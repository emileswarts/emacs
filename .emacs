(require 'ido)
(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(ido-mode t)

(tool-bar-mode -1)

(custom-set-variables
 '(custom-enabled-themes (quote (tango-dark)))
 '(ido-mode (quote both) nil (ido))
 (custom-set-faces
))

(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")
(require 'magit)
(with-eval-after-load 'info

(info-initialize)
  
(add-to-list 'Info-directory-list "~/.emacs.d/site-lisp/magit/Documentation/"))

(add-to-list 'load-path "~/.emacs.d/site-lisp/neotree")

(require 'neotree)

(global-set-key (kbd "C-, n") 'neotree-toggle)

(global-set-key (kbd "C-, g l") 'magit-log)

(global-set-key (kbd "C-, g s") 'magit-status)

(package-initialize)
