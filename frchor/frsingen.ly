\version "2.22.2"
sheetCopyright = "©friedensingen.de"
#(define book-staff-size 16)
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
  \markup {
    \fill-line {
       \override #'(baseline-skip . 8)
      \center-column {
        	\line { \abs-fontsize #18 "Noten der"}
	\vspace #2
	\line { \abs-fontsize #18 "Straßenmusik"}
	\vspace #2
	\line { \abs-fontsize #18 "für den Frieden"}
        \line { \abs-fontsize #10 "Auswahl für Pax Terra Friedenscamp"}
        \line { \abs-fontsize #10 "friedensingen.de"}
        \vspace #8
      }
    }
  }
  \markuplist \table-of-contents
}

\includeSheet "HeuteUndHier.ly"
\includeSheet "ZogenEinstFuenfWildeSchwaene.ly"
\includeSheet "SagMirWoDieBlumenSind.ly"
\includeSheet "WerMoechteNichtImLebenBleiben.ly"
\includeSheet "WeitInDerChampagne.ly"
\includeSheet "AllesWohlDemVolke.ly"
\includeSheet "DasWeicheWasser.ly"
\includeSheet "LasstUnsFriedenSchaffen.ly"
\includeSheet "HevenuSchalomAlechem.ly"
\includeSheet "../bwchor/OdYavoShalomAleinu.ly"
\includeSheet "DieErdeIstUnsereMutter.ly"
\includeSheet "../bwchor/MateAroha.ly"
\includeSheet "../bwchor/NgaIwiE.ly"
\includeSheet "WeShallOvercome.ly"
\includeSheet "../bwchor/SolangeUnsreLiederKlingen.ly"
