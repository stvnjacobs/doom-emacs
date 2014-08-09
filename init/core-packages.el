
;; (require 'cl)

;; Package management bootstrap
(setq package-enable-at-startup nil
      package-archives
      '(("melpa" . "http://melpa.milkbox.net/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/"))
      package-archive-exclude-alist
      '(("melpa" org-trello)
        ("melpa" org)
        ("marmalade" org)
        ("gnu" org))
      )

(let ((default-directory my/elisp-dir))
    (normal-top-level-add-to-load-path '("."))
    (normal-top-level-add-subdirs-to-load-path))

(eval-and-compile
  (package-initialize)
  (require 'use-package))

;; Check if a package is installed; if load is t, load it too.
;; Works for packages bundled with emacs too!
(defun my/install-package (package)
    (message "=> checking: %s" package)
    (unless (package-installed-p package)
      (message "=> installing: %s" package)
      (package-install package)))

(use-package diminish :ensure t)

;;
(provide 'core-packages)
