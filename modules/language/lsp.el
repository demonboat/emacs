(require 'core-elpaca)


(package! lsp-mode
:hook ((lsp-mode . lsp-enable-which-key-integration))
;;(add-hook 'lsp-completion-mode-hook
;;			(lambda ()
;;			  (setq-local completion-at-point-functions
;;						  (list (cape-capf-buster #'lsp-completion-at-point))))))
)
;;(defun corfu-lsp-setup ()
;;  (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
;;		'(orderless)))

;;(add-hook 'lsp-completion-mode-hook #'corfu-lsp-setup)

(package! lsp-ui
  :after lsp-mode)
