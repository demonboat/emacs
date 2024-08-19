(require 'core-elpaca)

;; Being able to easily run tests for the file currently focused on.
(defun run-test-for-buffer-file ()
  (let* ((project (project-current))
		 (project-root (if project
						   (error "Not in a project.")))
		 (file-name (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))
		 (script-path (concat project-root "gradlew")))
	
	(if (file-executable-p script-path)
		;; Run the script asynchronously
		(shell-command (format "%s %s" script-path file-name))
	  (error "Gradlew could not be found or is not executable."))))

(use-package lsp-java
  :hook (java-mode . lsp)
  :bind ("M-o" . run-test-for-buffer-file))


