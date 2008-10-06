;;;; -*- Mode: LISP; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(in-package :cl-user)
(defpackage :org.middleangle.cl-blapack-asd
  (:nicknames :cl-blapack-asd)
  (:use :cl :asdf))

;; Copyright rif 2006.
;; Modified BSD License (see LICENSE file in this directory).

(defsystem :org.middleangle.cl-blapack
  :depends-on (:cffi :org.middleangle.foreign-numeric-vector)
  :components
  ((:file "packages")
   (:file "features")
   (:file "bugfix" :depends-on ("features"))
   (:file "load-blapack-libs" :depends-on ("bugfix"))
   (:file "blapack-cffi-types" :depends-on ("bugfix"))
   (:file "blas-cffi" :depends-on ("load-blapack-libs"
				   "blapack-cffi-types"
                                   "bugfix"))
   (:file "lapack-cffi" :depends-on ("load-blapack-libs"
				     "blapack-cffi-types"
                                     "bugfix"))
   (:file "cl-blapack" :depends-on ("blas-cffi" "lapack-cffi"
                                                "bugfix"))))
