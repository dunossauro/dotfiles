;; load my configuration path
(add-to-list 'load-path "~/.emacs.d/config/")

;; Load my splited configuration
(require 'melpa-config)
(require 'gui-config)
(require 'git-config)
(require 'dashboard-config)
(require 'html-config)
(require 'lsp-config)
(require 'code-config)
(require 'languages)
(require 'functions)
(require 'keys)
(require 'hooks)
(require 'term-config)
(require 'write-config)
(require 'feed-config)

; Pacotes que estou testando
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode 1))
; fim: Pacotes que estou testando

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

;; Ivy
(use-package swiper
  :ensure t
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t
           enable-recursive-minibuffers t)
    (global-set-key "\C-f" 'swiper)))

(use-package counsel
  :ensure t)
