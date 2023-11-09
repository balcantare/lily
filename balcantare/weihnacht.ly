\version "2.22.2"
sheetCopyright = "©balcantare.de"
%#(define book-staff-size 16)
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
  \markup { \fill-line {
    \override #'(baseline-skip . 4)
      \center-column {
        	\line { \abs-fontsize #26 "Weihnachtsmusik"}
	\vspace #1.5
	\line { \abs-fontsize #14 "24pt"}
        \line { \abs-fontsize #14 "balcantare.de"}
        \vspace #4
      }
    }

  }
  \markuplist \table-of-contents
}

\includeSheet "EsIstEinSchneeGefallen.ly"
\includeSheet "GaudeteChristusEstNatus.ly"
\includeSheet "HappyXMas.ly"
\includeSheet "HarkTheHeraldAngelsSing.ly"
\includeSheet "HarkTheHeraldAngelsSingF.ly"
\includeSheet "HoertDerEngelHelleLieder.ly"
\includeSheet "LasGallinasVanABelen.ly"
\includeSheet "LaVirgenEMasaElPan.ly"
\includeSheet "MariaDurchEinDornwaldGing.ly"
\includeSheet "ODuFroehliche.ly"
\includeSheet "ODuStilleZeit.ly"
\includeSheet "OLittleTownOfBethlehem2.ly"
\includeSheet "QuandoNascetteNinno.ly"
\includeSheet "SindDieLichterAngezuendet.ly"
\includeSheet "SolsticeCarol.ly"
\includeSheet "TausendSterneSindEinDom.ly"
\includeSheet "VeseliSeMajkoBozja.ly"