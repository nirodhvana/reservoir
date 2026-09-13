;; Temporarily increase GC threshold during startup
(setopt inhibit-startup-screen t
        gc-cons-threshold most-positive-fixnum
        gc-cons-percentage 0.6

        ;; tweak native compilation settings
        native-comp-speed 2

	;; To reduce the risk of loading outdated byte-code files, you should set load-prefer-newer and enable auto-compile-on-load-mode as early as possible, in early-init.el
	load-prefer-newer t

        ;; this tells package.el not to add those pesky customized variable settings at the end of your init.el
        package--init-file-ensured t

        ;; Emacs resizes the (GUI) frame when your newly set font is larger (or smaller) than the system default. This seems to add 0.4-1s to startup.
        ;; frame-inhibit-implied-resize t

        ;; Prevent auto package-initialize as it would make package-quickstart redundant.
        package-enable-at-startup nil

        ;; Precompute package activation actions to speed up startup.
        package-quickstart t

        ;; A large config may make the *Messages* buffer lose some information.
        message-log-max t

        ;; Disable Bidirectional Text Scanning (Doom Emacs)
        bidi-display-reordering 'left-to-right
        bidi-paragraph-direction 'left-to-right
        bidi-inhibit-bpa t

        ;; Increase Process Output Buffer for LSP (Doom, Purcell, Centaur)
        read-process-output-max (* 4 1024 1024) ; 4MB

        ;; Save the Clipboard Before Killing (Purcell, Prot, Centaur)
        save-interprogram-paste-before-kill t

        ;; No Duplicates in the Kill Ring (Doom, Prot)
        kill-do-not-save-duplicates t

        ;; Sane Syntax in re-builder  
	reb-re-syntax 'string

        ;; Persist the Kill Ring Across Sessions (Doom, Prot) 
        savehist-additional-variables
        '(search-ring regexp-search-ring kill-ring)

    	;; Proportional Window Resizing (Purcell, Prot)
	window-combination-resize t

  	;; Faster Mark Popping
    	;; The annoyance: you need C-u C-SPC every single time. With this setting, after the first C-u C-SPC you can keep pressing just C-SPC to continue popping:
	set-mark-command-repeat-pop t

	;; Auto-Select Help Windows (Prot)
	help-window-select t
    	)

;; The kill ring can accumulate text properties (fonts, overlays, etc.) that bloat the savehist file. Doom strips them before saving
(add-hook 'savehist-save-hook
          (lambda ()
            (setopt kill-ring
                  (mapcar #'substring-no-properties
                          (cl-remove-if-not #'stringp kill-ring)))))

;; Restore to normal value after startup (e.g. 50MB)
(add-hook 'emacs-startup-hook
          (lambda () (setopt gc-cons-threshold (* 50 1024 1024))))

;; Auto-Chmod Scripts on Save
(add-hook 'after-save-hook
          #'executable-make-buffer-file-executable-if-script-p)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode)

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

;;; early-init.el -*- no-byte-compile: t -*-
(use-package auto-compile
  :demand t
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode)
  :custom
  (auto-compile-display-buffer nil)
  (auto-compile-mode-line-counter t)
  )

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(winner-mode +1)

(defun toggle-delete-other-windows ()
  "Delete other windows in frame if any, or restore previous window config."
  (interactive)
  (if (and winner-mode
           (equal (selected-window) (next-window)))
      (winner-undo)
    (delete-other-windows)))

(global-set-key (kbd "C-x 1") #'toggle-delete-other-windows)

(advice-add 'save-place-find-file-hook :after
            (lambda (&rest _)
              (when buffer-file-name (ignore-errors (recenter)))))

(define-advice keyboard-quit
    (:around (quit) quit-current-context)
  "Quit the current context.

When there is an active minibuffer and we are not inside it close
it.  When we are inside the minibuffer use the regular
`minibuffer-keyboard-quit' which quits any active region before
exiting.  When there is no minibuffer `keyboard-quit' unless we
are defining or executing a macro."
  (if (active-minibuffer-window)
      (if (minibufferp)
          (minibuffer-keyboard-quit)
        (abort-recursive-edit))
    (unless (or defining-kbd-macro
                executing-kbd-macro)
      (funcall-interactively quit))))

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
