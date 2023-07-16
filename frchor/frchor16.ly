\version "2.22.2"
#(define book-staff-size 16)
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
  \markup { \fill-line { \center-column {
	  \line {\abs-fontsize #18 "Musikbuch des "}
	  \null
	  \line {\abs-fontsize #18 "Bautzner Friedenschors"}
	  \null
	  \line {\abs-fontsize #10 "16pt"}
	  \null
	} } }
  \markuplist \table-of-contents

}

\includeSheet "NeinMeineSoehneGebIchNicht.ly"
\includeSheet "WeitInDerChampagne.ly"