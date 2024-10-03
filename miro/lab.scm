(define-module (miro lab)
  #:use-module (guix)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (guix licenses)
  #:use-module (guix packages))

(define-public emacs-lab
  (package
   (name "emacs-lab")
   (version "20240930.1525")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/isamert/lab.el.git")
		  (commit "9bf5740dc95e8f4ae952f4d16b2edb1f315036d4")))
	    (sha256
	     (base32
	      "11iwgkwgxfxv6p1zik5s5s4pp055xvsa3bri7nakjjdbnwcfvymb"))))
   (build-system emacs-build-system)
   (propagated-inputs (list emacs-memoize
			    emacs-request
			    emacs-s
			    emacs-f
			    emacs-compat
			    emacs-promise
			    emacs-async-await))
   (home-page "https://github.com/isamert/lab.el")
   (synopsis "An interface for GitLab")
   (description
    "lab.el is an Emacs package that provides a simple integration with GitLab
(managed or self-hosted).  Provides you easier access to some GitLab
functionality regarding to: - Projects :: list, open, clone, list MRs... - Merge
Requests :: list, open, create, rebase, list pipelines... - Pipelines :: list,
open, retry, cancel, delete, watch status... - Jobs :: list, open, retry,
cancel, delete, show logs/traces...  lab.el also provides you `lab--request
function which you can use to do GitLab API calls easily.")
   (license #f)))
