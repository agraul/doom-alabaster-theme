;;; doom-alabaster-theme.el --- A light theme with little syntax highlighting -*- lexical-binding: t; no-byte-compile: t -*-
;; Copyright (C) 2022 Alexander Graul
;;
;; Author: Alexander Graul <mail@agraul.de>
;; Maintainer: Alexander Graul <mail@agraul.de>
;; Version: 0.1
;; Keywords: themes faces
;; Homepage: https://github.com/agraul/doom-alabaster-theme
;; Homepage: https://github.com/tonsky/sublime-scheme-alabaster
;; Package-Requires: ((emacs "25.1") (doom-themes "2.3.0"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;; Doom Alabaster is a port of tonsky's Alabaster theme
;;
;;; Code:
(require 'doom-themes)

(defun doom-alabaster--setopt (sym val)
  "Custom setter that sets SYM to VAL and reloads the theme."
  (set-default sym val)
  ;;`custom--inhibit-theme-enable' is set to nil by `enable-theme'
  ;; don't reload when `enable-theme' is running
  (when (and (bound-and-true-p custom--inhibit-theme-enable)
             (memq 'doom-alabaster custom-enabled-themes))
    (load-theme 'doom-alabaster :no-confirm)))

(defgroup doom-alabaster-theme nil
  "Options for the `doom-alabaster' theme."
  :group 'doom-themes)

(defcustom doom-alabaster-fainter-comments nil
  "If non-nil, comments will be highlighted is less vivid colors."
  :group 'doom-alabaster-theme
  :type 'boolean)

(make-obsolete-variable 'doom-alabaster-fainter-comments
                        "Set doom-alabaster-style to `faint' instead."
                        "2024-10-08")

(defcustom doom-alabaster-comment-style 'original
  "Control style of comments.

There are three styles to select from:
1. `original': very visible comment highlighting
2. `faint': a less vivid comment highlighting
3. nil: no comment highlighting."
  :group 'doom-alabaster-theme
  :type '(choice (const :tag "Original" original)
                 (const :tag "faint" faint)
                 (const :tag "nil" nil))
  :set #'doom-alabaster--setopt)

(def-doom-theme doom-alabaster
    "A light theme with little highlighting"

;;;; Colors
  ;; name        default     256         16
  ((bg           '("#F7F7F7" "#F7F7F7"   "white"))
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

   (red          '("#AA3731" "#AA3731"   "red"))
   (green        '("#448C27" "#448C27"   "green"))
   (yellow       '("#CB9000" "#CB9000"   "yellow"))
   (dark-blue    '("#325CC0" "#325CC0"   "blue"))
   (magenta      '("#7A3E9D" "#7A3E9D"   "magenta"))
   (dark-cyan    '("#0083B2" "#0083B2"   "cyan"))
   (light-yellow '("#FFBC5D" "#FFBC5D"   "brightyellow"))
   (orange       '("#F05050" "#F05050"   "brightred"))
   (teal         '("#60CB00" "#60CB00"   "brightgreen"))
   (violet       '("#E64CE6" "#E64CE6"   "brightmagenta"))
   (cyan         '("#00AACB" "#00AACB"   "brightcyan"))
   (blue         '("#007ACC" "#007ACC"   "brightblue"))


   (yellow-highlight (doom-blend light-yellow bg 0.2))
   (bg-dark base2)
;;;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   base2)
   (selection      dark-blue)
   (builtin        fg)
   (comments       (cond
                    ((or (eq doom-alabaster-comment-style 'faint)
                         doom-alabaster-fainter-comments)
                     (doom-darken dark-blue 0.25))
                    ((eq doom-alabaster-comment-style nil)
                     fg)
                    ;; 'original == default
                    (t red)))
   (doc-comments   green)
   (constants      magenta)
   (functions      dark-blue)
   (keywords       fg)
   (methods        fg)
   (operators      fg)
   (type           dark-blue)
   (strings        green)
   (variables      fg)
   (numbers        magenta)
   (region         base2)
   (error          red)
   (warning        red)
   (success        green)
   (vc-modified    light-yellow)
   (vc-added       green)
   (vc-deleted     red)

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
   ;;; Search highlight -> light yellow
   (evil-ex-lazy-highlight                :background yellow-highlight)
   (evil-ex-search                        :background light-yellow)
   (lazy-highlight                        :background yellow-highlight)
   ;;;; vertico family
   (marginalia-size                       :foreground magenta)
   ;;;; all-the-icons
   (all-the-icons-purple                  :foreground magenta)
   ;;;; cider
   (cider-debug-code-overlay-face         :background base1)
   (cider-result-overlay-face             :background base1)
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
   ;;;; dired <built-in>
   (dired-header                          :foreground dark-blue :bold bold)
   (dired-marked                          :foreground magenta :bold bold)
   (dired-broken-symlink                  :background warning :foreground bg-alt
                                          :bold bold)
   (dired-symlink                         :foreground dark-cyan)
   ;;;; dired-git-info
   (dgi-commit-message-face               :foreground fg-alt)
   ;;;; ediff <built-in>
   (ediff-fine-diff-A                     :background (doom-blend selection bg 0.5)
                                          :bold bold :extend t)
   ;;;; eglot
   (eglot-highlight-symbol-face           :background bg-dark)
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
   ;;;; font-lock-*-face <built-in>
   (font-lock-preprocessor-face           :foreground operators)
   (font-lock-preprocessor-char-face      :foreground operators)
   ;;;; forge
   (forge-topic-label                     :box '(:line-width -1))
   ;;;; git-commit
   (git-commit-comment-branch-local       :inherit 'magit-branch-local)
   (git-commit-comment-branch-remote      :inherit 'magit-branch-remote)
   (git-commit-comment-file               :foreground fg)
   (git-commit-keyword                    :foreground magenta :slant 'italic)
   ;;;; gnus
   (gnus-cite-1                           :foreground green)
   (gnus-cite-2                           :foreground dark-blue)
   (gnus-cite-3                           :foreground red)
   (gnus-cite-4                           :foreground blue)
   (gnus-cite-5                           :foreground green)
   (gnus-cite-6                           :foreground dark-blue)
   (gnus-cite-7                           :foreground red)
   (gnus-cite-8                           :foreground blue)
   (gnus-cite-9                           :foreground green)
   (gnus-cite-10                          :foreground dark-blue)
   (gnus-cite-11                          :foreground red)
   (gnus-signature                        :foreground fg-alt)
   ;;;; highlight-numbers-number
   (highlight-numbers-number              :foreground numbers)
   ;;;; lsp
   (lsp-face-highlight-textual            :background bg-dark)
   (lsp-flycheck-warning-deprecated-face  :inherit 'flycheck-warning)
   ;;;; lsp-rust
   (lsp-rust-analyzer-inlay-face          :foreground fg-alt :background bg-dark)
   ;;;; magit
   (magit-blame-heading                   :foreground dark-blue :background bg-dark)
   (magit-branch-local                    :foreground dark-blue)
   (magit-cherry-equivalent               :foreground magenta)
   (magit-cherry-unmatched                :foreground blue)
   (magit-diff-added                      :foreground green)
   (magit-diff-added-highlight            :foreground green
                                          :inherit 'magit-diff-context-highlight)
   (magit-diff-context                    :foreground base6 :background base1)
   (magit-diff-context-highlight          :foreground base7 :background base1)
   (magit-diff-hunk-heading               :foreground fg
                                          :background (doom-lighten base3 0.3))
   (magit-diff-hunk-heading-highlight     :foreground base7 :background bg-dark)
   (magit-diff-hunk-heading-highlight     :foreground bg-alt :background base3)
   (magit-diff-hunk-heading-selection     :foreground orange :background bg-dark)
   (magit-diff-our                        :background bg-alt)
   (magit-diff-our-highlight              :background bg-alt)
   (magit-diff-removed                    :foreground red)
   (magit-diff-removed-highlight          :foreground red
                                          :inherit 'magit-diff-context-highlight)
   (magit-dimmed                          :foreground fg-alt)
   (magit-filename                        :foreground fg)
   (magit-log-author                      :foreground fg)
   (magit-log-date                        :foreground green)
   (magit-log-graph                       :foreground magenta)
   (magit-hash                            :foreground magenta)
   (magit-section-secondary-heading       :foreground magenta :bold bold)
   (magit-tag                             :foreground blue)
   ;;;; markdown
   (markdown-code-face                    :background bg-alt)
   (markdown-bold-face                    :inherit 'bold :foreground fg)
   (markdown-italic-face                  :inherit 'italic :foreground fg)
   (markdown-inline-code-face             :foreground red :background bg-alt)
   (markdown-code-face                    :background bg-alt)
   (markdown-link-face                    :inherit 'link)
   (markdown-list-face                    :foreground fg)
   ;;;; message
   (message-header-name                   :foreground green)
   (message-header-other                  :foreground fg)
   (message-header-subject                :foreground fg)
   ;;; mmm
   (mmm-default-submode-face              :background bg-alt)
   ;;;; mu4e
   (mu4e-footer-face                      :foreground fg-alt)
   (mu4e-header-key-face                  :foreground fg)
   (mu4e-trashed-face                     :foreground fg-alt :strike-through t)
   ;;; nerd-icons
   (nerd-icons-purple                     :foreground magenta)
   ;;;; org
   (org-agenda-date                       :foreground (doom-darken dark-blue 0.2))
   (org-agenda-date-today                 :foreground dark-blue)
   (org-agenda-date-weekend               :foreground (doom-darken dark-blue 0.3))
   (org-agenda-headline-done              :foreground fg-alt)
   (org-block                             :background bg-alt)
   (org-block-begin-line                  :background base1 :extend t)
   (org-code                              :foreground red :background bg-alt)
   (org-date                              :foreground fg-alt)
   (org-drawer                            :foreground fg-alt)
   (org-formula                           :foreground fg)
   (org-headline-done                     :foreground fg-alt)
   (org-level-1                           :inherit 'outline-1 :weight 'semibold)
   (org-property-value                    :foreground fg-alt)
   (org-special-keyword                   :foreground fg-alt)
   (org-table                             :background bg-alt)
   (org-tag                               :foreground fg)
   (org-verbatim                          :foreground green :background bg-alt)
   ;;;; outline (org-level-N faces inherit these)
   (outline-1                             :foreground fg)
   (outline-2                             :foreground dark-blue)
   (outline-3                             :foreground magenta)
   (outline-4                             :foreground blue)
   (outline-5                             :foreground (doom-darken yellow 0.2))
   (outline-6                             :foreground fg)
   (outline-7                             :foreground dark-blue)
   (outline-8                             :foreground magenta)
   ;;;; popup
   (popup-tip-face                        :inherit 'popup-face
                                          :foreground magenta :background bg-alt)
   ;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face       :foreground blue)
   (rainbow-delimiters-depth-2-face       :foreground green)
   (rainbow-delimiters-depth-3-face       :foreground red)
   (rainbow-delimiters-depth-4-face       :foreground blue)
   (rainbow-delimiters-depth-5-face       :foreground green)
   (rainbow-delimiters-depth-6-face       :foreground red)
   (rainbow-delimiters-depth-7-face       :foreground blue)
   (rainbow-delimiters-depth-8-face       :foreground green)
   (rainbow-delimiters-depth-9-face       :foreground red)
   ;;;; show-paren <built-in>
   (show-paren-match                      :foreground red :background bg-alt
                                          :weight 'ultra-bold :underline t)
   (show-paren-mismatch                   :foreground bg-alt :background red
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
   (tree-sitter-hl-face:constant.builtin  :foreground magenta)
   (tree-sitter-hl-face:escape            :foreground base3)
   (tree-sitter-hl-face:function          :foreground dark-blue)
   (tree-sitter-hl-face:function.call     :foreground fg)
   (tree-sitter-hl-face:function.macro    :foreground fg)
   (tree-sitter-hl-face:function.special  :foreground fg)
   (tree-sitter-hl-face:label             :foreground fg)
   (tree-sitter-hl-face:string.special    :foreground strings)
   (tree-sitter-hl-face:property          :foreground fg)
   (tree-sitter-hl-face:punctuation       :foreground base3)
   (tree-sitter-hl-face:type.builtin      :foreground dark-blue)
   ;;;; vc and related faces
   (change-log-acknowledgment             :foreground magenta)
   (change-log-date                       :foreground green)
   (change-log-name                       :foreground fg)
   (change-log-list                       :foreground dark-blue) ; e.g. tags, branches
   (log-view-message                      :foreground magenta)
   (log-view-commit-body                  :foreground fg)
   ;;;; which-key
   (which-key-group-description-face      :foreground magenta)
   ;;;; widget <built-in>
   (widget-field                          :foreground fg :background bg-alt
                                          :box '(:line-width -1))
   ;;;; window-divider <built-in>
   (window-divider                        :foreground base3 :background base3)))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path (file-name-directory load-file-name)))

(provide 'doom-alabaster-theme)
;;; doom-alabaster-theme.el ends here
