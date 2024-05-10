(defun line-numbers-and-relative ()
  (display-line-numbers-mode)
  (if display-line-numbers
      (setq display-line-numbers 'relative)))

(add-hook 'prog-mode-hook 'line-numbers-and-relative)

;; Disable ring bell very enoying! :p
(setq ring-bell-function 'ignore)

;; Define my fonts
(set-face-attribute 'default nil :font "Jetbrains Mono-12")
(set-frame-font "Jetbrains Mono-12" nil t)

;; Enable Ido for better navigation
(ido-mode)
