;;; activate.el -*- lexical-binding: t; -*-
;;; Commentary:
;; Choose which modules to run
;;; Code:


(defvar my--active-modules)

(setq my--active-modules '(
						   :checkers
						   (syntax +flycheck)
						   :completion
						   core-completion
						   :os
						   macos
						   :tools
						   shell
						   vc
						   :ui
						   icons
						   modeline
						   which-key))

(provide 'activate)
;; activate.el ends here.
