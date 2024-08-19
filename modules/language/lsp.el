(require 'core-elpaca)


(package! lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration)))
(package! lsp-ui
  :after lsp-mode)
