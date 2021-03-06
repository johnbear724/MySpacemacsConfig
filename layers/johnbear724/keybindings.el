(spacemacs/declare-prefix "o" "johnbear724")

(spacemacs/set-leader-keys "ob" 'johnbear724/build)
(spacemacs/set-leader-keys "or" 'johnbear724/run)
(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search)
(spacemacs/set-leader-keys "om" 'johnbear724/switch-to-messages-buffer)
(spacemacs/set-leader-keys "ow" 'johnbear724/switch-to-default-window-and-maximize)
(spacemacs/set-leader-keys "os" 'johnbear724/create-shell-buffer)

(spacemacs/declare-prefix "od" "directries")
(spacemacs/set-leader-keys "odn" 'johnbear724/open-quick-notes)
(spacemacs/set-leader-keys "odp" 'johnbear724/open-private-layers)
(spacemacs/set-leader-keys "odh" 'johnbear724/open-home)

(spacemacs/declare-prefix "ot" "toggles")
(spacemacs/set-leader-keys "otp" 'johnbear724/toggle-yapf-when-save-file)
(spacemacs/set-leader-keys "otc" 'johnbear724/toggle-clang-format-when-save-file)

;; (spacemacs/declare-prefix "og" "goto")
;; (spacemacs/set-leader-keys "ogd" 'johnbear724/push-mark-and-goto-definition)
;; (spacemacs/set-leader-keys "ogp" 'johnbear724/my-mark-ring-goto)

(global-set-key (kbd "C-;") 'company-complete)
(global-set-key (kbd "C-:") 'yas-expand)
