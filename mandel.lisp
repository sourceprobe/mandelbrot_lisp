(defconstant MAX_ITERATIONS 27)
(defconstant OUTPUT_RES_X 3.5)
(defconstant OUTPUT_RES_Y 2)
(defconstant OUTPUT_OFFSET_X -2.5)
(defconstant OUTPUT_OFFSET_Y -1)
(defconstant RESOLUTION_X 150)
(defconstant RESOLUTION_Y 60)

(defun for (start end fn)
    (if (>= start end)
        't
        (progn
            (apply fn (list start))
            (for (+ 1 start) end fn))))

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
    (defun calc_inner (x y iters) 
        (if (or (>= iters MAX_ITERATIONS)
                (< 4 (+ (* x x) (* y y))))
            iters
            (let (
                  (xnext (+ xi (* x x) (* -1 y y)))
                  (ynext (+ yi (* x y 2))))
                (calc_inner xnext ynext (+ 1 iters)))))
    (calc_inner 0 0 0)))
(defun draw_row (y width)
    (for 0 width (lambda (x)
        (princ (show (calc x y))))))
(defun draw_window (width height) 
    (for 0 height (lambda (y)
        (progn
            (draw_row y width)
            (terpri)))))
        
(defun main ()
    (draw_window RESOLUTION_X RESOLUTION_Y))

