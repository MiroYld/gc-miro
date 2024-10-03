(define-module (miro xmake)
  #:use-module (guix)
  #:use-module (gnu)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (guix licenses)
  #:use-module (guix packages))

(define-public xmake
  (package
    (name "xmake")
    (version "2.8.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/xmake-io/xmake")
	     (recursive? #t)
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256 "1rz7f37rps5s81mylxrn04jpd4q17dfbmz0rrdxg1wybxnpgb8il")))
    (arguments
     `(#:tests? #f))
    (build-system gnu-build-system)
    (home-page "https://xmake.io/")
    (synopsis "Cross-platform build utility based on Lua")
    (description "Xmake is a cross-platform build utility based on Lua.")
    (license gpl3)))
