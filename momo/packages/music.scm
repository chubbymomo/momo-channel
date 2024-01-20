(define-module (momo packages music)
  #:use-module (momo licenses)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (gnu packages linux)
  #:use-module (guix build-system copy)
  #:use-module (guix download))

(define-public spotify
  (let ((commit "g36b715a1"))
    (package
     (name "spotify")
     (version "1.2.26.1187")
     (source (origin
	      (method url-fetch)
	      (uri (string-append "http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_"
				  version
				  "."
				  commit
				  "_amd64.deb"))
	      (sha256
	       (base32
		"0l8ixgwni27vyf538pqxfnfyylyvgb5min5n20qkaj2kss5xzaw3"))))
     (build-system copy-build-system)
     (arguments
      `(#:tests? #false
	#:phases
	(modify-phases %standard-phases
		       (add-before 'unpack 'undeb
				   (lambda* (#:key source #:allow-other-keys)
				     (invoke "ar" "x" source)
				     #t))
		       (replace 'unpack 'unpack
				(lambda* (#:allow-other-keys)
				  (invoke "tar" "xvf" "./data.tar.gz")
				  #t))
		       (add-after 'unpack 'install
				  (lambda* (#:key outputs #:allow-other-keys)
				    (let* ((out (assoc-ref outputs "out"))
					   (bin (string-append out "/bin"))
					   (share (string-append out "/share/spotify"))
					   (icons (string-append out "/share/icons"))
					   (applications (string-append out "/share/applications")))
				      (mkdir-p bin)
				      (mkdir-p share)
				      (mkdir-p icons)
				      (mkdir-p applications)
				      ;; Install the Spotify executable
				      (copy-recursively "usr/share/spotify" share)
				      (symlink (string-append share "/spotify") (string-append bin "/spotify"))
				      ;; Install icons and desktop files
				      (copy-recursively "usr/share/doc" (string-append out "/share/doc"))
				      (copy-file "usr/share/spotify/spotify.desktop" (string-append applications "/spotify.desktop"))
				      #t))))))
     (synopsis "Spotify is a digital music streaming service that offers users access to millions of songs, podcasts, and videos from artists all over the world. It provides both free and premium subscription options, allowing users to listen to content with varying levels of control and without the need for downloading.")
     (description
      "Spotify is a popular streaming platform that allows users to access a vast library of music, podcasts, and videos. Users can create and share playlists, discover new music through personalized recommendations, and connect with artists' profiles. The platform operates on a freemium model, offering a free, ad-supported version and a premium version with additional features like offline listening and ad-free playback. Spotify integrates social features, enabling users to see what their friends are listening to and share music on social media. It's accessible on various devices, including smartphones, computers, and smart speakers, providing a seamless listening experience.
")
     (home-page "https://spotify.com")
     (license (nonfree "https://www.spotify.com/us/legal/end-user-agreement/")))))
