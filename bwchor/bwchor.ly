\version "2.22.2"
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
	  \line {\abs-fontsize #20 "Musikbuch des Bunte Welt Chors Soritz"}
	  \null
	} } }
  \markuplist \table-of-contents
}

\includeSheet "AmaniLeo.ly"
\includeSheet "CuecaBoliviana.ly"
\includeSheet "DaJeVisnja.ly"
\includeSheet "DeColores.ly"
\includeSheet "../balcantare/Ederlezi.ly"
\includeSheet "EsteSiJaPoharVinaZaplatim.ly"
\includeSheet "HinehMatov.ly"
\includeSheet "MateAroha.ly"
\includeSheet "../balcantare/NaneTsocha.ly"
\includeSheet "OiUVysnevomuSadotcku.ly"
\includeSheet "OdYavoShalomAleinu.ly"
\includeSheet "PoszlaKarolinka.ly"
\includeSheet "RedIsTheRose.ly"
\includeSheet "RainAndThunder.ly"
\includeSheet "SolangeUnsreLiederKlingen.ly"
\includeSheet "TotaHelpa.ly"
\includeSheet "../frchor/ZogenEinstFuenfWildeSchwaene.ly"