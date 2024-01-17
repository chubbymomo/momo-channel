(define udevmon
  (make <service>
    #:provides '(udevmon)
    #:docstring "Run udevmon"
    #:start (make-forkexec-constructor
              '("udevmon" "-c /etc/udevmon.yaml")
              #:log-file (string-append (getenv "HOME")
                                        "/log/udevmon.log"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services udevmon)

(start udevmon)
