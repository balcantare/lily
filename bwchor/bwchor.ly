\version "2.22.2"
fileName = "bwchor.ly"
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

\include "CuecaBoliviana.ly"
\include "PoszlaKarolinka.ly"
\include "DaJeVisnja.ly"
\include "DeColores.ly"
\include "OiUVysnevomuSadotcku.ly"
\include "OdYavoShalomAleinu.ly"
\include "RainAndThunder.ly"
\include "SolangeUnsreLiederKlingen.ly"
\include "TotaHelpa.ly"