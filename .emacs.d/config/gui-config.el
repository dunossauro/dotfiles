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
(set-face-attribute 'default nil :font "DejaVu Sans Mono Book" :height 220)

;; flex buffer
(defalias 'list-buffers 'ibuffer-other-window) ;; ibuffer default C-x C-b

;; Remove welcome message
(setq inhibit-startup-message t
      initial-buffer-choice  nil
      initial-scratch-message nil
      ;; cancel auto-save and backups
      auto-save-default nil
      make-backup-files nil
      ido-enable-flex-matching t
      ido-everywhere t)

;; Update changed buffers
(global-auto-revert-mode t)

(provide 'gui-config)
