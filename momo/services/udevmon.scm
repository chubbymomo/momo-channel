(define-module (momo services linux))

(define udevmon-service-type
  (make <service>
    #:provides '(udevmon)
    #:docstring "Run udevmon"
    #:start (make-forkexec-constructor
             '("udevmon" "-c /etc/udevmon.yaml"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services udevmon)
