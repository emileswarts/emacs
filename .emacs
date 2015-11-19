(package-initialize)
(require 'ido)
(require 'package)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(ido-mode t)

(tool-bar-mode -1)
(load-theme 'monokai t)
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("094f2c4dc01b7ebe70075ab7dba2e3f0fbab788af38ec574b2939c9454fed996" default)))
 '(global-linum-mode t)
 '(ido-mode (quote both) nil (ido))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(nil nil t)
 '(require-final-newline (quote visit))
 '(show-trailing-whitespace t))

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun highlight-to-end-of-line ()
  (interactive)
  (set-mark-command nil)
  (move-end-of-line nil)
  (left-char))

(defun ten-lines-down ()
  (interactive)
  (next-line 10))
(require 'rinari)
(global-rinari-mode)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(defun enlarge-a-lot ()
    (interactive)
  (enlarge-window-horizontally 15))

(evil-leader/set-key
  "a" 'switch-to-previous-buffer
  ;"b"
  ;"c"
  "d" 'split-window-right
  "e" 'dired
  "f" 'find-file
  "gd" 'magit-diff
  "gl" 'magit-log
  "gp" 'magit-push
  "gs" 'magit-status
  ;"h"
  ;"i"
  ;"j"
  "k" 'kill-buffer
  "l" 'global-linum-mode
  "m" 'fiplr-find-file
  "nt" 'neotree-toggle
  "n" 'enlarge-a-lot
  ;"o"
  ;"p"
  "q" 'delete-window
  "r" 'inf-ruby
  ;"s"
  "tm" 'rinari-find-model
  "tc" 'rinari-find-controller
  "ta" 'rinari-find-configuration
  "tr" 'rinari-find-routes
  ;"u"
  "v" 'highlight-to-end-of-line
  "w" 'save-buffer
  "x" 'whitespace-mode
  ;"y"
  ;"z"
  "," 'switch-to-buffer
  )

(set-face-attribute 'default nil :height 140)

(setq evil-want-C-i-jump nil)
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")

(with-eval-after-load 'info
  (require 'magit)
  (info-initialize)
  (add-to-list 'Info-directory-list "~/.emacs.d/site-lisp/magit/Documentation/"))

(add-to-list 'load-path "~/.emacs.d/site-lisp/neotree")

(require 'neotree)

(defun goto-match-paren (arg)
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(define-key evil-normal-state-map (kbd "C-l") 'other-window)
(define-key evil-normal-state-map (kbd "C-h") 'other-window)
(define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)
(define-key evil-normal-state-map (kbd "C-u") 'scroll-down-command)
(define-key evil-normal-state-map (kbd "TAB") 'goto-match-paren)
(define-key evil-normal-state-map (kbd "SPC") 'ten-lines-down)

(setq vc-follow-symlinks t)
(setq ido-enable-flex-matching t)

(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "nt" 'evil-normal-state)
(key-chord-define evil-visual-state-map "nt" 'evil-normal-state)
(key-chord-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-width 2)
(setq-default tab-always-indent nil)

(setq make-backup-files nil)

(setq ring-bell-function 'ignore)
(custom-set-faces)

(add-hook 'ruby-mode-hook 'robe-mode)
(blink-cursor-mode 0)
(auto-save-mode 0)
