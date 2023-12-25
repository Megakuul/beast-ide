;; Package Initialization

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Ensure that the use-package is always used
(eval-when-compile
  (require 'use-package))

;; Package setup

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package smex
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

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

(use-package rust-mode
  :hook (rust-mode . lsp-deferred))

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq-default tab-width 2)

;; zsh shell is fully lagging on term mode
(setq explicit-shell-file-name "/bin/bash")

;; Wraps words instead of letters
(global-visual-line-mode 1)

(menu-bar-mode 0)
(tool-bar-mode 0)
(ido-mode 1)

;; Keybinds

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-r") 'redo)
(global-set-key (kbd "C-x j") 'undo-tree-visualize)
(global-set-key (kbd "C-t") 'shell-command)
;; Use system clipboard instead of emacs kill ring
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-w") 'clipboard-kill-region)
(global-set-key (kbd "C-y") 'clipboard-yank)
;; Move quoted insert to C-x q
(global-set-key (kbd "C-x q") 'quoted-insert)
(global-set-key (kbd "C-q") 'other-window)

(defun mark-fullword ()
  "Mark the whole word selected by cursor"
  (interactive)
  (backward-word)
  (mark-word))

(global-set-key (kbd "C-c C-x") 'mark-fullword)
(global-set-key (kbd "C-c C-f") 'mark-defun)

(with-eval-after-load 'lsp-mode
  (define-key lsp-mode-map (kbd "C-c d") 'lsp-ui-doc-show)
  (define-key lsp-mode-map (kbd "C-c f") 'lsp-describe-thing-at-point)
  (define-key lsp-mode-map (kbd "C-f") 'company-complete)
  (define-key lsp-mode-map (kbd "C-c m") 'flymake-show-buffer-diagnostics))

;; Visual configuration

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(load-theme 'misterioso)
;; This one is cool aswell
;;(load-theme 'tango-dark)
;;(disable-theme 'misterioso)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ispell-dictionary nil)
 '(package-selected-packages '(dirtree undo-tree cmake-mode smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Additional configuration

 (defun go-mode-setup ()
   (setq tab-width 4))
(add-hook 'go-mode-hook 'go-mode-setup)

(setenv "PATH" (concat "~/go/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/go/bin")
