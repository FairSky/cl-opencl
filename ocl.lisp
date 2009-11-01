;;; Lispworks specific code (written with 5.1.2 version on Mac OS X 10.6)

(defpackage "OCL" (:use "CL")
  (:export
   "PLATFORMS"       "PLATFORM-COUNT"
   "DEVICES"         "DEVICE-COUNT"
   "RETAIN"          "RELEASE"
   ))
(in-package "OCL")

(defconstant +c-types+
  '((INT32    (signed-integer   32))
    (UINT32   (unsigned-integer 32))
    (INT64    (signed-integer   64))
    (UINT64   (unsigned-integer 64))
    (STRING    :pointer)
    (INT       INT32)
    (UINT      UINT)
    (LONG      INT64)
    (ULONG     UINT64)
    (MASK      ULONG)
    (BOOL      UINT)
    (PTR      :pointer)
    (PARAM    :signed)
    (SIZE-T   :unsigned)
    (FUNCTION :pointer)
    (PLATFORM  )
    (DEVICE    )
    (CONTEXT   )
    (QUEUE     )
    (BUFFER    )
    (PROGRAM   )
    (KERNEL    )
    (EVENT     )
    (SAMPLER   )))

(defconstant +c-structures+
  '((IMAGE-FORMAT)))

(defconstant +c-functions+
  '((|clGetPlatformIDs|              INT     ((UINT num-entries) ((PLATFORM) platforms) ((UINT) num-platforms)))
    (|clGetPlatformInfo|             INT     ((PLATFORM platform) (PARAM platform-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    (|clGetDeviceIDs|                INT     ((PLATFORM platform) (MASK device-type) (UINT num-entries) ((DEVICE) devices) ((UINT) num-devices)))
    (|clGetDeviceInfo|               INT     ((DEVICE device) (PARAM device-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    (|clCreateContext|               CONTEXT ((PTR context-properties) (UINT num-devices) ((DEVICE) devices) (FUNCTION notify) (PTR user-data) ((INT) error-returned)))
    (|clCreateContextFromType|       CONTEXT ((PTR context-properties) (MASK device-type) (FUNCTION notify) (PTR user-data0 ((INT) error-returned))))
    (|clRetainContext|               INT     ((CONTEXT context)))
    (|clReleaseContext|              INT     ((CONTEXT context)))
    (|clGetContextInfo|              INT     ((CONTEXT context) (PARAM context-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    (|clCreateCommandQueue|          QUEUE   ((CONTEXT context) (DEVICE device) (MASK command-queue-properties) ((INT) error-returned)))
    (|clRetainQueue|                 INT     ((QUEUE queue)))
    (|clReleaseQueue|                INT     ((QUEUE queue)))
    (|clGetCommandQueueInfo|         INT     ((QUEUE queue) (PARAM command-queue-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    (|clSetCommandQueueProperty|     INT     ((QUEUE queue) (MASK command-queue-properties) (BOOL enabled) ((MASK) command-queue-properties-returned)))
    (|clCreateBuffer|                BUFFER  ((CONTEXT context) (MASK memory-flags) (SIZE-T memory-size) (PTR host-ptr) ((INT) error-returned)))
    (|clCreateImage2D|               BUFFER  ((CONTEXT context) (MASK memory-flags) ((IMAGE-FORMAT) format) (SIZE-T width) (SIZE-T height) (SIZE-T row-pitch) (PTR host-ptr) ((INT) error-returned)))
    (|clCreateImage3D|               BUFFER  ((CONTEXT context) (MASK memory-flags) ((IMAGE-FORMAT) format) (SIZE-T width) (SIZE-T height) (SIZE-T depth) (SIZE-T row-pitch) (SIZE-T slice-pitch) (PTR host-ptr) ((INT) error-returned)))
    (|clRetainMemObject|             INT     ((BUFFER buffer)))
    (|clReleaseMemObject|            INT     ((BUFFER bufffer)))
    (|clGetSupportedImageFormats|    INT     ((CONTEXT context) (MASK memory-flags) (PARAM image-type) (UINT num-entries) ((IMAGE-FORMAT) image-formats) ((UINT) num-image-formats-returned)))
    (|clGetMemObjectInfo|            INT     ((BUFFER buffer) (PARAM memory-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    (|clGetImageInfo|                INT     ((BUFFER buffer) (PARAM image-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    (|clCreateSampler|               SAMPLER ((CONTEXT context) (BOOL normalized-coords) (UINT addressing-mode) (UINT filter-mode) ((INT) error-returned)))
    (|clRetainSampler|               INT     ((SAMPLER sampler)))
    (|clReleaseSampler|              INT     ((SAMPLER sampler)))
    (|clGetSamplerInfo|              INT     ((SAMPLER sampler) (PARAM sampler-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    (|clCreateProgramWithSource|     PROGRAM ((CONTEXT context) (UINT string-count) (PTR strings) ((SIZE-T) string-lengths) ((INT) error-returned)))
    (|clCreateProgramWithBinary|     PROGRAM ((CONTEXT context) (UINT device-count) ((DEVICE) devices) ((SIZE-T) binary-lengths) (PTR binaries) ((INT) binary-status) ((INT) error-returned)))
    (|clRetainProgram|               INT     ((PROGRAM program)))
    (|clReleaseProgram|              INT     ((PROGRAM program)))
    (|clBuildProgram|                INT     ((PROGRAM program) (UINT device-count) ((DEVICE) devices) (STRING options) (FUNCTION notify) (PTR user-data)))
    (|clUnloadCompiler|              VOID    )
    (|clGetProgramInfo|              INT     ((PROGRAM program) (PARAM program-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-returned)))
    (|clCreateKernel|                KERNEL  ((PROGRAM program) (STRING kernel-name) ((INT) error-returned)))
    (|clCreateKernelsInProgram|      KERNEL  ((PROGRAM program) (UINT kernel-count) ((KERNEL) kernels) ((UINT) kernel-count-returned)))
    (|clRetainKernel|                INT     ((KERNEL kernel)))
    (|clReleaseKernel|               INT     ((KERNEL kernel)))
    (|clSetKernelArg|                INT     ((KERNEL kernel) (UINT argument-index) (SIZE-T argument-size) (PTR argument-value)))
    (|clGetKernelInfo|               INT     ((KERNEL kernel) (PARAM kernel-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    (|clGetKernelWorkGroupInfo|      INT     ((KERNEL kernel) (DEVICE devicee) (PARAM kernel-workgroup-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    (|clWaitForEvents|               INT     ((UINT event-count) ((EVENT) events)))
    (|clGetEventInfo|                INT     ((EVENT event) (PARAM event-info (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned))))
    (|clRetainEvent|                 INT     ((EVENT event)))
    (|clReleaseEvent|                INT     ((EVENT event)))
    (|clGetEventProfilingInfo|       INT     ((EVENT event) (PARAM profiling-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    (|clFlush|                       INT     ((QUEUE queue)))
    (|clFinish|                      INT     ((QUEUE queue)))
    (|clEnqueueReadBuffer|           INT     ((QUEUE queue) (BUFFER buffer) (BOOL blocking-read)  (SIZE-T offset) (SIZE-T cb) (PTR ptr) (UINT waiting-event-count) ((EVENT) waiting-events) ((EVENT) event-returned)))
    (|clEnqueueWriteBuffer|          INT     ((QUEUE queue) (BUFFER buffer) (BOOL blocking-write) (SIZE-T offset) (SIZE-T cb) (PTR ptr) (UINT waiting-event-count) ((EVENT) waiting-events) ((EVENT) event-returned)))
    (|clEnqueueCopyBuffer|           INT     ((QUEUE queue) (BUFFER src-buffer) (BUFFER dst-buffer) (SIZE-T src-offset) (SIZE-T dst-offset) (SIZE-T cb) (PTR ptr) (UINT waiting-event-count) ((EVENT) waiting-events) ((EVENT) event-returned)))
    (|clEnqueueReadImage|            INT     ((QUEUE queue) (BUFFER buffer) (BOOL blocking-read)  ((SIZE-T 3) origin) ((SIZE-T 3) region) (SIZE-T row-pitch) (SIZE-T slice-pitch) (PTR ptr) (UINT waiting-event-count) ((EVENT) waiting-events) ((EVENT) event-returned)))
    (|clEnqueueWriteImage|           INT     ((QUEUE queue) (BUFFER buffer) (BOOL blocking-write) ((SIZE-T 3) origin) ((SIZE-T 3) region) (SIZE-T row-pitch) (SIZE-T slice-pitch) (PTR ptr) (UINT waiting-event-count) ((EVENT) waiting-events) ((EVENT) event-returned)))
    (|clEnqueueCopyImage|            INT     ((QUEUE queue) (BUFFER src-buffer) (BUFFER dst-buffer) ((SIZE-T 3) src-origin) ((SIZE-T 3) region) (SiZE-T dst-offset) (UINT waiting-event-count) ((EVENT) waiting-events) ((EVENT) event-returned)))
    (|clEnqueueCopyImageToBuffer|    INT)
    (|clEnqueueCopyBufferToImage|    INT)
    (|clEnqueueMapBuffer|            INT)
    (|clEnqueueMapImage|             INT)
    (|clEnqueueUnmapMemObject|       INT)
    (|clEnqueueNDRangeKernel|        INT)
    (|clEnqueueTask|                 INT)
    (|clEnqueueNativeKernel|         INT)
    (|clEnqueueMarker|               INT     ((QUEUE queue) ((EVENT) event-returned)))
    (|clEnqueueWaitForEvents|        INT     ((QUEUE queue) (UINT event-count) ((EVENT) events)))
    (|clEnqueueBarrier|              INT     ((QUEUE queue)))
    (|clGetExtensionFunctionAddress| PTR     ((STRING function-name)))
    (|clCreateFromGLBuffer|          BUFFER  ((CONTEXT context) (MASK memory-flags) (SIZE-T buffer-object) ((INT) error-returned)))
    (|clCreateFromGLTexture2D|       BUFFER  ((CONTEXT context) (MASK memory-flags) (SIZE-T texture-target) (SIZE-T mip-level) (SIZE-T texture-object) ((INT) error-returned)))
    (|clCreateFromGLTexture3D|       BUFFER  ((CONTEXT context) (MASK memory-flags) (SIZE-T texture-target) (SIZE-T mip-level) (SIZE-T texture-object) ((INT) error-returned)))
    (|clCreateFromGLRenderbuffer|    BUFFER  ((CONTEXT context) (MASK memory-flags) (SIZE-T render-buffer) ((INT) error-returned)))
    (|clGetGLObjectInfo|             INT     ((BUFFER buffer) ((UINT) gl-object-type) ((SIZE-T) gl-object-name)))
    (|clGetGLTextureInfo|            INT     ((BUFFER buffer) (UINT gl-texture-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    (|clEnqueueAcquireGLObjects|     INT     ((QUEUE queue) (UINT buffer-count) ((BUFFER) buffers) (UINT waiting-event-count) ((EVENT) waiting-events) ((EVENT) event-returned)))
    (|clReleaseAcquireGLObjects|     INT     ((QUEUE queue) (UINT buffer-count) ((BUFFER) buffers) (UINT waiting-event-count) ((EVENT) waiting-events) ((EVENT) event-returned)))
    #+macosx
    (|clGetGLContextInfoAPPLE|       INT     ((CONTEXT context) (PTR platform-gl-context) (UINT gl-platform-info) (SIZE-T param-value-size) (PTR param-value) ((SIZE-T) param-value-size-returned)))
    #+macosx
    (|clSetMemObjectDestructoAPPLE|  INT     ((BUFFER buffer) (FUNCTION notify) (PTR user-data)))
    #+macosx
    (|clLogMessagesToSystemLogAPPLE| VOID    ((STRING error-string) (PTR private-info) (SIZE-T cb) (PTR user-data)))
    #+macosx
    (|clLogMessagesToStdoutAPPLE|    VOID    ((STRING error-string) (PTR private-info) (SIZE-T cb) (PTR user-data)))
    #+macosx
    (|clLogMessagesToStderrAPPLE|    VOID    ((STRING error-string) (PTR private-info) (SIZE-T cb) (PTR user-data)))))

#+macosx
(fli:register-module "/System/Library/Frameworks/OpenCL.framework/OpenCL") 

#+win32
(fli:register-module "C:/Windows/System32/OpenCL.dll")

(fli:define-c-typedef s32 (:signed :int))
(fli:define-c-typedef u32 (:unsigned :int))
(fli:define-c-typedef s64 (:signed :long-long))
(fli:define-c-typedef u64 (:unsigned :long-long))

(fli:define-c-typedef platform :pointer)
(fli:define-c-typedef device   :pointer)
(fli:define-c-typedef context  :pointer)
(fli:define-c-typedef queue    :pointer)
(fli:define-c-typedef buffer   :pointer)
(fli:define-c-typedef program  :pointer)
(fli:define-c-typedef kernel   :pointer)
(fli:define-c-typedef event    :pointer)
(fli:define-c-typedef sampler  :pointer)

(fli:define-foreign-function (cl-get-platform-ids "clGetPlatformIDs")
    ((num-entries       u32)
     (platforms         (:one-of :pointer (:pointer platform)))
     (num-platforms     (:one-of :pointer (:pointer u32))))
  :result-type s32)

(fli:define-foreign-function (cl-get-platform-ids-2 "clGetPlatformIDs")
    ((num-entries       u32)
     (platforms         (:one-of :pointer (:pointer platform)))
     (num-platforms     (:one-of :pointer (:pointer u32))))
  :result-type s32)

(fli:define-foreign-function (cl-get-device-ids "clGetDeviceIDs")
    ((platform          :pointer)
     (device-types-mask u64)
     (num-entries       u32)
     (devices           (:one-of :pointer (:pointer device)))
     (num-devices       (:one-of :pointer (:pointer u32))))
  :result-type s32)

(fli:define-foreign-function (cl-create-context "clCreateContext")
    ((context-properties :pointer)
     (device-count       u32)
     (devices            (:pointer device))
     (notify-function    :pointer)
     (notify-user-data   :pointer)
     (error-code         (:one-of :pointer (:pointer u32))))
  :result-type context)

(fli:define-foreign-function (cl-create-buffer "clCreateBuffer")
    ((context context)
     (flags   u64)
     (size    :unsigned)
     (host    :pointer)
     (error   (:pointer s32)))
  :result-type buffer)

(defclass object() ((object :initarg :object)))
(defclass platform  (object) ())
(defclass device    (object) ())
(defclass context   (object) ((devices :initarg :devices)))
(defclass queue     (object) ((device  :initarg :device)))
(defclass buffer    (object) ())
(defclass sampler   (object) ())
(defclass program   (object) ((source) (devices)))
(defclass kernel    (object) ((program) (name)))
(defclass event     (object) ())

(fli:define-foreign-function (cl-retain-context   "clRetainContext")       ((context context)) :result-type s32)
(fli:define-foreign-function (cl-retain-queue     "clRetainCommandQueue")  ((queue     queue)) :result-type s32)
(fli:define-foreign-function (cl-retain-buffer    "clRetainMemObject")     ((buffer   buffer)) :result-type s32)
(fli:define-foreign-function (cl-retain-sampler   "clRetainSampler")       ((sampler sampler)) :result-type s32)
(fli:define-foreign-function (cl-retain-program   "clRetainProgram")       ((program program)) :result-type s32)
(fli:define-foreign-function (cl-retain-kernel    "clRetainKernel")        ((kernel   kernel)) :result-type s32)
(fli:define-foreign-function (cl-retain-event     "clRetainEvent")         ((event     event)) :result-type s32)

(fli:define-foreign-function (cl-release-context  "clReleaseContext")      ((context context)) :result-type s32)
(fli:define-foreign-function (cl-release-queue    "clReleaseCommandQueue") ((queue     queue)) :result-type s32)
(fli:define-foreign-function (cl-release-buffer   "clReleaseMemObject")    ((buffer   buffer)) :result-type s32)
(fli:define-foreign-function (cl-release-sampler  "clReleaseSampler")      ((sampler sampler)) :result-type s32)
(fli:define-foreign-function (cl-release-program  "clReleaseProgram")      ((program program)) :result-type s32)
(fli:define-foreign-function (cl-release-kernel   "clReleaseKernel")       ((kernel   kernel)) :result-type s32)
(fli:define-foreign-function (cl-release-event    "clReleaseEvent")        ((event     event)) :result-type s32)

(defmethod release ((context context)) (cl-release-context (slot-value context 'object)))
(defmethod release ((queue     queue)) (cl-release-queue   (slot-value queue   'object)))
(defmethod release ((buffer   buffer)) (cl-release-buffer  (slot-value buffer  'object)))
(defmethod release ((sampler sampler)) (cl-release-sampler (slot-value sampler 'object)))
(defmethod release ((program program)) (cl-release-program (slot-value program 'object)))
(defmethod release ((kernel   kernel)) (cl-release-kernel  (slot-value kernel  'object)))
(defmethod release ((event     event)) (cl-release-event   (slot-value event   'object)))

(defmethod retain  ((context context)) (cl-retain-context  (slot-value context 'object)))
(defmethod retain  ((queue     queue)) (cl-retain-queue    (slot-value queue   'object)))
(defmethod retain  ((buffer   buffer)) (cl-retain-buffer   (slot-value buffer  'object)))
(defmethod retain  ((sampler sampler)) (cl-retain-sampler  (slot-value sampler 'object)))
(defmethod retain  ((program program)) (cl-retain-program  (slot-value program 'object)))
(defmethod retain  ((kernel   kernel)) (cl-retain-kernel   (slot-value kernel  'object)))
(defmethod retain  ((event     event)) (cl-retain-event    (slot-value event   'object)))

(defclass parameter ()
  ((name)
   (id)
   (type)))

(fli:define-foreign-function (cl-get-platform-info "clGetPlatformInfo") ((platform platform) (param u32) (size :unsigned) (data :pointer) (sizeret (:one-of :pointer (:pointer :unsigned)))) :result-type s32)
(fli:define-foreign-function (cl-get-device-info   "clGetDeviceInfo")   ((device     device) (param u32) (size :unsigned) (data :pointer) (sizeret (:one-of :pointer (:pointer :unsigned)))) :result-type s32)
(fli:define-foreign-function (cl-get-context-info  "clGetContextInfo")  ((context  context)  (param u32) (size :unsigned) (data :pointer) (sizeret (:one-of :pointer (:pointer :unsigned)))) :result-type s32)

(defconstant +parameters+
  '((platform profile                       #x0900 string)
    (platform version                       #x0901 string)
    (platform name                          #x0902 string)
    (platform vendor                        #x0903 string)
    (platform extensions                    #x0904 string)
    (device   type                          #x1000 u64)
    (device   vendor-id                     #x1001 u32)
    (device   max-compute-units             #x1002 u32)
    (device   max-work-item-dimensions      #x1003 u32)
    (device   max-work-item-sizes           #x1004 (:pointer :unsigned))
    (device   max-work-group-size           #x1005 :unsigned)
    (device   preferred-vector-width-char   #x1006 u32)
    (device   preferred-vector-width-short  #x1007 u32)
    (device   preferred-vector-width-int    #x1008 u32)
    (device   preferred-vector-width-long   #x1009 u32)
    (device   preferred-vector-width-float  #x100A u32)
    (device   preferred-vector-width-double #x100B u32)
    (device   max-clock-frequency           #x100c u32)
    (device   address-bits                  #x100d u32)
    (device   max-mem-alloc-size            #x100e u64)
    (device   image-support                 #x100f u32)
    (device   max-read-image-args           #x1010 u32)
    (device   max-write-image-args          #x1011 u32)
    (device   image2d-max-width             #x1012 :unsigned)
    (device   image2d-max-height            #x1013 :unsigned)
    (device   image3d-max-width             #x1014 :unsigned)
    (device   image3d-max-height            #x1015 :unsigned)
    (device   image3d-max-depth             #x1016 :unsigned)
    (device   max-samplers                  #x1017 u32)
    (device   max-parameter-size            #x1018 :unsigned)
    (device   mem-base-addr-align           #x1019 u32)
    (device   min-data-type-align-size      #x101A u32)
    (device   single-fp-config              #x101B u64)
    (device   global-mem-cache-type         #x101C u32)
    (device   global-mem-cacheline-size     #x101D u32)
    (device   global-mem-cache-size         #x101E u64)
    (device   global-mem-size               #x101F u64)
))    

(defmethod info-function ((platform platform)) #'cl-get-platform-info)
(defmethod info-function ((device     device)) #'cl-get-device-info)
(defmethod info-function ((context   context)) #'cl-get-context-info)

(defgeneric info (param object &optional object2))

(defun cl-get-info (param object1 &optional object2 &key (f1 #'cl-get-device-info) (f2 nil))
  (assert (not (eq (null f1) (null f2))))
  (fli:with-dynamic-foreign-objects ((size :unsigned 0))
    (let ((e1 (if (null f2) (funcall f1 object1 param 0 nil size)
                (funcall f2 object1 object2 param 0 nil size))))
      (if (zerop e1)
          (let ((size (fli:dereference size)))
            (fli:with-dynamic-foreign-objects ((data :byte :nelems size))
              (let ((e2 (if (null f2) (funcall f1 object1 param size data nil)
                          (funcall f2 object1 object2 param size data nil))))
                (if (zerop e2)
                    (let ((array (make-array size :element-type '(unsigned-byte 8))))
                      (dotimes (n size) (setf (aref array n)
                                              (fli:dereference data :index n)))
                      (values array e2))
                  (values nil e2)))))
        (values nil e1)))))

(defmethod info (param (platform platform) &optional object2)
  (let ((platform (slot-value platform 'object)))
    (fli:with-dynamic-foreign-objects ((count :unsigned))
      (let ((error1 (cl-get-platform-info platform param 0 nil count)))
        (let ((count (fli:dereference count)))
          (fli:with-dynamic-foreign-objects ((param-value :byte :nelems count))
            (let ((error2 (cl-get-platform-info platform param count param-value nil)))
              (values param-value count error1 error2))))))))

(defun platform-count ()
  (fli:with-dynamic-foreign-objects ((count u32))
    (let ((error (cl-get-platform-ids 0 nil count)))
      (values (fli:dereference count) error))))

(defun platforms ()
  (let ((count (platform-count)))
    (fli:with-dynamic-foreign-objects ((platforms platform :nelems count))
      (let ((error (cl-get-platform-ids count platforms nil)))
        (values (loop for n :below count collecting (fli:dereference platforms :index n))
                error)))))

(defun platforms2 ()
  (let ((count (platform-count)))
    (fli:with-dynamic-foreign-objects ((platforms platform :nelems count))
      (let ((error (cl-get-platform-ids count platforms nil)))
        (values (loop for n :below count collecting (make-instance 'platform :object (fli:dereference platforms :index n)))
                error)))))

(defun device-count (platform)
  (fli:with-dynamic-foreign-objects ((count u32))
    (let ((error (cl-get-device-ids platform #xFFFFFFFF 0 nil count)))
      (values (fli:dereference count) error))))

(defun devices (platform)
  (let ((count (device-count platform)))
    (fli:with-dynamic-foreign-objects ((devices device :nelems count))
      (let ((error (cl-get-device-ids platform #xFFFFFFFFF count devices nil)))
        (values (loop for n :below count collecting (fli:dereference devices :index n))
                error)))))

(defun devices2 (platform)
  (let ((platform (slot-value platform 'object)))
   (let ((count (device-count platform)))
     (fli:with-dynamic-foreign-objects ((devices device :nelems count))
       (let ((error (cl-get-device-ids platform #xFFFFFFFFF count devices nil)))
         (values (loop for n :below count collecting
                       (make-instance 'device :object (fli:dereference devices :index n)))
                 error))))))

(defun make-context (devices)
  (let* ((device-count (length devices)))
    (fli:with-dynamic-foreign-objects
        ((devices device :nelems device-count :initial-contents devices)
         (error u32))
      (let ((context (cl-create-context nil device-count devices nil nil error)))
        (values context (fli:dereference error))))))

(defmethod initialize-instance :after ((context context) &rest initargs &key &allow-other-keys)
  (setf (slot-value context 'object)
        (make-context (slot-value context 'devices))))
                                       
(fli:define-foreign-callable ("notify" :result-type :void)
    ((error-info   (:reference-return :ef-mb-string))
     (private-info :pointer)
     (private-size :int)
     (user-data    :pointer))
  (format t "OpenCL: error    = ~A~&" error-info)
  (format t "OpenCL: private  = ~A ~A~&" private-size private-info)
  (format t "OpenCL: userdata = ~A~&" user-data))

(defmacro make-buffer-helper (buffer-flags)
  `(fli:with-dynamic-foreign-objects ((error s32))
     (values (cl-create-buffer context ,buffer-flags size nil error)
             (fli:dereference error))))
(defun make-buffer       (context size) (make-buffer-helper 0))
(defun make-read-buffer  (context size) (make-buffer-helper 2))
(defun make-write-buffer (context size) (make-buffer-helper 1))

(defparameter *platforms* (platforms))
(defparameter *platform* (first *platforms*))
(defparameter *devices* (devices (first *platforms*)))
(defparameter *device* (first *devices*))
(defparameter *context* (make-context *devices*))

(defconstant +error-codes+
  '((SUCCESS                         .   0)
    (DEVICE-NOT-FOUND                .  -1)
    (DEVICE-NOT-AVAILABLE            .  -2)
    (COMPILER-NOT-AVAILABLE          .  -3)
    (BUFFER-ALLOCATION-FAILURE       .  -4)
    (OUT-OF-RESOURCES                .  -5)
    (OUT-OF-HOST-MEMORY              .  -6)
    (PROFILING-NOT-AVAILABLE         .  -7)
    (MEMORY-COPY-OVERLAP             .  -8)
    (IMAGE-FORMAT-MISMATCH           .  -9)
    (IMAGE-FORMAT-NOT-SUPPORTED      . -10)
    (BUILD-PROGRAM-FAILURE           . -11)
    (MAP-FAILURE                     . -12)
    (INVALID-VALUE                   . -30)
    (INVALID-DEVICE-TYPE             . -31)
    (INVALID-PLATFORM                . -32)
    (INVALID-DEVICE                  . -33)
    (INVALID-CONTEXT                 . -34)   
    (INVALID-QUEUE_PROPERTIES        . -35)  
    (INVALID-COMMAND_QUEUE           . -36)        
    (INVALID-HOST_PTR                . -37)         
    (INVALID-MEM_OBJECT              . -38)   
    (INVALID-IMAGE_FORMAT_DESCRIPTOR . -39)   
    (INVALID-IMAGE_SIZE              . -40)         
    (INVALID-SAMPLER                 . -41)         
    (INVALID-BINARY                  . -42)         
    (INVALID-BUILD_OPTIONS           . -43)         
    (INVALID-PROGRAM                 . -44)         
    (INVALID-PROGRAM_EXECUTABLE      . -45)         
    (INVALID-KERNEL_NAME             . -46)         
    (INVALID-KERNEL_DEFINITION       . -47)         
    (INVALID-KERNEL                  . -48)
    (INVALID-ARG_INDEX               . -49)       
    (INVALID-ARG_VALUE               . -50)         
    (INVALID-ARG_SIZE                . -51)         
    (INVALID-KERNEL_ARGS             . -52)         
    (INVALID-WORK_DIMENSION          . -53)         
    (INVALID-WORK_GROUP_SIZE         . -54)         
    (INVALID-WORK_ITEM_SIZE          . -55)         
    (INVALID-GLOBAL_OFFSET           . -56)         
    (INVALID-EVENT_WAIT_LIST         . -57)         
    (INVALID-EVENT                   . -58)         
    (INVALID-OPERATION               . -59)         
    (INVALID-GL_OBJECT               . -60)         
    (INVALID-BUFFER_SIZE             . -61)         
    (INVALID-MIP_LEVEL               . -62)))


#+nil
(platform-count) 

#+nil
(platforms)

#+nil
(device-count (first (platforms)))

#+nil
(devices (first (platforms)))
