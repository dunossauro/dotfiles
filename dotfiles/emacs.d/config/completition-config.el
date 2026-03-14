(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package consult
  :ensure t
  :bind
  (("C-f" . consult-line)
   ("C-x b" . consult-buffer)
   ("M-y" . consult-yank-pop)
   ("C-c g" . consult-ripgrep)))

(use-package prescient
  :ensure t
  :config
  (prescient-persist-mode 1))

(use-package vertico-prescient
  :ensure t
  :after vertico
  :config
  (vertico-prescient-mode 1))


(provide 'completition-config)
