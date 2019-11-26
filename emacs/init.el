; Title bar stuff
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

; Package manager
(let ((bootstrap-file
       (expand-file-name
         "straight/repos/straight.el/bootstrap.el"
         user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
      (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

; Install packages
(straight-use-package 'evil)
(straight-use-package 'key-chord)
(straight-use-package 'base16-theme)
(straight-use-package 'linum)
(straight-use-package 'doom-modeline)
(straight-use-package 'fill-column-indicator)

; Disable meta (option) key
(setq mac-option-modifier 'nil)

; Show scratch on startup
(setq inhibit-startup-screen t)

; We will need the help char for something else
(setq help-char nil)

; Enable Evil
(setq evil-want-C-u-scroll t)
(setq evil-insert-state-message nil)
(setq evil-visual-state-message nil)
(evil-mode 1)

; Key mappings
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-l") 'next-buffer)
(define-key evil-normal-state-map (kbd "C-h") 'previous-buffer)

(setq key-chord-two-keys-delay 0.7)
(key-chord-mode 1)

; Clean UI
(tool-bar-mode -1)
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(fringe-mode 0)

; DOOM modeline
(doom-modeline-mode 1)
(setq doom-modeline-height 1)
(custom-set-faces
  '(mode-line ((t (:height 0.85))))
  '(mode-line-inactive ((t (:height 0.85)))))

; Change font
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 170
                    :weight 'normal
                    :width 'normal)

; Color theme
(load-theme 'base16-default-dark t)

; Bigger window
(if (window-system) (set-frame-size (selected-frame) 124 40))

; Disable automatic save files
(setq auto-save-default nil)

; Disable backup files
(setq make-backup-files nil)

; 80 ruller
(add-hook 'prog-mode-hook 'fci-mode)
(setq fci-rule-width 1)
(setq fci-rule-color "black")

; Highlight current line
(global-hl-line-mode 1)
