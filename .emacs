(require 'undo-tree)
(global-undo-tree-mode)
(require 'dirtree)

(setq inhibit-startup-screen t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(ido-mode 1)

;; Need to install smex and undo-tree for these operations
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-r") 'redo)
(global-set-key (kbd "C-x z") 'undo-tree-visualize)
(global-set-key (kbd "C-t") 'shell-command)
;; Use system clipboard instead of emacs kill ring
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-w") 'clipboard-kill-region)
(global-set-key (kbd "C-y") 'clipboard-yank)

;;(setq-default display-line-numbers 'relative)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(load-theme 'misterioso)
;; This one is cool aswell
;;(load-theme 'tango-dark)
;;(disable-theme 'misterioso)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(dirtree undo-tree cmake-mode smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
