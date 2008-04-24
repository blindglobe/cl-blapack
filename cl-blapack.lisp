;; Copyright rif 2006.
;; Modified BSD License (see LICENSE file in this directory).

(defpackage :org.middleangle.cl-blapack
  (:nicknames :cl-blapack)
  (:use :common-lisp :foreign-numeric-vector)
  (:export :with-blapack))

(in-package :org.middleangle.cl-blapack)

(use-package :blas-cffi)

(do-external-symbols (s :blas-cffi)
  (unintern s :lapack-cffi)
  (export s))

(use-package :lapack-cffi)
(do-external-symbols (s :lapack-cffi)
  (export s))

;; Right now, we only work with SBCL.  People need to add the
;; appropriate definitions for alternate implementations.

#-sbcl
(defmacro with-blapack (&body body)
  `(progn
    ,@body))

#+sbcl
(defmacro with-blapack (&body body)
  `(sb-int:with-float-traps-masked (:divide-by-zero)
    ,@body))
