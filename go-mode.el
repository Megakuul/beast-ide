;; Add this to your emacs-conf if you use go
;; requires gopls to be setup on the system

(require 'lsp-mode)
(require 'go-mode)
(require 'company)

(setenv "PATH" (concat "~/go/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/go/bin")

(eval-when-compile
  (require 'use-package))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'top
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable t
        lsp-ui-flycheck-enable t
        lsp-ui-sideline-ignore-duplicate t))


(define-key lsp-mode-map (kbd "C-c d") 'lsp-ui-doc-show)
(define-key lsp-mode-map (kbd "C-c f") 'lsp-describe-thing-at-point)
(define-key lsp-mode-map (kbd "C-f") 'company-complete)
