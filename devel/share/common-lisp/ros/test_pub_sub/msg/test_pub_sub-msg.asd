
(cl:in-package :asdf)

(defsystem "test_pub_sub-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "test_custom_msg" :depends-on ("_package_test_custom_msg"))
    (:file "_package_test_custom_msg" :depends-on ("_package"))
  ))