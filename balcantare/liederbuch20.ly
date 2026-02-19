\version "2.24.0"
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
	  \line {\abs-fontsize #20 "Balcantare Liederbuch"}
	   \vspace #2
        \line { \abs-fontsize #10 "Teil II, 20pt"}
        \line { \abs-fontsize #10 "balcantare.de"}
   
	  \null
	} } }
  \markuplist \table-of-contents

}

\includeSheet "DanserEncore.ly"
\includeSheet "DisLeurQueLonSaime.ly"
\includeSheet "../bwchor/EinHochAufDasLeben.ly"
%\includeSheet "../bwchor/KamperTrinklied.ly"
\includeSheet "../bwchor/MoegeDieStrasse.ly"
