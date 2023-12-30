#!/usr/local/bin/sbcl --script
(load "mandel.lisp")

; Compile to an executable.
(defun save ()
    (sb-ext:save-lisp-and-die 
        "mandel.sbcl.o"
        :toplevel #'main
        :executable t))
(save)


