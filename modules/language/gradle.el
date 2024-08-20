(require 'core-elpaca)

(package! groovy-mode)
(package! gradle-mode)

(after! lsp-java
  (add-hook 'gradle-mode-hook 'java-mode-hook))
