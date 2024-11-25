;; Auto-generated. Do not edit!


(when (boundp 'multi_orbbec::DeviceInfo)
  (if (not (find-package "MULTI_ORBBEC"))
    (make-package "MULTI_ORBBEC"))
  (shadow 'DeviceInfo (find-package "MULTI_ORBBEC")))
(unless (find-package "MULTI_ORBBEC::DEVICEINFO")
  (make-package "MULTI_ORBBEC::DEVICEINFO"))

(in-package "ROS")
;;//! \htmlinclude DeviceInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass multi_orbbec::DeviceInfo
  :super ros::object
  :slots (_header _name _serial_number _firmware_version _supported_min_sdk_version _hardware_version ))

(defmethod multi_orbbec::DeviceInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:name __name) "")
    ((:serial_number __serial_number) "")
    ((:firmware_version __firmware_version) "")
    ((:supported_min_sdk_version __supported_min_sdk_version) "")
    ((:hardware_version __hardware_version) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _name (string __name))
   (setq _serial_number (string __serial_number))
   (setq _firmware_version (string __firmware_version))
   (setq _supported_min_sdk_version (string __supported_min_sdk_version))
   (setq _hardware_version (string __hardware_version))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serial_number
   (&optional __serial_number)
   (if __serial_number (setq _serial_number __serial_number)) _serial_number)
  (:firmware_version
   (&optional __firmware_version)
   (if __firmware_version (setq _firmware_version __firmware_version)) _firmware_version)
  (:supported_min_sdk_version
   (&optional __supported_min_sdk_version)
   (if __supported_min_sdk_version (setq _supported_min_sdk_version __supported_min_sdk_version)) _supported_min_sdk_version)
  (:hardware_version
   (&optional __hardware_version)
   (if __hardware_version (setq _hardware_version __hardware_version)) _hardware_version)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _name
    4 (length _name)
    ;; string _serial_number
    4 (length _serial_number)
    ;; string _firmware_version
    4 (length _firmware_version)
    ;; string _supported_min_sdk_version
    4 (length _supported_min_sdk_version)
    ;; string _hardware_version
    4 (length _hardware_version)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _serial_number
       (write-long (length _serial_number) s) (princ _serial_number s)
     ;; string _firmware_version
       (write-long (length _firmware_version) s) (princ _firmware_version s)
     ;; string _supported_min_sdk_version
       (write-long (length _supported_min_sdk_version) s) (princ _supported_min_sdk_version s)
     ;; string _hardware_version
       (write-long (length _hardware_version) s) (princ _hardware_version s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _serial_number
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _serial_number (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _firmware_version
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _firmware_version (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _supported_min_sdk_version
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _supported_min_sdk_version (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _hardware_version
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _hardware_version (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get multi_orbbec::DeviceInfo :md5sum-) "1888569b0132dc804ac1aacd640af6e8")
(setf (get multi_orbbec::DeviceInfo :datatype-) "multi_orbbec/DeviceInfo")
(setf (get multi_orbbec::DeviceInfo :definition-)
      "std_msgs/Header header
string name
string serial_number
string firmware_version
string supported_min_sdk_version
string hardware_version

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :multi_orbbec/DeviceInfo "1888569b0132dc804ac1aacd640af6e8")

