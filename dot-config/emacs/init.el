(load-theme 'modus-vivendi t)

(add-to-list 'default-frame-alist '(font . "GohuFont uni11 NerdFont Propo 10" ))
(set-frame-parameter nil 'alpha-background 85)
(add-to-list 'default-frame-alist '(alpha-background . 85))

(use-package vertico
  :init (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package evil
  :init
  (setopt evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (setopt evil-want-integration t)
  (evil-collection-init))

(use-package org
  :init
  (setopt org-return-follows-link t ;; Follow the links
	  org-hide-emphasis-markers t ;; Hide the markers so you just see BOLD-TEXT and not *BOLD-TEXT*
	  org-agenda-files '("~/org") ;; Must do this so the agenda knows where to look for my files
	  org-log-done 'time) ;; When a TODO is set to a done state, record a timestamp

  :hook (
         (org-mode . org-indent-mode) ;; Make the indentation look nicer
         (org-mode . visual-line-mode) ;; Wrap the lines in org mode so that things are easier to read
	 )

  ;; Associate all org files with org mode
  :mode ("\\.org\\'" . org-mode)

  :bind (
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
	 )

  :custom (org-export-backends '(ascii html icalendar latex beamer md man odt texinfo))

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



(use-package magit)

(setopt org-latex-compiler "lualatex")


