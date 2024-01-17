(define-module (keyboard)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (gnu packages linux)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download))

(define-public caps2esc
  (let ((commit "975bb742841244141012c05e0c624672160af3e0"))
    (package
   (name "caps2esc")
   (version "0.3.2")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://gitlab.com/interception/linux/plugins/caps2esc")
		  (commit commit)))
	
	    (sha256
	     (base32
	      "0y8cyx6g5ixfwh73mwg03ajy9d1i7fimqxn9q79k925i12a49wc0"))))
   (build-system cmake-build-system)
   (arguments
    `(#:tests? #false))
   (propagated-inputs
    (list interception-tools))
   (synopsis "Transforming the most useless key ever in the most useful one.
For vi/Vim/NeoVim addicts at least.")
   (description
    "Put what's useless in its place
By moving the CAPSLOCK function to the far ESC location.
Make what's useful comfortably present, just below your Pinky
By moving both ESC and CTRL functions to the CAPSLOCK location")
   (home-page "https://gitlab.com/interception/linux/plugins/caps2esc")
   (license gpl3+))))
  
caps2esc
