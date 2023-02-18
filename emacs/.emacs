(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wheatgrass))
 '(package-selected-packages '(org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(require 'org)

(setq org-agenda-files '("~/Documents/personal/orgmode/gtd/inbox.org"
                         "~/Documents/personal/orgmode/gtd/gtd.org"
                         "~/Documents/personal/orgmode/gtd/tickler.org"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/Documents/personal/orgmode/gtd/gtd.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Documents/personal/orgmode/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-targets '(("~/Documents/personal/orgmode/gtd/gtd.org" :maxlevel . 3)
                           ("~/Documents/personal/orgmode/gtd/someday.org" :level . 1)
                           ("~/Documents/personal/orgmode/gtd/tickler.org" :maxlevel . 2)))

(setq org-startup-indented t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-ellipsis "  " ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-font-lock-mode 1)

;; TODO states
(setq org-todo-keywords
      '((sequence "TODO(t)" "PLANNING(p)" "IN-PROGRESS(i@/!)" "VERIFYING(v!)" "BLOCKED(b@)"  "|" "DONE(d!)" "OBE(o@!)" "WONT-DO(w@/!)" )
        ))

;; TODO colors
(setq org-todo-keyword-faces
      '(
        ("TODO" . (:foreground "GoldenRod" :weight bold))
        ("PLANNING" . (:foreground "DeepPink" :weight bold))
        ("IN-PROGRESS" . (:foreground "Cyan" :weight bold))
        ("VERIFYING" . (:foreground "DarkOrange" :weight bold))
        ("BLOCKED" . (:foreground "Red" :weight bold))
        ("DONE" . (:foreground "LimeGreen" :weight bold))
        ("OBE" . (:foreground "LimeGreen" :weight bold))
        ("WONT-DO" . (:foreground "LimeGreen" :weight bold))
        ))

(setq org-export-with-sub-superscripts nil)

