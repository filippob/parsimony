(TeX-add-style-hook "parsimonious"
 (lambda ()
    (LaTeX-add-bibliographies
     "parsimonious.bib")
    (LaTeX-add-labels
     "intro"
     "sec:data"
     "sec:overview"
     "par:boss"
     "eq:probit"
     "eq:threshold"
     "eq:gammaprior"
     "eq:gammapost"
     "par:predictor_selection"
     "eq:logistic"
     "par:estimating_error"
     "eq:testerr"
     "eq:cverr"
     "sec:other_ranker"
     "sec:software"
     "sec:results"
     "fig:accuracy"
     "fig:probability"
     "sec:discussion"
     "fig:ld"
     "fig:rank"
     "sec:conclusions"
     "tab:error"
     "tab:rank")
    (TeX-run-style-hooks
     "graphicx"
     "xfrac"
     "longtable"
     "latex2e"
     "svjour310"
     "svjour3"
     "smallextended"
     "fix-cm"
     "")))

