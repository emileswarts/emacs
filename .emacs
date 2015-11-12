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

(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")

(with-eval-after-load 'info
(require 'magit)
(info-initialize)
(add-to-list 'Info-directory-list "~/.emacs.d/site-lisp/magit/Documentation/"))

(add-to-list 'load-path "~/.emacs.d/site-lisp/neotree")

(require 'neotree)

(global-set-key (kbd "C-, n") 'neotree-toggle)

(global-set-key (kbd "C-, g l") 'magit-log)

(global-set-key (kbd "C-, g s") 'magit-status)

(global-set-key (kbd "C-, g b") 'magit-blame)

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
