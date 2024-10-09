;; Auto-generated. Do not edit!


(when (boundp 'multi_orbbec::SetString)
  (if (not (find-package "MULTI_ORBBEC"))
    (make-package "MULTI_ORBBEC"))
  (shadow 'SetString (find-package "MULTI_ORBBEC")))
(unless (find-package "MULTI_ORBBEC::SETSTRING")
  (make-package "MULTI_ORBBEC::SETSTRING"))
(unless (find-package "MULTI_ORBBEC::SETSTRINGREQUEST")
  (make-package "MULTI_ORBBEC::SETSTRINGREQUEST"))
(unless (find-package "MULTI_ORBBEC::SETSTRINGRESPONSE")
  (make-package "MULTI_ORBBEC::SETSTRINGRESPONSE"))

(in-package "ROS")





(defclass multi_orbbec::SetStringRequest
  :super ros::object
  :slots (_data ))

(defmethod multi_orbbec::SetStringRequest
  (:init
   (&key
    ((:data __data) "")
    )
   (send-super :init)
   (setq _data (string __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass multi_orbbec::SetStringResponse
  :super ros::object
  :slots (_success _message ))

(defmethod multi_orbbec::SetStringResponse
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

(defclass multi_orbbec::SetString
  :super ros::object
  :slots ())

(setf (get multi_orbbec::SetString :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get multi_orbbec::SetString :datatype-) "multi_orbbec/SetString")
(setf (get multi_orbbec::SetString :request) multi_orbbec::SetStringRequest)
(setf (get multi_orbbec::SetString :response) multi_orbbec::SetStringResponse)

(defmethod multi_orbbec::SetStringRequest
  (:response () (instance multi_orbbec::SetStringResponse :init)))

(setf (get multi_orbbec::SetStringRequest :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get multi_orbbec::SetStringRequest :datatype-) "multi_orbbec/SetStringRequest")
(setf (get multi_orbbec::SetStringRequest :definition-)
      "string data
---
bool success
string message

")

(setf (get multi_orbbec::SetStringResponse :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get multi_orbbec::SetStringResponse :datatype-) "multi_orbbec/SetStringResponse")
(setf (get multi_orbbec::SetStringResponse :definition-)
      "string data
---
bool success
string message

")



(provide :multi_orbbec/SetString "546971982e3fbbd5a41e60fb6432e357")


