;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;; Libraries
(package! anaphora)
(package! dash)
(package! dash-functional)

;; Org
;; ts (for org-super-agenda) is not being found for some reason
(package! ts :recipe (:host github :repo "alphapapa/ts.el"))
(package! org-super-agenda :recipe (:host github :repo "alphapapa/org-super-agenda"))
(package! ob-elixir)
(package! org-web-tools)

;; Fun
(package! elcord)

;; Testing grounds
(package! symbol-overlay)
