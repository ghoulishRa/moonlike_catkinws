;; Auto-generated. Do not edit!


(when (boundp 'multi_orbbec::GetBool)
  (if (not (find-package "MULTI_ORBBEC"))
    (make-package "MULTI_ORBBEC"))
  (shadow 'GetBool (find-package "MULTI_ORBBEC")))
(unless (find-package "MULTI_ORBBEC::GETBOOL")
  (make-package "MULTI_ORBBEC::GETBOOL"))
(unless (find-package "MULTI_ORBBEC::GETBOOLREQUEST")
  (make-package "MULTI_ORBBEC::GETBOOLREQUEST"))
(unless (find-package "MULTI_ORBBEC::GETBOOLRESPONSE")
  (make-package "MULTI_ORBBEC::GETBOOLRESPONSE"))

(in-package "ROS")





(defclass multi_orbbec::GetBoolRequest
  :super ros::object
  :slots ())

(defmethod multi_orbbec::GetBoolRequest
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

(defclass multi_orbbec::GetBoolResponse
  :super ros::object
  :slots (_data _success _message ))

(defmethod multi_orbbec::GetBoolResponse
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

(defclass multi_orbbec::GetBool
  :super ros::object
  :slots ())

(setf (get multi_orbbec::GetBool :md5sum-) "43f76a855b16e988566e147b692f2fab")
(setf (get multi_orbbec::GetBool :datatype-) "multi_orbbec/GetBool")
(setf (get multi_orbbec::GetBool :request) multi_orbbec::GetBoolRequest)
(setf (get multi_orbbec::GetBool :response) multi_orbbec::GetBoolResponse)

(defmethod multi_orbbec::GetBoolRequest
  (:response () (instance multi_orbbec::GetBoolResponse :init)))

(setf (get multi_orbbec::GetBoolRequest :md5sum-) "43f76a855b16e988566e147b692f2fab")
(setf (get multi_orbbec::GetBoolRequest :datatype-) "multi_orbbec/GetBoolRequest")
(setf (get multi_orbbec::GetBoolRequest :definition-)
      "---
bool data
bool success
string message

")

(setf (get multi_orbbec::GetBoolResponse :md5sum-) "43f76a855b16e988566e147b692f2fab")
(setf (get multi_orbbec::GetBoolResponse :datatype-) "multi_orbbec/GetBoolResponse")
(setf (get multi_orbbec::GetBoolResponse :definition-)
      "---
bool data
bool success
string message

")



(provide :multi_orbbec/GetBool "43f76a855b16e988566e147b692f2fab")


