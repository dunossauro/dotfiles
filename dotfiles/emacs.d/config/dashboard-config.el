;; Project organization
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/git/" "~/")
	projectile-switch-project-action 'neotree-projectile-action
	projectile-indexing-method 'alien
	projectile-use-git-grep 1))

(projectile-register-project-type 'python-toml '("pyproject.toml")
                                  :project-file "pyproject.toml"
                                  :compile "poetry build"
                                  :test "task test"
                                  :test-prefix "test_"
                                  :test-suffix "_test")

(use-package dashboard
  :ensure t
  :init
  (setq dashboard-items '((recents . 5)
			  (projects . 5)
			  (bookmarks . 5))
	dashboard-banner-logo-title "Olar bb!"
	dashboard-startup-banner 'logo
	dashboard-set-file-icons t
	dashboard-icon-type 'all-the-icons
	dashboard-projects-backend 'projectile
	dashboard-set-init-info nil)

  :config
  (dashboard-setup-startup-hook))

; recentf
(add-to-list 'recentf-exclude
	     (recentf-expand-file-name "~/.elfeed/*"))
(add-to-list 'recentf-exclude
	     (recentf-expand-file-name "~/.emacs.d/*"))

(provide 'dashboard-config)
