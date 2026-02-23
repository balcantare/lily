\version "2.24.2"
sheetCopyright = "©glue"
\include "../include/book.ily"

\bookpart {
  \paper{
     tocTitleMarkup = \markup \huge \column {
      \fill-line { \null "Inhalt" \null }
      \hspace #1
     }
  }
  \header {
    title = ##f
    composer = ##f
    arranger = ##f
    tagline = ##f
    subtitle = ##f
  }
  \markup { \fill-line {
    \override #'(baseline-skip . 4)
      \center-column {
        	\line { \abs-fontsize #26 "Noten der"}
	\vspace #1.5
	\line { \abs-fontsize #26 "Glue"}
        \vspace #4
      }
    }

  }
  \markuplist \table-of-contents
}

\includeSheet "ArthursBlues.ly"
