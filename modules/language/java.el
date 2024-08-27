(require 'core-elpaca)

(setq lsp-java-server-install-dir "~/.eclipse.jdt.ls/")

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

(defun update-jdtls ()
  "Deletes the jdtls location and runs install-jdtls again, as it would fetch the latest snapshot"
  (interactive)
  (delete-directory lsp-java-server-install-dir)
  (install-jdtls))

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

(defun fetch-lombok ()
  "Fetches lombok and puts it in the home directory"
  (interactive)
  
  (let ((lombok-location (expand-file-name "lombok.jar" "~/")))
	(url-copy-file "https://projectlombok.org/downloads/lombok.jar" lombok-location t))
  (message "Lombok downloaded to ~/lombok.jar"))

(package! lsp-java
  :hook (java-mode . lsp)
  :bind ("M-i" . lsp-java-add-import))

(after! lsp-java
  (setenv "JAVA_HOME" "/Users/lupentin/.sdkman/candidates/java/17.0.10-amzn/")
  (setq lsp-java-java-path (concat (getenv "JAVA_HOME") "/bin/java"))
  (setq lsp-java-configuration-runtimes `[
                                          (:name "JavaSE-17"
                                           :path ,(getenv "JAVA_HOME")
                                           :default t)])
  (setq lsp-java-vmargs
		'("-noverify"
		  "-Xmx2G"
		  "-XX:+UseG1GC"
		  "-XX:+UseStringDeduplication"
		  "-javaagent:/Users/lupentin/lombok.jar"))

  (setq lsp-java-code-generation-to-string-code-style "STRING_BUILDER")

  ;;(require 'lsp-java-boot)
  ;;(setq lsp-java-boot-java-tools-jar (concat lsp-java-server-install-dir "/boot-server/spring-boot-language-server-1.57.0-SNAPSHOT-exec.jar"))
  
  (add-hook 'lsp-mode-hook #'lsp-lens-mode))
  ;;(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode))
