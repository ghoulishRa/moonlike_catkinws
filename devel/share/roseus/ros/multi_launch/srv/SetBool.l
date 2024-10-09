;; Auto-generated. Do not edit!


(when (boundp 'multi_launch::SetBool)
  (if (not (find-package "MULTI_LAUNCH"))
    (make-package "MULTI_LAUNCH"))
  (shadow 'SetBool (find-package "MULTI_LAUNCH")))
(unless (find-package "MULTI_LAUNCH::SETBOOL")
  (make-package "MULTI_LAUNCH::SETBOOL"))
(unless (find-package "MULTI_LAUNCH::SETBOOLREQUEST")
  (make-package "MULTI_LAUNCH::SETBOOLREQUEST"))
(unless (find-package "MULTI_LAUNCH::SETBOOLRESPONSE")
  (make-package "MULTI_LAUNCH::SETBOOLRESPONSE"))

(in-package "ROS")





(defclass multi_launch::SetBoolRequest
  :super ros::object
  :slots (_data ))

(defmethod multi_launch::SetBoolRequest
  (:init
   (&key
    ((:data __data) nil)
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional (__data :null))
   (if (not (eq __data :null)) (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; bool _data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _data
       (if _data (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _data
     (setq _data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass multi_launch::SetBoolResponse
  :super ros::object
  :slots (_success _message ))

(defmethod multi_launch::SetBoolResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass multi_launch::SetBool
  :super ros::object
  :slots ())

(setf (get multi_launch::SetBool :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get multi_launch::SetBool :datatype-) "multi_launch/SetBool")
(setf (get multi_launch::SetBool :request) multi_launch::SetBoolRequest)
(setf (get multi_launch::SetBool :response) multi_launch::SetBoolResponse)

(defmethod multi_launch::SetBoolRequest
  (:response () (instance multi_launch::SetBoolResponse :init)))

(setf (get multi_launch::SetBoolRequest :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get multi_launch::SetBoolRequest :datatype-) "multi_launch/SetBoolRequest")
(setf (get multi_launch::SetBoolRequest :definition-)
      "bool data
---
bool success
string message

")

(setf (get multi_launch::SetBoolResponse :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get multi_launch::SetBoolResponse :datatype-) "multi_launch/SetBoolResponse")
(setf (get multi_launch::SetBoolResponse :definition-)
      "bool data
---
bool success
string message

")



(provide :multi_launch/SetBool "09fb03525b03e7ea1fd3992bafd87e16")


