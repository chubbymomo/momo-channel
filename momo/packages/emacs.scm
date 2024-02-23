(define-module (momo packages music)
  #:use-module (momo licenses)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system emacs)
  #:use-module (guix git-download))

(define-public emacs-dired-hide-dotfiles
  
(package
  (name "emacs-dired-hide-dotfiles")
   (version "20210222.1919")
   (source (origin
             (method git-fetch)
             (uri (git-reference
                   (url "https://github.com/mattiasb/dired-hide-dotfiles.git")
                   (commit "6a379f23f64045f5950d229254ce6f32dbbf5364")))
             (sha256 (base32
                      "0cwsjndvnv9a62ism7ckj27jdqx362947lyizka78qvmv369avv3"))))
   (build-system emacs-build-system)
   (home-page "https://github.com/mattiasb/dired-hide-dotfiles")
   (synopsis "Hide dotfiles in dired")
   (description
    "Hide dotfiles in dired.  To activate this mode add something like this to your
init.el: (defun my-dired-mode-hook () \"My `dired mode hook.\" ;; To hide
dot-files by default (dired-hide-dotfiles-mode)) ;; To toggle hiding (define-key
dired-mode-map \".\" #'dired-hide-dotfiles-mode) (add-hook dired-mode-hook
#'my-dired-mode-hook)")
   (license #f)))

(define-public emacs-treesit-auto
  (package
   (name "emacs-treesit-auto")
   (version "20240223.1450")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/renzmann/treesit-auto.git")
                  (commit "299dd88c9e5f1ff91a8f1989ad1e97e86c220020")))
            (sha256 (base32
                     "0c29ldai6fq413y14b4n3sh3s46vffdpg9xgspjklkq9ja1l0lw7"))))
   (build-system emacs-build-system)
   (home-page "https://github.com/renzmann/treesit-auto.git")
   (synopsis "Automatically use tree-sitter enhanced major modes")
   (description
    "If a tree-sitter grammar is available and installed, use it instead of the
corresponding default mode.  Conversely, when a tree-sitter grammar is not
available and a fallback major mode is available/specified, use it instead.
This package also provides a `treesit-auto-install-all function, which will scan
for tree-sitter grammars listed in `treesit-auto-recipe-list that are not
installed or otherwise available on `treesit-extra-load-path'.  Automatic
installation of grammars when visiting a file is controlled by the
`treesit-auto-install variable, which can be t, nil or `prompt'.  When t,
opening a file with a compatible tree-sitter mode will clone and install the
grammar defined by its recipe, if it isn't already installed. `prompt will
display a yes/no question in the minibuffer and wait for confirmation before
attempting the installation.")
   (license gpl3+)))

emacs-dired-hide-dotfiles
