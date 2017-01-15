;; (spacemacs/toggle-indent-guide-globally-on)
;; (global-flycheck-mode)

;; NeoTree Setting
;; (setq neo-vc-integration 'face)
(setq neo-theme 'nerd)

;; (global-git-commit-mode t)

(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq-default default-tab-width 4)

(setq-default c-basic-offset 4)
(setq c-default-style "k&r")

(with-eval-after-load 'org
  (setq org-startup-indented t)
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
	 (sh . t)
	 (python . t)
	 (C . t)
	 (js . t)
	 (go . t)
	 ))
  )

(add-hook 'c-mode-hook
		  (lambda ()
			(add-hook 'before-save-hook 'clang-format-buffer nil t)))

(add-hook 'c++-mode-hook
		  (lambda ()
			(add-hook 'before-save-hook 'clang-format-buffer nil t)))

(add-hook 'python-mode-hook
		  (lambda ()
			(add-hook 'before-save-hook 'johnbear724/yapfiy-buffer-when-save-file nil t)))

;; (add-hook 'python-mode-hook #'yapf-mode)

(setq-default python-indent-offset 4)

(setq flycheck-gometalinter-fast t)
(setq flycheck-gometalinter-deadline "10s")

;; platform config : windows
(setq w32-pipe-read-delay 0)

(setq default-buffer-file-coding-system 'utf-8-unix)

;; (set-language-environment "UTF-8")
;; (prefer-coding-system 'utf-8)

;; (when (spacemacs/system-is-mswindows)
;;   (set-language-environment "chinese-gbk")
;;   (prefer-coding-system 'chinese-gbk)
;;   )

(setq ls-lisp-dirs-first t)
