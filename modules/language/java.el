(require 'core-elpaca)


;; Being able to easily run tests for the file currently focused on.
(defun run-test-for-buffer-file ()
  (let* ((project (project-current))
		 (project-root (if project
						   (error "Not in a project")))
		 (file-name (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))
		 (script-path (concat project-root "gradlew")))
	
	(if (file-executable-p script-path)
		;; Run the script asynchronously
		(shell-command (format "%s %s" script-path file-name))
	  (error "Gradlew could not be found or is not executable"))))

(use-package lsp-java
  :hook (java-mode . lsp)
  :bind ("M-o" . run-test-for-buffer-file))

(after! lsp-java
  (setenv "JAVA_HOME" "/Users/lupentin/.sdkman/candidates/java/17.0.10-amzn/")
  (setq lsp-java-server-install-dir "~/.eclipse.jdt.ls/")
  (setq lsp-java-java-path (concat (getenv "JAVA_HOME") "/bin/java"))
  (setq lsp-java-configuration-runtimes `[
                                          (:name "JavaSE-17"
                                           :path ,(getenv "JAVA_HOME")
                                           :default t)])
  (lsp-java-update-server))
