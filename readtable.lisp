;;;; readtable.lisp

(CL:IN-PACKAGE :MODERN-LISP-LOL)
(NAMED-READTABLES:IN-READTABLE :STANDARD)

(DEFREADTABLE :MODERN-LISP-LOL
  (:MERGE :STANDARD)
  (:MACRO-CHAR #\* #'*-READER T)
  (:MACRO-CHAR #\& #'&-READER T)
  (:MACRO-CHAR #\: #'|:-READER| T)
  (:CASE :PRESERVE))
