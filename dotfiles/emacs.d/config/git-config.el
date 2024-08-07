(require 'package)

;; Git extention
(use-package magit
  :ensure t)

;; Find todos
;(use-package magit-todos
;  :after magit
;  :config (magit-todos-mode 1))


;; Show diff inline
(use-package diff-hl
  :ensure t)


(provide 'git-config)
