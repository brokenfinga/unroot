;; Auto-generated. Do not edit!


(when (boundp 'test_pub_sub::test_custom_msg)
  (if (not (find-package "TEST_PUB_SUB"))
    (make-package "TEST_PUB_SUB"))
  (shadow 'test_custom_msg (find-package "TEST_PUB_SUB")))
(unless (find-package "TEST_PUB_SUB::TEST_CUSTOM_MSG")
  (make-package "TEST_PUB_SUB::TEST_CUSTOM_MSG"))

(in-package "ROS")
;;//! \htmlinclude test_custom_msg.msg.html


(defclass test_pub_sub::test_custom_msg
  :super ros::object
  :slots (_data _counter ))

(defmethod test_pub_sub::test_custom_msg
  (:init
   (&key
    ((:data __data) "")
    ((:counter __counter) 0)
    )
   (send-super :init)
   (setq _data (string __data))
   (setq _counter (round __counter))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:counter
   (&optional __counter)
   (if __counter (setq _counter __counter)) _counter)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ;; int32 _counter
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;; int32 _counter
       (write-long _counter s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _counter
     (setq _counter (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get test_pub_sub::test_custom_msg :md5sum-) "0fa0f9ced31bb7ac9407d6fdd3a2b92b")
(setf (get test_pub_sub::test_custom_msg :datatype-) "test_pub_sub/test_custom_msg")
(setf (get test_pub_sub::test_custom_msg :definition-)
      "string data
int32  counter

")



(provide :test_pub_sub/test_custom_msg "0fa0f9ced31bb7ac9407d6fdd3a2b92b")


