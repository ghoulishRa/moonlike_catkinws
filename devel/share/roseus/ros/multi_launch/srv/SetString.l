;; Auto-generated. Do not edit!


(when (boundp 'multi_launch::SetString)
  (if (not (find-package "MULTI_LAUNCH"))
    (make-package "MULTI_LAUNCH"))
  (shadow 'SetString (find-package "MULTI_LAUNCH")))
(unless (find-package "MULTI_LAUNCH::SETSTRING")
  (make-package "MULTI_LAUNCH::SETSTRING"))
(unless (find-package "MULTI_LAUNCH::SETSTRINGREQUEST")
  (make-package "MULTI_LAUNCH::SETSTRINGREQUEST"))
(unless (find-package "MULTI_LAUNCH::SETSTRINGRESPONSE")
  (make-package "MULTI_LAUNCH::SETSTRINGRESPONSE"))

(in-package "ROS")





(defclass multi_launch::SetStringRequest
  :super ros::object
  :slots (_data ))

(defmethod multi_launch::SetStringRequest
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

(defclass multi_launch::SetStringResponse
  :super ros::object
  :slots (_success _message ))

(defmethod multi_launch::SetStringResponse
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

(defclass multi_launch::SetString
  :super ros::object
  :slots ())

(setf (get multi_launch::SetString :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get multi_launch::SetString :datatype-) "multi_launch/SetString")
(setf (get multi_launch::SetString :request) multi_launch::SetStringRequest)
(setf (get multi_launch::SetString :response) multi_launch::SetStringResponse)

(defmethod multi_launch::SetStringRequest
  (:response () (instance multi_launch::SetStringResponse :init)))

(setf (get multi_launch::SetStringRequest :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get multi_launch::SetStringRequest :datatype-) "multi_launch/SetStringRequest")
(setf (get multi_launch::SetStringRequest :definition-)
      "string data
---
bool success
string message

")

(setf (get multi_launch::SetStringResponse :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get multi_launch::SetStringResponse :datatype-) "multi_launch/SetStringResponse")
(setf (get multi_launch::SetStringResponse :definition-)
      "string data
---
bool success
string message

")



(provide :multi_launch/SetString "546971982e3fbbd5a41e60fb6432e357")


