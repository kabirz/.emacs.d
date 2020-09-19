(use-package restart-emacs)
(use-package evil)
(require 'evil)
(evil-mode 1)

;; Settings for company
(use-package company
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init . global-company-mode)
  :config (setq company-dabbrev-code-everywhere t
		        company-dabbrev-code-modes t
		        company-dabbrev-code-other-buffers 'all
		        company-dabbrev-downcase nil
		        company-dabbrev-ignore-case t
		        company-dabbrev-other-buffers 'all
		        company-require-match nil
		        company-minimum-prefix-length 2
		        company-show-numbers t
		        company-tooltip-limit 20
		        company-idle-delay 0
		        company-echo-delay 0
		        company-tooltip-offset-display 'scrollbar
		        company-begin-commands '(self-insert-command)))

(use-package company-quickhelp
  :hook (prog-mode . company-quickhelp-mode)
  :init (setq company-quickhelp-delay 0.3))

(use-package which-key
    :defer nil
    :config (which-key-mode))

(use-package ace-window
    :bind (("M-o" . 'ace-window)))

; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
            (c-mode . lsp-deferred)
            (go-mode . lsp-deferred)
            (java-mode . lsp-deferred)
            (js-mode . lsp-deferred)
            (html-mode . lsp-deferred)
            (python-mode . lsp-deferred)
            ;; if you want which-key integration
            (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp lsp-deferred)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; (use-package benchmark-init
;;     :init (benchmark-init/activate)
;;     :hook (after-init . benchmark-init/deactivate))

(provide 'init-package)