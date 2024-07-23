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
        	\line { \abs-fontsize #26 "Noten der"}
	\vspace #1.5
	\line { \abs-fontsize #26 "Musik Karawane"}
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

\includeSheet "BurschenAusMystrina.ly"
\includeSheet "Ceresnicki.ly"
\includeSheet "../balcantare/CrvenFesic.ly"
\includeSheet "CuecaBoliviana.ly"
\includeSheet "DaJeVisnja.ly"
\includeSheet "DeColores.ly"
\includeSheet "../frchor/DerPfahl.ly"
\includeSheet "../balcantare/DoluNaPtschelina.ly"
\includeSheet "../balcantare/Ederlezi.ly"
\includeSheet "EPoiTaiTai.ly"
\includeSheet "EsDunkeltSchonInDerHeide.ly"
\includeSheet "FarewellMyFriend.ly"
\includeSheet "HomeIsWhereMyHeartIs.ly"
\includeSheet "IchWuenscheDirMusik.ly"
\includeSheet "Ipharadisi.ly"
\includeSheet "KeineKleider.ly"
\includeSheet "LaPigiatura.ly"
\includeSheet "../balcantare/MasurischesSommerliedchen.ly"
\includeSheet "../balcantare/OjLivadoRosnaTravo.ly"
\includeSheet "OiUVysnevomuSadotcku.ly"
\includeSheet "OdYavoShalomAleinu.ly"
\includeSheet "PachaMama.ly"
\includeSheet "PoszlaKarolinka.ly"
\includeSheet "RedIsTheRose.ly"
\includeSheet "RainAndThunder.ly"
\includeSheet "Salaleo.ly"
\includeSheet "SolangeUnsreLiederKlingen.ly"
\includeSheet "../balcantare/StoMiEMilo.ly"
\includeSheet "TotaHelpa.ly"
\includeSheet "../balcantare/TumBalalaike.ly"
\includeSheet "WasAuchGeschieht.ly"
\includeSheet "WasWollenWirTrinken.ly"
\includeSheet "WennDerAbendNaht.ly"
\includeSheet "../balcantare/Werila.ly"
\includeSheet "WillTheCircleBeUnbroken.ly"
\includeSheet "WoMenschenSichVergessen.ly"
\includeSheet "../frchor/ZogenEinstFuenfWildeSchwaene.ly"
