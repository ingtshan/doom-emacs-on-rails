;;; extends.el --- add ingtshang's configuration as extends  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  ingtshan

;; Author: ingtshan <rongcanyo@gmail.com>

;; just like old emacs init.el
;; for develop and test my package quickly in simple way

(defun visit-extend-utils ()
  "Visit the user-settings.el."
  (interactive)
  (find-file (concat doom-private-dir "extends.el"))
  (message "Welcome to extend config file!"))

(map! :leader "fn" 'visit-extend-utils)

;; ;; fix web
;; (require 'eglot)
;; (require 'web-mode)
;; (define-derived-mode genehack-vue-mode web-mode "ghVue"
;;   "A major mode derived from web-mode, for editing .vue files with LSP support.")
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . genehack-vue-mode))
;; (add-hook 'genehack-vue-mode-hook #'eglot-ensure)
;; (add-to-list 'eglot-server-programs '(genehack-vue-mode "vls"))

(setq prettier-js-args
      (list "--trailing-comma" "all"
        "--bracket-spacing" "false"
        ))

(setq prettier-js-command (append '("bundle" "exec") "prettier"))

(setq org-outline-path-complete-in-steps nil
      org-refile-allow-creating-parent-nodes 'confirm
      org-refile-use-outline-path 'file
      org-refile-targets '((nil :maxlevel . 5)
                           (org-agenda-files :maxlevel . 4)))

(require 'prettier-js)
;; (setq prettier-js-command "bundle exec yarn prettier")

;; my package
(require 'mac-command)
(require 'rails-i18n-search)
(require 'rails-i18n)

(require 'insert-gitmoji)
(require 'insert-angular)

(map! :leader "ig" 'gitmoji-insert-emoji)
(map! :leader "ia" 'iangular-insert-segment)
(map! :leader "ii" 'rails-i18n-search-replace-regex-select-style)
(map! :leader "ic" #'(lambda () (interactive) (unless (search-forward-regexp "\\cc") nil)) :desc "in chinese character")
(map! :leader "nw" )
