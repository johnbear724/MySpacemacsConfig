(defun johnbear724/build ()
  (interactive)
  (projectile-with-default-dir (projectile-project-root)
	(async-shell-command "build")))

(defun johnbear724/run ()
  (interactive)
  (projectile-with-default-dir (projectile-project-root)
	(async-shell-command "run")))

;; (defun johnbear724/push-mark-and-goto-definition ()
;;   (interactive)
;;   (push-mark (point))
;;   (helm-gtags-find-tag-from-here))

(defun johnbear724/open-quick-notes ()
  (interactive)
  (find-file "c:/Users/john/Dropbox/Documents/Notes/quick_notes.org"))

(defun johnbear724/open-private-layers()
  (interactive)
  (dired "~/.spacemacs.d/layers"))

(defun johnbear724/switch-to-messages-buffer ()
  "Switch to the `*Messages*' buffer. Create it first if needed."
  (interactive)
  (let ((exists (get-buffer "*Messages*")))
    (switch-to-buffer (get-buffer-create "*Messages*")))
  (end-of-buffer))
