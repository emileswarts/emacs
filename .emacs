(package-initialize)
(require 'ido)
(require 'package)
(setq evil-want-C-i-jump nil)

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

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "a" 'switch-to-previous-buffer
  "d" 'split-window-right
  "f" 'enlarge-window-horizontally
  "gd" 'magit-diff
  "gp" 'magit-push
  "gs" 'magit-status
  "l" 'global-linum-mode
  "," 'switch-to-buffer
  "k" 'kill-buffer
  "w" 'save-buffer
  "nt" 'neotree-toggle
  "q" 'delete-frame
  )

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

(global-set-key (kbd "C-l") 'other-window)
(global-set-key (kbd "C-h") 'other-window)
(global-set-key (kbd "C-u") 'scroll-up-command)

(setq vc-follow-symlinks t)

(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "nt" 'evil-normal-state)
(key-chord-mode 1)
