\version "2.22.2"
sheetCopyright = "©freylax"
\include "book.ily"

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
        	\line { \abs-fontsize #24 "freylax Noten"}
	\vspace #8
      }
    }
  }
  \markuplist \table-of-contents

}
\includeSheet "Dubbele.ly"       % 2
\includeSheet "ToutLeLongDuBois.ly" % 3
\includeSheet "Zelda.ly"     % 4
