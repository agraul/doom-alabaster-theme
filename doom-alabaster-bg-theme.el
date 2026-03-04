;;; doom-alabaster-bg-theme.el --- A light theme with little syntax highlighting -*- lexical-binding: t; no-byte-compile: t -*-
;; Copyright (C) 2022--2025 Alexander Graul
;;
;; Author: Alexander Graul <mail@agraul.de>
;; Maintainer: Alexander Graul <mail@agraul.de>
;; Version: 0.2
;; Keywords: themes faces
;; Homepage: https://github.com/agraul/doom-alabaster-theme
;; Homepage: https://github.com/tonsky/sublime-scheme-alabaster
;; Package-Requires: ((emacs "25.1") (doom-themes "2.3.0"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;; Doom Alabaster BG is a port of tonsky's Alabaster BG theme
;;
;;; Code:
(require 'doom-themes)

(defun doom-alabaster-bg--setopt (sym val)
  "Set SYM to VAL and reload the theme."
  (set-default sym val)
  ;;`custom--inhibit-theme-enable' is set to nil by `enable-theme'
  ;; don't reload when `enable-theme' is running
  (when (and (bound-and-true-p custom--inhibit-theme-enable)
             (memq 'doom-alabaster-bg custom-enabled-themes))
    (load-theme 'doom-alabaster :no-confirm)))

(defgroup doom-alabaster-bg-theme nil
  "Options for the `doom-alabaster-bg' theme."
  :group 'doom-themes)

(def-doom-theme doom-alabaster-bg
    "A light theme with little background highlighting"

;;;; Colors
  ;; name        default     256         16
  ((bg           '("#FFFFFF" "#FFFFFF"   "white"))
   (base0        '("#F0F0F0" "F0F0F0"    "white"))
   (base1        '("#E0E0E0" "#E0E0E0"   "brightblack"))
   (base2        '("#DDDDDD" "#DDDDDD"   "brightblack"))
   (base3        '("#777777" "#777777"   "brightblack"))
   (base4        '("#424242" "#424242"   "brightblack"))
   (base5        '("#000000" "#000000"   "black"))
   (base6        '("#000000" "#000000"   "black"))
   (base7        '("#000000" "#000000"   "black"))
   (base8        '("#000000" "#000000"   "black"))
   (fg           '("#000000" "#000000"   "black"))
   (fg-alt       '("#474747" "#474747"   "black"))
   (bg-alt       base0)

   (grey       base3)

   ;; alabaster bg colors
   (active     '("#007ACC" "#007ACC" "brightblue"))
   (blue       '("#DBF1FF" "#DBF1FF" "brightblue"))
   (green      '("#F1FADF" "#F1FADF" "brightgreen"))
   (dark-green '("#DBECB6" "#DBECB6" "green"))
   (red        '("#FFE0E0" "#FFE0E0" "red"))
   (magenta    '("#F9E0FF" "#F9E0FF" "magenta"))
   (yellow     '("#FFFABC" "#FFFABC" "brightyellow"))
   (orange     '("#FFBC5D" "#FFBC5D" "brightyellow"))

   ;; additional colors
   (dark-blue    '("#325CC0" "#325CC0"   "blue"))
   (dark-cyan    '("#0083B2" "#0083B2"   "cyan"))
   (light-yellow '("#FFBC5D" "#FFBC5D"   "brightyellow"))
   (teal         '("#60CB00" "#60CB00"   "brightgreen"))
   (violet       '("#E64CE6" "#E64CE6"   "brightmagenta"))
   (cyan         '("#00AACB" "#00AACB"   "brightcyan"))
   (fg-green     '("#3D7C1F" "#3D7C1F"   "green")) ; slightly darker than stock-alabaster

   ;; fg color variants from stock alabaster
   (fg-magenta   '("#7A3E9D" "#7A3E9D"   "magenta"))
   (fg-blue      '("#007ACC" "#007ACC"   "brightblue"))
   (fg-red       '("#AA3731" "#AA3731"   "red"))
   (fg-yellow    '("#CB9000" "#CB9000"   "yellow"))


   (yellow-highlight (doom-blend light-yellow bg 0.2))
   (bg-dark base2)

;;;; face categories -- required for all themes
   (highlight      fg-blue)
   (vertical-bar   base2)
   (selection      dark-blue)
   (builtin        fg)
   (comments       fg)
   (doc-comments   fg)
   (constants      fg-magenta)
   (functions      fg)
   (keywords       fg)
   (methods        fg)
   (operators      fg)
   (type           dark-blue)
   (strings        green)
   (variables      fg)
   (numbers        fg-magenta)
   (region         base2)
   (error          fg-red)
   (warning        fg-red)
   (success        fg-green)
   (vc-modified    light-yellow)
   (vc-added       fg-green)
   (vc-deleted     fg-red)

   (modeline-fg fg-alt)
   (modeline-bg bg-dark)
   (modeline-bg-inactive base0))

;;;; Base theme face overrides
  ((line-number                           :background bg-alt)
   (minibuffer-prompt                     :foreground dark-blue)
   (mode-line                             :foreground modeline-fg :background modeline-bg)
   (mode-line-emphasis                    :inherit 'mode-line :bold bold)
   (mode-line-inactive                    :foreground modeline-fg
                                          :background modeline-bg-inactive)
   (secondary-selection                   :background bg-dark)
   ;; drop bold from link
   (link                                  :foreground highlight :underline t)
   ;;; Search highlight
   (evil-ex-lazy-highlight                :background yellow-highlight)
   (evil-ex-search                        :background light-yellow)
   (lazy-highlight                        :background yellow)
   (match                                 :foreground fg-green :background base0 :weight 'bold)
   ;;;; vertico family
   (marginalia-size                       :foreground fg-magenta)
   (marginalia-file-priv-dir   :foreground fg)
   (marginalia-file-priv-exec  :foreground fg)
   (marginalia-file-priv-link  :foreground dark-blue)
   (marginalia-file-priv-other :foreground fg)
   (marginalia-file-priv-rare  :foreground fg)
   (marginalia-file-priv-read  :foreground fg)
   (marginalia-file-priv-write :foreground fg)
   (marginalia-number          :foreground numbers)
   (marginalia-lighter         :foreground violet)

   ;;;; adoc-mode
   (adoc-gen-face             :foreground fg :background bg)
   (adoc-meta-hide-face       :inherit 'font-lock-escape-face)
   (adoc-meta-face            :foreground fg)
   (adoc-title-0-face :inherit 'adoc-title-face :height 1.0)
   (adoc-title-1-face :inherit 'outline-1 :weight 'semi-bold)
   (adoc-title-2-face :inherit 'outline-2)
   (adoc-title-3-face :inherit 'outline-3)
   (adoc-title-4-face :inherit 'outline-4)
   (adoc-title-5-face :inherit 'outline-5)
   ;;;; all-the-icons
   (all-the-icons-purple                  :foreground fg-magenta)
   ;;;; ansi-color
   (ansi-color-red                        :foreground fg-red :background fg-red)
   (ansi-color-blue                       :foreground fg-blue :background fg-blue)
   (ansi-color-green                      :foreground fg-green :background fg-green)
   (ansi-color-yellow                     :foreground fg-yellow :background fg-yellow)
   (ansi-color-magenta                    :foreground fg-magenta :background fg-magenta)
   (ansi-color-red                        :foreground fg-red :background fg-red)
   ;;;; cider
   (cider-debug-code-overlay-face         :background base1)
   (cider-result-overlay-face             :background base1)
   (cider-test-success-face               :foreground fg :background green)
   ;;;; company
   (company-tooltip-annotation            :foreground fg)
   (company-tooltip-selection             :background bg-dark)
   ;;;; custom <built-in
   (custom-group-tag                      :foreground dark-blue)
   (custom-button-unraised                :foreground dark-blue :background bg
                                          :button '(line-width 1 :style nil))
   (custom-button-pressed-unraised        :foreground bg :background dark-blue
                                          :button '(line-width 1 :style nil))
   ;;;; diff-indicator
   (diff-added                            :inherit 'magit-diff-added-highlight)
   (diff-changed                          :inherit 'magit-diff-hunk-heading)
   (diff-hunk-header                      :inherit 'magit-diff-hunk-heading)
   (diff-removed                          :inherit 'magit-diff-removed-highlight)
   ;;;; diff-mode
   (diff-file-header                      :inherit 'magit-diff-file-heading)
   (diff-header                           :inherit 'magit-diff-hunk-heading)
   ;;;; dired <built-in>
   (dired-header                          :foreground dark-blue :bold bold)
   (dired-marked                          :foreground fg-magenta :bold bold)
   (dired-flagged                         :foreground fg-red :bold bold)
   (dired-broken-symlink                  :background warning :foreground bg-alt
                                          :bold bold)
   (dired-symlink                         :foreground dark-cyan)
   ;;;; dired-git-info
   (dgi-commit-message-face               :foreground fg-alt)
   ;;;; doom
   (doom-dashboard-banner                 :foreground fg-green)
   (doom-dashboard-loaded                 :foreground fg-green)
   ;;;; doom-modeline
   (doom-modeline-project-dir             :inherit 'doom-modeline
                                          :foreground fg-green :bold bold)
   ;;;; ediff <built-in>
   (ediff-fine-diff-A                     :background (doom-blend selection bg 0.5)
                                          :bold bold :extend t)
   ;;;; eglot
   (eglot-highlight-symbol-face           :background bg-dark)
   ;;;; elisp
   (elisp-shorthand-font-lock-face        :inherit 'default)
   ;;;; eshell <built-in>
   (eshell-prompt                         :foreground fg)
   (eshell-ls-archive                     :foreground fg)
   (eshell-ls-backup                      :foreground fg)
   (eshell-ls-clutter                     :foreground fg)
   (eshell-ls-directory                   :foreground dark-blue)
   (eshell-ls-executable                  :foreground fg)
   (eshell-ls-missing                     :foreground fg)
   (eshell-ls-product                     :foreground fg)
   (eshell-ls-readonly                    :foreground fg)
   (eshell-ls-special                     :foreground fg)
   (eshell-ls-symlink                     :inherit 'dired-symlink)
   (eshell-ls-unreadable                  :foreground fg)
   ;;;; flycheck
   (flycheck-error                        :underline `(:style wave :color ,error) :foreground 'unspecified)
   (flycheck-warning                      :underline `(:style wave :color ,orange) :foreground 'unspecified)
   (flycheck-info                         :underline `(:style wave :color ,fg-green) :foreground 'unspecified)
 ;;;; font-lock-*-face <built-in>
   (font-lock-comment-face                :foreground fg :background yellow)
   (font-lock-doc-face                    :foreground fg-green :background green)
   (font-lock-preprocessor-face           :inherit 'default)
   (font-lock-preprocessor-char-face      :inherit 'default)
   (font-lock-function-name-face          :foreground dark-blue :background blue)
   (font-lock-type-face                   :foreground dark-blue :background blue)
   (font-lock-string-face                 :foreground fg-green :background green)
   (font-lock-function-call-face          :inherit 'default)
   (font-lock-negation-char-face          :inherit 'default)
 ;;;; forge
   (forge-topic-label                     :box '(:line-width -1))
   ;;;; git-commit
   (git-commit-comment-branch-local       :inherit 'magit-branch-local)
   (git-commit-comment-branch-remote      :inherit 'magit-branch-remote)
   (git-commit-comment-file               :foreground fg)
   (git-commit-keyword                    :foreground fg-magenta :slant 'italic)
   (git-commit-summary               :foreground fg :background green)
   (git-commit-overlong-summary      :inherit 'error          :background base0 :slant 'italic :weight 'bold)
   (git-commit-nonempty-second-line  :inherit 'git-commit-overlong-summary)
   (git-commit-pseudo-header         :foreground fg :background green :slant 'italic)
   (git-commit-known-pseudo-header   :foreground fg :background green :weight 'bold :slant 'italic)
   (git-commit-comment-detached      :foreground orange)
   (git-commit-comment-heading       :foreground fg :background green)

 ;;;; gnus
   (gnus-cite-1                           :foreground fg-green)
   (gnus-cite-2                           :foreground dark-blue)
   (gnus-cite-3                           :foreground fg-red)
   (gnus-cite-4                           :foreground fg-blue)
   (gnus-cite-5                           :foreground fg-green)
   (gnus-cite-6                           :foreground dark-blue)
   (gnus-cite-7                           :foreground fg-red)
   (gnus-cite-8                           :foreground fg-blue)
   (gnus-cite-9                           :foreground fg-green)
   (gnus-cite-10                          :foreground dark-blue)
   (gnus-cite-11                          :foreground fg-red)
   (gnus-signature                        :foreground fg-alt)
   ;;;; highlight-numbers-number
   (highlight-numbers-number              :foreground numbers)
   ;;;; highlight-symbol
   (highlight-quoted-symbol               :inherit 'font-lock-variable-face)
   ;;;; lsp
   (lsp-face-highlight-textual            :background bg-dark)
   (lsp-flycheck-warning-deprecated-face  :inherit 'flycheck-warning)
   ;;;; lsp-rust
   (lsp-rust-analyzer-inlay-face          :foreground fg-alt :background bg-dark)
   ;;;; magit
   (magit-bisect-good                     :foreground fg-green)
   (magit-bisect-bad                      :foreground fg-red)
   (magit-blame-heading                   :foreground dark-blue :background bg-dark)
   (magit-blame-date                      :foreground fg-red)
   (magit-branch-current                  :foreground fg-blue)
   (magit-branch-local                    :foreground dark-blue)
   (magit-branch-remote                   :foreground fg-green)
   (magit-cherry-equivalent               :foreground fg-magenta)
   (magit-cherry-unmatched                :foreground fg-blue)
   (magit-diff-added                      :foreground fg-green)
   (magit-diff-added-highlight            :foreground fg-green
                                          :inherit 'magit-diff-context-highlight)
   (magit-diff-context                    :foreground base6 :background base1)
   (magit-diff-context-highlight          :foreground base7 :background base1)
   (magit-diff-hunk-heading               :foreground fg
                                          :background (doom-lighten base3 0.3))
   (magit-diff-hunk-heading-highlight     :foreground base7 :background bg-dark)
   (magit-diff-hunk-heading-highlight     :foreground bg-alt :background base3)
   (magit-diff-hunk-heading-selection     :foreground orange :background bg-dark)
   (magit-diff-lines-heading              :foreground fg-yellow :background red)
   (magit-diff-our                        :background bg-alt)
   (magit-diff-our-highlight              :background bg-alt)
   (magit-diff-removed                    :foreground fg-red)
   (magit-diff-removed-highlight          :foreground fg-red
                                          :inherit 'magit-diff-context-highlight)
   (magit-dimmed                          :foreground fg-alt)
   (magit-filename                        :foreground fg)
   (magit-log-author                      :foreground fg)
   (magit-log-date                        :foreground fg-green)
   (magit-log-graph                       :foreground fg-magenta)
   (magit-hash                            :foreground fg-magenta)
   (magit-section-heading                 :foreground dark-blue :bold bold :extend t)
   (magit-section-secondary-heading       :foreground fg-magenta :bold bold)
   (magit-sequence-head                   :inherit 'magit-head)
   (magit-sequence-drop                   :inherit 'magit-diff-removed)
   (magit-tag                             :foreground fg-blue)
   ;;;; Make (make-mode)
   (makefile-targets                      :inherit 'font-lock-type-face)
   ;;;; markdown
   (markdown-reference-face               :foreground fg-magenta)
   (markdown-pre-face                     :foreground fg)
   (markdown-code-face                    :foreground fg)
   (markdown-bold-face                    :inherit 'bold :foreground fg)
   (markdown-italic-face                  :inherit 'italic :foreground fg)
   (markdown-inline-code-face             :background bg-alt :foreground fg)
   (markdown-link-face                    :inherit 'font-lock-string-face)
   (markdown-url-face                     :foreground fg :underline t)
   (markdown-list-face                    :foreground fg)
   (markdown-metadata-key-face            :foreground fg)
   (markdown-metadata-value-face          :foreground fg)
   (markdown-header-delimiter-face        :foreground fg)
   (markdown-header-face                  :foreground fg)
   (markdown-header-face-1                :inherit 'font-lock-type-face)
   (markdown-header-face-2                :inherit 'font-lock-type-face)
   (markdown-header-face-3                :inherit 'font-lock-type-face)
   (markdown-header-face-4                :inherit 'font-lock-type-face)
   (markdown-header-face-5                :inherit 'font-lock-type-face)
   (markdown-header-face-6                :inherit 'font-lock-type-face)
   ;; (markdown-header-face-1                :inherit 'outline-1 :weight 'semi-bold)
   ;; (markdown-header-face-2                :inherit 'outline-2)
   ;; (markdown-header-face-3                :inherit 'outline-3)
   ;; (markdown-header-face-4                :inherit 'outline-4)
   ;; (markdown-header-face-5                :inherit 'outline-5)
   ;; (markdown-header-face-6                :inherit 'outline-6)
   ;;;; message
   (message-header-name                   :foreground fg-green)
   (message-header-other                  :foreground fg)
   (message-header-subject                :foreground fg)
   ;;; mmm
   (mmm-default-submode-face              :background bg-alt)
   ;;;; mu4e
   (mu4e-footer-face                      :foreground fg-alt)
   (mu4e-header-key-face                  :foreground fg)
   (mu4e-trashed-face                     :foreground fg-alt :strike-through t)
   ;;; nerd-icons
   (nerd-icons-red                        :foreground fg-red)
   (nerd-icons-lred                      :foreground (doom-lighten fg-red 0.3))
   (nerd-icons-green                      :foreground fg-green)
   (nerd-icons-blue                       :foreground fg-blue)
   (nerd-icons-lblue                      :foreground (doom-lighten fg-blue 0.3))
   (nerd-icons-yellow                     :foreground fg-yellow)
   (nerd-icons-purple                     :foreground fg-magenta)
   ;;;; orderless
   (orderless-match-face-0 :weight 'bold :foreground (doom-blend fg-blue    fg 0.6)
                           :background (doom-blend blue    bg 0.1))
   (orderless-match-face-1 :weight 'bold :foreground (doom-blend fg-magenta fg 0.6)
                           :background (doom-blend magenta bg 0.1))
   (orderless-match-face-2 :weight 'bold :foreground (doom-blend fg-green   fg 0.6)
                           :background (doom-blend fg-green   bg 0.1))
   (orderless-match-face-3 :weight 'bold :foreground (doom-blend orange fg 0.6)
                           :background (doom-blend orange bg 0.1))
   ;;;; org
   (org-agenda-date                       :foreground (doom-darken dark-blue 0.2))
   (org-agenda-date-today                 :foreground dark-blue)
   (org-agenda-date-weekend               :foreground (doom-darken dark-blue 0.3))
   (org-agenda-headline-done              :foreground fg-alt)
   (org-block                             :background bg-alt)
   (org-block-begin-line                  :background base1 :extend t)
   (org-code                              :foreground fg-alt :background bg-alt)
   (org-date                              :foreground fg-alt)
   (org-drawer                            :foreground fg-alt)
   (org-formula                           :foreground fg)
   (org-headline-done                     :foreground fg-alt)
   (org-level-1                           :inherit 'outline-1 :weight 'semibold)
   (org-property-value                    :foreground fg-alt)
   (org-special-keyword                   :foreground fg-alt)
   (org-todo                              :foreground fg-green)
   (org-priority                          :foreground fg-red)
   (org-table                             :background bg-alt)
   (org-tag                               :foreground fg)
   (org-verbatim                          :foreground fg-green :background bg-alt)
   ;;;; outline (org-level-N faces inherit these)
   (outline-1                             :foreground fg)
   (outline-2                             :foreground dark-blue)
   (outline-3                             :foreground fg-magenta)
   (outline-4                             :foreground fg-blue)
   (outline-5                             :foreground (doom-darken yellow 0.2))
   (outline-6                             :foreground fg)
   (outline-7                             :foreground dark-blue)
   (outline-8                             :foreground fg-magenta)
   ;;;; popup
   (popup-tip-face                        :inherit 'popup-face
                                          :foreground fg-magenta :background bg-alt)
   ;;;; pr-review
   (pr-review-hash-face                   :inherit 'magit-hash)
   ;;;; pulse
   (pusle-highlight-start-face            :background yellow)
   ;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face       :foreground fg-blue)
   (rainbow-delimiters-depth-2-face       :foreground fg-green)
   (rainbow-delimiters-depth-3-face       :foreground fg-red)
   (rainbow-delimiters-depth-4-face       :foreground fg-blue)
   (rainbow-delimiters-depth-5-face       :foreground fg-green)
   (rainbow-delimiters-depth-6-face       :foreground fg-red)
   (rainbow-delimiters-depth-7-face       :foreground fg-blue)
   (rainbow-delimiters-depth-8-face       :foreground fg-green)
   (rainbow-delimiters-depth-9-face       :foreground fg-red)
   ;;;; sh-script
   (sh-quoted-exec                       :background bg-alt)
   ;;;; show-paren <built-in>
   (show-paren-match                      :foreground fg-red :background bg-alt
                                          :weight 'ultra-bold :underline t)
   (show-paren-mismatch                   :foreground bg-alt :background fg-red
                                          :weight 'ultra-bold :underline t)
   ;;;; smerge-tool
   (smerge-upper                          :background (doom-blend red bg 0.2))
   ;;;; tab-bar <built-in>
   (tab-bar                               :foreground fg :background modeline-bg)
   (tab-bar-tab                           :inherit 'tab-bar :underline t)
   (tab-bar-tab-inactive                  :inherit 'tab-bar)
   ;;;; treemacs
   (treemacs-git-modified-face            :foreground yellow)
   ;;;; tree-sitter
   (tree-sitter-hl-face:attribute         :foreground fg)
   (tree-sitter-hl-face:constant.builtin  :foreground fg-magenta)
   (tree-sitter-hl-face:escape            :foreground base3)
   (tree-sitter-hl-face:function          :foreground fg :background blue)
   (tree-sitter-hl-face:function.call     :foreground fg)
   (tree-sitter-hl-face:function.macro    :foreground fg)
   (tree-sitter-hl-face:function.special  :foreground fg)
   (tree-sitter-hl-face:label             :foreground fg)
   (tree-sitter-hl-face:string.special    :foreground fg :background strings)
   (tree-sitter-hl-face:property          :foreground fg)
   (tree-sitter-hl-face:punctuation       :foreground base3)
   (tree-sitter-hl-face:type.builtin      :foreground fg :background blue)
   ;;;; vc and related faces
   (change-log-acknowledgment             :foreground fg-magenta)
   (change-log-date                       :foreground fg-green)
   (change-log-name                       :foreground fg)
   (change-log-list                       :foreground dark-blue) ; e.g. tags, branches
   (log-view-message                      :foreground fg-magenta)
   (log-view-commit-body                  :foreground fg)
   ;;;; which-key
   (which-key-key-face                   :foreground fg-green)
   (which-key-group-description-face     :foreground fg :background magenta)
   (which-key-command-description-face   :foreground fg :background blue)
   (which-key-separator-face             :foreground fg :background bg)
   (which-key-local-map-description-face :foreground fg :background magenta)
   ;;;; widget <built-in>
   (widget-field                          :foreground fg :background bg-alt
                                          :box '(:line-width -1))
   ;;;; window-divider <built-in>
   (window-divider                        :foreground base3 :background base3)))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path (file-name-directory load-file-name)))

(provide 'doom-alabaster-bg-theme)
;;; doom-alabaster-bg-theme.el ends here
