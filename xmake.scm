(use-modules
 (guix packages)
 (guix git-download)
 (guix build-system gnu)
 ((guix licenses) #:prefix license:))

(define-public xmake
  (package
    (name "xmake")
    (version "2.8.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xmake-io/xmake.git")
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
    (license license:gpl3+)))
xmake
