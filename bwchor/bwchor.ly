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
        	\line { \abs-fontsize #26 "Noten des"}
	\vspace #1.5
	\line { \abs-fontsize #26 "Bunte Welt Chors"}
	\vspace #1.5
	\line { \abs-fontsize #26 "Soritz"}
	\vspace #0.5
        \line { \abs-fontsize #14 "Teil I, 24pt"}
        \line { \abs-fontsize #14 "balcantare.de"}
        \vspace #4
      }
    }

  }
  \markuplist \table-of-contents
}

\includeSheet "AmaniLeo.ly"
\includeSheet "Apfeltraum.ly"
\includeSheet "BurschenAusMystrina.ly"
\includeSheet "Ceresnicki.ly"
\includeSheet "CuecaBoliviana.ly"
\includeSheet "DaJeVisnja.ly"
\includeSheet "DeColores.ly"
\includeSheet "../balcantare/Ederlezi.ly"
\includeSheet "EPoiTaiTai.ly"
\includeSheet "EsDunkeltSchonInDerHeide.ly"
\includeSheet "EsteSiJaPoharVinaZaplatim.ly"
\includeSheet "FarewellMyFriend.ly"
\includeSheet "HinehMatov.ly"
\includeSheet "Ipharadisi.ly"
\includeSheet "HomeIsWhereMyHeartIs.ly"
\includeSheet "LaPigiatura.ly"
\includeSheet "KeineKleider.ly"
\includeSheet "OiUVysnevomuSadotcku.ly"
\includeSheet "OdYavoShalomAleinu.ly"
\includeSheet "PoszlaKarolinka.ly"
\includeSheet "RedIsTheRose.ly"
\includeSheet "RainAndThunder.ly"
\includeSheet "Salaleo.ly"
\includeSheet "SolangeUnsreLiederKlingen.ly"
\includeSheet "TotaHelpa.ly"
\includeSheet "WasWollenWirTrinken.ly"
\includeSheet "WillTheCircleBeUnbroken.ly"
\includeSheet "WoMenschenSichVergessen.ly"
\includeSheet "../frchor/ZogenEinstFuenfWildeSchwaene.ly"
\includeSheet "NavidadLaAnnuciacion.ly"
\includeSheet "NavidadLaPeregrinacion.ly"
\includeSheet "NavidadElNacimiento.ly"