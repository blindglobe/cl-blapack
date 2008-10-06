

(in-package :cl-user)

(defpackage :org.middleangle.cl-blapack
  (:nicknames :cl-blapack)
  (:use :common-lisp :foreign-numeric-vector :blas-cffi)
  (:export :with-blapack))
