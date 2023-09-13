;; Add thisto your emacs-conf if you use go

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
