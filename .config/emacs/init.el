(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(setq visible-bell t)

(set-face-attribute 'default nil :font "FiraCode-13:Medium")

(setq frame-resize-pixelwise t)

(setq scroll-margin 8)
(setq scroll-step 1)

(setq-default indent-tabs-mode t)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("org" . "https://orgmode.org/elpa/")
						 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(unless package-archive-contents
  (package-refresh-contents))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package gruvbox-theme)
(load-theme 'gruvbox t)

(use-package flx)
(use-package counsel)

(use-package ivy
  :diminish
  :config
  (ivy-mode 1)
  (setq ivy–regex-fuzzy t)
  (setq ivy-re-builders-alist
		'((t . ivy--regex-fuzzy))))

(column-number-mode)
(global-display-line-numbers-mode t)

(setq whitespace-style (quote (lines-tail))
  whitespace-line-column 100)
(global-whitespace-mode 1)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(use-package evil
  :config
  (evil-mode 1)
  (setq evil-want-C-i-jump t)
  (setq evil-want-C-u-delete t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-undo-system 'undo-redo))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(counsel flx mood-line gruvbox-theme use-package ivy evil doom-modeline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
