\version "2.22.2"
sheetCopyright = "©friedensingen.de"
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
      \override #'(baseline-skip . 4)
      \center-column {
        	\line { \abs-fontsize #26 "Noten der"}
	\vspace #1.5
	\line { \abs-fontsize #26 "Straßenmusik"}
	\vspace #1.5
	\line { \abs-fontsize #26 "für den Frieden"}
	\vspace #0.5
        \line { \abs-fontsize #14 "Teil I, 24pt"}
        \line { \abs-fontsize #14 "friedensingen.de"}
        \vspace #4
      }
    }
  }
  \markuplist \table-of-contents
}

\includeSheet "../bwchor/AmaniLeo.ly"
\includeSheet "DasWeicheWasser.ly"
\includeSheet "DerPfahl.ly"
\includeSheet "DieErdeIstUnsereMutter.ly"
\includeSheet "HeuteUndHier.ly"
\includeSheet "HevenuSchalomAlechem.ly"
\includeSheet "../bwchor/HinehMatov.ly"
\includeSheet "LasstUnsFriedenSchaffen.ly"
\includeSheet "../bwchor/NgaIwiE.ly"
\includeSheet "../bwchor/OdYavoShalomAleinu.ly"
\includeSheet "SagMirWoDieBlumenSind.ly"
\includeSheet "WeShallOvercome.ly"
\includeSheet "WerMoechteNichtImLebenBleiben.ly"
\includeSheet "ZogenEinstFuenfWildeSchwaene.ly"
