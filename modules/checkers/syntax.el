(require 'core-elpaca)


;; Will most likely be needing more stuff with java..
(package! flycheck
  :if (feature-p! +flycheck)
  :init (global-flycheck-mode 1)
  :custom-face
  (flycheck-info ((t (:underline (:style line :color "#80FF80")))))
  (flycheck-warning ((t (:underline (:style line :color "#FF9933")))))
  (flycheck-error ((t (:underline (:style line :color "#FF5C33")))))
  :config
  (setq 'flycheck-emacs-lisp-load-path 'inherit 
		flyhcheck-check-syntax-automatically '(mode-enabled save)
		flycheck-display-errors-delay 0.25
		flycheck-checker-error-threshold 1500
		flycheck-buffer-switch-check-intermediate-buffers t)

  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
