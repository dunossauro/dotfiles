(use-package vterm
  :ensure t
  :bind
  (:map vterm-mode-map
	("C-S-v" . vterm-yank)
	("C-S-c" . vterm-copy-mode)))

(use-package vterm-toggle
    :ensure t)

(provide 'term-config)
