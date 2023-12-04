(use-package dashboard
  :ensure t
  :init
  (setq dashboard-items '((recents . 5)
                            (projects . 10))
	dashboard-banner-logo-title "Olar bb!"
	dashboard-startup-banner 'logo
	dashboard-set-file-icons t
	dashboard-heading-icons t
	dashboard-set-init-info nil)
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-org-agenda-categories '("Tasks"))

(provide 'dashboard-config)
