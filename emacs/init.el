;; Make the titlebar transparent so that it fits with the background
;; color of the theme
;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

;; Custom does not put its stuff in init.el, but in this file instead
(setq custom-file (concat user-emacs-directory "/custom.el"))

;; Remove UI elements I don't use
(tool-bar-mode -1)
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(set-face-attribute 'fringe nil :background nil)

;; Disable the meta (alt) key because of AZERTY
;; Commands can still be entered thanks to evil-mode (:)
;; However, some "motions" that rely on meta can not be activated anymore
;; and require a new mapping
(setq mac-option-modifier nil)

;; Set title and startup position of the main frame
(setq frame-title-format "Satan")
(setq initial-frame-alist '((top . 50) (left . 90) (width . 140) (height . 42)))

;; No confirmation message when exiting
(setq confirm-kill-emacs nil)

;; Show scratch on startup
(setq inhibit-startup-screen t)

;; Default font
(set-face-attribute 'default nil
		    :family "Iosevka"
		    :height 170
		    :weight 'normal
		    :width 'normal)

;; Allows to quickly edit the configuration file
;; See General bindings
(defun find-user-init-file ()
  (interactive)
  (find-file user-init-file))

;; Open dired in ~
(defun dired-home ()
  (interactive)
  (dired "~"))

;; Open dired in .
(defun dired-current ()
  (interactive)
  (dired "."))

;; Dislpay fancy icons in buffer switch
(defun ivy-rich-switch-buffer-icon (candidate)
  (with-current-buffer
      (get-buffer candidate)
    (let ((icon (all-the-icons-icon-for-mode major-mode)))
      (if (symbolp icon)
	  (all-the-icons-icon-for-mode 'fundamental-mode)
	icon))))

;; Load package and enable the remotes
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa"     . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu"       . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org"       . "http://orgmode.org/elpa/"))
(package-initialize)

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight and complete maching parenthesis
(show-paren-mode 1)
(electric-pair-mode)

;; Wrap text at 80 automatically
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq fill-column 80)

;; Boostrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; All packages must be installed
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; TODO Make sure packages are up to date
;; There is a mechanism to do this, just look on the GitHub

;; https://gitlab.com/protesilaos/modus-themes
;; vivendi -> dark
;; operandi -> light
(use-package modus-vivendi-theme
  :config
  (set-face-background 'vertical-border "#333")
  (set-face-foreground 'vertical-border (face-background 'vertical-border)))

;; Doom themes
;; (use-package doom-themes
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t ; Keep bold
;;         doom-themes-enable-italic t) ; Keep italic
;;   (load-theme 'doom-one-light t)
;;   (doom-themes-org-config)) ; Org mode fontification

;; Doom Modeline
(use-package doom-modeline
  :config
  (setq doom-modeline-buffer-modification-icon nil
	doom-modeline-buffer-encoding nil)
  :hook (after-init . doom-modeline-mode))

;; Delight
;; Allows to use :delight with use-package in order to hide
;; minor modes in the statusline
;; Not really necessary while using doom-modeline but anyways
(use-package delight)

;; Disable eldoc
(global-eldoc-mode -1)

;; Evil mode
(use-package evil
  ; A few bonus keybinds for Evil that are not handled by General
  :bind (("C-j " . evil-scroll-line-down)
	 ("C-k"  . evil-scroll-line-up)
	 ("C-s"  . evil-ex-search-forward)
	 ("C-h"  . evil-ex-nohighlight))
  :init
  (setq evil-search-module 'evil-search ; Evil own search module
        evil-vsplit-window-right t ; New vertical splits are put on the right
	evil-split-window-below t ; New horizontal splits are put on the bottom
	evil-want-keybinding nil ; Required for evil-collection
	evil-want-C-u-scroll t ; Otherwise it is an Emacs prefix
	
	evil-insert-state-tag "" ; I bet there is a better way to do this
	evil-visual-state-tag "")
  :config
  (evil-mode))

;; Evil collection
;; Brings Evil bindings to the other parts of Emacs such as info, or calendar
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Commentary for Evil
(use-package evil-commentary
  :config
  (evil-commentary-mode))

;; Lion alignment for Evil
(use-package evil-lion
  :config
  (evil-lion-mode))

;; Allows to log commands that are being run in real time
;; Great to quickly pick a command name if you are able to run it some way
(use-package command-log-mode)

;; Counsel
(use-package counsel
  :delight
  :config
  (counsel-mode))

;; Counsel for projectile
(use-package counsel-projectile
  :delight
  :config
  (counsel-projectile-mode))

;; Ivy
(use-package ivy
  :delight
  :config
  (setq ivy-re-builders-alist '((t      . ivy--regex-fuzzy))
	ivy-format-function 'ivy-format-function-line
        ivy-height 17
	ivy-wrap t
        ivy-fixed-height-minibuffer t
        projectile-completion-system 'ivy
        ivy-count-format "(%d/%d) "
        ivy-magic-slash-non-match-action nil)
  (ivy-mode))

;; Ivy Rich
(use-package ivy-rich
  :config
  ;; Full line selection
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (setq ivy-rich--display-transformers-list
	'(ivy-switch-buffer
	  (:columns
	   ((ivy-rich-switch-buffer-icon (:width 2))
	    (ivy-rich-candidate (:width 30))
	    (ivy-rich-switch-buffer-size (:width 7))
	    (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
	    (ivy-rich-switch-buffer-major-mode (:width 20 :face warning))
	    (ivy-rich-switch-buffer-project (:width 15 :face success))
	    (ivy-rich-switch-buffer-path (:width (lambda (x)
						   (ivy-rich-switch-buffer-shorten-path x
						   (ivy-rich-minibuffer-width 0.3))))))
	   :predicate
	 (lambda (cand) (get-buffer cand)))))
  (ivy-rich-mode))

;; Projectile
(use-package projectile
  :delight
  :config
  (projectile-mode +1))

;; Org mode
(use-package org
  :ensure org-plus-contrib

  :config
  ; Make titles look more like titles
  (set-face-attribute 'org-document-title nil
                      :height 1.5
                      :weight 'bold)
  (set-face-attribute 'org-level-1 nil
                      :height 1.1
                      :weight 'bold)
  (set-face-attribute 'org-level-2 nil
                      :height 1.05
                      :weight 'bold)
  (set-face-attribute 'org-level-3 nil
                      :weight 'bold)
  (set-face-attribute 'org-level-4 nil
                      :weight 'normal)
  (set-face-attribute 'org-level-5 nil
                      :weight 'normal)
  (set-face-attribute 'org-level-6 nil
                      :weight 'normal)

  (setq
    ; Files to include in the agenda, todo views...
    org-directory "~/Documents/notes"
    org-agenda-files (list org-directory (concat org-directory "/kent"))
    org-agenda-window-setup 'current-window

    ; Styling
    org-pretty-entities t
    org-hierarchical-todo-statistics t
    org-hide-leading-stars t
    org-hidden-keywords '(title)

    ; In the agenda, number of days "ahead"
    org-deadline-warning-days 7))

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  :config
  (setq
    org-bullets-bullet-list '("⁖" "☱" "☲" "☳" "☴" "☵" "☶" "☷" "☷" "☷" "☷")))

(use-package evil-org
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook (lambda () (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; All the icons for Dired
(use-package all-the-icons-dired
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

;; Highlight keywords
(use-package fixme-mode)

;; General keybindings
(use-package general
  :after counsel
  :config
  (general-evil-setup t)

  (general-define-key
   :states '(normal motion emacs)
   :keymaps 'override
   :prefix "SPC"
   ":" 'counsel-M-x)

  ;; Buffer bindings
  (general-define-key
    :states '(normal motion emacs)
    :keymaps 'override
    :prefix "SPC a"
    "a"  'counsel-switch-buffer
    "z"  'evil-switch-to-windows-last-buffer
    "h"  'evil-window-left ; These are technically more like windows
    "j"  'evil-window-down ; stuff but I prefer them here
    "k"  'evil-window-up
    "l"  'evil-window-right
    "f"  'swiper; Find
    "F"  'swiper-all; Find all
    "s"  'evil-write ; Write
    "e"  'eval-buffer
    "q"  'evil-delete-buffer ; These two are swaped as I use quit more often
    "d"  'evil-quit) ; And the d is more reachable

  ;; Window bindings
  (general-define-key
    :states '(normal motion emacs)
    :keymaps 'override
    :prefix "SPC e" ; I know that window starts with a "w" but "e" is more reachable
    "s"  'evil-window-split
    "v"  'evil-window-vsplit)

  ;; Help bindings
  (general-define-key
    :states '(normal motion emacs)
    :keymaps 'override
    :prefix "SPC h"
    "b"  'describe-bindings
    "f"  'counsel-describe-function
    "v"  'counsel-describe-variable)

  ;; Project bindings
  (general-define-key
    :states '(normal motion emacs)
    :keymaps 'override
    :prefix "SPC p"
    "a"  'projectile-add-known-project
    "d"  'projectile-remove-known-project
    "f"  'counsel-projectile-find-file
    "b"  'counsel-projectile-switch-to-buffer
    "s"  'counsel-projectile-ag
    "p"  'counsel-projectile-switch-project)

  ;; Open bindings
  (general-define-key
    :states '(normal motion emacs)
    :keymaps 'override
    :prefix "SPC o"
    "h"  #'dired-home
    "d"  #'dired-current
    "a"  'org-agenda
    "r"  'counsel-recentf
    "p"  #'find-user-init-file))
