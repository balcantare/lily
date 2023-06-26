\version "2.22.2"
fileName = "balcantare.ly"
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
	  \null
	} } }
  \markuplist \table-of-contents

}

\include "AiDaNjaeBudjitje.ly"
\include "AiMoridschej.ly"
\include "AjdeJano.ly"
\include "AjDevlaleKojOdi.ly"
\include "AndroVerdan.ly"
\include "AvenNashasTusa.ly"
\include "BeljevinaZemljaFina.ly"
\include "CsardasReinhard.ly"
