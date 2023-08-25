\version "2.22.2"
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

\includeSheet "AiDaNjaeBudjitje.ly"
\includeSheet "AiMoridschej.ly"
\includeSheet "AjdeJano.ly"
\includeSheet "AjDevlaleKojOdi.ly"
\includeSheet "AndroVerdan.ly"
\includeSheet "AvenNashasTusa.ly"
\includeSheet "BeljevinaZemljaFina.ly"
\includeSheet "CrvenFesic.ly"
\includeSheet "CsardasReinhard.ly"
\includeSheet "CrvenFesic.ly"
\includeSheet "DoluNaPtschelina.ly"
\includeSheet "DorogojDlinnoyu.ly"
\includeSheet "EchJablotschka.ly"
\includeSheet "Ederlezi.ly"
\includeSheet "ForSephora.ly"
\includeSheet "JovanoJovanke.ly"
\includeSheet "KerenSchaworaleDrom.ly"
\includeSheet "NaneTsocha.ly"
\includeSheet "Nastenka.ly"
\includeSheet "OjLivadoRosnaTravo.ly"
\includeSheet "PodmowskojeWecera.ly"
\includeSheet "RomanoDrom.ly"
\includeSheet "Rutschejok.ly"
\includeSheet "StoMiEMilo.ly"
\includeSheet "UtcaUtca.ly"
\includeSheet "Werila.ly"
\includeSheet "XekinaiSamiotissa.ly"