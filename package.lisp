;;;; package.lisp

(cl:in-package :cl-user)
(NAMED-READTABLES:IN-READTABLE :STANDARD)


(defpackage :|common-lisp| 
  (:use)
  (:nicknames :|cl|)
  (:export . #.(let (ans)
                 (do-external-symbols (s :cl)
                   (push (string-downcase s) ans) )
                 ans ))
  (:export . 
    ("*BREAK-ON-SIGNALS*"
     "*PRINT-CIRCLE*" "*STANDARD-INPUT*" "*PRINT-BASE*"
     "*READTABLE*" "*COMPILE-VERBOSE*" "*READ-SUPPRESS*" "*MACROEXPAND-HOOK*"
     "*TERMINAL-IO*" "*LOAD-VERBOSE*" "*READ-EVAL*" "*TRACE-OUTPUT*"
     "*PRINT-RIGHT-MARGIN*" "*PRINT-MISER-WIDTH*" "*PRINT-RADIX*" "*PRINT-ESCAPE*"
     "*READ-BASE*" "*GENSYM-COUNTER*" "*STANDARD-OUTPUT*" "*LOAD-PATHNAME*"
     "*READ-DEFAULT-FLOAT-FORMAT*" "*QUERY-IO*" "*MODULES*" "*RANDOM-STATE*"
     "*LOAD-TRUENAME*" "**" "*COMPILE-FILE-PATHNAME*" "*PRINT-LENGTH*"
     "*PRINT-GENSYM*" "*FEATURES*" "*DEFAULT-PATHNAME-DEFAULTS*" "*PRINT-ARRAY*"
     "*DEBUG-IO*" "*PRINT-LEVEL*" "*COMPILE-FILE-TRUENAME*" "*LOAD-PRINT*"
     "*COMPILE-PRINT*" "*DEBUGGER-HOOK*" "*PRINT-LINES*" "*PRINT-READABLY*"
     "*PRINT-CASE*" "*PACKAGE*" "*PRINT-PPRINT-DISPATCH*" "*PRINT-PRETTY*" "***"
     "*ERROR-OUTPUT*" ))
  (:export :CL . #.cl:lambda-list-keywords)
  (:import-from :CL . #.cl:lambda-list-keywords)
  (:import-from :CL . 
    ("*BREAK-ON-SIGNALS*"
     "*PRINT-CIRCLE*" "*STANDARD-INPUT*" "*PRINT-BASE*"
     "*READTABLE*" "*COMPILE-VERBOSE*" "*READ-SUPPRESS*" "*MACROEXPAND-HOOK*"
     "*TERMINAL-IO*" "*LOAD-VERBOSE*" "*READ-EVAL*" "*TRACE-OUTPUT*"
     "*PRINT-RIGHT-MARGIN*" "*PRINT-MISER-WIDTH*" "*PRINT-RADIX*" "*PRINT-ESCAPE*"
     "*READ-BASE*" "*GENSYM-COUNTER*" "*STANDARD-OUTPUT*" "*LOAD-PATHNAME*"
     "*READ-DEFAULT-FLOAT-FORMAT*" "*QUERY-IO*" "*MODULES*" "*RANDOM-STATE*"
     "*LOAD-TRUENAME*" "**" "*COMPILE-FILE-PATHNAME*" "*PRINT-LENGTH*"
     "*PRINT-GENSYM*" "*FEATURES*" "*DEFAULT-PATHNAME-DEFAULTS*" "*PRINT-ARRAY*"
     "*DEBUG-IO*" "*PRINT-LEVEL*" "*COMPILE-FILE-TRUENAME*" "*LOAD-PRINT*"
     "*COMPILE-PRINT*" "*DEBUGGER-HOOK*" "*PRINT-LINES*" "*PRINT-READABLY*"
     "*PRINT-CASE*" "*PACKAGE*" "*PRINT-PPRINT-DISPATCH*" "*PRINT-PRETTY*" "***"
     "*ERROR-OUTPUT*" )))


(defpackage :|common-lisp-user|
  (:use :|cl|)
  (:nicknames :|cl-user|))


(defpackage :modern-lisp-lol
  (:use :cl :named-readtables :fiveam))

(defpackage "modern-lisp-lol.test"
  (:use :|cl| :named-readtables :fiveam))

