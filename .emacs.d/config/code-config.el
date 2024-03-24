(use-package origami
  :ensure t)

(define-key origami-mode-map (kbd "<backtab>") 'origami-toggle-node)
(define-key origami-mode-map (kbd "C-<iso-lefttab>") 'origami-toggle-all-nodes)

(add-hook 'prog-mode-hook #'origami-mode)


(provide 'code-config)
