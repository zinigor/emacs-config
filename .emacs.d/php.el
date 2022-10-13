(require 'flycheck)
(require 'php-mode)

(flycheck-add-next-checker 'php-phpcs 'php)

(add-hook 'php-mode-hook
	  '(lambda()
	     (setq tab-width 4
		   c-basic-offset 4)
	     (flycheck-mode t)
	     (whitespace-mode t)
	     (indent-tabs-mode t)))

;; https://emacs.stackexchange.com/a/21207/11205
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint)))

  (let* ((root (locate-dominating-file
                buffer-file-name
                ".git"))
         (phpcs (and root
                     (expand-file-name "vendor/bin/phpcs"
                                       root))))
    (when (and phpcs (file-executable-p phpcs))
      (setq-local flycheck-php-phpcs-executable phpcs))))


(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;;(flycheck-define-command-checker 'php-phpcs-jetpack
;;  "A Jetpack specific checker using custom phpcs."
;;
;;  :command '("vendor/bin/phpcs"
;;             ;; Rubocop takes the original file name as argument when reading
;;             ;; from standard input
;;             "--stdin" source-original)
;;  :standard-input t
;;  :working-directory "/home/zinigor/workspace/jetpack/")
;;  :modes '(php-mode))

(flycheck-define-checker php-phpcs-jetpack
  "A PHP style checker using PHP Code Sniffer.

Needs PHP Code Sniffer 2.6 or newer.

See URL `http://pear.php.net/package/PHP_CodeSniffer/'."
  :command ("/home/zinigor/workspace/jetpack/vendor/bin/phpcs" "--report=checkstyle"
            ;; Use -q flag to force quiet mode
            ;; Quiet mode prevents errors from extra output when phpcs has
            ;; been configured with show_progress enabled
            "-q"
            (option "--standard=" flycheck-phpcs-standard concat)
            ;; Some files are not detected correctly
            ;; so it is necessary to pass the extension.
            (eval
             (-when-let* ((fname buffer-file-name)
                          (ext (file-name-extension fname)))
               (concat "--extensions=" ext)))

            ;; Pass original file name to phpcs.  We need to concat explicitly
            ;; here, because phpcs really insists to get option and argument as
            ;; a single command line argument :|
            (eval (when (buffer-file-name)
                    (concat "--stdin-path=" (buffer-file-name))))
            ;; Read from standard input
            "-")
  :standard-input t
  :error-parser flycheck-parse-checkstyle
  :error-filter
  (lambda (errors)
    (flycheck-sanitize-errors
     (flycheck-remove-error-file-names "STDIN" errors)))
  :modes (php-mode php+-mode)
  ;; phpcs seems to choke on empty standard input, hence skip phpcs if the
  ;; buffer is empty, see https://github.com/flycheck/flycheck/issues/907
  :predicate flycheck-buffer-nonempty-p
  :default-directory "/home/zinigor/workspace/jetpack/"
  :working-directory (lambda (file)
		       "/home/zinigor/workspace/jetpack/"))

;;(setq-default tab-width 4)
;;(setq-default indent-tabs-mode t)
