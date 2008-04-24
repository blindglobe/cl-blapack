;; Copyright rif 2006.
;; Modified BSD License (see LICENSE file in this directory).

(defpackage :org.middleangle.load-blapack-libs
  (:use :common-lisp :cffi)
  (:export *blapack-libs-loaded*))

(in-package :org.middleangle.load-blapack-libs)

;; EDIT THESE VARIABLES TO POINT TO YOUR LIBRARIES!

(eval-when (:compile-toplevel :load-toplevel)
  (defvar *gfortran-lib* "/usr/lib/libgfortran.so.0")
  (defvar *blas-lib* "/usr/lib/atlas/libblas.so.3")
  (defvar *lapack-lib* "/usr/lib/atlas/liblapack.so.3")

  (defvar *blapack-libs-loaded* nil)

  (unless *blapack-libs-loaded*
    (progn
      (load-foreign-library *gfortran-lib*)
      (load-foreign-library *blas-lib*)
      (load-foreign-library *lapack-lib*)
      (setf *blapack-libs-loaded* t))))
