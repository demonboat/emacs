(require 'core-elpaca)

(use-package eat
  :hook ('eshell-load-hook #'eat-eshell-mode))
