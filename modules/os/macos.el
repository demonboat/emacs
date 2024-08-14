(require 'core-elpaca)
(require 'core-util)

(with-os! (darwin)
  ;; Adjust command option.
  (setq mac-command-modifier 'meta)
  ;; visit files opened outside of emacs in existing frame.
  (setq ns-pop-up-frames nil)

  (and (or (daemonp)
		   (display-graphic-p))
	   (require 'ns-auto-titlebar nil t)
	   (ns-auto-titlebar-mode +1))
  
  (do-once-n-sec-after-emacs-startup!
   0.15
   (toggle-frame-maximized)))

;; Keychain Integration.
(after! auth-source 
  (pushnew! auth-sources 'macos-keychain-internet 'macos-keychain-generic))

;; Delete files to trash on MacOS
(setq delete-by-moving-to-trash (not non-essential))
