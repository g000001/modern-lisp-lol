;;;; modern-lisp-lol.lisp

(cl:in-package :modern-lisp-lol)
(NAMED-READTABLES::IN-READTABLE :COMMON-LISP)


;;; "modern-lisp-lol" goes here. Hacks and glory await!

(defun externals ()
  (let (ans)
    (do-external-symbols (s :cl)
      (push s ans) )
    ans ))


(defun functions (&optional (ext (externals)))
  (remove-if-not (lambda (s) 
                   (and (fboundp s)
                        (not (special-operator-p s))
                        (not (macro-function s))
                        s))
                 ext))


(defun setup-functoins (&optional (fs (functions)))
  (dolist (s fs)
    (setf (symbol-function (find-symbol (string-downcase s) "cl"))
          (symbol-function (find-symbol (string s) "CL")))))


(defun macros (&optional (ext (externals)))
  (remove-if-not (lambda (s) 
                   (and (fboundp s)
                        (not (special-operator-p s))
                        (macro-function s)
                        s))
                 ext))


(defun setup-macros (&optional (fs (macros)))
  (dolist (s fs)
    (setf (macro-function (find-symbol (string-downcase s) "cl"))
          (macro-function (find-symbol (string s) "CL")))))


(defun special-operators (&optional (ext (externals)))
  (remove-if-not (lambda (s) 
                   (and (fboundp s)
                        (special-operator-p s)
                        s))
                 ext))


(defun setup-special-operators (&optional (sops (special-operators)))
  (dolist (s sops)
    (eval `(defmacro ,(find-symbol (string-downcase s) "cl") (&rest args)
             `(,',s ,@args)))))


(defun special-variables (&optional (ext (externals)))
  (remove-if-not (lambda (s) 
                   (and (boundp s)
                        (char= #\* (char (string s) 0))
                        s))
                 ext))

(defun constants (&optional (ext (externals)))
  (remove-if-not (lambda (s) 
                   (and (boundp s)
                        (constantp s)
                        s))
                 ext))

(defun setup-constants (&optional (consts (constants)))
  (dolist (s consts)
    (eval `(defconstant ,(find-symbol (string-downcase s) "cl") 
             ,s))))


(let ((STD-RT (copy-readtable nil)))
  (defun |*-READER| (STREAM CHAR)
    (let ((CL:|*READTABLE*| STD-RT))
      (unread-char CHAR STREAM)
      (read STREAM t nil t)))
  (defun |&-READER| (STREAM CHAR)
    (let ((CL:|*READTABLE*| STD-RT))
      (unread-char CHAR STREAM)
      (read STREAM t nil t)))
  (defun |:-READER| (STREAM CHAR)
    (let ((CL:|*READTABLE*| STD-RT))
      (unread-char CHAR STREAM)
      (read STREAM t nil t))))


#|(let ((*readtable* (find-readtable :modern-lisp-lol)))
  (CL:READ-FROM-STRING "::foo"))|#


;;; 
