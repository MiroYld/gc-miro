(define-module (miro kube)
  #:use-module (guix)
  #:use-module (gnu)
  #:use-module (guix build-system emacs)
  #:use-module (guix git-download)
  #:use-module (guix licenses)
  #:use-module (guix packages))

(define-public kube
  (package
  (name "emacs-kubernetes")
  (version "20221229.1519")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/kubernetes-el/kubernetes-el.git")
                  (commit "24de7a1621dc06234abf63db454d63a522aaa632")))
            (sha256
             (base32
              "07037fcnh67q9ahdqq5m8vx6r052kh1nyklw3nyrb8yljpcdy4ps"))))
  (build-system emacs-build-system)
  (propagated-inputs (list emacs-dash
                           emacs-magit-section
                           emacs-magit-popup
                           emacs-with-editor
                           emacs-request
                           emacs-s
                           emacs-transient))
  (arguments
   '(#:include '("^[^/]+.el$" "^[^/]+.el.in$"
                 "^dir$"
                 "^[^/]+.info$"
                 "^[^/]+.texi$"
                 "^[^/]+.texinfo$"
                 "^doc/dir$"
                 "^doc/[^/]+.info$"
                 "^doc/[^/]+.texi$"
                 "^doc/[^/]+.texinfo$")
     #:exclude '("^.dir-locals.el$" "^test.el$" "^tests.el$" "^[^/]+-test.el$"
                 "^[^/]+-tests.el$" "^kubernetes-evil.el$")))
  (home-page "https://github.com/kubernetes-el/kubernetes-el")
  (synopsis "Magit-like porcelain for Kubernetes")
  (description
   "kubernetes-el is a text-based, interactive management interface for managing
Kubernetes clusters within Emacs.")
  (license #f)))
