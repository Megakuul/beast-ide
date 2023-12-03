;; Add this to your emacs-conf if you use go
;; requires rust-analyzer to be setup on the system

(require 'rust-mode)
(add-hook 'rust-mode-hook #'lsp)

(use-package rust-mode
  :hook (rust-mode . lsp-deferred))
