\version "2.24.2"
sheetCopyright = "©freylax"
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
        	\line { \abs-fontsize #24 "freylax Noten"}
	\vspace #8
      }
    }
  }
  \markuplist \table-of-contents
}

book = "freylax"

\includeSheet "ADayInTheLiveOfAFool.ly"
\includeSheet "../glue/ArthursBlues.ly"
\includeSheet "ChampsElysees.ly"
\includeSheet "../balcantare/DjindjiRindjiBubamaro.ly"
\includeSheet "../balcantare/DorogojDlinnoyu.ly"
\includeSheet "ElChoclo.ly"
\includeSheet "FairfieldFancy.ly"
\includeSheet "FireFliesAndMosquitos.ly"
\includeSheet "../glue/ForTeresa.ly"
\includeSheet "Geburtstagslied.ly"	
\includeSheet "../glue/JungleBlues.ly"
\includeSheet "../latino/laurita.ly"
\includeSheet "../balcantare/NaneTsocha.ly"
\includeSheet "RhythmGitan.ly"
\includeSheet "Sangshyttevalsen.ly"
\includeSheet "SintiSwing11.ly"
\includeSheet "../glue/SlivovitzPolka.ly"
