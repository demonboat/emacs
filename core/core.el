;;; core.el --- start of the actual config -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(load (expand-file-name (expand-file-name "core/core-paths" user-emacs-directory))
      nil 'nomessage)
(require 'core-paths)
(add-to-list 'load-path shan-core-dir)

(require 'core-elpaca)

(use-package emacs
  :ensure nil
  :custom
  (menu-bar-mode nil)         ;; Disable the menu bar
  (scroll-bar-mode nil)       ;; Disable the scroll bar
  (tool-bar-mode nil)         ;; Disable the tool bar
  ;;(inhibit-startup-screen t)  ;; Disable welcome screen

  (delete-selection-mode t)   ;; Select text and delete it by typing.
  (electric-indent-mode nil)  ;; Turn off the weird indenting that Emacs does by default.
  (electric-pair-mode t)      ;; Turns on automatic parens pairing

  (blink-cursor-mode nil)     ;; Don't blink cursor
  (global-auto-revert-mode t) ;; Automatically reload file and show changes if the file has changed

  ;;(dired-kill-when-opening-new-dired-buffer t) ;; Dired don't create new buffer
  ;;(recentf-mode t) ;; Enable recent file mode

  ;;(global-visual-line-mode t)           ;; Enable truncated lines
  ;;(display-line-numbers-type 'relative) ;; Relative line numbers
  (global-display-line-numbers-mode t)  ;; Display line numbers

  (mouse-wheel-progressive-speed nil) ;; Disable progressive speed when scrolling
  (scroll-conservatively 10) ;; Smooth scrolling
  ;;(scroll-margin 8)

  (tab-width 4)

  (make-backup-files nil) ;; Stop creating ~ backup files
  (auto-save-default nil) ;; Stop creating # auto save files


  :hook
  (prog-mode . (lambda () (hs-minor-mode t))) ;; Enable folding hide/show globally
  :config
  ;; Move customization variables to a separate file and load it, avoid filling up init.el with unnecessary variables
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)
  ;; Living dangerously with no backups.
  (setq-default backup-inhibited t
				auto-save-default nil
				create-lockfiles nil
				make-backup-files nil)
  ;; Line setup.
  (setq-default require-final-newline t
				fill-column 120
				vc-follow-symlinks t
				find-file-visit-truename t
				inhibit-compacting-font-caches t)

  :bind (([escape] . keyboard-escape-quit)))



;;(use-package move-text
;;  :config
;;  (move-text-default-bindings))

(use-package dash :demand t)
(use-package f :demand t)
(use-package s :demand t)
(use-package string-inflection :demand t)


(dolist (core-module '(core-util
		       core-module
		       core-theme
		       core-bindings))
  (require core-module))

(provide 'core)
;;; core.el ends here.
