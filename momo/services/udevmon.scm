(define-module (momo services udevmon)
  #:use-module (guix gexp)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu packages linux)
  #:export (udevmon-service))

(define udevmon-shepherd-service
  (lambda (config)
    (list (shepherd-service
           (documentation "udevmon from interception-tools.")
           (provision '(udevmon))
           (requirement '(udev)) ; or other relevant requirements
           (start #~(make-forkexec-constructor
                     (list #$(file-append interception-tools "/bin/udevmon")
			   "-c" "/etc/udevmon.yaml")
		     #:log-file "/var/log/udevmon.log"
		     #:user "root"))
           (stop #~(make-kill-destructor))))))

(define udevmon-service-type
  (service-type (name 'udevmon)
                (description "udevmon service from interception-tools.")
                (extensions
                 (list (service-extension shepherd-root-service-type
                                          udevmon-shepherd-service)))))

(define* (udevmon-service #:key (config (list)))
  (service udevmon-service-type config))
