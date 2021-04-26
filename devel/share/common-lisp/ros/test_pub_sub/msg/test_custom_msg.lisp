; Auto-generated. Do not edit!


(cl:in-package test_pub_sub-msg)


;//! \htmlinclude test_custom_msg.msg.html

(cl:defclass <test_custom_msg> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:string
    :initform "")
   (counter
    :reader counter
    :initarg :counter
    :type cl:integer
    :initform 0))
)

(cl:defclass test_custom_msg (<test_custom_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <test_custom_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'test_custom_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name test_pub_sub-msg:<test_custom_msg> is deprecated: use test_pub_sub-msg:test_custom_msg instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <test_custom_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_pub_sub-msg:data-val is deprecated.  Use test_pub_sub-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'counter-val :lambda-list '(m))
(cl:defmethod counter-val ((m <test_custom_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_pub_sub-msg:counter-val is deprecated.  Use test_pub_sub-msg:counter instead.")
  (counter m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <test_custom_msg>) ostream)
  "Serializes a message object of type '<test_custom_msg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
  (cl:let* ((signed (cl:slot-value msg 'counter)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <test_custom_msg>) istream)
  "Deserializes a message object of type '<test_custom_msg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'counter) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<test_custom_msg>)))
  "Returns string type for a message object of type '<test_custom_msg>"
  "test_pub_sub/test_custom_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test_custom_msg)))
  "Returns string type for a message object of type 'test_custom_msg"
  "test_pub_sub/test_custom_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<test_custom_msg>)))
  "Returns md5sum for a message object of type '<test_custom_msg>"
  "0fa0f9ced31bb7ac9407d6fdd3a2b92b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'test_custom_msg)))
  "Returns md5sum for a message object of type 'test_custom_msg"
  "0fa0f9ced31bb7ac9407d6fdd3a2b92b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<test_custom_msg>)))
  "Returns full string definition for message of type '<test_custom_msg>"
  (cl:format cl:nil "string data~%int32  counter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'test_custom_msg)))
  "Returns full string definition for message of type 'test_custom_msg"
  (cl:format cl:nil "string data~%int32  counter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <test_custom_msg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'data))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <test_custom_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'test_custom_msg
    (cl:cons ':data (data msg))
    (cl:cons ':counter (counter msg))
))
