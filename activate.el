;;; activate.el -*- lexical-binding: t; -*-
;;; Commentary:
;; Choose which modules to run
;;; Code:


(defvar my--active-modules)

(setq my--active-modules '(
						   :tools
						   vc
						   :ui
						   modeline))

(provide 'activate)
;; activate.el ends here.
