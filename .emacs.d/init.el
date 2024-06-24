(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; My custom packages
(setq sophonie/package-dir "/home/sophonie/.bash_history/.emacs.d/personal/packages/")

;; My custom themes
(setq sophonie/theme-dir "/home/sophonie/.emacs.d/personal/themes/")
(setq sophonie/theme 'phaz)

;; Programming mode
(setq sophonie/programming-modes '(javascript-mode
				  html-mode
				  c-mode
				  css-mode
				  sh-mode
				  conf-mode
				  emacs-lisp-mode
				  lisp-interaction-mode
				  typescript-mode
				  python-mode
				  php-mode
				  go-mode
				  web-mode))

(setq sophonie/indent 2)


;; enable Line Number and relative style from hook
(defun line-numbers-and-relative ()
  (display-line-numbers-mode)
  (if display-line-numbers
      (setq display-line-numbers 'relative)))

(add-hook 'prog-mode-hook 'line-numbers-and-relative)

;; Manage backup files
;; (setq backup-directory-alist '(("." . "~/.emacs-backup-file")))
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; Revert buffer when changed in disk
(global-auto-revert-mode 1)

;; Indent
(setq default-input-method sophonie/indent)

;; Persist across session
;;(desktop-save-mode 1)
;;(save-place-mode 1)

;; Highlight line
(global-hl-line-mode 1)

;; Write over the range
(delete-selection-mode 1)

;; Remove some visual unless
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Disable ring bell very enoying! :p
(setq ring-bell-function 'ignore)

;; Define my fonts
(set-face-attribute 'default nil :font "Jetbrains Mono-12")
(set-frame-font "Jetbrains Mono-12" nil t)

;; Theme
(use-package zenburn-theme
  :ensure t)
(use-package gruvbox-theme
  :ensure t)

;; Load modus-theme
(load-theme 'gruvbox-dark-medium t)

;; Enable Ido for better navigation
(ido-mode)

;; Smex
(use-package smex
  :ensure t
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)
   ;; This is your old M-x.
   ("C-c C-c M-x" . execute-extended-command)))

;; Enable highlight line mode
;;(add-hook 'prog-mode-hook 'hl-line-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dockerfile-mode lsp-docker docker-compose-mode docker all-the-icons all-the-icons-install-fonts org-mode orgmode lsp-ui magit gruvbox-theme smex go-mode typescript-mode company flycheck lsp-pyright lsp-mode zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; FlyCheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 2))

;; Golang mode
(use-package go-mode
  :ensure t)

;; Typescript mode
(use-package typescript-mode
  :ensure t)

;; PHP mode
(use-package php-mode
  :ensure t)

;; Web mode
(use-package web-mode
  :ensure t)

;; Docker mode
(use-package docker
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package docker-compose-mode
  :ensure t)

;; LSP
(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-auto-guess-root t
	lsp-keymap-prefix "C-l"
	lsp-enable-indentation t
	lsp-enable-imenu t
	lsp-file-watch-threshold 500)
  (defun lsp-on-save-operation()
    (when (or (boundp 'lsp-mode)
	      (boundp 'lsp-deferred))
      (lsp-organize-imports)
      (lsp-format-buffer)))
  
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ('sophonie/programming-modes . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp-deferred)

(use-package lsp-ui
  :ensure t
  :after (lsp-mode)
  :commands lsp-ui-doc-hide
  :bind
  ("C-c u" . lsp-ui-imenu)
  :init (setq lsp-ui-peek-enable t
	      lsp-ui-doc-enable t
	      lsp-ui-doc-use-webkit nil
	      lsp-ui-doc-delay 0.2
	      lsp-ui-doc-include-signature t
	      ;;lsp-ui-doc-alignment 'at-point
	      lsp-ui-doc-use-childframe t
	      lsp-ui-peek-show-directory t
	      lsp-ui-sideline-update-mode 'line
	      lsp-ui-sideline-enable t
	      lsp-ui-sideline-show-hover nil
	      lsp-ui-sideline-show-code-actions t
	      lsp-ui-sideline-ignore-duplicate t)
  :config
  (add-to-list 'lsp-ui-doc-frame-parameters '(right-fringe . 8)))

;; Python LSP
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))  ; or lsp-deferred

;; Docker LSP
(use-package lsp-docker
  :ensure t
  :hook (docker-mode . (lambda ()
                         (require 'lsp-docker)
                         (lsp-deferred))))  ; or lsp-deferred


;; Magit
(use-package magit
  :ensure t)

;; Command emergency
(global-set-key (kbd "M-<") #'beginning-of-buffer)
(global-set-key (kbd "M->") #'end-of-buffer)

(use-package all-the-icons
  :ensure t)

;; Org Mode
(use-package org
  :ensure t
  :bind (("C-c l" . org-store-line)
	 ("C-c a" . org-agenda)
	 ("C-c c" . org-capture))
  :config
  (setq org-agenda-files '("~/Documents/todo.org")))




