;; GC trick to speed up the startup
;; The GC will not run during startup
(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)

;; Restore the GC to proper after startup
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold gc-cons-threshold
          gc-cons-percentage 0.1)))

;; Another trick related to the minibuffer
;; Stolen from Doom
(setq doom-gc-cons-threshold 16777216)

(defun doom-defer-garbage-collection-h ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun doom-restore-garbage-collection-h ()
  (run-at-time
   1 nil (lambda () (setq gc-cons-threshold doom-gc-cons-threshold))))

(add-hook 'minibuffer-setup-hook #'doom-defer-garbage-collection-h)
(add-hook 'minibuffer-exit-hook #'doom-restore-garbage-collection-h)

;; Another speedup trick
;; Also obviously stolen from Doom
(defvar doom--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
  (lambda ()
    (setq file-name-handler-alist doom--file-name-handler-alist)))

;; Load package and enable the remotes
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa"     . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu"       . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org"       . "http://orgmode.org/elpa/"))
(package-initialize)

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

;; The rest of the configuration is in an Org file
;; It is easier to manage
(setq user-settings-file "/Users/geographer/.dotfiles/emacs/settings.org")
(require 'org)
(org-babel-load-file
  (expand-file-name user-settings-file))
