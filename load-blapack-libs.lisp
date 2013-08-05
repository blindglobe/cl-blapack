;; Copyright rif 2006.
;; Modified BSD License (see LICENSE file in this directory).

(defpackage :org.middleangle.load-blapack-libs
  (:use :common-lisp :cffi)
  (:export *blapack-libs-loaded*))

(in-package :org.middleangle.load-blapack-libs)






(eval-when (:compile-toplevel :load-toplevel)
#+darwin 
  (progn
    (defparameter *gfortran-lib* nil)
    (defparameter *blas-lib*
      "/System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib")
    (defparameter *lapack-lib*
      "/System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/Versions/A/libLAPACK.dylib"))
#-darwin
  (progn
    (defparameter *gfortran-lib* "libgfortran.so.3")
    (defparameter *blas-lib* "libblas.so")
    (defparameter *lapack-lib* "liblapack.so"))

  
  (defvar *blapack-libs-loaded* nil)

  (unless *blapack-libs-loaded*
    (progn
      (when *gfortran-lib* (load-foreign-library *gfortran-lib*))
      (load-foreign-library *blas-lib*)
      (load-foreign-library *lapack-lib*)
      (setf *blapack-libs-loaded* t))))
