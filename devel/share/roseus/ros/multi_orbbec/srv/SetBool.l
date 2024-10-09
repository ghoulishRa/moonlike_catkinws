;; Auto-generated. Do not edit!


(when (boundp 'multi_orbbec::SetBool)
  (if (not (find-package "MULTI_ORBBEC"))
    (make-package "MULTI_ORBBEC"))
  (shadow 'SetBool (find-package "MULTI_ORBBEC")))
(unless (find-package "MULTI_ORBBEC::SETBOOL")
  (make-package "MULTI_ORBBEC::SETBOOL"))
(unless (find-package "MULTI_ORBBEC::SETBOOLREQUEST")
  (make-package "MULTI_ORBBEC::SETBOOLREQUEST"))
(unless (find-package "MULTI_ORBBEC::SETBOOLRESPONSE")
  (make-package "MULTI_ORBBEC::SETBOOLRESPONSE"))

(in-package "ROS")





(defclass multi_orbbec::SetBoolRequest
  :super ros::object
  :slots (_data ))

(defmethod multi_orbbec::SetBoolRequest
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

(defclass multi_orbbec::SetBoolResponse
  :super ros::object
  :slots (_success _message ))

(defmethod multi_orbbec::SetBoolResponse
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

(defclass multi_orbbec::SetBool
  :super ros::object
  :slots ())

(setf (get multi_orbbec::SetBool :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get multi_orbbec::SetBool :datatype-) "multi_orbbec/SetBool")
(setf (get multi_orbbec::SetBool :request) multi_orbbec::SetBoolRequest)
(setf (get multi_orbbec::SetBool :response) multi_orbbec::SetBoolResponse)

(defmethod multi_orbbec::SetBoolRequest
  (:response () (instance multi_orbbec::SetBoolResponse :init)))

(setf (get multi_orbbec::SetBoolRequest :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get multi_orbbec::SetBoolRequest :datatype-) "multi_orbbec/SetBoolRequest")
(setf (get multi_orbbec::SetBoolRequest :definition-)
      "bool data
---
bool success
string message

")

(setf (get multi_orbbec::SetBoolResponse :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get multi_orbbec::SetBoolResponse :datatype-) "multi_orbbec/SetBoolResponse")
(setf (get multi_orbbec::SetBoolResponse :definition-)
      "bool data
---
bool success
string message

")



(provide :multi_orbbec/SetBool "09fb03525b03e7ea1fd3992bafd87e16")


