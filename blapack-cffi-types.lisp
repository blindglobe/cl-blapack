;; Copyright rif 2006.
;; Modified BSD License (see LICENSE file in this directory).

(defpackage :org.middleangle.blapack-cffi-types
  (:nicknames :blapack-cffi-types)
  (:use :common-lisp :cffi :fnv))

(in-package :org.middleangle.blapack-cffi-types)

(defctype :fortran-int :pointer)
(defctype :fortran-float :pointer)
(defctype :fortran-double :pointer)
(defctype :fortran-complex-float :pointer)
(defctype :fortran-complex-double :pointer)
(defctype :fortran-logical :pointer)
(defctype :logical :int)

(defmethod translate-to-foreign (val (name (eql :fortran-int)))
  (if (typep val 'fnv-int32)
      (fnv-foreign-pointer val)
      (fnv-foreign-pointer (make-fnv-int32 1 :initial-value val))))

(defmethod translate-to-foreign (val (name (eql :fortran-float)))
  (if (typep val 'fnv-float)
      (fnv-foreign-pointer val)
      (fnv-foreign-pointer (make-fnv-float 1 :initial-value val))))

(defmethod translate-to-foreign (val (name (eql ':fortran-double)))
  (if (typep val 'fnv-double)
      (fnv-foreign-pointer val)
      (fnv-foreign-pointer (make-fnv-double 1 :initial-value val))))

(defmethod translate-to-foreign (val (name (eql :fortran-complex-float)))
  (if (typep val 'fnv-complex-float)
      (fnv-foreign-pointer val)
      (fnv-foreign-pointer (make-fnv-complex-float 1 :initial-value val))))

(defmethod translate-to-foreign (val (name (eql :fortran-complex-double)))
  (if (typep val 'fnv-complex-double)
      (fnv-foreign-pointer val)
      (fnv-foreign-pointer (make-fnv-complex-double 1 :initial-value val))))

(defmethod translate-to-foreign (val (name (eql :fortran-logical)))
  (if (typep val 'fnv-int32)
      (fnv-foreign-pointer val)
      (fnv-foreign-pointer (make-fnv-int32 1 :initial-value (if val 1 -1)))))

(setf (cffi-type-to-fnv-type :logical) :cffi-fnv-int32)
