(begin
(define hook
  (make-wrapper-procedure (#%$fasl-write-gensym-hook)
                          (procedure-arity-mask (#%$fasl-write-gensym-hook))
                          #t))

(parameterize ([#%$fasl-write-gensym-hook hook])
  (compile-file "demo.ss"))
(define desc
  (#%$describe-fasl-from-port (open-file-input-port "demo.so")))
)
