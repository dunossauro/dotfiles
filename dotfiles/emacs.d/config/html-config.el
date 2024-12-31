(use-package web-mode
  :ensure t)

(use-package emmet-mode
  :ensure t
  :init
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'sgml-mode-hook 'emmet-mode))

(use-package simple-httpd
  :ensure t)

(use-package impatient-mode
  :ensure t)

(provide 'html-config)
