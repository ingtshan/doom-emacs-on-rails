;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; to for add load-path recursion like -r
(unless (boundp 'add-subdirs-to-load-path)
  (defun add-subdirs-to-load-path(dir)
    "Recursive add directories to `load-path`."
    (let ((default-directory (file-name-as-directory dir)))
      (add-to-list 'load-path dir)
      (normal-top-level-add-subdirs-to-load-path))))

(add-subdirs-to-load-path
 (expand-file-name "extends" doom-private-dir))

(if (not (file-exists-p "~/.doom.d/doom-settings.el"))
    (org-babel-load-file
     (expand-file-name "doom-settings.org" doom-private-dir))
  (load (expand-file-name "doom-settings.el" doom-private-dir)))

;; load ingtshan's configuration
(load (expand-file-name "extends.el" doom-private-dir))
