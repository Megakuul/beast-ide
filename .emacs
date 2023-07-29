(setq inhibit-startup-screen t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(ido-mode 1)

(global-set-key (kbd "M-x") 'smex)

(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)


(load-theme 'misterioso)
;; This one is cool aswell
;;(load-theme 'tango-dark)
;;(disable-theme 'misterioso)
