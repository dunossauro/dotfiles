; markdown config
(use-package markdown-mode
  :ensure t
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do))
  :config
  (setq markdown-fontify-code-blocks-natively t))

(custom-set-faces
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.8 :foreground "#A3BE8C" :weight extra-bold))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4 :foreground "#EBCB8B" :weight extra-bold))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.2 :foreground "#D08770" :weight extra-bold))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.15 :foreground "#BF616A" :weight extra-bold))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.11 :foreground "#b48ead" :weight extra-bold))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.06 :foreground "#5e81ac" :weight extra-bold)))))

; org config
(use-package org
  :ensure t)

(setq org-agenda-files '("~/todos.org"))

; citar config
(use-package citar
  :ensure t
  :custom
  (citar-bibliography '("~/references.bib")))

(defvar citar-indicator-files-icons
  (citar-indicator-create
   :symbol (all-the-icons-faicon
            "file-o"
            :face 'all-the-icons-green
            :v-adjust -0.1)
   :function #'citar-has-files
   :padding "  " ; need this because the default padding is too low for these icons
   :tag "has:files"))

(defvar citar-indicator-links-icons
  (citar-indicator-create
   :symbol (all-the-icons-octicon
            "link"
            :face 'all-the-icons-orange
            :v-adjust 0.01)
   :function #'citar-has-links
   :padding "  "
   :tag "has:links"))

(defvar citar-indicator-notes-icons
  (citar-indicator-create
   :symbol (all-the-icons-material
            "speaker_notes"
            :face 'all-the-icons-blue
            :v-adjust -0.3)
   :function #'citar-has-notes
   :padding "  "
   :tag "has:notes"))

(defvar citar-indicator-cited-icons
  (citar-indicator-create
   :symbol (all-the-icons-faicon
            "circle-o"
            :face 'all-the-icons-green)
   :function #'citar-is-cited
   :padding "  "
   :tag "is:cited"))


(setq citar-indicators
  (list citar-indicator-files-icons
        citar-indicator-links-icons
        citar-indicator-notes-icons
        citar-indicator-cited-icons)) 


(provide 'write-config)
