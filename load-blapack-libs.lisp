;; Copyright rif 2006.
;; Modified BSD License (see LICENSE file in this directory).

(defpackage :org.middleangle.load-blapack-libs
  (:use :common-lisp :cffi)
  (:export *blapack-libs-loaded*))

(in-package :org.middleangle.load-blapack-libs)

;; EDIT THESE VARIABLES TO POINT TO YOUR LIBRARIES!

(eval-when (:compile-toplevel :load-toplevel)
  (defparameter *gfortran-lib* "/usr/lib/libgfortran.so.3")
  (defparameter *blas-lib* "/usr/lib/libblas.so")
  (defparameter *lapack-lib* "/usr/lib/liblapack.so")

  (defvar *blapack-libs-loaded* nil)

  (unless *blapack-libs-loaded*
    (progn
      (load-foreign-library *gfortran-lib*)
      (load-foreign-library *blas-lib*)
      (load-foreign-library *lapack-lib*)
      (setf *blapack-libs-loaded* t))))
