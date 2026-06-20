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
\includeSheet "AllOfMe.ly"
\includeSheet "AndoDromAm.ly"
\includeSheet "AndoDromEm.ly"
\includeSheet "../glue/ArthursBlues.ly"
\includeSheet "AutumnLeaves.ly"
\includeSheet "BesameMucho.ly"
\includeSheet "ChampsElysees.ly"
\includeSheet "../balcantare/DjindjiRindjiBubamaro.ly"
\includeSheet "Donauwellen.ly"
\includeSheet "../balcantare/DorogojDlinnoyu.ly"
\includeSheet "ElChoclo.ly"
\includeSheet "ExactlyLikeYou.ly"
\includeSheet "FairfieldFancy.ly"
\includeSheet "FireFliesAndMosquitos.ly"
\includeSheet "../balcantare/ForSephora.ly"
\includeSheet "../glue/ForTeresa.ly"
\includeSheet "Geburtstagslied.ly"
\includeSheet "Hinterhof.ly"
\includeSheet "HoraEm.ly"
\includeSheet "IWillWaitForYou.ly"
\includeSheet "JiddisherTanz.ly"
\includeSheet "../glue/JungleBlues.ly"
\includeSheet "LadyBeGood.ly"
\includeSheet "../latino/laurita.ly"
\includeSheet "Lelea.ly"
\includeSheet "LuluSwing.ly"
\includeSheet "Marina.ly"
\includeSheet "../balcantare/NaneTsocha.ly"
\includeSheet "NeuerSwing.ly"
\includeSheet "OnlyYou.ly"
\includeSheet "OnTheSunnySide.ly"
\includeSheet "ParCiParLa.ly"
\includeSheet "PerleDeParis.ly"
\includeSheet "PoclednieBockrecenie.ly"
\includeSheet "RhythmGitan.ly"
\includeSheet "Romana.ly"
\includeSheet "Sangshyttevalsen.ly"
\includeSheet "SiniIni.ly"
\includeSheet "SintiSwing11.ly"
\includeSheet "../glue/SlivovitzPolka.ly"
\includeSheet "SternenNacht.ly"
\includeSheet "Swing42.ly"
\includeSheet "TicoTicoNoFuba.ly"
\includeSheet "UnisonoWalzer.ly"
