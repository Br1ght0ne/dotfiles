;;; init.el -*- lexical-binding: t; -*-

(doom! :feature
       debugger            ; FIXME stepping through code, to help you add bugs
       eval                ; run code, run (also, repls)
       (evil               ; come to the dark side, we have cookies
        +everywhere)       ; the shadows grow longer
       file-templates      ; auto-snippets for empty files
       (lookup             ; helps you navigate your code and documentation
        +devdocs)          ; ...on devdocs.io online
       ;; +docsets          ; ...or in Dash docsets locally
       (lsp +eglot)
       snippets             ; my elves. They type so I don't have to
       spellcheck           ; tasing you for misspelling mispelling
       (syntax-checker      ; tasing you for every semicolon you forget
        +childframe)        ; use childframes for error popups (Emacs 26+ only)
       workspaces           ; tab emulation, persistence & separate workspaces

       :completion
       (company                         ; the ultimate code completion backend
        +auto)                          ; as-you-type code completion
       (ivy                             ; a search engine for love and life
        +fuzzy)                         ; enable fuzzy search backend for ivy
       ;; helm              ; the *other* search engine for love and life
       ;; +fuzzy            ; enable fuzzy search backend for helm
       ;; ido               ; the other *other* search engine...

       :ui
       doom                     ; what makes DOOM look the way it does
       doom-dashboard           ; a nifty splash screen for Emacs
       doom-modeline            ; a snazzy Atom-inspired mode-line
       doom-quit                ; DOOM quit-message prompts when you quit Emacs
       evil-goggles             ; display visual hints when editing in evil
       fci                      ; a `fill-column' indicator
       hl-todo                  ; highlight TODO/FIXME/NOTE tags
       ;; modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash ; blink the current line after jumping
       ;; neotree           ; a project drawer, like NERDTree for vim
       treemacs                  ; a project drawer, like neotree but cooler
       (popup                    ; tame sudden yet inevitable temporary windows
        +all                     ; catch all popups that start with an asterix
        +defaults)               ; default popup rules
       (pretty-code +fira)       ; replace bits of code with pretty symbols
       ;; tabbar            ; FIXME an (incomplete) tab bar for Emacs
       unicode                 ; extended unicode support for various languages
       vc-gutter               ; vcs diff in the fringe
       vi-tilde-fringe         ; fringe tildes to mark beyond EOB
       window-select           ; visually switch windows

       :editor
       (format +onsave)                 ; all must be formatted
       lispy                            ; the best lisp package ever
       multiple-cursors                 ; editing in many places at once
       parinfer                         ; turn lisp into python, sort of
       ;; rotate-text       ; cycle region at point between text candidates

       :emacs
       dired                       ; making dired pretty [functional]
       ediff                       ; comparing files in Emacs
       electric                    ; smarter, keyword-based electric-indent
       eshell                      ; a consistent, cross-platform shell (WIP)
       hideshow                    ; basic code-folding support
       imenu                       ; an imenu sidebar and searchable code index
       term                        ; terminals in Emacs
       ;; vc                ; version-control and Emacs, sitting in a tree

       :tools
       ;; editorconfig      ; let someone else argue about tabs vs spaces
       ;; ein               ; tame Jupyter notebooks with emacs
       ;; gist              ; interacting with github gists
       ;; godot             ; THE GAME ENGINE YOU WAITED FOR.
       make                      ; $ make your dreams come true  # doesn't work
       magit                     ; the best git porcelain everrr
       password-store            ; password manager for nerds
       pdf                       ; pdf enhancements
       ;; prodigy           ; FIXME managing external services & code builders
       ;; rgb               ; creating color strings
       ;; tmux              ; an API for interacting with tmux
       ;; upload            ; map local to remote projects via ssh/ftp
       wakatime                ; maintaining your illusions of being productive

       :lang               ; you either code, or should start coding
       ;; assembly          ; assembly for fun or debugging
       (cc +irony)                    ; C/C++/Obj-C madness
       ;;  +rtags           ; I don't need those
       ;; clojure           ; java with a lisp
       ;; common-lisp       ; if you've seen one lisp, you've seen them all
       ;; crystal           ; ruby at the speed of c
       csharp                    ; unity, .NET, and mono shenanigans
       data                      ; config/data formats
       erlang                    ; an elegant language for a more civilized age
       elixir                    ; erlang done right
       ;; elm               ; care for a cup of TEA?
       emacs-lisp                ; drown in parentheses
       ;; ess               ; emacs speaks statistics
       ;; go                ; the hipster dialect
       (haskell                         ; a language that's lazier than I am
        +intero)                        ; the best haskell IDE for emacs
       ;; hy                ; readability of scheme w/ speed of python
       (java        ; the poster child for carpal tunnel syndrome
        +meghanada) ; the only java server that sucks (a little) less
       javascript   ; all(hope(abandon(ye(who(enter(here))))))
       ;; julia             ; a better, faster MATLAB
       latex       ; writing papers in Emacs has never been so fun
       ledger      ; an accounting system in Emacs
       ;; lua               ; one-based indices? one-based indices
       markdown    ; writing docs for people to ignore
       nim         ; python + lisp at the speed of c
       ;; nix               ; I hereby declare "nix geht mehr!"
       ;; ocaml             ; an objective camel
       (org        ; organize your plain life in plain text
        +alert     ; don't be rude, don't miss birthdays
        +attach    ; custom attachment system
        +babel     ; running code in org
        +capture   ; org-capture in and outside of Emacs
        +export    ; Exporting org to whatever you want
        +present)  ; Emacs for presentations
       ;; perl              ; write code no one else can comprehend
       ;; php               ; perl's insecure younger brother
       ;; plantuml          ; diagrams for confusing people more
       ;; purescript        ; javascript, but functional
       python       ; beautiful is better than ugly
       ;; qt                ; the 'cutest' gui framework ever
       ;; racket            ; a DSL for DSLs
       ;; rest              ; Emacs as a REST client
       ruby         ; 1.step { |i| puts "Ruby is #{i.even? ? 'love' : 'life'}"}
       rust         ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;; scala             ; java, but good
       sh                 ; she sells (ba|z)sh shells on the C xor
       ;; solidity          ; do you need a blockchain? No.
       ;; swift             ; who asked for emoji variables?
       web                              ; the tubes

       :app   ; huge ass new features
       email             ; why RMS made Emacs
       ;;  +gmail           ; ABSOLUTELY PROPRIETARY!!1!1!
       ;; irc               ; how neckbeards socialize
       regex  ; two problems instead of one
       (rss   ; emacs as an RSS reader
        +org) ; rss + org: born to be together
       ;; twitter           ; twitter client https://twitter.com/vnought
       (write              ; emacs as a word processor (latex + org + markdown)
        +wordnut           ; wordnet (wn) search
        +langtool)         ; a proofreader (grammar/style check) for Emacs

       :collab                       ; only professional relationship, I swear!
       floobits                      ; peer programming for a price
       impatient-mode                ; show off code over HTTP

       :config      ; configs. configs always change
       ;;literate           ; something something org babel tangle

       (default                         ; hlissner's legacy
         +bindings                      ; spacemacs? spacemacs
         +snippets                      ; you won't use them anyway
         +evil-commands)                ; what are those for?

       :private                   ; what makes your emacs truly yours
       (default                   ; a huge mess
         +bindings                ; already miss Spacemacs? AGAIN
         +elfeed))          ; your precious little articles are OURS now!
