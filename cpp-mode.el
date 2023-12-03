;; Add this to your emacs-conf if you use cpp
;; requires ccls to be setup on the system

(require 'ccls)

(use-package ccls
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))
