(TeX-add-style-hook "parsimonious"
 (lambda ()
    (LaTeX-add-bibliographies
     "parsimonious.bib")
    (LaTeX-add-labels
     "intro"
     "sec:1"
     "sec:data"
     "sec:overview"
     "par:boss"
     "par:predictor_selection"
     "par:estimating_error"
     "sec:other_ranker"
     "sec:software"
     "sec:results"
     "sec:discussion"
     "sec:conclusions")
    (TeX-run-style-hooks
     "graphicx"
     "latex2e"
     "svjour310"
     "svjour3"
     "smallextended"
     "fix-cm"
     "")))

