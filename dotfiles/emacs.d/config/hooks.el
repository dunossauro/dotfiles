;; hooks
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)

;; Markdown
;(add-hook 'markdown-mode-hook #'nb/markdown-unhighlight)

(add-hook 'after-init-hook #'global-emojify-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'prog-mode-hook #'origami-mode)

(add-hook 'text-mode-hook 'display-line-numbers-mode)
; install hunspell-pt-br on aur
(add-hook 'text-mode-hook 'hl-line-mode)

;; ts-modes
(defun my-ts-mode-keybindings ()
  (when (string-suffix-p "-ts-mode" (symbol-name major-mode))
    (local-set-key (kbd "C-c C-v") #'duplicate-line)
    (local-set-key (kbd "C-/") #'comment-line)
    (setq-local yas-indent-line 'fixed)))

(add-hook 'after-change-major-mode-hook #'my-ts-mode-keybindings)

(provide 'hooks)
