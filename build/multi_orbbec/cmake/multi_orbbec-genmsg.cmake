# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "multi_orbbec: 4 messages, 9 services")

set(MSG_I_FLAGS "-Imulti_orbbec:/root/catkin_ws/src/multi_orbbec/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(multi_orbbec_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg" "std_msgs/Header"
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg" "std_msgs/Header"
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg" "std_msgs/Header"
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg" "std_msgs/Header"
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv" ""
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv" ""
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv" "sensor_msgs/RegionOfInterest:std_msgs/Header:sensor_msgs/CameraInfo"
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv" ""
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv" "std_msgs/Header:multi_orbbec/DeviceInfo"
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv" ""
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv" ""
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv" ""
)

get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv" NAME_WE)
add_custom_target(_multi_orbbec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_orbbec" "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)
_generate_msg_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)
_generate_msg_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)
_generate_msg_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)

### Generating Services
_generate_srv_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_cpp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
)

### Generating Module File
_generate_module_cpp(multi_orbbec
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(multi_orbbec_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(multi_orbbec_generate_messages multi_orbbec_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_cpp _multi_orbbec_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(multi_orbbec_gencpp)
add_dependencies(multi_orbbec_gencpp multi_orbbec_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS multi_orbbec_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)
_generate_msg_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)
_generate_msg_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)
_generate_msg_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)

### Generating Services
_generate_srv_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)
_generate_srv_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)
_generate_srv_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)
_generate_srv_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)
_generate_srv_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)
_generate_srv_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)
_generate_srv_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)
_generate_srv_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)
_generate_srv_eus(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
)

### Generating Module File
_generate_module_eus(multi_orbbec
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(multi_orbbec_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(multi_orbbec_generate_messages multi_orbbec_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_eus _multi_orbbec_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(multi_orbbec_geneus)
add_dependencies(multi_orbbec_geneus multi_orbbec_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS multi_orbbec_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)
_generate_msg_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)
_generate_msg_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)
_generate_msg_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)

### Generating Services
_generate_srv_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)
_generate_srv_lisp(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
)

### Generating Module File
_generate_module_lisp(multi_orbbec
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(multi_orbbec_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(multi_orbbec_generate_messages multi_orbbec_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_lisp _multi_orbbec_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(multi_orbbec_genlisp)
add_dependencies(multi_orbbec_genlisp multi_orbbec_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS multi_orbbec_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)
_generate_msg_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)
_generate_msg_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)
_generate_msg_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)

### Generating Services
_generate_srv_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)
_generate_srv_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)
_generate_srv_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)
_generate_srv_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)
_generate_srv_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)
_generate_srv_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)
_generate_srv_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)
_generate_srv_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)
_generate_srv_nodejs(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
)

### Generating Module File
_generate_module_nodejs(multi_orbbec
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(multi_orbbec_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(multi_orbbec_generate_messages multi_orbbec_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_nodejs _multi_orbbec_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(multi_orbbec_gennodejs)
add_dependencies(multi_orbbec_gennodejs multi_orbbec_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS multi_orbbec_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)
_generate_msg_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)
_generate_msg_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)
_generate_msg_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)

### Generating Services
_generate_srv_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)
_generate_srv_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)
_generate_srv_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CameraInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)
_generate_srv_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)
_generate_srv_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)
_generate_srv_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)
_generate_srv_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)
_generate_srv_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)
_generate_srv_py(multi_orbbec
  "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
)

### Generating Module File
_generate_module_py(multi_orbbec
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(multi_orbbec_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(multi_orbbec_generate_messages multi_orbbec_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/DeviceInfo.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Extrinsics.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/Metadata.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/msg/IMUInfo.msg" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetBool.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetBool.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraInfo.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetCameraParams.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetDeviceInfo.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetInt32.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/GetString.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetInt32.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/root/catkin_ws/src/multi_orbbec/srv/SetString.srv" NAME_WE)
add_dependencies(multi_orbbec_generate_messages_py _multi_orbbec_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(multi_orbbec_genpy)
add_dependencies(multi_orbbec_genpy multi_orbbec_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS multi_orbbec_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_orbbec
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(multi_orbbec_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(multi_orbbec_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_orbbec
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(multi_orbbec_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(multi_orbbec_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_orbbec
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(multi_orbbec_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(multi_orbbec_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/multi_orbbec
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(multi_orbbec_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(multi_orbbec_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_orbbec
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(multi_orbbec_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(multi_orbbec_generate_messages_py sensor_msgs_generate_messages_py)
endif()
