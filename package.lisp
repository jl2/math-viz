;;;; package.lisp
;;;;
;;;; Copyright (c) 2017 Jeremiah LaRocco <jeremiah.larocco@gmail.com>

(defpackage #:math-viz
  (:nicknames :mv)
  (:use #:cl #:clgl #:3d-matrices #:3d-vectors)
  (:export #:show-zero-bisect))

