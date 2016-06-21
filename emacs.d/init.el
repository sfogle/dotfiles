(setq inhibit-startup-message t)

(setq ring-bell-function 'ignore)

(setq frame-background-mode 'dark)

(defun install-package (package)
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))

;; http://www.flycheck.org/manual/latest/index.html
(install-package 'flycheck)
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'init-javascript)
(require 'init-python)

;; use spaces, not tabs, for indent
(setq-default indent-tabs-mode nil)

;; (install-package 'projectile)

(install-package 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; get rid of that dreaded whitespace!
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init)
