;;; core-theme.el --- core theming and setting up faces. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package doom-themes
  :custom
  (doom-themes-org-config)
  (setq doom-themes-enable-bold t
		doom-themes-enable-italic t
		doom-themes-padded-modeline t)
  :config
  (load-theme 'doom-gruvbox-light t))

(add-to-list 'default-frame-alist '(alpha-background . 90)) ;; For all new frames henceforth

(setq-default line-spacing 0.12)

(provide 'core-theme)
;;; core-theme.el ends here.
