
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wheatgrass))
 '(flycheck-php-phpcs-executable "/home/zinigor/workspace/jetpack/vendor/bin/phpcs")
 '(package-selected-packages '(ac-php lsp-mode flycheck editorconfig php-mode))
 '(php-mode-coding-style 'wordpress)
 '(safe-local-variable-values
   '((flycheck-checker . php-phpcs-jetpack)
     (lsp-intelephense-files-exclude .
				     ["**/.git/**"
				      (\, "**/.svn/**")
				      (\, "**/.hg/**")
				      (\, "**/CVS/**")
				      (\, "**/.DS_Store/**")
				      (\, "**/node_modules/**")
				      (\, "**/bower_components/**")
				      (\, "**/vendor/**/{Tests,tests}/**")
				      (\, "**/.history/**")
				      (\, "**/vendor/**/vendor/**")
				      (\, "**/projects/packages/**/vendor/**")
				      (\, "**/projects/plugins/**/vendor/**")
				      (\, "**/projects/plugins/**/jetpack_vendor/**")
				      (\, "**/projects/packages/**/jetpack_vendor/**")
				      (\, "**/projects/packages/**/wordpress/**")
				      (\, "**/projects/plugins/**/wordpress/**")
				      (\, "**/projects/packages/**/tests/php/lib/functions-wordpress.php")
				      (\, "**/tools/docker/wordpress/wp-admin/includes/noop.php")])))
 '(whitespace-line-column 800))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-hspace ((t (:background "gray2" :foreground "gray22"))))
 '(whitespace-indentation ((t (:background "gray2" :foreground "gray22"))))
 '(whitespace-space ((t (:background "grey2" :foreground "grey22"))))
 '(whitespace-tab ((t (:background "grey2" :foreground "grey22")))))
