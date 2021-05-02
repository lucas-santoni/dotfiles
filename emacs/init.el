(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq vc-follow-symlinks t)

(require 'org)
(org-babel-load-file (expand-file-name "settings.org" user-emacs-directory))
