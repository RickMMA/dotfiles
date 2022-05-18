(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-safe-themes
   '("3b83978af40d7b5325dc379a373dd8cc0c102a5f2fb64debd6c2d1ee05017e33" "25af4b2030e5499486946cf93e71daf6cec254f3167e71fb75b11a9933b6dc52" "4e92c582a6b397f2a3e3effdc6b7459906653284cdc3dce50761e0f571d3bd5e" "cfe7d8fa480c30ea693c9a4be021917f7f3c75c6f2a7418ef791e7b997209bd7" "3fee5b204ed71d8bf937694b09e5be5673e452bebadd79ef2e1cdbeac3eb0e95" "46a16c851166566bd822baaef5c65d3ce435d66a7490fee87e67c11fd648813d" "8325eddaa4a264ce472c8f37f3eaa79624751e0c0c0fd4bf623bb934b05d3623" "61c03f91d85e0132389d68127ac70374b3adbb3e1940145bb688345442249180" "38a13ed1b269cea2504ee79b07ffdb338c64a2185387f795c47144d1fc11e24d" "f18ce4c53b14db3d266f19ee63c27ff745eeddaeb7357e7aa14f9734e48dba00" "11d23424ad109abc7e433041f76a6f5ee10442770ebb84ac03e420676c9932f3" "a25ca82041fa0a78d6c5b074dfb7333d88953a24e3a46b289c86035b5a573165" "90daf04333c513a0658a91b8eaa526dba31da6933dc0d3e9099ae57dea75f2a9" "3ab3c3ef66cb55c2e1485fa9f11388f01d0eacfdd626873162a80c2fbea3d231" "c77d3ebb4af34194194889bf49cea28ec86b52e5f1bdd1a80defdfaec421a406" "1ffac76810186715f4dd7959202d6c2f31a8963ef0015c17ca01887c8a906688" "18260f7eedbe0bff102d450ed353b5a3dc76d5d8aa04887d8a4dfb3bb10a43be" "01609e32a8c0eba78c83070d64dc6af6a161d42d4f2a511180ca2ec500aeb74a" "e04a9e4b409278f8bdc79dc2232e417bcf729edd26f4a3fe8937561cdd7c4fbc" "34371bd12294b2a4d06dccbac00b6d29dcbfaa6f7e6e34862bc32e3fc41dd55a" default))
 '(package-selected-packages
   '(pdf-tools web-mode marginalia vertico use-package helm evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; UTF-8 as default encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Set long lines to hide instead of showing
(setq-default truncate-lines 1)

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
;;(package-refresh-contents)

;; Add personal load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Set up use-package
(package-install 'use-package)
(require 'use-package)

;; Set up vertico and marginlia (lightweight helm)
(use-package vertico
       :init
       (vertico-mode))

(use-package marginalia
:after vertico
:ensure t
:init
(marginalia-mode))

;; Download and set up evil-mode
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable evil-mode
(require 'evil)
(evil-mode 1)

(setq inhibit-startup-message t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; Set fonts
(when (member "Lucida Console" (font-family-list))
  (set-frame-font "Lucida Console-11" t t))

;; Set theme
;;(load-theme 'tsdh-dark)
(load-theme 'wombat)

;; Set default frame size
(setq default-frame-alist
       '((width . 120)
         (left . 0.5)
         (top . 0.5)
         (vertical-scroll-bars . nil)
         (horizontal-scroll-bars . nil)))

;; Set line numbers
(global-display-line-numbers-mode 1)

;; Show cursor position within line in status bar
(column-number-mode 1)

;; Highlight cursor line
(global-hl-line-mode 1)

;; Highlight parenthesis
(show-paren-mode 1)

;; Disable backup files
(setq make-backup-files nil)

;; Disable autosave files
(setq auto-save-default nil)

;; Activate pdf tools package
(pdf-tools-install)
