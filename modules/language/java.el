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

(defun install-jdtls ()
  "This downloads jdtls without using the annoying maven installer,
   which I cannot use at work, requires tar for automatic extraction.."
  (interactive)

  ;; Check if it has been set already and if the path exists.
  (unless lsp-java-server-install-dir
	(setq lsp-java-server-install-dir "~/.eclipse.jdt.ls/"))

  (unless (file-directory-p lsp-java-server-install-dir)
	(make-directory lsp-java-server-install-dir))

  (let* ((jdtls-url "https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz")
	     (jdtls-download-path (expand-file-name "jdt-language-server-latest.tar.gz" temporary-file-directory)))

  (message "Downloading eclipse jdtls")
  (url-copy-file jdtls-url (expand-file-name "jdt-language-server-latest.tar.gz" temporary-file-directory) t)

  (let ((default-directory lsp-java-server-install-dir))
	(call-process "tar" nil nil nil "-xvf" jdtls-download-path))

  (delete-file jdtls-download-path)
  (message "eclipse jdtls was successfully added to %s" lsp-java-server-install-dir)))

(package! lsp-java
  :hook (java-mode . lsp)
  :bind ("M-o" . run-test-for-buffer-file)
  :config
  (setq lsp-java-server-install-dir "~/.eclipse.jdt.ls/"))

(after! lsp-java
  (setenv "JAVA_HOME" "/Users/lupentin/.sdkman/candidates/java/17.0.10-amzn/")
  (setq lsp-java-java-path (concat (getenv "JAVA_HOME") "/bin/java"))
  (setq lsp-java-configuration-runtimes `[
                                          (:name "JavaSE-17"
                                           :path ,(getenv "JAVA_HOME")
                                           :default t)]))
