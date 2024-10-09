cmake_minimum_required(VERSION 3.0.2)
project(multi_launch)

# Establecer propiedades del directorio y opciones de compilación
set_directory_properties(PROPERTIES COMPILE_OPTIONS "-std=c++11;-Wall;-Wextra")
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -O3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -O3")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fPIC -g3")
set(CMAKE_BUILD_TYPE "Release")

# Opciones de compilación
option(ENABLE_SANITIZER "Enable sanitizer options" OFF)
option(USE_RK_HW_DECODER "Use Rockchip hardware decoder" OFF)
option(USE_NV_HW_DECODER "Use Nvidia hardware decoder" OFF)

# Configuración de sanitizadores
if (ENABLE_SANITIZER)
    set(SANITIZER_FLAGS "-fsanitize=address -static-libasan")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${SANITIZER_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${SANITIZER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${SANITIZER_FLAGS}")
endif()

# Detectar el tipo de máquina
execute_process(COMMAND uname -m OUTPUT_VARIABLE MACHINES OUTPUT_STRIP_TRAILING_WHITESPACE)
execute_process(COMMAND getconf LONG_BIT OUTPUT_VARIABLE MACHINES_BIT OUTPUT_STRIP_TRAILING_WHITESPACE)

if ((${MACHINES} MATCHES "x86_64") AND (${MACHINES_BIT} MATCHES "64"))
    set(HOST_PLATFORM "x64")
elseif (${MACHINES} MATCHES "arm")
    set(HOST_PLATFORM "arm32")
elseif ((${MACHINES} MATCHES "aarch64") AND (${MACHINES_BIT} MATCHES "64"))
    set(HOST_PLATFORM "arm64")
elseif ((${MACHINES} MATCHES "aarch64") AND (${MACHINES_BIT} MATCHES "32"))
    set(HOST_PLATFORM "arm32")
endif()

# Configuración de rutas
set(ORBBEC_LIBS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/SDK/lib/${HOST_PLATFORM}")
set(ORBBEC_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/SDK/include/")
set(CMAKE_BUILD_RPATH "${CMAKE_BUILD_RPATH}:${ORBBEC_LIBS_DIR}")
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_RPATH}:${ORBBEC_LIBS_DIR}")

if (USE_NV_HW_DECODER)
    set(JETSON_MULTI_MEDIA_API_DIR "/usr/src/jetson_multimedia_api")
    set(JETSON_MULTI_MEDIA_API_CLASS_DIR "${JETSON_MULTI_MEDIA_API_DIR}/samples/common/classes")
    set(JETSON_MULTI_MEDIA_API_INCLUDE_DIR "${JETSON_MULTI_MEDIA_API_DIR}/include/")
    set(LIBJPEG8B_INCLUDE_DIR "${JETSON_MULTI_MEDIA_API_INCLUDE_DIR}/libjpeg-8b")
    set(TEGRA_ARMABI "/usr/lib/aarch64-linux-gnu/")
    set(NV_LIBRARIES
        -lnvjpeg
        -lnvbufsurface
        -lnvbufsurftransform
        -lyuv
        -lv4l2
    )
    list(APPEND NV_LIBRARIES
        -L${TEGRA_ARMABI}
        -L${TEGRA_ARMABI}/tegra
    )
endif()

# Encontrar paquetes requeridos
find_package(OpenCV REQUIRED)
find_package(Eigen3 REQUIRED)
find_package(Boost REQUIRED COMPONENTS filesystem system)
find_package(PkgConfig REQUIRED)
find_package(Threads REQUIRED)
find_package(catkin REQUIRED COMPONENTS
    camera_info_manager
    diagnostic_updater
    dynamic_reconfigure
    image_exposure_msgs
    image_transport
    nodelet
    roscpp
    sensor_msgs
    wfov_camera_msgs
    cv_bridge
    image_geometry
    message_filters
    message_generation
    std_srvs
    tf2
    tf2_ros
    pluginlib
)

# Verificación de Boost
if(Boost_FOUND)
    message(STATUS "Boost found!")
    message(STATUS "Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
    message(STATUS "Boost_LIBRARIES: ${Boost_LIBRARIES}")
else()
    message(FATAL_ERROR "Boost not found!")
endif()

# Dependencias adicionales basadas en opciones
if (USE_RK_HW_DECODER)
    pkg_search_module(RK_MPP REQUIRED rockchip_mpp)
    if (NOT RK_MPP_FOUND)
        message(FATAL_ERROR "Rockchip MPP not found")
    endif()
    
    pkg_search_module(RGA REQUIRED librga)
    if (NOT RGA_FOUND)
        message(STATUS "Rockchip RGA not found, using libyuv instead")
        add_definitions(-DUSE_LIBYUV)
        add_compile_options(-lyuv)
    endif()
endif()

# Generación de mensajes
add_message_files(FILES
    DeviceInfo.msg
    Extrinsics.msg
    Metadata.msg
    IMUInfo.msg
)
add_service_files(FILES
    GetBool.srv
    SetBool.srv
    GetCameraInfo.srv
    GetCameraParams.srv
    GetDeviceInfo.srv
    GetInt32.srv
    GetString.srv
    SetInt32.srv
    SetString.srv
)
generate_messages(DEPENDENCIES std_msgs sensor_msgs)

# Generación de opciones de reconfiguración dinámica
generate_dynamic_reconfigure_options(cfg/Spinnaker.cfg)

# Definir el paquete catkin
catkin_package(
    CATKIN_DEPENDS
        INCLUDE_DIRS include
        LIBRARIES ${PROJECT_NAME}
        camera_info_manager
        cv_bridge
        dynamic_reconfigure
        image_geometry
        image_transport
        message_filters
        message_runtime
        std_srvs
        tf2
        tf2_ros
        image_exposure_msgs
        nodelet
        roscpp
        sensor_msgs
        wfov_camera_msgs
)

# Manejo de Spinnaker
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
find_package(Spinnaker QUIET)
if(NOT Spinnaker_FOUND)
    message(STATUS "libSpinnaker no encontrado en la ruta de la biblioteca del sistema")
    include(cmake/DownloadSpinnaker.cmake)
    download_spinnaker(Spinnaker_LIBRARIES Spinnaker_INCLUDE_DIRS)
endif()

message(STATUS "libSpinnaker biblioteca: ${Spinnaker_LIBRARIES}")
message(STATUS "libSpinnaker incluir: ${Spinnaker_INCLUDE_DIRS}")

# Incluir directorios
include_directories(
    SYSTEM
    ${Spinnaker_INCLUDE_DIRS}
    ${catkin_INCLUDE_DIRS}
    include
)

# Definir bibliotecas
add_library(SpinnakerCameraLib src/SpinnakerCamera.cpp)
set(Spinnaker_LIBRARIES "/opt/ros/noetic/lib/libSpinnaker.so")
set(Spinnaker_INCLUDE_DIRS "/opt/ros/noetic/include")

target_link_libraries(SpinnakerCameraLib
    Camera
    ${Spinnaker_LIBRARIES}
    ${catkin_LIBRARIES}
)

# Ejecutable de prueba para Spinnaker
add_executable(spinnaker_test_node src/spinnaker_test_node.cpp)
target_link_libraries(spinnaker_test_node
    SpinnakerCameraLib
    ${catkin_LIBRARIES}
)

# Dependencias
add_dependencies(SpinnakerCameraLib ${PROJECT_NAME}_gencfg)

# Definir más bibliotecas
add_library(Camera src/camera.cpp)
target_link_libraries(Camera ${catkin_LIBRARIES})
add_dependencies(Camera ${PROJECT_NAME}_gencfg)

add_library(Cm3 src/cm3.cpp)
target_link_libraries(Cm3 Camera ${catkin_LIBRARIES})
add_dependencies(Cm3 ${PROJECT_NAME}_gencfg)

add_library(Gh3 src/gh3.cpp)
target_link_libraries(Gh3 Camera ${catkin_LIBRARIES})
add_dependencies(Gh3 ${PROJECT_NAME}_gencfg)

add_library(Diagnostics src/diagnostics.cpp)
target_link_libraries(Diagnostics Camera SpinnakerCameraLib ${catkin_LIBRARIES})
add_dependencies(Diagnostics ${PROJECT_NAME}_gencfg)

add_library(SpinnakerCameraNodelet src/nodelet.cpp)
target_link_libraries(SpinnakerCameraNodelet
    Diagnostics
    SpinnakerCameraLib
    Camera
    Gh3
    Cm3
    ${catkin_LIBRARIES}
)

# Ejecutable principal
add_executable(spinnaker_camera_node src/node.cpp)
target_link_libraries(spinnaker_camera_node
    SpinnakerCameraLib
    ${catkin_LIBRARIES}
)
set_target_properties(spinnaker_camera_node PROPERTIES OUTPUT_NAME camera_node PREFIX "")

# Añadir dependencias
# add_dependencies(${PROJECT_NAME} ${PROJECT_NAME}_generate_messages_cpp)
# add_dependencies(${PROJECT_NAME}_nodelet ${PROJECT_NAME}_generate_messages_cpp)

# Definir biblioteca principal
set(SOURCE_FILES
    src/d2c_viewer.cpp
    src/ob_camera_node.cpp
    src/ob_camera_node_driver.cpp
    src/ros_sensor.cpp
    src/ros_service.cpp
    src/utils.cpp
    src/ros_setup.cpp
    src/jpeg_decoder.cpp
)

# Incluir fuentes adicionales según opciones
if (USE_RK_HW_DECODER)
    add_definitions(-DUSE_RK_HW_DECODER)
    list(APPEND SOURCE_FILES src/rk_mpp_decoder.cpp)
endif()

if (USE_NV_HW_DECODER)
    add_definitions(-DUSE_NV_HW_DECODER)
    list(APPEND SOURCE_FILES src/jetson_nv_decoder.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvBuffer.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvElement.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvElementProfiler.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvJpegDecoder.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvJpegEncoder.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvLogging.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvUtils.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvV4l2Element.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvV4l2ElementPlane.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvVideoDecoder.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvVideoEncoder.cpp
        ${JETSON_MULTI_MEDIA_API_CLASS_DIR}/NvBufSurface.cpp
    )
endif()

# Incluir directorios comunes
set(COMMON_INCLUDE_DIRS
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
    ${catkin_INCLUDE_DIRS}
    ${Boost_INCLUDE_DIRS}
    ${OpenCV_INCLUDE_DIRS}
    ${ORBBEC_INCLUDE_DIR}
)

if (USE_NV_HW_DECODER)
    list(APPEND COMMON_INCLUDE_DIRS
        ${JETSON_MULTI_MEDIA_API_INCLUDE_DIR}
        ${LIBJPEG8B_INCLUDE_DIR}
    )
endif()

if (USE_RK_HW_DECODER)
    list(APPEND COMMON_INCLUDE_DIRS
        ${RK_MPP_INCLUDE_DIRS}
        ${RGA_INCLUDE_DIR}
    )
endif()

# Enlazar bibliotecas comunes
set(COMMON_LINK_LIBRARIES
    ${catkin_LIBRARIES}
    ${OpenCV_LIBS}
    ${Boost_LIBRARIES}
    -lOrbbecSDK
    -L${ORBBEC_LIBS_DIR}
    Threads::Threads
    -lrt
    -ldw # para stack trace
)

if (USE_RK_HW_DECODER)
    list(APPEND COMMON_LINK_LIBRARIES
        ${RK_MPP_LIBRARIES}
        ${RGA_LIBRARIES}
    )
elseif (USE_NV_HW_DECODER)
    list(APPEND COMMON_LINK_LIBRARIES
        ${NV_LIBRARIES}
    )
endif()

# Definir biblioteca principal del proyecto
add_library(${PROJECT_NAME} ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME} PRIVATE ${COMMON_LINK_LIBRARIES})
target_include_directories(${PROJECT_NAME} PUBLIC ${COMMON_INCLUDE_DIRS})

# Definir nodelet
add_library(${PROJECT_NAME}_nodelet ${SOURCE_FILES} src/ros_nodelet.cpp)
target_link_libraries(${PROJECT_NAME}_nodelet ${COMMON_LINK_LIBRARIES})
target_include_directories(${PROJECT_NAME}_nodelet PUBLIC ${COMMON_INCLUDE_DIRS})

# Macro para añadir ejecutables
macro(add_orbbec_executable TARGET SOURCES)
    add_executable(${TARGET} ${SOURCES})
    target_link_libraries(${TARGET} ${COMMON_LINK_LIBRARIES} ${PROJECT_NAME})
    target_include_directories(${TARGET} PUBLIC ${COMMON_INCLUDE_DIRS})
endmacro()

# Añadir ejecutables
add_orbbec_executable(list_devices_node src/list_devices_node.cpp)
add_orbbec_executable(list_depth_work_mode_node src/list_depth_work_mode.cpp)
add_orbbec_executable(list_camera_profile_mode_node src/list_camera_profile_mode.cpp)
add_orbbec_executable(orbbec_camera_node src/main.cpp)

# Instalación de targets
install(TARGETS
    SpinnakerCameraLib
    SpinnakerCameraNodelet
    Camera
    Cm3
    Gh3
    Diagnostics
    spinnaker_camera_node
    ${PROJECT_NAME}
    ${PROJECT_NAME}_nodelet
    orbbec_camera_node
    list_devices_node
    list_depth_work_mode_node
    list_camera_profile_mode_node
    ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
    LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
    RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

# Instalación de archivos adicionales
install(FILES nodelet_plugins.xml DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
install(DIRECTORY launch DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
install(DIRECTORY config DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

if(EXISTS ${CMAKE_CURRENT_BINARY_DIR}/usr/lib)
    install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/usr/lib/ DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
            PATTERN libQt* EXCLUDE)
else()
    get_filename_component(Spinnaker_LIB_DIR ${Spinnaker_LIBRARIES} DIRECTORY)
    file(READ ${PROJECT_SOURCE_DIR}/cmake/install_files filenames)
    foreach(filename ${filenames})
        install(FILES ${Spinnaker_LIB_DIR}/${filename} DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION})
    endforeach()
endif()

install(DIRECTORY include DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}/)
install(DIRECTORY ${ORBBEC_INCLUDE_DIR} DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}/)
install(FILES LICENSE DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

# Instalación de udev rules si se está construyendo el paquete
if(DEFINED ENV{BUILDING_PACKAGE})
    install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/scripts/99-obsensor-ros1-libusb.rules
            DESTINATION /etc/udev/rules.d)
endif()

# Incluir directorios comunes en los targets
target_include_directories(${PROJECT_NAME} PUBLIC ${COMMON_INCLUDE_DIRS})
target_include_directories(${PROJECT_NAME}_nodelet PUBLIC ${COMMON_INCLUDE_DIRS})

# Pruebas y linting
if (CATKIN_ENABLE_TESTING)
    find_package(roslaunch REQUIRED)
    roslaunch_add_file_check(launch/camera.launch)

    find_package(roslint REQUIRED)
    set(ROSLINT_CPP_OPTS "--filter=-build/c++11")
    roslint_cpp()
    roslint_add_test()
endif()
