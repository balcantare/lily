\version "2.24.0"
sheetCopyright = "©balcantare.de"
\include "../include/book.ily"

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
	  \vspace #2
        \line { \abs-fontsize #10 "Teil II, 20pt"}
        \line { \abs-fontsize #10 "balcantare.de"}
        \vspace #8
	} } }
  \markuplist \table-of-contents

}
book= "balcantare"
\includeSheet "DanserEncore.ly"
\includeSheet "Democratie.ly"
\includeSheet "DisLeurQueLonSaime.ly"
\includeSheet "DisLeurQueLonSaimeDt.ly"
\includeSheet "../bwchor/EinHochAufDasLeben.ly"
\includeSheet "OpaCupaDm.ly"
\includeSheet "StadtDerMusik.ly"
\includeSheet "TheStarOfCountyDown.ly"