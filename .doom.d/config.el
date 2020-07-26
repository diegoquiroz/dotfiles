
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Diego Quiroz"
      user-mail-address "diego00aq@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;(setq doom-theme 'doom-nord-light)
(setq doom-theme 'doom-nord-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq mac-option-modifier 'meta
	  mac-right-option-modifier 'none)
;(setq ns-option-modifier 'none
;    ns-right-alternate-modifier 'meta)

;;(setq doom-variable-pitch-font (font-spec :family "Noto Sans" :size 13))
;;(setq doom-font (font-spec :family "Menlo" :size 12))
(setq treemacs-width 25)
(setq doom-treemacs-use-generic-icons 'nil)
(setq doom-themes-treemacs-theme "doom-colors")

(setq minimap-minimum-width 10)


(use-package nyan-mode
   :custom
   (nyan-cat-face-number 4)
   (nyan-animate-nyancat t)
   ;:hook
   ;(doom-modeline-mode . nyan-mode)
   )


;;(use-package doom-themes
;;  :custom
;;  (doom-themes-enable-italic t)
;;  (doom-themes-enable-bold t)
;;  :custom-face
;;  ;; (vertical-bar   (doom-darken base5 0.4))
;;  ;; (doom-darken bg 0.4)
;;  :config
;;  (load-theme 'doom-dracula t)
;;  (doom-themes-neotree-config)
;;  (doom-themes-org-config)
;;  ;; Modeline
;;  (use-package doom-modeline
;;    :custom
;;    (doom-modeline-buffer-file-name-style 'truncate-with-project)
;;    (doom-modeline-icon t)
;;    (doom-modeline-major-mode-icon nil)
;;    (doom-modeline-minor-modes nil)
;;    :hook
;;    (after-init . doom-modeline-mode)
;;    :config
;;    (set-cursor-color "cyan")
;;    (line-number-mode 0)
;;    (column-number-mode 0)
;;    (doom-modeline-def-modeline 'main
;;      '(bar workspace-number window-number evil-state god-state ryo-modal xah-fly-keys matches buffer-info remote-host buffer-position parrot selection-info)
;;      '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs checker))))
