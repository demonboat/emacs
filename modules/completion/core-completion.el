(require 'core-elpaca)

;; Enhances in-buffer completion with a small completion popup.
(package! corfu
  :init (global-corfu-mode)
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-popupinfo-mode t)
  (corfu-popupinfo-delay 0.5)
  (corfu-separator ?\s)
  (completion-ignore-case t)
  (tab-always-indent 'complete)
  (corfu-preview-current nil))

(package! nerd-icons-corfu
  :after corfu
  :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))


;; Provides completion at point extension which can be combied with corfu and more.
(package! cape
  :after corfu
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-dict)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-abbrev)
  (add-to-list 'completion-at-point-functions #'cape-history)
  (add-to-list 'completion-at-point-functions #'cape-elisp-symbol))

;; Specific completion style for corfu and vertico
(package! orderless
  :custom
  (completion--styles '(orderless basic))
  (completion--category-override '((file (styles basic partial-completion)))))

;; Vertical completion UI
(package! vertico
  :init (vertico-mode))

;; Saving history completion
(savehist-mode)

;; Adds more shit to the completions, like descriptions and such.
(package! marginalia
  :after vertico
  :init (marginalia-mode))

(package! nerd-icons-completion
  :after marginalia
  :config (nerd-icons-completion-mode)
  :hook (marginalia-mode . nerd-icons-completion-marginalia-setup))

