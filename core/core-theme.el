;;; core-theme.el --- core theming and setting up faces. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package doom-themes
  :custom
  (doom-themes-org-config)
  :config
  (setq doom-themes-enable-bold t
		doom-themes-enable-italic t)
  (load-theme 'doom-earl-grey t))

(add-to-list 'default-frame-alist '(alpha-background . 90)) ;; For all new frames henceforth

(set-face-attribute 'default nil
                    ;; :font "JetBrains Mono" ;; Set your favorite type of font or download JetBrains Mono
                    :height 120
                    :weight 'medium)
;; This sets the default font on all graphical frames created after restarting Emacs.
;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
;; are not right unless I also add this method of setting the default font.

;;(add-to-list 'default-frame-alist '(font . "JetBrains Mono")) ;; Set your favorite font
(setq-default line-spacing 0.12)

(provide 'core-theme)
;;; core-theme.el ends here.
