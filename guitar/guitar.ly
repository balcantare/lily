\version "2.24.2"
#(define book-staff-size 20)
\include "../include/book.ily"

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
	  \line {\abs-fontsize #20 "Balcantare Gitarrenbuch"}
	  \null
	} } }
  \markuplist \table-of-contents

}

\includeSheet "Djangology.ly"
\includeSheet "LaGitane.ly"
\includeSheet "LaLuneA.ly"
\includeSheet "LaLuneB.ly"
\includeSheet "LeBalDeLaMarine.ly"
\includeSheet "MinorSwing.ly"
\includeSheet "walz-41.ly"
\includeSheet "ValseAJesaja.ly"
