(defconstant MAX_ITERATIONS 27)
(defconstant OUTPUT_RES_X 3.5)
(defconstant OUTPUT_RES_Y 2)
(defconstant OUTPUT_OFFSET_X -2.5)
(defconstant OUTPUT_OFFSET_Y -1)
(defconstant RESOLUTION_X 150)
(defconstant RESOLUTION_Y 60)


; turn # interations into a char for display
(defun show (val) 
    (if (<= val 26)
        (code-char (+ val 
                          -1
                          (char-code #\A)))
        " "))
; Calculate how many steps are required.
(defun calc (x y)
    (let (
      (xi (+ OUTPUT_OFFSET_X (* OUTPUT_RES_X (/ x RESOLUTION_X))))
      (yi (+ OUTPUT_OFFSET_Y (* OUTPUT_RES_Y (/ y RESOLUTION_Y)))))
      (loop for iters below MAX_ITERATIONS
	    for x = 0 then (+ (+ xi (* x x) (* -1 y y)))
	    and y = 0 then (+ yi (* x y 2))
	    when (< 4 (+ (* x x) (* y y)))
	    	do (return iters)
	    finally (return iters))))
	
(defun draw_window (width height) 
  (dotimes (y height)
    (dotimes (x width)
        (princ (show (calc x y))))
    (terpri)))
        
(defun main ()
    (draw_window RESOLUTION_X RESOLUTION_Y))

