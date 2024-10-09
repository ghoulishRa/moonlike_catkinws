;; Auto-generated. Do not edit!


(when (boundp 'multi_launch::GetBool)
  (if (not (find-package "MULTI_LAUNCH"))
    (make-package "MULTI_LAUNCH"))
  (shadow 'GetBool (find-package "MULTI_LAUNCH")))
(unless (find-package "MULTI_LAUNCH::GETBOOL")
  (make-package "MULTI_LAUNCH::GETBOOL"))
(unless (find-package "MULTI_LAUNCH::GETBOOLREQUEST")
  (make-package "MULTI_LAUNCH::GETBOOLREQUEST"))
(unless (find-package "MULTI_LAUNCH::GETBOOLRESPONSE")
  (make-package "MULTI_LAUNCH::GETBOOLRESPONSE"))

(in-package "ROS")





(defclass multi_launch::GetBoolRequest
  :super ros::object
  :slots ())

(defmethod multi_launch::GetBoolRequest
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

(defclass multi_launch::GetBoolResponse
  :super ros::object
  :slots (_data _success _message ))

(defmethod multi_launch::GetBoolResponse
  (:init
   (&key
    ((:data __data) nil)
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _data __data)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:data
   (&optional (__data :null))
   (if (not (eq __data :null)) (setq _data __data)) _data)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _data
    1
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _data
       (if _data (write-byte -1 s) (write-byte 0 s))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _data
     (setq _data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass multi_launch::GetBool
  :super ros::object
  :slots ())

(setf (get multi_launch::GetBool :md5sum-) "43f76a855b16e988566e147b692f2fab")
(setf (get multi_launch::GetBool :datatype-) "multi_launch/GetBool")
(setf (get multi_launch::GetBool :request) multi_launch::GetBoolRequest)
(setf (get multi_launch::GetBool :response) multi_launch::GetBoolResponse)

(defmethod multi_launch::GetBoolRequest
  (:response () (instance multi_launch::GetBoolResponse :init)))

(setf (get multi_launch::GetBoolRequest :md5sum-) "43f76a855b16e988566e147b692f2fab")
(setf (get multi_launch::GetBoolRequest :datatype-) "multi_launch/GetBoolRequest")
(setf (get multi_launch::GetBoolRequest :definition-)
      "---
bool data
bool success
string message

")

(setf (get multi_launch::GetBoolResponse :md5sum-) "43f76a855b16e988566e147b692f2fab")
(setf (get multi_launch::GetBoolResponse :datatype-) "multi_launch/GetBoolResponse")
(setf (get multi_launch::GetBoolResponse :definition-)
      "---
bool data
bool success
string message

")



(provide :multi_launch/GetBool "43f76a855b16e988566e147b692f2fab")


