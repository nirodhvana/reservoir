;; Temporarily increase GC threshold during startup
(setopt inhibit-startup-screen t
	  gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      ;; tweak native compilation settings
      native-comp-speed 2
      ;; this tells package.el not to add those pesky customized variable settings at the end of your init.el
      package--init-file-ensured t
      ;; Emacs resizes the (GUI) frame when your newly set font is larger (or smaller) than the system default. This seems to add 0.4-1s to startup.
      ;; frame-inhibit-implied-resize t
      ;; Prevent auto package-initialize as it would make package-quickstart redundant.
      package-enable-at-startup nil
      ;; Precompute package activation actions to speed up startup.
      package-quickstart t
      ;; A large config may make the *Messages* buffer lose some information.
      message-log-max t)

;; Restore to normal value after startup (e.g. 50MB)
(add-hook 'emacs-startup-hook
          (lambda () (setopt gc-cons-threshold (* 50 1024 1024))))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setopt display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)

(require 'package)

;; Add Milkypostman’s Emacs Lisp Package Archive
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setopt use-package-always-ensure t ;; Always :ensure t (install and enable package) when using the macro
      use-package-verbose t) ;; Package install logging. Packages break, it's nice to know why.

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(defun er-keyboard-quit ()
  (interactive)
  (if (active-minibuffer-window)
      (if (minibufferp)
          (minibuffer-keyboard-quit)
        (abort-recursive-edit))
    (keyboard-quit)))

(global-set-key [remap keyboard-quit] #'er-keyboard-quit)

(setopt backup-directory-alist `(("." . "~/.emacsbackups"))
      make-backup-files t ; backup of a file the first time it is saved.
      backup-by-copying t ; don't clobber symlinks
      version-control t ; version numbers for backup files
      delete-old-versions t
      delete-by-moving-to-trash t
      kept-new-versions 5 ; newest versions to keep when a new numbered backup is made (default: 2)
      kept-old-versions 3 ; oldest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t ; auto-save every buffer that visits a file
      )


