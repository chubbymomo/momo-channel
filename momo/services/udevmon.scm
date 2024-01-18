(define-module (momo services udevmon)
  #:use-module (gnu packages)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:use-module (gnu services shepherd)
  #:use-module (momo packages keyboard)
  #:use-module (gnu packages linux)
  #:export (udevmon-service))

(define (udevmon-shepherd-config)
  '())

(define udevmon-shepherd-service
  (lambda (config)
    (list (shepherd-service
	   (documentation "udevmon daemon")
	   (provision '(udevmon))
	   (requirement '(udev))
	   (start #~(make-forkexec-constructor
		     (list (string-append #$interception-tools "/bin/udevmon" " -c " "/etc/udevmon.yaml"))
		     #:environment-variables '("GUILE_WARN_DEPRECATED=detailed")
		     #:log-file "/var/log/udevmon.log"))
	   (stop #~(make-kill-destructor))))))

(define udevmon-service-type
  (service-type
   (name 'udevmon)
   (description "Start udevmon")
   (extensions
    (list (service-extension shepherd-root-service-type
			     udevmon-shepherd-service)))))

(define* (udevmon-service #:key (config (list)))
  (service udevmon-service-type config))

