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

(defgroup doom-alabaster-theme nil
  "Options for the `doom-alabaster' theme."
  :group 'doom-themes)

(defcustom doom-alabaster-fainter-comments nil
  "If non-nil, comments will be highlighted is less vivid colors."
  :group 'doom-alabaster-theme
  :type 'boolean)

(def-doom-theme doom-alabaster-bg
  "A light theme with little (background) highlighting"

;;;; Colors
  ;; name        default     256         16
  ((bg           '("#FFFFFF" "white"     "white"        ))
   (bg-alt       '("#F0F0F0" "white"     "white"        ))
   (base0        '("#F0F0F0" "F0F0F0"    "white"        ))
   (base1        '("#E0E0E0" "#E0E0E0"   "brightblack"  ))
   (base2        '("#DDDDDD" "#DDDDDD"   "brightblack"  ))
   (base3        '("#777777" "#777777"   "brightblack"  ))
   (base4        '("#424242" "#424242"   "brightblack"  ))
   (base5        '("#000000" "black"     "black"        ))
   (base6        '("#000000" "black"     "black"        ))
   (base7        '("#000000" "black"     "black"        ))
   (base8        '("#000000" "black"     "black"        ))
   (fg           '("#000000" "black"     "black"        ))
   (fg-alt       '("#474747" "black"     "black"        ))

   (grey       base3)

   (red          '("#FFE0E0" "#FFE0E0"   "red"          ))
   (green        '("#DBECB6" "#DBECB6"   "green"        ))
   (yellow       '("#FFFABC" "#FFFABC"   "yellow"       ))
   (dark-blue    '("#325CC0" "#325CC0"   "blue"         ))
   (magenta      '("#7A3E9D" "#7A3E9D"   "magenta"      ))
   (dark-cyan    '("#0083B2" "#0083B2"   "cyan"         ))
   (light-yellow '("#FFBC5D" "#FFBC5D"   "brightyellow" ))
   (orange       '("#F05050" "#F05050"   "brightred"    ))
   (teal         '("#F1FADF" "#F1FADF"   "brightgreen"  ))
   (violet       '("#F9E0FF" "#F9E0FF"   "brightmagenta"))
   (cyan         '("#00AACB" "#00AACB"   "brightcyan"   ))
   (blue         '("#DBF1FF" "#DBF1FF"   "brightblue"   ))
   (active       '("#007ACC" "#007ACC"   "brightblue"   ))
   (selection    '("#B4D8FD" "#B4D8FD"   "brightblue"   ))
   (fg-red       '("#AA3731" "#AA3731"   "red"          ))
   (fg-green     '("#448C27" "#448C27"   "green"        ))
   (fg-punctuation '("#00000090" "#00000090"   "black"  ))


   (yellow-highlight (doom-blend light-yellow bg 0.2))
   (bg-dark base2)
;;;; face categories -- required for all themes
   (highlight      active)
   (vertical-bar   base2)
   (selection      selection)
   (builtin        fg)
   (comments       (doom-lighten yellow (if doom-alabaster-fainter-comments 0.3 0)))
   (doc-comments   (doom-darken fg-red 0.25))
   (constants      magenta)
   (functions      dark-blue)
   (keywords       fg)
   (methods        fg)
   (operators      fg)
   (type           dark-blue)
   (strings        teal)
   (variables      fg)
   (numbers        magenta)
   (region         base2)
   (error          fg-red)
   (warning        orange)
   (success        green)
   (vc-modified    light-yellow)
   (vc-added       green)
   (vc-deleted     red)

   (modeline-fg fg-alt)
   (modeline-bg bg-dark)
   (modeline-bg-inactive base0))

;;;; Base theme face overrides
  (

   (font-lock-comment-face :foreground fg :background comments)
   (font-lock-builtin-face :foreground magenta)
   (font-lock-doc-face :foreground doc-comments)
   (font-lock-type-face :foreground fg :background blue)
   (font-lock-variable-name-face :foreground fg)
   (font-lock-function-name-face :foreground fg :background blue)
   (font-lock-string-face :foreground fg :background teal)

   (line-number                           :background bg-alt)
   (minibuffer-prompt                     :foreground dark-blue)
   (mode-line                             :foreground modeline-fg :background modeline-bg)
   (mode-line-emphasis                    :inherit 'mode-line :bold t)
   (mode-line-inactive                    :foreground modeline-fg :background modeline-bg-inactive)
   (secondary-selection                   :background bg-dark)
;;; Search highlight -> light yellow
   (evil-ex-lazy-highlight                :background yellow-highlight)
   (evil-ex-search                        :background light-yellow)
   (lazy-highlight                        :background yellow-highlight)
;;;; vertico family
   (marginalia-size                       :background violet)
;;;; all-the-icons
   (all-the-icons-purple                  :background violet)
;;;; cider
   (cider-result-overlay-face             :background bg-alt)
;;;; company
   (company-tooltip-annotation            :foreground fg)
   (company-tooltip-selection             :background bg-dark)
;;;; diff-indicator
   (diff-added                            :inherit 'magit-diff-added-highlight)
   (diff-changed                          :inherit 'magit-diff-hunk-heading)
   (diff-hunk-header                      :inherit 'magit-diff-hunk-heading)
   (diff-removed                          :inherit 'magit-diff-removed-highlight)
;;;; dired-git-info
   (dgi-commit-message-face               :foreground fg-alt)
;;;; eglot
   (eglot-highlight-symbol-face           :background bg-dark)
;;;; font-lock
   (font-lock-preprocessor-face           :foreground operators)
   (font-lock-preprocessor-char-face      :foreground operators)
;;;; forge
   (forge-topic-label                     :box '(:line-width -1 :style none))
;;;; git-commit
   (git-commit-comment-branch-local       :inherit 'magit-branch-local)
   (git-commit-comment-branch-remote      :inherit 'magit-branch-remote)
   (git-commit-comment-file               :foreground fg)
   (git-commit-keyword                    :background violet :slant 'italic)
;;;; gnus
   (gnus-cite-1                           :foreground green)
   (gnus-cite-2                           :foreground dark-blue)
   (gnus-cite-3                           :foreground fg-red)
   (gnus-cite-4                           :foreground blue)
   (gnus-cite-5                           :foreground green)
   (gnus-cite-6                           :foreground dark-blue)
   (gnus-cite-7                           :foreground fg-red)
   (gnus-cite-8                           :foreground blue)
   (gnus-cite-9                           :foreground green)
   (gnus-cite-10                          :foreground dark-blue)
   (gnus-cite-11                          :foreground fg-red)
   (gnus-signature                        :foreground fg-alt)
;;;; highlight-numbers-number
   (highlight-numbers-number              :foreground numbers)
;;;; lsp
   (lsp-face-highlight-textual            :foreground fg :background bg-alt)
   ;; (lsp-flycheck-info-unnecessary-face    :foreground fg :background red)
   ;; (lsp-flycheck-warning-unnecessary-face :foreground fg :underline red)
;;;; lsp-rust
   (lsp-rust-analyzer-inlay-face          :foreground fg-alt :background bg-dark)
;;;; magit
   (magit-blame-heading                   :foreground dark-blue :background bg-dark)
   (magit-branch-local                    :foreground dark-blue)
   (magit-cherry-equivalent               :background violet)
   (magit-cherry-unmatched                :foreground blue)
   (magit-diff-added                      :foreground green)
   (magit-diff-added-highlight            :foreground green :inherit 'magit-diff-context-highlight)
   (magit-diff-context                    :foreground base6 :background base1)
   (magit-diff-context-highlight          :foreground base7 :background base1)
   (magit-diff-hunk-heading               :foreground fg :background (doom-lighten base3 0.3))
   (magit-diff-hunk-heading-highlight     :foreground base7 :background bg-dark)
   (magit-diff-hunk-heading-highlight     :foreground bg-alt :background base3)
   (magit-diff-hunk-heading-selection     :foreground orange :background bg-dark)
   (magit-diff-our                        :background bg-alt)
   (magit-diff-our-highlight              :background bg-alt)
   (magit-diff-removed                    :foreground red)
   (magit-diff-removed-highlight          :foreground red :inherit 'magit-diff-context-highlight)
   (magit-dimmed                          :foreground fg-alt)
   (magit-filename                        :foreground fg)
   (magit-log-author                      :background violet)
   (magit-section-secondary-heading       :background violet :weight 'bold)
   (magit-tag                             :foreground blue)
;;; markdown
   (markdown-code-face                    :background bg-alt)
   (markdown-italic-face                  :background violet)
;;;; message
   (message-header-name                   :foreground green)
   (message-header-other                  :foreground fg)
   (message-header-subject                :foreground fg)
;;;; mic-paren
   (paren-face-match :foreground fg-red :background bg :weight 'ultra-bold)
   (paren-face-mismatch :foreground fg :background orange :weight 'ultra-bold)
   (paren-face-no-match :foreground fg :background orange :weight 'ultra-bold)
;;;; mu4e
   (mu4e-footer-face                      :foreground fg-alt)
   (mu4e-header-key-face                  :foreground fg)
   (mu4e-trashed-face                     :foreground fg-alt :strike-through t)
;;;; org
   (org-agenda-date                       :foreground (doom-darken dark-blue 0.2))
   (org-agenda-date-today                 :foreground dark-blue)
   (org-agenda-date-weekend               :foreground (doom-darken dark-blue 0.3))
   (org-agenda-headline-done              :foreground fg-alt)
   (org-block                             :background bg-alt)
   (org-block-begin-line                  :background base1 :extend t)
   (org-code                              :foreground fg :background red)
   (org-date                              :foreground fg-alt)
   (org-drawer                            :foreground fg-alt)
   (org-headline-done                     :foreground fg-alt)
   (org-meta-line :background comments)
   (org-priority                          :background red :weight 'bold)
   (org-property-value                    :foreground fg-alt)
   (org-special-keyword                   :foreground fg-alt)
   (org-table                             :background bg-alt)
   (org-tag                               :foreground fg)
   (org-todo                              :foreground fg :background green :weight 'bold)
   (org-verbatim                          :background green)
;;;; outline (org-level-N faces inherit these)
   (outline-1                             :foreground dark-blue)
   (outline-2                             :foreground magenta)
   (outline-3                             :foreground dark-cyan)
   (outline-4                             :foreground (doom-lighten dark-blue 0.25))
   (outline-5                             :foreground (doom-lighten magenta 0.25))
   (outline-6                             :foreground (doom-lighten dark-blue 0.5))
   (outline-7                             :foreground (doom-lighten magenta 0.5))
   (outline-8                             :foreground (doom-lighten dark-blue 0.8))
;;;;  rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground dark-blue)
   (rainbow-delimiters-depth-2-face :foreground magenta)
   (rainbow-delimiters-depth-3-face :foreground fg-green)
   (rainbow-delimiters-depth-4-face :foreground (doom-darken violet 0.5))
   (rainbow-delimiters-depth-5-face :foreground (doom-darken teal 0.5))
   (rainbow-delimiters-depth-6-face :foreground (doom-darken blue 0.5))
   (rainbow-delimiters-depth-7-face :foreground magenta)
   (rainbow-delimiters-depth-8-face :foreground fg-green)
   (rainbow-delimiters-depth-9-face :foreground (doom-darken violet 0.5))
;;;; show-paren <built-in>
   ((show-paren-match &inherit paren-face-match))
   ((show-paren-mismatch &inherit paren-face-mismatch))
;;;; smerge-tool
   (smerge-upper                          :background (doom-blend red bg 0.2))
;;;; tree-sitter
   (tree-sitter-hl-face:attribute         :foreground fg)
   (tree-sitter-hl-face:constant.builtin  :foreground magenta)
   (tree-sitter-hl-face:escape            :foreground fg :background green)
   (tree-sitter-hl-face:function          :foreground fg :background blue)
   (tree-sitter-hl-face:function.call     :foreground fg :background blue)
   (tree-sitter-hl-face:function.macro    :foreground fg :background blue)
   (tree-sitter-hl-face:function.special  :foreground fg :background blue)
   (tree-sitter-hl-face:label             :foreground fg)
   (tree-sitter-hl-face:string.special    :foreground fg :background strings)
   (tree-sitter-hl-face:property          :foreground fg)
   (tree-sitter-hl-face:punctuation       :foreground fg-punctuation)
   (tree-sitter-hl-face:type.builtin      :foreground fg :background blue)
;;;; which-key
   (which-key-key-face                    :foreground fg-green)
   (which-key-separator-face              :foreground (doom-darken yellow 0.5))
   (which-key-group-description-face      :foreground magenta)
   (which-key-command-description-face    :foreground dark-blue)))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path (file-name-directory load-file-name)))

(provide 'doom-alabaster-theme)
;;; doom-alabaster-theme.el ends here
