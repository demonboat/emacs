;;; activate.el --- active modules -*- lexical-binding: t; -*-
;;; Commentary:
;; Choose which modules to run
;;; Code:


(defvar my--active-modules)

(setq my--active-modules '(
						   :checkers
						   (syntax +flycheck)
						   :completion
						   company
						   core-completion
						   :language
						   racket
						   lsp
						   java
						   gradle
						   :os
						   macos
						   :tools
						   shell
						   vc
						   :ui
						   helm
						   icons
						   modeline
						   which-key))

(provide 'activate)
;;; activate.el ends here.
