(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives
               (cons "melpa" (concat proto "://melpa.org/packages/")) t))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/rainbow-delimiters")
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" default)))
 '(package-selected-packages
   (quote
    (racket-mode evil company-coq company-lean lean-mode proof-general)))
 '(proof-colour-locked t)
 '(proof-splash-enable nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'package) ; You might already have this line
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize) ; You might already have this line
(add-hook 'coq-mode-hook #'company-coq-mode)
(menu-bar-mode 0)
(tool-bar-mode 0)
(add-hook 'text-mode-hook 'auto-fill-mode)
(setq-default fill-column 80)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
;; Set up package.el to work with MELPA
;;(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/"))
;;(package-initialize)
;;(package-refresh-contents)
;;
;;;; Download Evil
;;(unless (package-installed-p 'evil)
;;  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(require 'rainbow-delimiters)
(require 'package)
(add-to-list 'package-archives
	      '("melpa" . "https://melpa.org/packages/")
	      t)
(load-theme 'afternoon t)
