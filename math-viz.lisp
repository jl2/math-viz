;;;; math-viz.lisp
;;;;
;;;; Copyright (c) 2017 Jeremiah LaRocco <jeremiah.larocco@gmail.com>

(in-package #:math-viz)

(defun bisect (primitives function x-min x-max &optional (depth 10) (fx-min nil) (fx-max nil) )
  (let* ((f-x-min (if fx-min fx-min (funcall function x-min)))
         (f-x-max (if fx-max fx-max (funcall function x-max)))
         (x-mid (+ x-min (/ (- x-max x-min) 2)))
         (f-x-mid (funcall function x-mid)))

    (format t "f(~a) = ~a~%f(~a) = ~a~%f(~a) = ~a~%"
            x-min f-x-min
            x-mid f-x-mid
            x-max f-x-max)

    (clgl:add-line primitives
                   (vec3 x-min f-x-min 0.0)
                   (vec3 x-max f-x-max 0.0)
                   (vec4 1.0 0.0 0.5 1.0))

    (clgl:add-line primitives
                   (vec3 x-min f-x-min 0.0)
                   (vec3 x-mid f-x-mid 0.0)
                   (vec4 0.0 1.0 0.5 1.0))
    (clgl:add-line primitives
                   (vec3 x-mid f-x-mid 0.0)
                   (vec3 x-max f-x-max 0.0)
                   (vec4 0.5 0.0 1.0 1.0))

    (let ((change (* f-x-mid f-x-min)))
      (format t "~a~%~%" change)
      (cond ((or (= f-x-mid 0.0) (= depth 0))
             x-mid)
            ((> 0.0 change)
             (bisect primitives function x-min x-mid (1- depth) f-x-min f-x-mid))
            (t
             (bisect primitives function x-mid x-max (1- depth) f-x-mid f-x-max ))))))

(defun show-zero-bisect (&key (function (lambda (x) (- (* x x) 1))) (x-min 0.0) (x-max 2.0) (depth 20))
  (let ((prims (2d-plot :yf function)))
    (values prims (bisect prims function x-min x-max depth ))))
