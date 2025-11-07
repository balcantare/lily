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
\includeSheet "../balcantare/Biserka.ly"
\includeSheet "Cerclevolu.ly"
\includeSheet "DeMontfort.ly"
\includeSheet "DeTweedeKoepel.ly"
\includeSheet "Dubbele.ly"
\includeSheet "FairfieldFancy.ly"
\includeSheet "FairyDance.ly"
\includeSheet "FairyValse.ly"
\includeSheet "FireFliesAndMosquitos.ly"
\includeSheet "Hepter.ly"
\includeSheet "IetsVoorVyf.ly"
\includeSheet "KijkenInHetKampvuur.ly"
\includeSheet "../latino/laurita.ly"
\includeSheet "MazurkaLizzee.ly"
\includeSheet "MazurkaVoorEenDooieMus.ly"
\includeSheet "MichaelsJig.ly"
\includeSheet "Reel.ly"
\includeSheet "RonDodo.ly"
\includeSheet "Sangshyttevalsen.ly"
\includeSheet "SalbeiSchottisch.ly"
\includeSheet "ScottishPourBruno.ly"
\includeSheet "ScottishVreeswijk.ly"
\includeSheet "ToutLeLongDuBois.ly" % 3
\includeSheet "../balcantare/Valenki.ly"
\includeSheet "WalsVoorDeWilgen.ly"
\includeSheet "Zelda.ly"     % 4
