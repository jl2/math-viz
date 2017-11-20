;;;; math-viz.asd
;;;;
;;;; Copyright (c) 2017 Jeremiah LaRocco <jeremiah.larocco@gmail.com>

(asdf:defsystem #:math-viz
  :description "Describe math-viz here"
  :author "Jeremiah LaRocco <jeremiah.larocco@gmail.com>"
  :license "ISC"
  :depends-on (#:clgl)
  :serial t
  :components ((:file "package")
               (:file "math-viz")))

