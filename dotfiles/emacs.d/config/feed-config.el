(use-package elfeed
  :ensure t)

(setq-default elfeed-search-filter "@1-week-ago +unread")
(setq browse-url-browser-function 'eww-browse-url)

(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :before "2 weeks ago"
                              :remove 'unread))

(provide 'feed-config)
