;; org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; cucumber
(use-package feature-mode
  :ensure t
  :custom
  (feature-default-language "pt"))

(provide 'languages)
