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
;;   (johnbear724/my-mark-ring-push)
;;   (spacemacs/jump-to-definition))

(defun johnbear724/open-quick-notes ()
  (interactive)
  (find-file "c:/Users/john/Dropbox/Documents/Notes/quick_notes.org"))

(defun johnbear724/open-private-layers()
  (interactive)
  (dired "~/.spacemacs.d/"))

(defun johnbear724/switch-to-messages-buffer ()
  "Switch to the `*Messages*' buffer. Create it first if needed."
  (interactive)
  (let ((exists (get-buffer "*Messages*")))
    (switch-to-buffer (get-buffer-create "*Messages*")))
  (end-of-buffer))

(defun johnbear724/switch-to-default-window-and-maximize ()
  "Switch to window 1 and maximize the window."
  (interactive)
  (select-window-1)
  (spacemacs/toggle-maximize-buffer))

(defun johnbear724/yapfify-call-bin (input-buffer output-buffer)
  "Call process yapf on INPUT-BUFFER saving the output to OUTPUT-BUFFER.
Return the exit code."
  (with-current-buffer input-buffer
    (call-process-region (point-min) (point-max) "yapf" nil output-buffer)))

;;;###autoload
(defun johnbear724/yapfify-buffer ()
  "Try to yapfify the current buffer.
If yapf exits with an error, the output will be shown in a help-window."
  (interactive)
  (let* ((original-buffer (current-buffer))
         (original-point (point))  ; Because we are replacing text, save-excursion does not always work.
         (tmpbuf (get-buffer-create "Yapf output"))
         (exit-code (johnbear724/yapfify-call-bin original-buffer tmpbuf)))

    ;; There are three exit-codes defined for YAPF:
    ;; 0: Exit with success (change or no change on yapf >=0.11)
    ;; 1: Exit with error
    ;; 2: Exit with success and change (Backward compatibility)
    ;; anything else would be very unexpected.
    (cond ((or (eq exit-code 0) (eq exit-code 2))
           (with-current-buffer tmpbuf
             (copy-to-buffer original-buffer (point-min) (point-max)))
           (goto-char original-point))

          ((eq exit-code 1)
		   (message (format "Yapf failed with the following error(s): \n\n%s"
							(with-current-buffer tmpbuf
							  (buffer-string))))
           ))
    ;; Clean up tmpbuf
    (kill-buffer tmpbuf)))

;; ;;; The mark ring for links jumps
;; (defun johnbear724/my-pop-to-buffer-same-window
;; 	(&optional buffer-or-name norecord label)
;;   "Pop to buffer specified by BUFFER-OR-NAME in the selected window."
;;   (if (fboundp 'pop-to-buffer-same-window)
;;       (funcall
;;        'pop-to-buffer-same-window buffer-or-name norecord)
;;     (funcall 'switch-to-buffer buffer-or-name norecord)))
;; (defcustom my-mark-ring-length 10
;;   "Number of different positions to be recorded in the ring.
;; Changing this requires a restart of Emacs to work correctly."
;;   :type 'integer)
;; (defvar my-mark-ring nil
;;   "Mark ring for positions before jumps.")
;; (defvar my-mark-ring-last-goto nil
;;   "Last position in the mark ring used to go back.")
;; ;; Fill and close the ring
;; (setq my-mark-ring nil my-mark-ring-last-goto nil) ;; in case file is reloaded
;; (loop for i from 1 to my-mark-ring-length do
;;       (push (make-marker) my-mark-ring))
;; (setcdr (nthcdr (1- my-mark-ring-length) my-mark-ring)
;; 	my-mark-ring)

;; (defun johnbear724/my-mark-ring-push (&optional pos buffer)
;;   "Put the current position or POS into the mark ring and rotate it."
;;   (interactive)
;;   (setq pos (or pos (point)))
;;   (setq my-mark-ring (nthcdr (1- my-mark-ring-length) my-mark-ring))
;;   (move-marker (car my-mark-ring)
;; 	       (or pos (point))
;; 	       (or buffer (current-buffer)))
;;   (message "%s"
;; 	   (substitute-command-keys
;; 	    "Position saved to mark ring, go back with \\[johnbear724/my-mark-ring-goto].")))

;; (defun johnbear724/my-mark-ring-goto (&optional n)
;;   "Jump to the previous position in the mark ring.
;; With prefix arg N, jump back that many stored positions.  When
;; called several times in succession, walk through the entire ring.
;; The commands jumping to a different position in the current file,
;; or to another file, automatically push the old position
;; onto the ring."
;;   (interactive "p")
;;   (let (p m)
;;     (if (eq last-command this-command)
;; 	(setq p (nthcdr n (or my-mark-ring-last-goto my-mark-ring)))
;;       (setq p my-mark-ring))
;;     (setq my-mark-ring-last-goto p)
;;     (setq m (car p))
;;     (johnbear724/my-pop-to-buffer-same-window (marker-buffer m))
;;     (goto-char m)
;;     (if (or (outline-invisible-p) (org-invisible-p2)) (message 'mark-goto))))
