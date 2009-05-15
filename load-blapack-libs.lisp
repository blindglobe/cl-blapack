;; Copyright rif 2006.
;; Modified BSD License (see LICENSE file in this directory).

(defpackage :org.middleangle.load-blapack-libs
  (:use :common-lisp :cffi)
  (:export *blapack-libs-loaded*))

(in-package :org.middleangle.load-blapack-libs)

;; EDIT THESE VARIABLES TO POINT TO YOUR LIBRARIES!


#|
;;; The suggestion (from Leo (sdl.web at gmail dot com) to use native
;;; accelerated BLAS and LAPACK on MacOSX is to COMMENT OUT the
;;; gfortran lib DEFPARAMETER and LOAD-FOREIGN-LIBRARY, as it is not
;;; linked in, and to use the following locations:

  ;; (defparameter *gfortran-lib* "/usr/lib/libgfortran.so.3")
  (defparameter *blas-lib*
     "/System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib")
  (defparameter *lapack-lib*
     "/System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/Versions/A/libLAPACK.dylib")

;;; and then for the load, comment it out:

+      ;; (load-foreign-library *gfortran-lib*)

;;; This might not hold for your MacOSX setup, please report back!
|#


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
