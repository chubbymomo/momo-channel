(define-module (momo packages libraries)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages base)
  #:use-module (guix packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages python)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages glib)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (momo licenses)
  #:use-module (guix git-download))

(define-public libxss
  (let ((commit "34f3f72b88c0a0a10d618e9dfbc88474ae5ce880"))
    (package
     (name "libxss")
     (version "1.2.4")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://gitlab.freedesktop.org/xorg/lib/libxscrnsaver")
		    (commit commit)))
	      
	      (sha256
	       (base32
		"0xrp92jknbw8s82x4mwq0szqlffzh77irny4cj1mfcrxd6w90h26"))))
     (build-system gnu-build-system)
     (arguments
      `(#:tests? #false))
     (native-inputs
      (list xorgproto
	    libx11
	    util-macros
	    automake))
     (inputs
      (list libxext
	    libx11
	    glibc))
     (synopsis "XScreenSaver - X11 Screen Saver extension client library")
     (description
      "XScreenSaver - X11 Screen Saver extension client library")
     (home-page "https://gitlab.freedesktop.org/xorg/lib/libxscrnsaver")
     (license (nonfree "https://gitlab.freedesktop.org/xorg/lib/libxscrnsaver/-/blob/master/COPYING")))))

(define-public gtest
  (let ((commit "f8d7d77c06936315286eb55f8de22cd23c188571"))
    (package
     (name "gtest")
     (version "1.14.0")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/google/googletest")
		    (commit commit)))
	      (sha256
	       (base32
		"19c7f248rkg302yrbl5x7irfyi6a9whbpf45wn4bn9fk0625qi5p"))))
     (build-system cmake-build-system)
     (arguments
      `(#:tests? #false))
     (native-inputs
      (list gcc
	    python))
     (inputs
      (list gcc))
     (synopsis "")
     (description
      "")
     (home-page "")
     (license bsd-3))))


(define-public ayatana-ido
  (let ((commit "13402a2cc4616b4b5f4244413599e635fcfc1401"))
    (package
     (name "ayatana-ido")
     (version "0.10.1")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/AyatanaIndicators/ayatana-ido")
		    (commit commit)))
	      (sha256
	       (base32
		"1k36mkl6525kxb8cbj38644w1qcnnj65insjfs8n9lwblk519rxr"))))
     (build-system cmake-build-system)
     (arguments
      `(#:tests? #false))
     (native-inputs
      (list gobject-introspection
	    vala
	    gtest))
     (inputs
      (list gtk))
     (synopsis "The Ayatana Indicators project is the continuation of Application Indicators and System Indicators, two technologies developed by Canonical Ltd. for the Unity7 desktop.")
     (description
      "The Ayatana Indicators project is the continuation of Application Indicators and System Indicators, two technologies developed by Canonical Ltd. for the Unity7 desktop.

Application Indicators are a GTK implementation of the StatusNotifierItem Specification (SNI) that was originally submitted to freedesktop.org by KDE.

System Indicators are an extensions to the Application Indicators idea. System Indicators allow for far more widgets to be displayed in the indicator's menu.

The Ayatana Indicators project is the new upstream for application indicators, system indicators and associated projects with a focus on making Ayatana Indicators a desktop agnostic technology.")
     (home-page "https://ayatana-indicators.org/")
     (license gpl3+))))

(define-public libayatana-indicator
  (let ((commit "611bb384b73fa6311777ba4c41381a06f5b99dad"))
    (package
     (name "libayatana-indicator")
     (version "0.9.4")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/AyatanaIndicators/libayatana-indicator")
		    (commit commit)))
	      (sha256
	       (base32
		"1c0pymlpxabh7iackv6i47gh81b7pxx194r07lpbxnz5x1kjxj1s"))))
     (build-system cmake-build-system)
     (arguments
      `(#:tests? #false))
     (native-inputs
      (list gobject-introspection
	    vala))
     (inputs
      (list ayatana-ido
	    gdk-pixbuf
	    glibc
	    glib
	    gtk))
     (synopsis "The Ayatana Indicators project is the continuation of Application Indicators and System Indicators, two technologies developed by Canonical Ltd. for the Unity7 desktop.")
     (description
      "The Ayatana Indicators project is the continuation of Application Indicators and System Indicators, two technologies developed by Canonical Ltd. for the Unity7 desktop.

Application Indicators are a GTK implementation of the StatusNotifierItem Specification (SNI) that was originally submitted to freedesktop.org by KDE.

System Indicators are an extensions to the Application Indicators idea. System Indicators allow for far more widgets to be displayed in the indicator's menu.

The Ayatana Indicators project is the new upstream for application indicators, system indicators and associated projects with a focus on making Ayatana Indicators a desktop agnostic technology.")
     (home-page "https://ayatana-indicators.org/")
     (license gpl3+))))

(define-public libayatana-appindicator
  (let ((commit "238c8b02718fa5b4af95ede72beeed762094f4cc"))
    (package
     (name "libayatana-appindicator")
     (version "0.5.93")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://gitlab.com/interception/linux/plugins/caps2esc")
		    (commit commit)))
	      
	      (sha256
	       (base32
		"0zx61qclgrxqvq7p38anhab9s2hqmnnn1ydbn4x2db1k87x5rb98"))))
     (build-system cmake-build-system)
     (arguments
      `(#:tests? #false))
     (native-inputs
      (list gobject-introspection
	    vala))
     (inputs
      (list gcc
	    glib
	    glibc
	    gtk
	    libayatana-indicator
	    libdbusmenu))
     (synopsis "The Ayatana Indicators project is the continuation of Application Indicators and System Indicators, two technologies developed by Canonical Ltd. for the Unity7 desktop.")
     (description
      "The Ayatana Indicators project is the continuation of Application Indicators and System Indicators, two technologies developed by Canonical Ltd. for the Unity7 desktop.

Application Indicators are a GTK implementation of the StatusNotifierItem Specification (SNI) that was originally submitted to freedesktop.org by KDE.

System Indicators are an extensions to the Application Indicators idea. System Indicators allow for far more widgets to be displayed in the indicator's menu.

The Ayatana Indicators project is the new upstream for application indicators, system indicators and associated projects with a focus on making Ayatana Indicators a desktop agnostic technology.")
     (home-page "https://ayatana-indicators.org/")
     (license gpl3+))))
