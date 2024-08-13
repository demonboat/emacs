;;; core-projects.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'core-elpaca)
(require 'core-paths)
(require 'core-module)

(package! projectile
  :init (projectile-mode)
  :custom
  (projectile-run-use-comint-mode t)
  (projectile-switch-project-action #'projectile-dired)
  (projectile-project-search-path '("~/Documents/repositories/")))

(provide 'core-projects)
;; core-projects.el ends here.
