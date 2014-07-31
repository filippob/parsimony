(TeX-add-style-hook "parsimonious"
 (lambda ()
    (LaTeX-add-bibliographies
     "parsimonious.bib")
    (LaTeX-add-labels
     "intro"
     "sec:data"
     "sec:overview"
     "par:boss"
     "eq:threshold"
     "par:predictor_selection"
     "par:estimating_error"
     "sec:other_ranker"
     "sec:software"
     "sec:results"
     "fig:accuracy"
     "fig:probability"
     "sec:discussion"
     "fig:ld"
     "fig:rank"
     "sec:conclusions"
     "tab:error")
    (TeX-run-style-hooks
     "graphicx"
     "latex2e"
     "svjour310"
     "svjour3"
     "smallextended"
     "fix-cm"
     "")))

