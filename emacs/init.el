(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel swiper solarized-theme ace-window auto-complete iflipb helm org-bullets try evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-forground :height 3.0)))))

(setq inhibit-startup-message t)
(tool-bar-mode -1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; load evil
(use-package evil
  :ensure t ;; install the evil package if not installed
  :init ;; tweak evil's configuration before loading it
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  :config ;; tweak evil after loading it
  (evil-mode))

(defvar +evil-esc-hook '(t)
  "A hook run after ESC is pressed in normal mode (invoked by
`evil-force-normal-state'). If any hook returns non-nil, all hooks after it are
ignored.")

(defun +evil*attach-escape-hook ()
  "Run the `+evil-esc-hook'."
  (cond ((minibuffer-window-active-p (minibuffer-window))
	 ;; quit the minibuffer if open.
	 (abort-recursive-edit))
	((evil-ex-hl-active-p 'evil-ex-search)
	 ;; disable ex search buffer highlights.
	 (evil-ex-nohighlight))
	(t
	 ;; Run all escape hooks. If any returns non-nil, then stop there.
	 (run-hook-with-args-until-success '+evil-esc-hook))))
(advice-add #'evil-force-normal-state :after #'+evil*attach-escape-hook)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package helm
  :ensure t
  :init
  (progn
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key [C-tab] 'helm-mini)
    (global-unset-key (kbd "C-z"))
    (global-set-key (kbd "C-x b") 'helm-mini)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    ))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-forground :height 3.0)))))
    ))

(setq-default display-line-numbers 'relative)

(use-package solarized-theme
  :ensure t
  :init (load-theme 'solarized-dark t)
  )
