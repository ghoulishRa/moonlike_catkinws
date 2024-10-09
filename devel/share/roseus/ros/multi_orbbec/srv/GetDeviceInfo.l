;; Auto-generated. Do not edit!


(when (boundp 'multi_orbbec::GetDeviceInfo)
  (if (not (find-package "MULTI_ORBBEC"))
    (make-package "MULTI_ORBBEC"))
  (shadow 'GetDeviceInfo (find-package "MULTI_ORBBEC")))
(unless (find-package "MULTI_ORBBEC::GETDEVICEINFO")
  (make-package "MULTI_ORBBEC::GETDEVICEINFO"))
(unless (find-package "MULTI_ORBBEC::GETDEVICEINFOREQUEST")
  (make-package "MULTI_ORBBEC::GETDEVICEINFOREQUEST"))
(unless (find-package "MULTI_ORBBEC::GETDEVICEINFORESPONSE")
  (make-package "MULTI_ORBBEC::GETDEVICEINFORESPONSE"))

(in-package "ROS")





(defclass multi_orbbec::GetDeviceInfoRequest
  :super ros::object
  :slots ())

(defmethod multi_orbbec::GetDeviceInfoRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass multi_orbbec::GetDeviceInfoResponse
  :super ros::object
  :slots (_info _success _message ))

(defmethod multi_orbbec::GetDeviceInfoResponse
  (:init
   (&key
    ((:info __info) (instance multi_orbbec::DeviceInfo :init))
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _info __info)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:info
   (&rest __info)
   (if (keywordp (car __info))
       (send* _info __info)
     (progn
       (if __info (setq _info (car __info)))
       _info)))
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; multi_orbbec/DeviceInfo _info
    (send _info :serialization-length)
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; multi_orbbec/DeviceInfo _info
       (send _info :serialize s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; multi_orbbec/DeviceInfo _info
     (send _info :deserialize buf ptr-) (incf ptr- (send _info :serialization-length))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass multi_orbbec::GetDeviceInfo
  :super ros::object
  :slots ())

(setf (get multi_orbbec::GetDeviceInfo :md5sum-) "a172c842ade7825e92d115b1aef6b0d1")
(setf (get multi_orbbec::GetDeviceInfo :datatype-) "multi_orbbec/GetDeviceInfo")
(setf (get multi_orbbec::GetDeviceInfo :request) multi_orbbec::GetDeviceInfoRequest)
(setf (get multi_orbbec::GetDeviceInfo :response) multi_orbbec::GetDeviceInfoResponse)

(defmethod multi_orbbec::GetDeviceInfoRequest
  (:response () (instance multi_orbbec::GetDeviceInfoResponse :init)))

(setf (get multi_orbbec::GetDeviceInfoRequest :md5sum-) "a172c842ade7825e92d115b1aef6b0d1")
(setf (get multi_orbbec::GetDeviceInfoRequest :datatype-) "multi_orbbec/GetDeviceInfoRequest")
(setf (get multi_orbbec::GetDeviceInfoRequest :definition-)
      "---
DeviceInfo info
bool success
string message


================================================================================
MSG: multi_orbbec/DeviceInfo
std_msgs/Header header
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

(setf (get multi_orbbec::GetDeviceInfoResponse :md5sum-) "a172c842ade7825e92d115b1aef6b0d1")
(setf (get multi_orbbec::GetDeviceInfoResponse :datatype-) "multi_orbbec/GetDeviceInfoResponse")
(setf (get multi_orbbec::GetDeviceInfoResponse :definition-)
      "---
DeviceInfo info
bool success
string message


================================================================================
MSG: multi_orbbec/DeviceInfo
std_msgs/Header header
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



(provide :multi_orbbec/GetDeviceInfo "a172c842ade7825e92d115b1aef6b0d1")


