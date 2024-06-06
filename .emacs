
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;Uncomment if using indent guides mode
;;(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;;Atuo completion
;;(ac-config-default)
;;(global-auto-complete-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes '(deeper-blue))
 '(highlight-indent-guides-method 'character)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(helm afternoon-theme highlight-indentation highlight-indent-guides verilog-mode))
 '(safe-local-variable-values '((verilog-auto-sense-define-constant . t)))
 '(show-paren-mode t)
 '(verilog-auto-inst-sort nil)
 '(verilog-auto-save-policy nil)
 '(verilog-indent-level 2)
 '(verilog-indent-level-behavioral 2)
 '(verilog-indent-level-declaration 2)
 '(verilog-indent-level-module 2))

(setq-default tab-width 2)

(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq make-backup-files nil)
(save-place-mode 1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :height 120 :width normal :weight normal))))
 '(font-lock-comment-face ((t (:foreground "green"))))
 '(font-lock-function-name-face ((t (:foreground "red"))))
 '(font-lock-keyword-face ((t (:foreground "tomato"))))
 '(font-lock-negation-char-face ((t (:foreground "DeepSkyBlue"))))
 '(font-lock-type-face ((t (:foreground "deep sky blue"))))
 '(verilog-font-lock-translate-off-face ((t (:background "gray10" :slant italic)))))


;;(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;;maximize window

;;(when window-system (set-frame-size (selected-frame) 160 48))
;;(add-hook 'window-setup-hook 'toggle-frame-maximized t)

(global-set-key "\C-z" 'undo-only)
(global-set-key (kbd "<f12>") 'save-buffer)
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "<f4>" ) 'goto-line)
(global-set-key (kbd "<f5>" ) 'query-replace)
(global-set-key (kbd "<C-f5>") 'compile)
(global-set-key [f10] 'align-regexp)
(global-set-key "\C-cd" "\C-a\C- \C-n\M-w\C-y")

(setq-default cursor-type 'bar)

(set-default 'truncate-lines t)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'before-save-hook 'my-prog-nuke-trailing-whitespace)

(defun my-prog-nuke-trailing-whitespace ()
  (when (derived-mode-p 'prog-mode)
    (delete-trailing-whitespace)))

(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))
  
(global-set-key (kbd "C-d") 'duplicate-line)


