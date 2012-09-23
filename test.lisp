(cl:in-package "modern-lisp-lol.test")
(IN-READTABLE :MODERN-LISP-LOL)

(DEF-SUITE modern-lisp-lol)

(IN-SUITE modern-lisp-lol)


(TEST Symbol-name
  (IS (string= (symbol-name 'foo)
               "foo" ))
  (IS (string= (symbol-name 'Foo)
               "Foo" ))
  ;; !!! 
  (IS (string= (symbol-name :Foo)
               "FOO" ))
  (IS (string= (symbol-name :|Foo|)
               "Foo" )))


(defun keytest1 (n &key (FOO 3))
  (list n FOO))


(defun keytest2 (n &key ((:foo foo) 3))
  (list n foo))


(defun keytest3 (n &key (foo 3))
  (list n foo))


(TEST Keys
  (IS (equal (keytest1 1 :foo 2)
             (list 1 2)))
  (IS (equal (keytest2 1 :foo 2)
             (list 1 2)))
  ;; !!!
  (IS (equal (keytest3 1 :|foo| 2)
             (list 1 2)))
  (IS (string= (make-string 3 :initial-element #\a)
               "aaa")))


(TEST Special-variables
  (IS (= (let ((*read-base* 8.))
           (read-from-string "11"))
         9.)))

(TEST Print
  (IS (string= (princ-to-string 'Zombie)
               "Zombie"))
  (IS (string= (princ-to-string 'zombie)
               "zombie")))


(TEST Symbol
  (IS-FALSE (eq 'zombie 'Zombie))
  (IS-TRUE (eq 'Zombie 'Zombie)))


(TEST Misc
  (IS-TRUE (equal 
            (let ((*readtable* (FIND-READTABLE :modern-lisp-lol)))
              (read-from-string "#+(#.(cl:if(cl:equal(cl:format()\"~A\"(cl:read-from-string \"#:m\"))\"M\") :or :and)) (pushnew :case-sensitiveness *features*)"))
            '(pushnew :CASE-SENSITIVENESS *FEATURES*))))


;;; eof
