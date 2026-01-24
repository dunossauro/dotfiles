;; Text Folding
(use-package origami :ensure t)

(define-key origami-mode-map (kbd "<backtab>") 'origami-toggle-node)
(define-key
 origami-mode-map (kbd "C-<iso-lefttab>") 'origami-toggle-all-nodes)

; snippets from autocomplete
(use-package yasnippet :ensure t :init (yas-global-mode 1))

; company: autocomplete library
(use-package
 company
 :ensure t
 :config
 (setq
  company-idle-delay 0
  company-eldoc-multiline t
  company-minimum-prefix-length 1)
 (global-company-mode t))

(use-package eldoc-mouse
  :ensure t
  :hook (eglot-managed-mode . eldoc-mouse-mode))

(use-package eldoc-box
  :ensure t
  :hook (eldoc-mode . eldoc-box-hover-mode)
  :config
  (setq
   eldoc-idle-delay 0.5
   eldoc-box-idle-delay 0.5
   eldoc-message-function #'ignore
   eldoc-box-position 'frame-center
   eldoc-box-hover-when-idle nil)
  :custom
  (eldoc-box-position 'at-point)
  (eldoc-box-max-pixel-width 600)
  (eldoc-box-max-pixel-height 400))

;; sardine
(defun sardine/start-sardine ()
  (interactive)
  (setq-local python-shell-interpreter "/home/dunossauro/.local/bin/sardine")
  (setq-local python-shell-interpreter-args "")
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
(add-hook
 'python-mode-hook (lambda () (local-unset-key (kbd "C-c C-c"))))
(add-hook
 'python-mode-hook (lambda () (local-unset-key (kbd "C-c C-s"))))

; Remapping keys
(global-set-key (kbd "C-c C-c") #'sardine/eval-block)
(global-set-key (kbd "C-c C-s") #'sardine/stop-code)


;; --- ts
(use-package tree-sitter-langs :ensure t)

(use-package
 treesit-auto
 :custom (treesit-auto-install 'prompt)
 :config
 (treesit-auto-add-to-auto-mode-alist 'all)
 (global-treesit-auto-mode))


(provide 'code-config)
