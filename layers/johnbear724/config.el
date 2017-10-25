(setq dropbox-path "~/Dropbox/")

(cond
 ((spacemacs/system-is-mswindows)
  (setq w32-pipe-read-delay 0)
  (progn
	(

	 )))
 ((spacemacs/system-is-linux)
  (setq dropbox-path "~/Documents/Dropbox/")
  (progn
	(

	 )))
 ((spacemacs/system-is-mac)
  (progn
	(

	 )))
 )

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
  ;; Use XeLaTeX to export PDF in Org-mode
  (setq org-latex-pdf-process
		'("xelatex -interaction nonstopmode -output-directory %o %f"
		  "xelatex -interaction nonstopmode -output-directory %o %f"
		  "xelatex -interaction nonstopmode -output-directory %o %f"))
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

;; ======
;; Formart when save file
(add-hook 'c-mode-hook
		  (lambda ()
			(add-hook 'before-save-hook 'johnbear724/clang-format-when-save-file nil t)))

(add-hook 'c++-mode-hook
		  (lambda ()
			(add-hook 'before-save-hook 'johnbear724/clang-format-when-save-file nil t)))

(add-hook 'python-mode-hook
		  (lambda ()
			(add-hook 'before-save-hook 'johnbear724/yapfiy-buffer-when-save-file nil t)))

;; (add-hook 'python-mode-hook #'yapf-mode)

(setq johnbear724-yapf-when-save-file t)
(setq johnbear724-clang-format-when-save-file t)
;; Formart when save file
;; ======

(setq-default python-indent-offset 4)

(setq flycheck-gometalinter-fast t)
(setq flycheck-gometalinter-deadline "10s")

(setq default-buffer-file-coding-system 'utf-8-unix)

;; (set-language-environment "UTF-8")
;; (prefer-coding-system 'utf-8)

;; (when (spacemacs/system-is-mswindows)
;;   (set-language-environment "chinese-gbk")
;;   (prefer-coding-system 'chinese-gbk)
;;   )

(setq ls-lisp-dirs-first t)

(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

(defadvice dired-readin
	(after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))
