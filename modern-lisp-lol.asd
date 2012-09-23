;;;; modern-lisp-lol.asd -*- Mode: Lisp;-*- 

(cl:in-package :asdf)
;;(NAMED-READTABLES:IN-READTABLE :STANDARD)
(defsystem :modern-lisp-lol
  :serial t
  :depends-on (:fiveam
               :named-readtables)
  :components ((:file "package")
               (:file "modern-lisp-lol")
               (:file "setup")
               (:file "readtable")
               (:file "test")))

(defmethod perform ((o test-op) (c (eql (find-system :modern-lisp-lol))))
  (load-system :modern-lisp-lol)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
        (let ((result (funcall (_ :fiveam :run) (_ :|modern-lisp-lol.test|
                                                   :|modern-lisp-lol|))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))

