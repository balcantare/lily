\version "2.24.2"
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
	  \line {\abs-fontsize #20 "Balcantare Folk"}
	  \null
	} } }
  \markuplist \table-of-contents

}

book= "balcantare"
\includeSheet "AjDevlaleKojOdi.ly"
\includeSheet "NaneTsocha.ly"
\includeSheet "Biserka.ly"
\includeSheet "../freylax/FireFliesAndMosquitos.ly"
\includeSheet "TheStarOfCountyDown.ly"
\includeSheet "Werila.ly"
\includeSheet "../freylax/AndroUitHanterdroom.ly"
\includeSheet "OpaCupaDm.ly"
\includeSheet "BeljevinaZemljaFina.ly"
\includeSheet "JovanoJovanke.ly"
\includeSheet "AjdeJano.ly"
\includeSheet "KerenSchaworaleDrom.ly"
\includeSheet "StripTheWillow.ly"
\includeSheet "Valenki.ly"
\includeSheet "../bwchor/LisomLisom.ly"
\includeSheet "Ederlezi.ly"
\includeSheet "LjubljuZiganaJana.ly"
