\version "2.24.0"
sheetCopyright = "©friedensingen.de"
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
  \markup {
    \fill-line {
      \override #'(baseline-skip . 8)
      \center-column {
        	\line { \abs-fontsize #18 "Noten der"}
	\vspace #2
	\line { \abs-fontsize #18 "Straßenmusik"}
	\vspace #2
	\line { \abs-fontsize #18 "für den Frieden"}
        \line { \abs-fontsize #10 "Teil II, 20pt"}
        \line { \abs-fontsize #10 "friedensingen.de"}
        \vspace #8
      }
    }
  }
  \markuplist \table-of-contents

}
book = frchor

\includeSheet "BrotUndRosen.ly"
\includeSheet "../balcantare/DisLeurQueLonSaimeDt.ly"
\includeSheet "../bwchor/EinHochAufDasLeben.ly"
\includeSheet "RuestigeRentner.ly"
