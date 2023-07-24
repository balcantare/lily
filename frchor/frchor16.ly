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
        \line { \abs-fontsize #10 "Teil II, 16pt"}
        \line { \abs-fontsize #10 "friedensingen.de"}
        \vspace #8
      }
    }
  }
  \markuplist \table-of-contents

}
\includeSheet "AllesWohlDemVolke.ly"       % 2
\includeSheet "JetztWirdFriedenGemacht.ly" % 3
\includeSheet "../bwchor/MateAroha.ly"     % 4
\includeSheet "NeinMeineSoehneGebIchNicht.ly" % 5
\includeSheet "WeitInDerChampagne.ly"         % 6