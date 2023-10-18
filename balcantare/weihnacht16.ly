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
  \markup { \fill-line {
    \override #'(baseline-skip . 4)
      \center-column {
        	\line { \abs-fontsize #26 "Weihnachtsmusik"}
	\vspace #1.5
	\line { \abs-fontsize #14 "16pt"}
        \line { \abs-fontsize #14 "balcantare.de"}
        \vspace #4
      }
    }

  }
  \markuplist \table-of-contents
}

\includeSheet "RiuRiuChiu.ly"
\includeSheet "LeisLeisLeis.ly"