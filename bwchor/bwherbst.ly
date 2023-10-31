\version "2.22.2"
sheetCopyright = "©balcantare.de"
\include "../include/book.ily"

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
  \markup { \fill-line {
    \override #'(baseline-skip . 4)
      \center-column {
        	\line { \abs-fontsize #26 "Noten für das Herbstprogramm"}
	\vspace #1.5
	\line { \abs-fontsize #26 "des Bunte Welt Chors"}
	\vspace #1.5
	\line { \abs-fontsize #26 "Soritz"}
	\vspace #0.5
        %\line { \abs-fontsize #14 "Teil I, 24pt"}
        \line { \abs-fontsize #14 "balcantare.de"}
        \vspace #4
      }
    }

  }
  \markuplist \table-of-contents
}

\includeSheet "Salaleo.ly"
\includeSheet "SolangeUnsreLiederKlingen.ly"
\includeSheet "TotaHelpa.ly"
\includeSheet "PoszlaKarolinka.ly"
\includeSheet "OiUVysnevomuSadotcku.ly"
\includeSheet "DaJeVisnja.ly"
\includeSheet "Ceresnicki.ly"
\includeSheet "RainAndThunder.ly"
\includeSheet "RedIsTheRose.ly"
\includeSheet "KeineKleider.ly"
\includeSheet "../balcantare/Ederlezi.ly"
\includeSheet "EsteSiJaPoharVinaZaplatim.ly"
\includeSheet "LaPigiatura.ly"
\includeSheet "WasWollenWirTrinken.ly"
\includeSheet "WillTheCircleBeUnbroken.ly"
\includeSheet "OdYavoShalomAleinu.ly"
\includeSheet "HomeIsWhereMyHeartIs.ly"
\includeSheet "Ipharadisi.ly"
\includeSheet "Apfeltraum.ly"
\includeSheet "EsDunkeltSchonInDerHeide.ly"
\includeSheet "BuntSindSchonDieWaelder.ly"
