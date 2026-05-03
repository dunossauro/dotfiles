;; load my configuration path
(add-to-list 'load-path "~/.emacs.d/config/")

;; Load my splited configuration
(require 'melpa-config)
(require 'system-config)
(require 'gui-config)
(require 'git-config)
(require 'dashboard-config)
(require 'completion-config)
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

(use-package
 elisp-autofmt
 :ensure t
 :init (setq elisp-autofmt-check-elisp-autofmt-exists 'always)
 :commands (elisp-autofmt-mode elisp-autofmt-buffer)
 :hook (emacs-lisp-mode . elisp-autofmt-mode)
 :config (setq elisp-autofmt-on-save-p t))
