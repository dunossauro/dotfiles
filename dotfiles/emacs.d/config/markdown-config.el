(use-package markdown-mode
  :ensure t
  :hook (markdown-mode . lsp)
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do))
  :config
  (require 'lsp-marksman)
  (setq markdown-fontify-code-blocks-natively t))

;; Markdown custom faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.8 :foreground "#A3BE8C" :weight extra-bold))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4 :foreground "#EBCB8B" :weight extra-bold))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.2 :foreground "#D08770" :weight extra-bold))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.15 :foreground "#BF616A" :weight extra-bold))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.11 :foreground "#b48ead" :weight extra-bold))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.06 :foreground "#5e81ac" :weight extra-bold)))))

(defvar nb/current-line '(0 . 0)
   "(start . end) of current line in current buffer")
 (make-variable-buffer-local 'nb/current-line)

 (defun nb/unhide-current-line (limit)
   "Font-lock function"
   (let ((start (max (point) (car nb/current-line)))
         (end (min limit (cdr nb/current-line))))
     (when (< start end)
       (remove-text-properties start end
                       '(invisible t display "" composition ""))
       (goto-char limit)
       t)))

 (defun nb/refontify-on-linemove ()
   "Post-command-hook"
   (let* ((start (line-beginning-position))
          (end (line-beginning-position 2))
          (needs-update (not (equal start (car nb/current-line)))))
     (setq nb/current-line (cons start end))
     (when needs-update
       (font-lock-fontify-block 3))))

 (defun nb/markdown-unhighlight ()
   "Enable markdown concealling"
   (interactive)
   (markdown-toggle-markup-hiding 'toggle)
   (font-lock-add-keywords nil '((nb/unhide-current-line)) t)
   (add-hook 'post-command-hook #'nb/refontify-on-linemove nil t))


(provide 'markdown-config)
