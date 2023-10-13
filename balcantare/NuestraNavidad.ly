\version "2.22.2"
sheetCopyright = "©balcantare.de"
#(define book-staff-size 22)
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
        	\line { \abs-fontsize #26 "Nuestra Navidad"}
	\vspace #1.5
	\line { \abs-fontsize #26 "Ariel Ramirez"}
	\vspace #1.5
	\line { \abs-fontsize #14 "22pt"}
        \line { \abs-fontsize #14 "balcantare.de"}
        \vspace #4
      }
    }

  }
  \markuplist \table-of-contents
}

\includeSheet "NavidadLaAnnuciacion.ly"
\includeSheet "NavidadLaPeregrinacion.ly"
\includeSheet "NavidadElNacimiento.ly"
\includeSheet "NavidadLosPastores.ly"
\includeSheet "NavidadLosReyesMagos.ly"
\includeSheet "NavidadLaHuida.ly"