;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

;; Copyright rif 2006.
;; Modified BSD License (see LICENSE file in this directory).

(defsystem :org.middleangle.cl-blapack
  :depends-on (:cffi :org.middleangle.foreign-numeric-vector)
  :components
  ((:file "load-blapack-libs")
   (:file "blapack-cffi-types")
   (:file "blas-cffi" :depends-on ("load-blapack-libs"
				   "blapack-cffi-types"))
   (:file "lapack-cffi" :depends-on ("load-blapack-libs"
				     "blapack-cffi-types"))
   (:file "cl-blapack" :depends-on ("blas-cffi" "lapack-cffi"))))
