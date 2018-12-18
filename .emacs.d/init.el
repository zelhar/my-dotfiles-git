;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; bring up help for key bindings
(use-package which-key
:ensure t
:config
(which-key-mode))


;; Auto completion
(use-package auto-complete
:ensure t
:init
(progn
(ac-config-default)
(global-auto-complete-mode t)
))


;; on the fly syntax checking
(use-package flycheck
:ensure t
:init
(global-flycheck-mode t))

;; snippets and snippet expansion
(use-package yasnippet
:ensure t
:init
(yas-global-mode 1))

;; tags for code navigation
(use-package ggtags
:ensure t
:config
(add-hook 'c-mode-common-hook
(lambda ()
(when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
(ggtags-mode 1))))
)

(use-package ag
  :ensure t
)

(use-package latex-pretty-symbols)
(use-package latex-math-preview)

(use-package helm-ag)

(setq visible-bell 1)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
;; don't use tabs for indent
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(setq-default c-tab-always-indent "shit")
(setq-default tab-width 4)
;(setq tab-width 4)
;Break Lines that are too long
(auto-fill-mode t)
(set-fill-column 70)
(setq sentence-end-double-space nil)
; backups
;(setq make-backup-files nil) ; Don't want any backup files
(setq backup-directory-alist
      `((".*" . "~/temp/emacs_files")))
; parentheses
(show-paren-mode t)
; show columns
(setq column-number-mode t)
;;enable evil
(require 'evil)
(evil-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;(global-hl-line-mode t)
(electric-indent-mode nil)
(electric-pair-mode t)
(setq electric-pair-delete-adjacent-pairs t)

;;(global-linum-mode t)
;(add-hook 'prog-mode-hook 'linum-on) ;rerurns error

;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
;; when a file is updated outside emacs, make it update if it's already opened in emacs
(global-auto-revert-mode 1)
;; keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)
;; save/restore opened files
;(desktop-save-mode 1)
(evil-set-initial-state 'pdf-view-mode 'emacs)
(add-hook 'pdf-view-mode-hook
  (lambda ()
    (set (make-local-variable 'evil-emacs-state-cursor) (list nil))))

(add-hook 'doc-view-mode-hook
  (lambda ()
    (set (make-local-variable 'evil-emacs-state-cursor) (list nil))))

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(require 'slime)
(slime-setup)

;;starting pdf-tools/pdf-view-mode as replacement to docview-mode
(pdf-tools-install)
;;Trying to set proxy for eww that privoxy won't block
(setq url-proxy-services
      '(("http"     . "")
        ("https"    . "")
        ("ftp"      . "")
        ("no_proxy" . "")))

;;Set default spellchecking program
;(setq ispell-program-name "hunspell")
;(setq ispell-program-name "aspell")
;(setq ispell-really-hunspell t)
;(setq ispell-dictionary "deutsch8")
;Org-Mode Preference
(setq org-indent-mode -1)
;wrap lines
(global-visual-line-mode 1)

(setq
  echo-keystrokes 0.1
  sentence-end-double-space nil
  display-time-24hr-format t)

(visual-line-mode 1)
(delete-selection-mode 1)
;stop interferring with x clipboard
(setq x-select-enable-clipboard nil)
;copy to clipboard with C-c y
(global-set-key (kbd "C-c y") 'x-clipboard-yank)

;;haskell-mode
;unicode mode makes the file unloadable in ghci (at least out of the box) 
;(add-hook 'haskell-mode-hook 'turn-on-haskell-unicode-input-method)
;(require 'haskell-unicode-input-method)
; (add-hook 'haskell-mode-hook 
;   (lambda () (set-input-method "haskell-unicode")))

;(speedbar-add-supported-extension ".hs")
(add-hook 'haskell-mode-hook 'flyspell-prog-mode)
;(package-install 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;(setq haskell-process-type "stack-ghci")
;(custom-set-variables
;  '(haskell-process-type 'cabal-repl))

;setting w3m for haskell-mode
;(package-install 'w3m)
(setq w3m-mode-map (make-sparse-keymap))
(define-key w3m-mode-map (kbd "RET") 'w3m-view-this-url)
(define-key w3m-mode-map (kbd "q") 'bury-buffer)
(define-key w3m-mode-map (kbd "<mouse-1>") 'w3m-maybe-url)
(define-key w3m-mode-map [f5] 'w3m-reload-this-page)
(define-key w3m-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)
(define-key w3m-mode-map (kbd "M-<left>") 'w3m-view-previous-page)
(define-key w3m-mode-map (kbd "M-<right>") 'w3m-view-next-page)
(define-key w3m-mode-map (kbd "M-.") 'w3m-haddock-find-tag)

(defun w3m-maybe-url ()
  (interactive)
    (if (or (equal '(w3m-anchor) (get-text-property (point) 'face))
            (equal '(w3m-arrived-anchor) (get-text-property (point) 'face)))
        (w3m-view-this-url)))

(require 'w3m-haddock)
(add-hook 'w3m-display-hook 'w3m-haddock-display)
(define-key haskell-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)

;(defcustom haskell-w3m-haddock-dirs
;  '("/usr/share/doc/ghc/html/haddock/"))
(setq haskell-w3m-haddock-dirs "~/usr/share/doc/ghc/html/haddock/")

;; Install Intero
;(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)

;; helm
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
(setq helm-locate-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)


(helm-mode 1)
