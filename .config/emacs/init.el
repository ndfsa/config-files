; clean up gui
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

; make semicolon work like in vim
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; set font
(set-face-attribute 'default nil :font "JetBrainsMono-14:Medium")

; set frame size
(when window-system (set-frame-size (selected-frame) 120 36))

; allow frame using fractional characters
(setq frame-resize-pixelwise t)

; scroll margin before cursor is at the end
(setq scroll-margin 5)
(setq scroll-step 1)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

; bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

; register use-package macro
(straight-use-package 'use-package)

; assume :straight t is the default
(setq straight-use-package-by-default t)

; packages
(use-package dracula-theme
  :config
  (load-theme 'dracula t))
(use-package mood-line
  :config
  (mood-line-mode 1))
(use-package goto-chg)
(use-package evil
  :requires
  (goto-chg)
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-w-delete t)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(use-package ivy
  :config
  (setq ivy-re-builders-alist
    '((t . ivy--regex-fuzzy)))
  (ivy-mode 1))
(use-package counsel
  :config
  (counsel-mode 1))
(use-package ivy-rich
  :config
  (ivy-rich-mode 1))
(use-package general)
(use-package projectile
  :config
  (setq projectile-completion-system 'ivy))
(use-package tree-sitter)
(use-package tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(use-package rust-mode)
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((rust-mode . lsp))
  :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package org :straight nil)
(use-package magit)
(use-package ediff)
