;;; init.el -*- lexical-binding: t; -*-

(doom! :app               ; what makes Emacs the best OS
       calendar           ; essentials for a modern dweller
       ;; irc             ; how neckbeards socialize
       regex              ; two problems instead of one
       (rss               ; emacs as an RSS reader
        +org)             ; rss + org: born to be together
       ;; twitter         ; twitter client https://twitter.com/vnought
       (write             ; emacs as a word processor (latex + org + markdown)
        +wordnut          ; wordnet (wn) search
        +langtool)        ; a proofreader (grammar/style check) for Emacs

       :completion        ; be lazy, be productive
       (company           ; the ultimate code completion backend
        +auto)            ; as-you-type code completion
       (ivy               ; a search engine for love and life
        +prescient        ; sorting and filtering machinery
        +fuzzy)           ; enable fuzzy search backend for ivy
       ;; helm            ; the *other* search engine for love and life
       ;; +fuzzy          ; enable fuzzy search backend for helm
       ;; ido             ; the other *other* search engine...

       :editor
       (evil              ; come to the dark side, we have cookies
        +everywhere)      ; the shadows grow longer
       file-templates     ; auto-snippets for empty files
       fold               ; basic code-folding support
       (format            ; all must be formatted...
        +onsave)          ; and don't even think about it.
       lispy              ; the best lisp package ever
       multiple-cursors   ; editing in many places at once
       ;; parinfer        ; turn lisp into python, sort of
       rotate-text        ; cycle region at point between text candidates
       snippets           ; my elves. They type so I don't have to

       :emacs             ; anything new is enormously patched old
       (dired             ; making dired pretty [functional]
        ;; +ranger        ; you can't forget it, let's be honest
        +icons)           ; it's 20XX already, come on!
       electric           ; smarter, keyword-based electric-indent
       vc                 ; version-control and Emacs, sitting in a tree

       :email             ; a thing of beauty
       mu4e               ; AM YOU
       ;; notmuch
       ;; wanderlust

       :lang              ; you either code, or should start coding
       ;; agda
       ;; assembly        ; assembly for fun or debugging
       (cc                ; C/C++/Obj-C madness
        +irony)           ; at least it's not Sarcasm++
       ;;  +rtags         ; I don't need those
       clojure         ; java with a lisp
       ;; common-lisp     ; if you've seen one lisp, you've seen them all
       ;; coq
       ;; crystal         ; ruby at the speed of c
       csharp             ; unity, .NET, and mono shenanigans
       data               ; config/data formats
       (elixir +lsp)      ; erlang done right
       ;; elm             ; care for a cup of TEA?
       emacs-lisp         ; drown in parentheses
       erlang             ; an elegant language for a more civilized age
       ;; ess             ; emacs speaks statistics
       go                 ; the hipster dialect
       (haskell           ; a language that's lazier than I am
        +intero)          ; the best haskell IDE for emacs
       ;; hy              ; readability of scheme w/ speed of python
       ;; idris
       (java              ; the poster child for carpal tunnel syndrome
        +meghanada)       ; the only java server that sucks (a little) less
       (javascript        ; all(hope(abandon(ye(who(enter(here))))))
        +lsp)
       ;; julia           ; a better, faster MATLAB
       kotlin             ; better Java, and even more!
       latex              ; writing papers in Emacs has never been so fun
       ledger             ; an accounting system in Emacs
       lua                ; one-based indices? one-based indices
       markdown           ; writing docs for people to ignore
       nim                ; python + lisp at the speed of c
       ;; nix             ; I hereby declare "nix geht mehr!"
       ;; ocaml           ; an objective camel
       (org               ; organize your plain life in plain text
        +gnuplot          ; because a picture is worth... something?
        +pandoc           ; for those *other* pleb formats
        +present)         ; emacs for presentations
       ;; perl            ; write code no one else can comprehend
       ;; php             ; perl's insecure younger brother
       ;; plantuml        ; diagrams for confusing people more
       ;; purescript      ; javascript, but functional
       python             ; beautiful is better than ugly
       ;; qt              ; the 'cutest' gui framework ever
       ;; racket          ; a DSL for DSLs
       ;; rest            ; Emacs as a REST client
       (ruby              ; 1.step { |i| puts "Ruby is #{i.even? ? 'love' : 'life'}"}
        +rails)           ; convention over head-desk-banging
       (rust              ; a crabby language
        +lsp)             ; best in class
       ;; scala           ; java, but good
       sh                 ; she sells (ba|z)sh shells on the C xor
       ;; solidity        ; do you need a blockchain? No.
       ;; swift           ; who asked for emoji variables?
       ;; terra
       ;; vala
       web                ; the tubes

       :term              ; is this hacking?
       eshell             ; hack the world, one cons at a time
       term               ; the virgin default terminal
       ;; vterm           ; the CHAD native-enhanced terminal module

       :tools             ; of the trade, and other activities
       ;; ansible
       debugger           ; stepping through code, to help you add bugs
       ;; direnv
       docker             ; ever played buzzword bingo?
       editorconfig       ; let someone else argue about tabs vs spaces
       ;; ein             ; tame Jupyter notebooks with emacs
       eval               ; run code, run (also, repls)
       (flycheck          ; tasing you for every semicolon you forget
        +childframe)      ; because popups are hungry for attention
       flyspell           ; tasing you for misspelling mispelling
       gist            ; interacting with github gists
       (lookup            ; helps you navigate your code and documentation
        +devdocs)         ; ...on devdocs.io online
       lsp                ; a sane way to talk to your editor in charge
       ;; macos
       (magit             ; the best git porcelain everrr
        +forge)           ; git(hub|lab|gud) at your fingertips
       make               ; $ make your dreams come true  # doesn't work
       pass               ; password manager for nerds
       pdf                ; pdf enhancements
       ;; prodigy         ; FIXME managing external services & code builders
       ;; rgb             ; creating color strings
       ;; terraform
       ;; tmux            ; an API for interacting with tmux
       ;; upload          ; map local to remote projects via ssh/ftp
       wakatime           ; maintaining your illusions of being productive

       :ui                ; you can't stare at that console all day, Ronny!
       ;; deft
       doom               ; what makes DOOM look the way it does
       doom-dashboard     ; a nifty splash screen for Emacs
       doom-quit          ; DOOM quit-message prompts when you quit Emacs
       fill-column        ; a `fill-column' indicator
       hl-todo            ; highlight TODO/FIXME/NOTE tags
       ;; indent-guides
       modeline           ; snazzy, Atom-inspired modeline, plus API
       nav-flash          ; blink the current line after jumping
       ;; neotree         ; a project drawer, like NERDTree for vim
       ophints            ; display visual hints when editing in evil
       (popup             ; tame sudden yet inevitable temporary windows
        +all              ; catch all popups that start with an asterix
        +defaults)        ; default popup rules
       (pretty-code       ; replace bits of code with pretty symbols
        +fira)            ; the one true ligature font
       ;; tabbar          ; FIXME an (incomplete) tab bar for Emacs
       treemacs           ; a project drawer, like neotree but cooler
       unicode            ; extended unicode support for various languages
       vc-gutter          ; vcs diff in the fringe
       vi-tilde-fringe    ; fringe tildes to mark beyond EOB
       window-select      ; visually switch windows
       workspaces         ; tab emulation, persistence & separate workspaces

       :config            ; configs. configs always change
       literate           ; something something org babel tangle
       (default           ; hlissner's legacy
        +bindings         ; spacemacs? spacemacs
        +smartparens      ; parinfer, but actually no
        +snippets         ; you won't use them anyway
        +evil-commands)   ; what are those for?
       )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(wakatime-api-key "d3ced585-ce02-419a-a204-36bf85a09926")
 '(wakatime-cli-path "wakatime")
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
