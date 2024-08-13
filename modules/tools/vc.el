(require 'core-elpaca)

(package! magit
  :commands magit-status)

(package! diff-hl
  :hook ((dired-mode          . diff-hl-dired-mode-unless-remote)
		  (magit-pre-refresh  . diff-hl-magit-pre-refresh)
		  (magit-post-refresh . diff-hl-magit-post-refresh))
  :init (global-diff-hl-mode))

