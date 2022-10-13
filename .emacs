;; Starting emacs server
(server-start)

;; Custom settings
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Add path to the local site-lisp
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; Add exec-path for /usr/local/bin
(add-to-list 'exec-path "/usr/local/bin")
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

;; Use desctop notifications
(require 'notifications)

;; Use compile
(require 'compile)

;; Uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

;; Save recent files acros sessions
(require 'recentf)
(recentf-mode t)

;; Turn off scrollbar, toolbar and menubar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode 1)

;; Turn on column number mode
(column-number-mode t)

;; Highlight brackets
(show-paren-mode t)

;; Delete seleted text when typing
(delete-selection-mode t)

;; Font
;(set-default-font "Ubuntu Mono 12")

;; Copy original file when creating backup
(setq backup-by-copying t)

;; File path mirroring for backup files
(defun my-backup-file-name (fpath)
  (let (backup-root bpath)
    (setq backup-root "~/.emacs.d/files-backup")
    (setq bpath (concat backup-root fpath "~"))
    (make-directory (file-name-directory bpath) bpath)
    bpath
    )
  )
(setq make-backup-file-name-function 'my-backup-file-name)

;; Invoking a login shell
(setq explicit-bash-args '( "--login" "--noediting" "-i"))


(require 'package)

(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)



(load-file "~/.emacs.d/php.el")
