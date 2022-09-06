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

(def-doom-theme doom-alabaster
  "A light theme with little highlighting"

;;;; Colors
  ;; name        default     256         16
  ((bg           '("#F7F7F7" "white"     "white"        ))
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

   (red          '("#AA3731" "#AA3731"   "red"          ))
   (green        '("#448C27" "#448C27"   "green"        ))
   (yellow       '("#CB9000" "#CB9000"   "yellow"       ))
   (dark-blue    '("#325CC0" "#325CC0"   "blue"         ))
   (magenta      '("#7A3E9D" "#7A3E9D"   "magenta"      ))
   (dark-cyan    '("#0083B2" "#0083B2"   "cyan"         ))
   (light-yellow '("#FFBC5D" "#FFBC5D"   "brightyellow" ))
   (orange       '("#F05050" "#F05050"   "brightred"    ))
   (teal         '("#60CB00" "#60CB00"   "brightgreen"  ))
   (violet       '("#E64CE6" "#E64CE6"   "brightmagenta"))
   (cyan         '("#00AACB" "#00AACB"   "brightcyan"   ))
   (blue         '("#007ACC" "#007ACC"   "brightblue"   ))


;;;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   base2)
   (selection      dark-blue)
   (builtin        fg)
   (comments       red)
   (doc-comments   (doom-darken red 0.25))
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
   (warning        orange)
   (success        green)
   (vc-modified    light-yellow)
   (vc-added       green)
   (vc-deleted     red)

   (modeline-fg fg-alt)
   (modeline-bg base2)
   (modeline-bg-inactive base0))

;;;; Base theme face overrides
  ((line-number                           :background bg-alt)
   (minibuffer-prompt                     :foreground dark-blue)
   (mode-line                             :foreground modeline-fg :background modeline-bg)
   (mode-line-emphasis                    :inherit 'mode-line :bold t)
   (mode-line-inactive                    :foreground modeline-fg :background modeline-bg-inactive)
   (secondary-selection                   :background base2)
   ;;; Search highlight -> light yellow
   (evil-ex-lazy-highlight                :background (doom-blend light-yellow bg 0.2))
   (evil-ex-search                        :background light-yellow)
   (lazy-highlight                        :background (doom-blend light-yellow bg 0.2))
   ;;;; vertico family
   (marginalia-size                       :foreground magenta)
   ;;;; all-the-icons
   (all-the-icons-purple                  :foreground magenta)
   ;;;; cider
   (cider-result-overlay-face             :background bg-alt)
   ;;;; company
   (company-tooltip-annotation            :foreground fg)
   (company-tooltip-selection             :background base2)
   ;;;; diff-indicator
   (diff-added                            :inherit 'magit-diff-added-highlight)
   (diff-changed                          :inherit 'magit-diff-hunk-heading)
   (diff-hunk-header                      :inherit 'magit-diff-hunk-heading)
   (diff-removed                          :inherit 'magit-diff-removed-highlight)
   ;;;; forge
   (forge-topic-label                     :box '(:line-width -1 :style none))
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
   (lsp-face-highlight-textual            :background (doom-blend light-yellow bg 0.2))
   ;;;; lsp-rust
   (lsp-rust-analyzer-inlay-face          :foreground fg-alt)
   ;;;; magit
   (magit-blame-heading                   :foreground dark-blue :background base2)
   (magit-branch-local                    :foreground dark-blue)
   (magit-cherry-equivalent               :foreground magenta)
   (magit-cherry-unmatched                :foreground blue)
   (magit-diff-added                      :foreground green)
   (magit-diff-added-highlight            :foreground green :inherit 'magit-diff-context-highlight)
   (magit-diff-context                    :foreground base6 :background base1)
   (magit-diff-context-highlight          :foreground base7 :background base1)
   (magit-diff-hunk-heading               :foreground fg :background (doom-lighten base3 0.3))
   (magit-diff-hunk-heading-highlight     :foreground base7 :background base2)
   (magit-diff-hunk-heading-highlight     :foreground bg-alt :background base3)
   (magit-diff-hunk-heading-selection     :foreground orange :background base2)
   (magit-diff-our                        :background bg-alt)
   (magit-diff-our-highlight              :background bg-alt)
   (magit-diff-removed                    :foreground red)
   (magit-diff-removed-highlight          :foreground red :inherit 'magit-diff-context-highlight)
   (magit-dimmed                          :foreground fg-alt)
   (magit-filename                        :foreground fg)
   (magit-log-author                      :foreground magenta)
   (magit-section-secondary-heading       :foreground magenta :weight 'bold)
   (magit-tag                             :foreground blue)
   ;;; markdown
   (markdown-code-face                    :background bg-alt)
   (markdown-italic-face                  :foreground magenta)
   ;;;; message
   (message-header-name                   :foreground green)
   (message-header-other                  :foreground fg)
   (message-header-subject                :foreground fg)
   ;;;; mu4e
   (mu4e-footer-face                      :foreground fg-alt)
   (mu4e-header-key-face                  :foreground fg)
   (mu4e-trashed-face                     :foreground fg-alt :strike-through t)
   ;;;; org
   (org-agenda-date                       :foreground (doom-darken dark-blue 0.2))
   (org-agenda-date-today                 :foreground dark-blue)
   (org-agenda-date-weekend               :foreground (doom-darken dark-blue 0.3))
   (org-block                             :background bg-alt)
   (org-block-begin-line                  :background  base1 :extend t)
   (org-code                              :foreground red :background bg-alt)
   (org-date                              :foreground fg-alt)
   (org-drawer                            :foreground fg-alt)
   (org-property-value                    :foreground fg-alt)
   (org-special-keyword                   :foreground fg-alt)
   (org-table                             :background bg-alt)
   (org-verbatim                          :foreground green :background bg-alt)
   ;;;; outline (org-level-N faces inherit these)
   (outline-1                             :foreground dark-blue)
   (outline-2                             :foreground magenta)
   (outline-3                             :foreground blue)
   (outline-4                             :foreground (doom-darken yellow 0.2))
   (outline-5                             :foreground dark-blue)
   (outline-6                             :foreground magenta)
   (outline-7                             :foreground blue)
   (outline-8                             :foreground (doom-darken yellow 0.2))
   ;;;; smerge-tool
   (smerge-upper                          :background (doom-blend red bg 0.2))
   ;;;; tree-sitter
   (tree-sitter-hl-face:attribute         :foreground fg)
   (tree-sitter-hl-face:constant.builtin  :foreground magenta)
   (tree-sitter-hl-face:escape            :foreground base3)
   (tree-sitter-hl-face:function          :foreground dark-blue)
   (tree-sitter-hl-face:function.call     :foreground fg)
   (tree-sitter-hl-face:function.macro    :foreground fg)
   (tree-sitter-hl-face:function.special  :foreground fg)
   (tree-sitter-hl-face:label             :foreground fg)
   (tree-sitter-hl-face:property          :foreground fg)
   (tree-sitter-hl-face:punctuation       :foreground base3)
   (tree-sitter-hl-face:type.builtin      :foreground dark-blue)
   ;;;; which-key
   (which-key-group-description-face      :foreground magenta)))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path (file-name-directory load-file-name)))

(provide 'doom-alabaster-theme)
;;; doom-alabaster-theme.el ends here
