
;;------------------------------------------------------------
;; Dash
;;------------------------------------------------------------


(add-to-list 'load-path "~/.emacs.d/lisp/")
(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t nil)
(global-set-key [(control c)(d)] 'dash-at-point)
(global-set-key [(control c)(e)] 'dash-at-point-with-docset)


;;------------------------------------------------------------
;; Python
;;------------------------------------------------------------


;; python-mode
(setq py-install-directory "~/.emacs.d/elpa/python-mode-6.1.3")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

; use matplotlib
(setq py-python-command-args '("--matplotlib" "--pylab"))
(setq py-force-py-shell-name-p t)

; split windows
;(setq py-split-windows-on-execute-p t)
(setq-default py-split-windows-on-execute-function 'split-window-horizontally)

; try to automagically figure out indentation
(setq py-smart-indentation t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)


;;------------------------------------------------------------
;; Auto-Complete
;;------------------------------------------------------------


;; yasnippet settings
(load-file "~/.emacs.d/lisp/yasnippet.el")
(load-file "~/.emacs.d/lisp/auto-complete.el")
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

;; load yasnippet
(require 'yasnippet)
(yas/global-mode t)

;; load auto-complete (basic)
(require 'auto-complete)
(global-auto-complete-mode t)


;;------------------------------------------------------------
;; Setting
;;------------------------------------------------------------


;;default linum-mode
(global-linum-mode 1)

;;show line_num and raw_number  
(global-linum-mode t)
(column-number-mode t)

;; Delete-selection-mode
(delete-selection-mode nil)

;; Emacs-Shell
(global-set-key [(meta s)(meta s)] 'shell)

;; Marker Setting
(global-set-key [(control x)(control x)] 'set-mark-command)

;; Don't make Backup File
(setq make-backup-files nil)
(setq-default transient-mark-mode t)
(setq auto-mode-alist (cons '("readme" . text-mode) auto-mode-alist))

;; shell mode cursor goes bottom
(remove-hook 'comint-output-filter-functions 'comint-postoutput-scroll-to-bottom)

;; underline mode
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((((class color) (min-colors 88) (background light)) (:underline "red")))))
(global-hl-line-mode t)


;;------------------------------------------------------------
;; Shortcuts
;;------------------------------------------------------------


;; F5 Emacs Shell
(global-set-key [(f5)] 'eshell)

;; F6 Replace-string
(global-set-key [(f6)] 'replace-string)

;; F7 Directory open, neotree
(global-set-key [(f7)] 'neotree-toggle)

;; F8
(global-set-key [(f8)] 'linum-mode)

;; F9
(global-set-key [(f9)] 'comment-or-uncomment-region)

;; F12 Find-grep, Find specific text on current directory
(global-set-key [(f12)] 'find-grep)



;;------------------------------------------------------------
;; Etc.
;;------------------------------------------------------------

(defun minimap-toggle ()
  "Toggle minimap for current buffer."
  (interactive)
  (if (not (boundp 'minimap-bufname))
      (setf minimap-bufname nil))
  (if (null minimap-bufname)
      (progn (minimap-create)
	     (set-frame-width (selected-frame) 100))
    (progn (minimap-kill)
	      (set-frame-width (selected-frame) 80))))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize))

(require 'package)
(add-to-list 'package-archives
	                  '("marmalade" . "http://marmalade-repo.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(py-python-command-args (quote ("--pylab"))))
