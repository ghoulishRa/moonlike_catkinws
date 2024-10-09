;; Auto-generated. Do not edit!


(when (boundp 'multi_orbbec::GetString)
  (if (not (find-package "MULTI_ORBBEC"))
    (make-package "MULTI_ORBBEC"))
  (shadow 'GetString (find-package "MULTI_ORBBEC")))
(unless (find-package "MULTI_ORBBEC::GETSTRING")
  (make-package "MULTI_ORBBEC::GETSTRING"))
(unless (find-package "MULTI_ORBBEC::GETSTRINGREQUEST")
  (make-package "MULTI_ORBBEC::GETSTRINGREQUEST"))
(unless (find-package "MULTI_ORBBEC::GETSTRINGRESPONSE")
  (make-package "MULTI_ORBBEC::GETSTRINGRESPONSE"))

(in-package "ROS")





(defclass multi_orbbec::GetStringRequest
  :super ros::object
  :slots ())

(defmethod multi_orbbec::GetStringRequest
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

(defclass multi_orbbec::GetStringResponse
  :super ros::object
  :slots (_data _success _message ))

(defmethod multi_orbbec::GetStringResponse
  (:init
   (&key
    ((:data __data) "")
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _data (string __data))
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass multi_orbbec::GetString
  :super ros::object
  :slots ())

(setf (get multi_orbbec::GetString :md5sum-) "15baad3d82a7b70bfc4eb31d66322293")
(setf (get multi_orbbec::GetString :datatype-) "multi_orbbec/GetString")
(setf (get multi_orbbec::GetString :request) multi_orbbec::GetStringRequest)
(setf (get multi_orbbec::GetString :response) multi_orbbec::GetStringResponse)

(defmethod multi_orbbec::GetStringRequest
  (:response () (instance multi_orbbec::GetStringResponse :init)))

(setf (get multi_orbbec::GetStringRequest :md5sum-) "15baad3d82a7b70bfc4eb31d66322293")
(setf (get multi_orbbec::GetStringRequest :datatype-) "multi_orbbec/GetStringRequest")
(setf (get multi_orbbec::GetStringRequest :definition-)
      "---
string data
bool success
string message

")

(setf (get multi_orbbec::GetStringResponse :md5sum-) "15baad3d82a7b70bfc4eb31d66322293")
(setf (get multi_orbbec::GetStringResponse :datatype-) "multi_orbbec/GetStringResponse")
(setf (get multi_orbbec::GetStringResponse :definition-)
      "---
string data
bool success
string message

")



(provide :multi_orbbec/GetString "15baad3d82a7b70bfc4eb31d66322293")


