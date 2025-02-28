(package-initialize)
(setq custom-file "~/.emacs.custom.el")

;(add-to-list 'default-frame-alist `(font. "Lucida Console-20"))
(set-frame-font "Lucida Console-20.5" nil t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(ido-mode 1)
(ido-everywhere 1)

(global-display-line-numbers-mode)
(setq-default tab-width 4)

(global-set-key (kbd "C-,")         'duplicate-line)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)


(require 'company)
(require 'go-eldoc)
(require 'go-mode)
;won't work because i'm not using lsp mode
(add-hook 'go-mode-hook 'lsp-deferred)

(add-hook 'before-save-hook 'gofmt-before-save)

(load-file custom-file)

(require 'eglot)
(add-hook 'go-mode-hook #'eglot-ensure)
(add-hook 'after-init-hook 'global-company-mode)
