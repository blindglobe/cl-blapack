;; Copyright rif 2006.
;; Modified BSD License (see LICENSE file in this directory).

(defpackage :org.middleangle.cl-blapack
  (:nicknames :cl-blapack)
  (:use :common-lisp :foreign-numeric-vector)
  (:export :with-blapack))

(in-package :org.middleangle.cl-blapack)

(use-package :blas-cffi)

(do-external-symbols (s :blas-cffi)
  (export s))

;; don't use the package LAPACK-CFFI directly since some functions
;; such as %XERBLA and %LSAME are defined in both LAPACK and BLAS and
;; we want to use the BLAS versions.
(do-external-symbols (s :lapack-cffi)
  (unless (find-symbol (symbol-name s) :cl-blapack)
    (import s)
    (export s)))

;; Right now, we only work with SBCL.  People need to add the
;; appropriate definitions for alternate implementations.

#-(or sbcl cmu)
(defmacro with-blapack (&body body)
  `(progn
    ,@body))

#+sbcl
(defmacro with-blapack (&body body)
  `(sb-int:with-float-traps-masked (:divide-by-zero)
    ,@body))

#+cmu
(defmacro with-blapack (&body body)
  `(extensions:with-float-traps-masked (:divide-by-zero)
     ,@body))
