;; Auto-generated. Do not edit!


(when (boundp 'multi_launch::GetCameraParams)
  (if (not (find-package "MULTI_LAUNCH"))
    (make-package "MULTI_LAUNCH"))
  (shadow 'GetCameraParams (find-package "MULTI_LAUNCH")))
(unless (find-package "MULTI_LAUNCH::GETCAMERAPARAMS")
  (make-package "MULTI_LAUNCH::GETCAMERAPARAMS"))
(unless (find-package "MULTI_LAUNCH::GETCAMERAPARAMSREQUEST")
  (make-package "MULTI_LAUNCH::GETCAMERAPARAMSREQUEST"))
(unless (find-package "MULTI_LAUNCH::GETCAMERAPARAMSRESPONSE")
  (make-package "MULTI_LAUNCH::GETCAMERAPARAMSRESPONSE"))

(in-package "ROS")





(defclass multi_launch::GetCameraParamsRequest
  :super ros::object
  :slots ())

(defmethod multi_launch::GetCameraParamsRequest
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

(defclass multi_launch::GetCameraParamsResponse
  :super ros::object
  :slots (_l_intr_p _r_intr_p _r2l_r _r2l_t _success _message ))

(defmethod multi_launch::GetCameraParamsResponse
  (:init
   (&key
    ((:l_intr_p __l_intr_p) (make-array 4 :initial-element 0.0 :element-type :float))
    ((:r_intr_p __r_intr_p) (make-array 4 :initial-element 0.0 :element-type :float))
    ((:r2l_r __r2l_r) (make-array 9 :initial-element 0.0 :element-type :float))
    ((:r2l_t __r2l_t) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _l_intr_p __l_intr_p)
   (setq _r_intr_p __r_intr_p)
   (setq _r2l_r __r2l_r)
   (setq _r2l_t __r2l_t)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:l_intr_p
   (&optional __l_intr_p)
   (if __l_intr_p (setq _l_intr_p __l_intr_p)) _l_intr_p)
  (:r_intr_p
   (&optional __r_intr_p)
   (if __r_intr_p (setq _r_intr_p __r_intr_p)) _r_intr_p)
  (:r2l_r
   (&optional __r2l_r)
   (if __r2l_r (setq _r2l_r __r2l_r)) _r2l_r)
  (:r2l_t
   (&optional __r2l_t)
   (if __r2l_t (setq _r2l_t __r2l_t)) _r2l_t)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; float32[4] _l_intr_p
    (* 4    4)
    ;; float32[4] _r_intr_p
    (* 4    4)
    ;; float32[9] _r2l_r
    (* 4    9)
    ;; float32[3] _r2l_t
    (* 4    3)
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[4] _l_intr_p
     (dotimes (i 4)
       (sys::poke (elt _l_intr_p i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[4] _r_intr_p
     (dotimes (i 4)
       (sys::poke (elt _r_intr_p i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[9] _r2l_r
     (dotimes (i 9)
       (sys::poke (elt _r2l_r i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _r2l_t
     (dotimes (i 3)
       (sys::poke (elt _r2l_t i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[4] _l_intr_p
   (dotimes (i (length _l_intr_p))
     (setf (elt _l_intr_p i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[4] _r_intr_p
   (dotimes (i (length _r_intr_p))
     (setf (elt _r_intr_p i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[9] _r2l_r
   (dotimes (i (length _r2l_r))
     (setf (elt _r2l_r i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _r2l_t
   (dotimes (i (length _r2l_t))
     (setf (elt _r2l_t i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass multi_launch::GetCameraParams
  :super ros::object
  :slots ())

(setf (get multi_launch::GetCameraParams :md5sum-) "06621ca772ba4ac96475002c209b1554")
(setf (get multi_launch::GetCameraParams :datatype-) "multi_launch/GetCameraParams")
(setf (get multi_launch::GetCameraParams :request) multi_launch::GetCameraParamsRequest)
(setf (get multi_launch::GetCameraParams :response) multi_launch::GetCameraParamsResponse)

(defmethod multi_launch::GetCameraParamsRequest
  (:response () (instance multi_launch::GetCameraParamsResponse :init)))

(setf (get multi_launch::GetCameraParamsRequest :md5sum-) "06621ca772ba4ac96475002c209b1554")
(setf (get multi_launch::GetCameraParamsRequest :datatype-) "multi_launch/GetCameraParamsRequest")
(setf (get multi_launch::GetCameraParamsRequest :definition-)
      "---
float32[4] l_intr_p
float32[4] r_intr_p
float32[9] r2l_r
float32[3] r2l_t
bool success
string message

")

(setf (get multi_launch::GetCameraParamsResponse :md5sum-) "06621ca772ba4ac96475002c209b1554")
(setf (get multi_launch::GetCameraParamsResponse :datatype-) "multi_launch/GetCameraParamsResponse")
(setf (get multi_launch::GetCameraParamsResponse :definition-)
      "---
float32[4] l_intr_p
float32[4] r_intr_p
float32[9] r2l_r
float32[3] r2l_t
bool success
string message

")



(provide :multi_launch/GetCameraParams "06621ca772ba4ac96475002c209b1554")


