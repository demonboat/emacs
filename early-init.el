;;; early-init.el --- config entry point -*- lexical-binding: t; -*-

;;; Commentary:

;; Mostly from Shan

;; Emacs 27.1 introduced early-init.el, which runs before init.el, before package
;; and any UI initialization happens, and before any site files are loaded.

;;; Code:

(require 'cl-lib)

;; UX: Respect DEBUG envvar as an alternative to --debug-init, make sure startup
;;   is sufficiently verbose from this point on.
(when (getenv-internal "DEBUG")
  (setq init-file-debug t
		debug-on-error t))

;; Defer garbage collection further back in the startup process
(defvar last-file-name-handler-alist file-name-handler-alist)
(setq gc-cons-threshold most-positive-fixnum
	  gc-cons-percentage 0.6
	  file-name-handler-alist nil)

(defun my|revert-gc ()
  "Reset values and garbage collect."
  (setq gc-cons-threshold (* 16 1024 1024)
		gc-cons-percentage 0.1
		file-name-handler-alist (append last-file-name-handler-alist
										file-name-handler-alist))
  (cl-delete-duplicates file-name-handler-alist :test 'equal)
  (makunbound 'last-file-name-handler-alist)
  (garbage-collect))

(add-hook 'after-init-hook 'my|revert-gc)

(setq load-prefer-newer noninteractive)

(when (>= emacs-major-version 27)
  (setq package-enable-at-startup nil))

(setq user-emacs-directory (file-name-directory load-file-name))

(load (expand-file-name "core/core" user-emacs-directory)
	  nil 'nomessage)

(require 'core-module)
(core-module/load-config)

;;; early-init.el ends here
