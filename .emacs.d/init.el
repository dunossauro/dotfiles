;; load my configuration path
(add-to-list 'load-path "~/.emacs.d/config/")

;; Load my splited configuration
(require 'gui-config)
(require 'melpa-config)
(require 'dashboard-config)
(require 'markdown-config)

;; org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; ---- emojis

(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))

;; ---- auto-complete

; snippets from autocomplete
(use-package yasnippet
  :ensure t)

(yas-global-mode 1)

; company: autocomplete library
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0
	company-minimum-prefix-length 1)
  (global-company-mode t))

(use-package all-the-icons
  :ensure t)

(use-package spaceline
  :ensure t)

(use-package spaceline-config
  :config
  (spaceline-emacs-theme))

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; ----

(use-package rebecca-theme
  :ensure t
  :config  (load-theme #'rebecca t))

;(use-package timu-macos-theme
;  :ensure t
;  :config
;  (load-theme 'timu-macos t))

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
    (setq ivy-use-virtual-buffers t
	  enable-recursive-minibuffers t)
    (global-set-key "\C-f" 'swiper)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)))

;; ----------- Git config

;; Git extention
(use-package magit
  :ensure t)

;; Show diff inline
(use-package diff-hl
  :ensure t)


;; Project organization
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/git/")
	projectile-switch-project-action 'neotree-projectile-action
	projectile-indexing-method 'alien
	projectile-use-git-grep 1))

;; Side tree
(use-package neotree
  :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :bind (("C-\\". 'neotree-toggle));; atom key
  )

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
  (centaur-tabs-change-fonts (face-attribute 'default :font) 150)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)
  :bind
  ("C-x <prior>" . centaur-tabs-backward)
  ("C-x <next>" . centaur-tabs-forward)
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  (vterm-mode . centaur-tabs-local-mode))


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
   ;; before install pylint (pip install pylint)
   ;; before install flake8 (pip install flake8)
   ;; after install, create config file (pylint --generate-rcfile > ~/.pylintrc)
   (setq flycheck-python-flake8-executable "~/.local/bin/flake8"
	 flycheck-python-pylint-executable "~/.local/bin/pylint")
   )

;; Spell
(setq
    ispell-program-name "/usr/bin/hunspell"
    ispell-dictionary "pt_BR")

(require 'flyspell)
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
  (interactive "*p")
  (setq buffer-undo-list (cons (point) buffer-undo-list))
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion
      (end-of-line)
      (setq eol (point))
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        (while (> count 0)
          (newline)
          (insert line)
          (setq count (1- count)))
        )

      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    )
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
(global-unset-key (kbd "C-y"))
(global-set-key (kbd "C-<dead-grave>") 'vterm-toggle)
(global-set-key (kbd "C-`") 'vterm-toggle)
(global-set-key (kbd "C-'") 'vterm-toggle)
(global-set-key (kbd "C-S-e") 'eval-buffer)
(global-set-key (kbd "C-y") 'yas-describe-tables)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-l") 'select-line)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'write-file)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-n") 'new-empty-buffer)
(global-set-key (kbd "C-k") (lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key (kbd "C-c C-v") 'duplicate-line)
(global-set-key (kbd "C-x C-t") 'projectile-run-vterm)
(global-set-key (kbd "C-S-f") 'projectile-grep)
(global-set-key (kbd "C-e") 'flycheck-list-errors)

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

;; hooks
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)

;; Markdown
;(add-hook 'markdown-mode-hook #'nb/markdown-unhighlight)

(add-hook 'after-init-hook #'global-emojify-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(add-hook 'text-mode-hook 'display-line-numbers-mode)
; install hunspell-pt-br on aur
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'hl-line-mode)

(add-hook 'python-mode-hook
     '(lambda () (define-key python-mode-map (kbd "C-c C-v") 'duplicate-line)))

;; Config end
