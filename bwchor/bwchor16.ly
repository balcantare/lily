\version "2.22.2"
sheetCopyright = "©balcantare.de"
#(define book-staff-size 16)
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
  \markup {
    \fill-line {
      \override #'(baseline-skip . 8)
      \center-column {
        	\line { \abs-fontsize #18 "Noten des"}
	\vspace #2
	\line { \abs-fontsize #18 "Bunte Welt Chors"}
	\vspace #2
	\line { \abs-fontsize #18 "Soritz"}
        \line { \abs-fontsize #10 "Teil III, 16pt"}
        \line { \abs-fontsize #10 "balcantare.de"}
        \vspace #8
      }
    }

  }
  \markuplist \table-of-contents
}

\includeSheet "HuetetDieFlamme.ly"
\includeSheet "MateAroha.ly"
\includeSheet "NkosiSikeleliAfrika.ly"
\includeSheet "Tourdion.ly"
