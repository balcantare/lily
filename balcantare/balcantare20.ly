\version "2.24.0"
#(define book-staff-size 20)
\include "book.ily"

\bookpart {
  \paper{
    %% Übersetzung der Inhaltsverzeichnisüberschrift nach französisch:
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
	  \line {\abs-fontsize #20 "Balcantare Musikbuch"}
	  \vspace #1.5
	  \line {\abs-fontsize #12 "Teil II, 20pt"}
	  \null
	} } }
  \markuplist \table-of-contents

}

\includeSheet "OpaCupa.ly"
\includeSheet "OpaCupaDm.ly"

