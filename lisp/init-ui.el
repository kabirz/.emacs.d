(use-package dracula-theme
    :init (load-theme 'dracula t))
(use-package smart-mode-line
    :init
    (setq sml/no-confirm-load-theme t)
    (setq sml/theme 'respectful)
    (sml/setup))

;; Font settings
(use-package emacs
  :when (display-graphic-p)
  :config
  (setq display-line-numbers-type t)
  (global-display-line-numbers-mode t)
  (set-default 'cursor-type 'bar)
  (setq default-frame-alist '((width . 100) (height . 40)))
  ;; (set-frame-parameter nil 'fullscreen 'maximized)
  ;; Set fonts global
  (set-face-attribute 'default nil :font "SourceCodePro Nerd Font")

  (when *is-windows*
    (setq face-font-rescale-alist '(("DejaVuSansMono Nerd Font Mono 11" . 1)))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "华文细黑" :size 10.5))))
  (when *is-mac*
    (set-face-attribute 'default nil :font "Monaco 10")
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "华文细黑" :size 14.5)))))

(provide 'init-ui)