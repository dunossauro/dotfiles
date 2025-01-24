;; Text Folding
(use-package origami
  :ensure t)

(define-key origami-mode-map (kbd "<backtab>") 'origami-toggle-node)
(define-key origami-mode-map (kbd "C-<iso-lefttab>") 'origami-toggle-all-nodes)
(setopt display-fill-column-indicator-column 80)

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

;; sardine
(setq
 ;python-shell-interpreter "/home/dunossauro/.local/bin/sardine"
 python-shell-interpreter "/home/dunossauro/.local/bin/sardine"
 python-shell-interpreter-args "")

(defun sardine/start-sardine ()
  (interactive)
  (run-python))

(defun sardine/eval-block ()
  (interactive)
  (mark-paragraph)
  (if (and transient-mark-mode mark-active)
      (python-shell-send-region (point) (mark))
    (python-shell-send-region (point-at-bol) (point-at-eol)))
  (forward-paragraph))

(defun sardine/stop-code ()
  "Stop all the Sardine code currently running"
  (interactive)
  (python-shell-send-string "panic()"))

; Unmapping keys from the Python mode
(add-hook 'python-mode-hook
          (lambda() (local-unset-key (kbd "C-c C-c"))))
(add-hook 'python-mode-hook
          (lambda() (local-unset-key (kbd "C-c C-s"))))

; Remapping keys
(global-set-key (kbd "C-c C-c") #'sardine/eval-block)
(global-set-key (kbd "C-c C-s") #'sardine/stop-code)

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
   ;; before install pylint (pipx install pylint)
   ;; before install flake8 (pipx install flake8)
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

(add-hook 'yaml-mode-hook #'flyspell-prog-mode)
(add-hook 'conf-mode-hook #'flyspell-prog-mode)
(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(add-hook 'toml-mode-hook #'flyspell-prog-mode)
(add-hook 'dockerfile-mode #'flyspell-prog-mode)
(add-hook 'docker-compose-mode #'flyspell-prog-mode)


(use-package flycheck-inline
  :ensure t)

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

;; it sucks!
;; https://github.com/emacs-lsp/lsp-mode/issues/4679
(setq lsp-copilot-applicable-fn (lambda (&rest _) nil))

(use-package lsp-pyright ;; Python LSP
  :ensure t
  :custom (lsp-pyright-langserver-command "basedpyright")
  :hook
  ((python-mode . (lambda ()
                    (require 'lsp-pyright)
                    (lsp-deferred)))
   (flycheck-mode . (lambda ()
                      ;; Next checker check the first lsp -> flake8 -> pylint
                      ;; Waring clause check the next only if dont have errors
                      ;; If lsp dont have errors, check flake8, if lsp and flake8 dont have any error
                      ;; check using pylint.
                      (flycheck-add-next-checker 'lsp '(warning . python-flake8))
                      (flycheck-add-next-checker 'python-flake8 '(warning . python-pylint))
                      (message "Added flycheck checkers.")))))

;; ----- lsp
(setq lsp-auto-guess-root t)

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :after lsp-mode
  :config
  (setq lsp-ui-doc-mode 1))

(require 'lsp-diagnostics)
(lsp-diagnostics-flycheck-enable)

(provide 'code-config)
