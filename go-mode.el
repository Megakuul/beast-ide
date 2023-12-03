;; Add this to your emacs-conf if you use go
;; requires gopls to be setup on the system

(require 'go-mode)

(setenv "PATH" (concat "~/go/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/go/bin")

(eval-when-compile
  (require 'use-package))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))
