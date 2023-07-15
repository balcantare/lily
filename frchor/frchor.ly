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
	  \line {\abs-fontsize #20 "Musikbuch des Bautzner Friedenschors"}
	  \null
	} } }
  \markuplist \table-of-contents

}

\includeSheet "../bwchor/AmaniLeo.ly"
\includeSheet "DasWeicheWasser.ly"
\includeSheet "DerPfahl.ly"
\includeSheet "DieErdeIstUnsereMutter.ly"
\includeSheet "HevenuSchalomAlechem.ly"
\includeSheet "../bwchor/HinehMatov.ly"
\includeSheet "LasstUnsFriedenSchaffen.ly"
\includeSheet "../bwchor/MateAroha.ly"
\includeSheet "../bwchor/NgaIwiE.ly"
\includeSheet "SagMirWoDieBlumenSind.ly"
\includeSheet "WerMoechteNichtImLebenBleiben.ly"
\includeSheet "ZogenEinstFuenfWildeSchwaene.ly"