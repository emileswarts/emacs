(package-initialize)
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

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "f" 'find-file
  "b" 'switch-to-buffer
  "gs" 'magit-status
  "gp" 'magit-push
  "l" 'global-linum-mode
  "d" 'split-window-right
  "nt" 'neotree-toggle
  "f" 'enlarge-window-horizontally
  "k" 'kill-buffer)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(add-to-list 'load-path "~/.emacs.d/elpa/evil-1.2.8")
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

(setq vc-follow-symlinks t)
