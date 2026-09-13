(load-theme 'modus-vivendi t)

(add-to-list 'default-frame-alist '(font . "GohuFont uni11 NerdFont Propo 10" ))
;;(set-frame-parameter nil 'alpha-background 85)
;;(add-to-list 'default-frame-alist '(alpha-background . 85))

(use-package vertico
  :init (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package evil
  :custom
  (evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :custom
  (evil-want-integration t)
  :config
  (evil-collection-init))

(use-package org
  :custom
  (org-return-follows-link t) ;; Follow the links
  (org-hide-emphasis-markers t) ;; Hide the markers so you just see BOLD-TEXT and not *BOLD-TEXT*
  (org-agenda-files '("~/org")) ;; Must do this so the agenda knows where to look for my files
  (org-log-done 'time) ;; When a TODO is set to a done state, record a timestamp
  (org-export-backends '(ascii html icalendar latex beamer md man odt texinfo)) ;; Org mode export options I want
  (org-latex-compiler "lualatex") ;; Change the org-mode LaTeX export compiler to LuaLaTeX.

  :hook 
  (org-mode . org-indent-mode) ;; Make the indentation look nicer
  (org-mode . visual-line-mode) ;; Wrap the lines in org mode so that things are easier to read
  

  ;; Associate all org files with org mode
  :mode ("\\.org\\'" . org-mode)

  :bind 
  ;; Shortcuts for storing links, viewing the agenda, and starting a capture
  ("\C-cl" . org-store-link)
  ("\C-ca" . org-agenda)
  ("\C-cc" . org-capture)
  (:map org-mode-map
	;; Remap the change priority keys to use the UP or DOWN key
        ("C-c <up>" . org-priority-up)
        ("C-c <down>" . org-priority-down)
	;; When you want to change the level of an org item, use SMR
        ("C-c C-g C-r" . org-shiftmetaright)
	)

  ;; AESTHETICS
  :config
  (when (display-graphic-p)
    (let* ((variable-tuple
            (cond ((x-list-fonts "Iosevka")         '(:font "Iosevka"))
                  ((x-family-fonts "Iosevka")       '(:family "Iosevka"))
                  (nil (warn "Cannot find a Iosevka Font. Install Iosevka."))))
           (headline           `(:inherit default :weight bold)))

      ;; Set different heights for different levels in org mode
      (custom-theme-set-faces
       'user
       `(org-level-8 ((t (,@headline ,@variable-tuple :foreground, "#2e5d66"))))
       `(org-level-7 ((t (,@headline ,@variable-tuple :foreground, "#2e5d66"))))
       `(org-level-6 ((t (,@headline ,@variable-tuple :foreground, "#2e5d66"))))
       `(org-level-5 ((t (,@headline ,@variable-tuple :foreground, "#2e5d66"))))
       `(org-level-4 ((t (,@headline ,@variable-tuple :foreground, "#1DA3C0" :height 1.1))))
       `(org-level-3 ((t (,@headline ,@variable-tuple :foreground, "#18857e" :height 1.25))))
       `(org-level-2 ((t (,@headline ,@variable-tuple :foreground, "#c9372a" :height 1.5))))
       `(org-level-1 ((t (,@headline ,@variable-tuple :foreground, "#920727" :height 1.75))))
       `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))
    )
  )



(use-package magit
  )

(use-package tex-site
  :ensure auctex)

(use-package gnus)

(use-package subed
	:hook 
	;; Remember cursor position between sessions
	(subed-mode . save-place-local-mode)
	;; Break lines automatically while typing
	(subed-mode . turn-on-auto-fill)
	;; Break lines at 40 characters
	(subed-mode . (lambda () (setq-local fill-column 40)))
	;; Some reasonable defaults
	(subed-mode . subed-enable-pause-while-typing)
	;; As the player moves, update the point to show the current subtitle
	(subed-mode . subed-enable-sync-point-to-player)
	;; As your point moves in Emacs, update the player to start at the current subtitle
	(subed-mode . subed-enable-sync-player-to-point)
	;; Replay subtitles as you adjust their start or stop time with M-[, M-], M-{, or M-}
	(subed-mode . subed-enable-replay-adjusted-subtitle)
	;; Loop over subtitles
	(subed-mode . subed-enable-loop-over-current-subtitle)
	;; Show characters per second
	(subed-mode . subed-enable-show-cps)
	)

;; (use-package scanner
;;   :init
;;   (setopt scanner-use-unpaper t)

;;   :bind-keymap ("s-s" . scanner-map)
;;   )
