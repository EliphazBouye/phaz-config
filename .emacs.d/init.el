(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Enable Line Number and relative style from hook
(defun line-numbers-and-relative ()
  (display-line-numbers-mode)
  (if display-line-numbers
      (setq display-line-numbers 'relative)))

(add-hook 'prog-mode-hook 'line-numbers-and-relative)

;; Manage backup files
(setq backup-directory-alist '(("." . "~/.emacs-backup-file")))

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

;; Load modus-theme
(load-theme 'zenburn t)

;; Enable Ido for better navigation
(ido-mode)

;; Enable highlight line mode
;;(add-hook 'prog-mode-hook 'hl-line-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(typescript-mode company flycheck lsp-pyright lsp-mode zenburn-theme)))
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

;; Typescript mode
(use-package typescript-mode
  :ensure t)

;; LSP
(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ((javascript-mode typescript-mode python-mode php-mode c-mode) . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp-deferred)


;; Python LSP
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))  ; or lsp-deferred
