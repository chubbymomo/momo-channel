(define-module (momo packages development)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system maven)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages java)
  #:use-module (gnu packages clojure)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages xiph))

(define-public sdl2
  (let ((commit "859844eae358447be8d66e6da59b6fb3df0ed778"))
    (package
     (name "sdl2")
     (version "2.30.0")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/libsdl-org/SDL")
		    (commit commit)))
	      
	      (sha256
	       (base32
		"0f027xpypf5za8aiczbqjr28zlijq9x47xv0ma64l25g7vyzv8mq"))))
     (build-system cmake-build-system)
     (arguments
      `(#:tests? #false))
     (propagated-inputs
      (list ))
     (synopsis "")
     (description
      "")
     (home-page "https://libsdl.org/")
     (license license:bsd-2))))

(define-public sdl2-mixer
  (let ((commit "a37e09f85d321a13dfcf0d4432827ee09beeb623"))
    (package
     (name "sdl2-mixer")
     (version "2.8.0")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/libsdl-org/SDL_mixer")
		    (commit commit)))
	      
	      (sha256
	       (base32
		"1jmivaapcl625pw1mndpp3ds2ql2srvq08amh94rfgzh371rmclc"))))
     (build-system cmake-build-system)
     (arguments
      `(#:tests? #false))
     (propagated-inputs
      (list sdl2
	    opusfile
	    libxmp
	    wavpack
	    fluidsynth))
     (synopsis "")
     (description
      "")
     (home-page "https://wiki.libsdl.org/SDL_mixer")
     (license license:bsd-2))))

(define-public sdl2-ttf
  (let ((commit "4a318f8dfaa1bb6f10e0c5e54052e25d3c7f3440"))
    (package
     (name "sdl2-ttf")
     (version "2.20.0")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/libsdl-org/SDL_ttf")
		    (commit commit)))
	      
	      (sha256
	       (base32
		"1h3knwdmicmn5lbxczjwfy575r984qbj0bkv87w9hppxa96p5lyw"))))
     (build-system cmake-build-system)
     (arguments
      `(#:tests? #false))
     (propagated-inputs
      (list sdl2
	    freetype))
     (synopsis "")
     (description
      "")
     (home-page "https://wiki.libsdl.org/SDL_ttf")
     (license license:bsd-2))))

(define-public sdl2-net
  (let ((commit "669e75b84632e2c6cc5c65974ec9e28052cb7a4e"))
    (package
     (name "sdl2-net")
     (version "2.2.0")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/libsdl-org/SDL_net")
		    (commit commit)))
	      
	      (sha256
	       (base32
		"00kwpk16mv1mcl6kjzjmjzfz9wxs3yxnz8xq8xfa20x9ysghlixh"))))
     (build-system cmake-build-system)
     (arguments
      `(#:tests? #false))
     (propagated-inputs
      (list sdl2))
     (synopsis "")
     (description
      "")
     (home-page "https://wiki.libsdl.org/SDL_net")
     (license license:bsd-2))))

(define-public sdl2-image
  (let ((commit "abcf63aa71b4e3ac32120fa9870a6500ddcdcc89"))
    (package
     (name "sdl2-image")
     (version "2.8.2")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/libsdl-org/SDL_image")
		    (commit commit)))
	      
	      (sha256
	       (base32
		"1j52xqg51z55q4ld3zisdlhmqh2d6s9i21936wfr454jz9ys1zvi"))))
     (build-system cmake-build-system)
     (arguments
      `(#:tests? #false))
     (propagated-inputs
      (list sdl2))
     (synopsis "")
     (description
      "")
     (home-page "https://wiki.libsdl.org/SDL2_image")
     (license license:bsd-2))))

;; (define-public jnaerator
;;   (let ((commit "363959544aeb57d341def43aa6d66afc7f3de6b6"))
;;     (package
;;      (name "jnaerator")
;;      (version "0.12")
;;      (source (origin
;; 	      (method git-fetch)
;; 	      (uri (git-reference
;; 		    (url "https://github.com/nativelibs4java/JNAerator")
;; 		    (commit commit)))

;; 	      (sha256
;; 	       (base32
;; 		"1xz4hwd9v3acn55r1j7407g9d2l535xcvwwrypfhalmf1qvbq3fg"))))
;;      (build-system maven-build-system)
;;      (arguments
;;       `(#:tests? #false))
;;      (propagated-inputs
;;      (list))
;;      (synopsis "")
;;      (description
;;       "")
;;      (home-page "https://github.com/nativelibs4java/JNAerator")
;;      (license license:bsd-2))))

(define-public raylib-parser
  (let ((commit "ae50bfa2cc569c0f8d5bc4315d39db64005b1b08"))
    (package
     (name "raylib-parser")
     (version "5.0")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/raysan5/raylib")
		    (commit commit)))
	      (sha256
	       (base32
		"0327licmylwlh5iyzw35pq7ci2d15rp3jms5i9p0vfg1rlv2sjw0"))))
     (build-system gnu-build-system)
     (arguments
      `(#:tests? #false
	#:phases
	(modify-phases %standard-phases
		       (delete 'configure)
		       (add-before 'build 'prepare-makefile
				   (lambda* (#:key inputs #:allow-other-keys)
					    (substitute* "parser/Makefile"
							 (("cc") "$(CC)"))
					    #t))
		       (replace 'build
				(lambda* (#:key inputs #:allow-other-keys)
					 (chdir "parser")
					 (invoke "make" "CC=gcc" "-j" (number->string (parallel-job-count)))))
		       (replace 'install
				(lambda* (#:key outputs #:allow-other-keys)
					 (let ((out (assoc-ref outputs "out")))
					   ;; Assuming 'raylib_parser' is the executable you want to install
					   (install-file "raylib_parser" (string-append out "/bin"))
					   ;; Repeat 'install-file' as necessary for other files you want to install
					   ))))))
     (native-inputs
      (list gcc-toolchain))
     (synopsis "")
     (description
      "")
     (home-page "")
     (license license:zlib))))

raylib-parser
