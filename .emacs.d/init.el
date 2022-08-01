;; --------- Emacs GUI config

;; dead keys
(require 'iso-transl)
;; Remove welcome message
(setq inhibit-startup-message t)
;; Remove menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; line-numbers
(global-linum-mode t)

;; highlight actual line
(global-hl-line-mode)

;; Font size
(set-face-attribute 'default nil :height 150)

;; cancel auto-save and backups
(setq auto-save-default nil)
(setq make-backup-files nil)

;; flex buffer
(defalias 'list-buffers 'ibuffer-other-window) ;; ibuffer default C-x C-b
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; modes
(ido-mode 1)
(cua-mode 1)

;; org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; --------- melpa stuff

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; --------- external melpa packages
(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((recents . 5)
			    (projects . 10)))
    (setq dashboard-banner-logo-title "Olar bb!")
    (setq dashboard-startup-banner 'logo)
    (setq dashboard-set-file-icons t)
    (setq dashboard-heading-icons t)
    (setq dashboard-set-init-info nil)
    )
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-org-agenda-categories '("Tasks"))

;; ---- auto-complete

; snippets from autocomplete
(use-package yasnippet
  :ensure t)

(yas-global-mode 1)

; company: autocomplete library
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (global-company-mode t))


(use-package try
  :ensure t)

(use-package spaceline
  :ensure t)

(use-package spaceline-config
  :config
  (spaceline-emacs-theme))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package all-the-icons
  :ensure t)

;; ----

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

(use-package rebecca-theme
  :ensure t
  :config  (load-theme #'rebecca t))

(use-package counsel
  :ensure t)

(use-package vterm
    :ensure t)

(use-package vterm-toggle
    :ensure t)

(global-unset-key (kbd "C-<up>"))
(global-unset-key (kbd "C-<down>"))
(use-package move-text
  :ensure t
  :config
  (progn
    (global-set-key (kbd "C-<up>") 'move-text-up)
    (global-set-key (kbd "C-<down>") 'move-text-down)))

(use-package swiper
  :ensure t
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (global-set-key "\C-f" 'swiper)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)))

(use-package markdown-mode
  :ensure t)

;; ----------- Git config

;; Git extention
(use-package magit
  :ensure t)

;; Show diff inline
(use-package diff-hl
  :ensure t)

(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)


;; Project organization
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))


(setq projectile-project-search-path '("~/git/"))
(setq projectile-switch-project-action 'neotree-projectile-action)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    )
  :bind (("C-\\". 'neotree-toggle));; atom key
  )

(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (progn
    (centaur-tabs-mode t)
    (centaur-tabs-headline-match)
    (setq centaur-tabs-style "bar")
    (setq centaur-tabs-set-bar 'over)
    (setq centaur-tabs-set-modified-marker t)
    (setq centaur-tabs-modified-marker "*")
    (centaur-tabs-change-fonts "arial" 160)
    (setq centaur-tabs-set-icons t)
    (setq centaur-tabs-height 32))
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

(use-package emmet-mode
  :ensure t)

(use-package multiple-cursors
  :ensure t
  :config
  (progn
    (global-set-key (kbd "M-S-<down>") 'mc/edit-lines)
    (global-set-key (kbd "C-S-<up>") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-S-<down>") 'mc/mark-next-like-this)
    (global-set-key (kbd "M-S-<left>") 'mc/mark-all-like-this)))

;; ----------- Python config
(use-package poetry
  :ensure t
  :hook
  ;; activate poetry-tracking-mode when python-mode is active
  (python-mode . poetry-tracking-mode)
  )

;; ----------- Syntax checker

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init
   (setq flycheck-check-syntax-automatically '(save new-line)
        flycheck-idle-change-delay 5.0
        flycheck-display-errors-delay 0.9
        flycheck-highlighting-mode 'symbols
        flycheck-indication-mode 'left-fringe
        flycheck-standard-error-navigation t
        flycheck-deferred-syntax-check nil)
   :config
   ;; before install flake8 (pip install flake8)
   (setq flycheck-python-flake8-executable "~/.local/bin/flake8")
   ;; before install pylint (pip install pylint)
   ;; after install, create config file (pylint --generate-rcfile > ~/.pylintrc)
   (setq flycheck-python-pylint-executable "~/.local/bin/pylint")
   )

;; Spell
(setq
  ispell-program-name
  "/usr/bin/hunspell")
(require 'flyspell)
(add-hook 'text-mode-hook 'flyspell-mode)
(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(use-package flycheck-inline
  :ensure t)

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

;; ----------- LSP

(use-package lsp-pyright ;; Python LSP
  :ensure t
  :hook
  ((python-mode . (lambda ()
		    (require 'lsp-pyright)
                    (lsp-deferred)))
   (flycheck-mode . (lambda ()
		      ;; Next checker check the first lsp -> flake8 -> pylint
		      ;; Waring clause check the next only if dont have errors
		      ;; If lsp dont have errors, check flake8, if lsp and flake8 dont have any eror
		      ;; check using pylint.
                      (flycheck-add-next-checker 'lsp '(warning . python-flake8))
                      (flycheck-add-next-checker 'python-flake8 '(warning . python-pylint))
                      (message "Added flycheck checkers.")))))


(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :after lsp-mode
  :config
  (setq lsp-ui-doc-mode 1))

(require 'lsp-diagnostics)
(lsp-diagnostics-flycheck-enable)  

;; --------- My Functions
(defun select-line ()
  (interactive)
  (if (region-active-p)
      (progn
        (forward-line 1)
        (end-of-line))
    (progn
      (end-of-line)
      (set-mark (line-beginning-position)))))


(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))

(defun new-empty-buffer ()
  (interactive)
  (let ((-buf (generate-new-buffer "untitled")))
    (switch-to-buffer -buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)))

;; --------- keys
(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "C-_"))
(global-unset-key (kbd "M-a"))
(global-unset-key (kbd "C-e"))
(global-set-key (kbd "C-<dead-grave>") 'vterm-toggle)
(global-set-key (kbd "C-e") 'eval-buffer)
(global-set-key (kbd "C-M-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-S-<down>") 'enlarge-window)
(global-set-key (kbd "C-M-S-<up>") 'shrink-window)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-l") 'select-line)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'write-file)
(global-set-key "\C-a" 'mark-whole-buffer)
(global-set-key "\C-n" 'new-empty-buffer)
(global-set-key "\C-k" (lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key "\C-c\C-v" 'duplicate-line)
(global-set-key "\C-x\C-t" 'projectile-run-vterm)

(global-set-key (kbd "C-+")
                (lambda ()
                  (interactive)
                  (let ((old-face-attribute (face-attribute 'default :height)))
                    (set-face-attribute 'default nil :height (+ old-face-attribute 5)))))

(global-set-key (kbd "C--")
                (lambda ()
                  (interactive)
                  (let ((old-face-attribute (face-attribute 'default :height)))
                    (set-face-attribute 'default nil :height (- old-face-attribute 5)))))

(require 'term)
(define-key term-mode-map (kbd "C-c") 'term-kill-subjob)
(define-key term-mode-map (kbd "C-d") 'kill-process)

(add-hook 'python-mode-hook
     '(lambda () (define-key python-mode-map (kbd "C-c C-v") 'duplicate-line)))
