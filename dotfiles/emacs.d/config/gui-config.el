;; dead keys
(require 'iso-transl)

;; Remove menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; window size
(add-to-list 'default-frame-alist '(height . 26))
(add-to-list 'default-frame-alist '(width . 89))

;; modes
(ido-mode 1)
(cua-mode 1)
(display-time-mode 1)

;; Font size
;(set-face-attribute 'default nil :font "OpenDyslexicM Nerd Font Bold" :height 200)
(set-face-attribute 'default nil :font "Dejavu Sans Mono Book" :height 220)

;; flex buffer
(defalias 'list-buffers 'ibuffer-other-window) ;; ibuffer default C-x C-b

;; Remove welcome message
(setq inhibit-startup-message t
      initial-buffer-choice  nil
      initial-scratch-message nil
      use-dialog-box nil ; avoid system dialogs
      ;; cancel auto-save and backups
      auto-save-default nil
      make-backup-files nil
      ido-enable-flex-matching t
      ido-everywhere t)

(fset 'yes-or-no-p 'y-or-n-p)

;; Update changed buffers
(global-auto-revert-mode t)

(use-package all-the-icons
  :ensure t)

(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme #'catppuccin t)
  (setq catppuccin-flavor 'mocha)
  (catppuccin-reload))

(use-package spaceline
  :ensure t)

(use-package spaceline-config
  :config
  (spaceline-emacs-theme))

;; Side tree
(use-package neotree
  :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)
        neo-autorefresh t
  )
  :bind ("C-\\". 'neotree-toggle))

;; Buffer tabs
(global-unset-key (kbd "C-x <prior>"))
(global-unset-key (kbd "C-x <next>"))
(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (setq centaur-tabs-style "bar"
	centaur-tabs-set-bar 'over
	centaur-tabs-set-modified-marker t
	centaur-tabs-modified-marker "*"
	centaur-tabs-set-icons t
	centaur-tabs-height 32)
  (centaur-tabs-change-fonts (face-attribute 'default :font) 200)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)
  :bind
  ("C-x <prior>" . centaur-tabs-backward)
  ("C-x <next>" . centaur-tabs-forward)
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  (vterm-mode . centaur-tabs-local-mode))

(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))

(provide 'gui-config)
