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
\includeSheet "AndoAnTriskell.ly"
\includeSheet "AndroVerdan.ly"
\includeSheet "AvecQueLaMarmotte.ly"
\includeSheet "AvenNashasTusa.ly"
\includeSheet "BeljevinaZemljaFina.ly"
\includeSheet "CineAPusCarciumaNDrum.ly"
\includeSheet "CrvenFesic.ly"
\includeSheet "CsardasReinhard.ly"
\includeSheet "CrvenFesic.ly"
\includeSheet "DereGelior.ly"
\includeSheet "Devojko.ly"
\includeSheet "DoluNaPtschelina.ly"
\includeSheet "DorogojDlinnoyu.ly"
\includeSheet "DvaDubi.ly"
\includeSheet "EchJablotschka.ly"
\includeSheet "Ederlezi.ly"
\includeSheet "FontaineLaJolie.ly"
\includeSheet "ForSephora.ly"
\includeSheet "FroehlicherKreis.ly"
\includeSheet "Ivanica.ly"
\includeSheet "JovanoJovanke.ly"
\includeSheet "JaVstretilVac.ly"
\includeSheet "KerenSchaworaleDrom.ly"
\includeSheet "LesChampsElysees.ly"
\includeSheet "LesChampsElyseesC.ly"
\includeSheet "LjubljuZiganaJana.ly"
\includeSheet "MasurischesSommerliedchen.ly"
\includeSheet "NaneTsocha.ly"
\includeSheet "Nastenka.ly"
\includeSheet "OjLivadoRosnaTravo.ly"
\includeSheet "PodmowskojeWecera.ly"
\includeSheet "RomanoDrom.ly"
\includeSheet "Rutschejok.ly"
\includeSheet "Schiffsjungentanz.ly"
\includeSheet "SchukaHisOZiro.ly"
\includeSheet "StadtDerMusik.ly"
\includeSheet "StoMiEMilo.ly"
\includeSheet "TumBalalaike.ly"
\includeSheet "UtcaUtca.ly"
\includeSheet "Werila.ly"
\includeSheet "XekinaiSamiotissa.ly"