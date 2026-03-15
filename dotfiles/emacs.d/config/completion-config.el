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

(use-package consult
  :ensure t
  :bind
  (("C-f" . consult-line)
   ("C-S-f" . consult-git-grep)
   ("C-S-M-f" . consult-grep)
   ("C-e"  . 'consult-flymake)
   ("C-x b" . consult-buffer)))

(use-package prescient
  :ensure t
  :config
  (prescient-persist-mode 1))

(use-package vertico-prescient
  :ensure t
  :after vertico
  :config
  (vertico-prescient-mode 1))

(provide 'completion-config)
