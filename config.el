;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Jim Liu"
      user-mail-address "jimliu2014@hotmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(map! :desc "Next Workspace"
      :n
      "tl" #'+workspace/switch-right)

(map! :desc "tabprevious"
      :n
      "th" #'+workspace/switch-left)

(map! :desc "Toggle Treemacs"
      :n
      "tt" #'treemacs)

(map! :desc "Treemacs Change Directory"
      :n
      "td" #'treemacs-select-directory)

(map!
      :desc "Org Latex Preview"
      :n
      "tlp" #'org-latex-preview)

(define-key evil-normal-state-map (kbd "J")
    (lambda nil (interactive) (evil-next-visual-line 5)))

(define-key evil-normal-state-map (kbd "K")
    (lambda nil (interactive) (evil-previous-visual-line 5)))

;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;;Relative line number
(setq display-line-numbers-type 'relative)

;; Automatic scroll
;; Vertical Scroll
(setq scroll-step 1)
(setq scroll-margin 5)          ;; Always have n lines above or below the edge
(setq scroll-conservatively 101)
(setq scroll-up-aggressively 0.01)
(setq scroll-down-aggressively 0.01)
(setq auto-window-vscroll nil)
(setq fast-but-imprecise-scrolling nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
;; Horizontal Scroll
(setq hscroll-step 1)
(setq hscroll-margin 1)

;; Org-roam settings
(use-package! org-roam
  :custom
  (org-roam-directory "~/Desktop/RoamNotes")
  (org-roam-complete-everywhere t)
  )
(map! :leader
      :desc "insert node by completion"
      :n
      "nrc" #'completion-at-point)

(use-package! websocket
    :after org-roam)
;; Org-roam-ui settings
(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

;; Change Font Size
(setq doom-font (font-spec :size 16))
;; Org-mode latex preview
(add-hook 'org-mode-hook 'org-fragtog-mode)
(add-hook 'org-mode-hook #'turn-on-org-cdlatex)
;; Latex snippets
(setq yas-triggers-in-field t)
;; (yas-reload-all)
;; (add-hook 'prog-mode-hook #'yas-minor-mode)
;; pdf-tools
(add-hook 'pdf-view-mode-hook 'pdf-continuous-scroll-mode)
