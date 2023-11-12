;; Add thisto your emacs-conf if you use go

(require 'lsp-mode)
(require 'rust-mode)
(add-hook 'rust-mode-hook #'lsp)

(use-package rust-mode
  :hook (rust-mode . lsp-deferred))

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
