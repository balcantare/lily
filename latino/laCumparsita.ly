\version "2.19"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

\language "english"

title = #"La Cumparsita"
composer = #"Rodriguez Contursi Maroni"
meter = #"Tango"
%instrument = #"for Pegueri Bandoneon"

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  system-count = 12
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
            \override #'(offset . 7)
            \override #'(thickness . 6)
            \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  title = \realBookTitle
  tagline = ##f
}

startParenthesis = {
  \once \override ParenthesesItem.stencils = #(lambda (grob)
        (let ((par-list (parentheses-item::calc-parenthesis-stencils grob)))
          (list (car par-list) point-stencil )))
}

endParenthesis = {
  \once \override ParenthesesItem.stencils = #(lambda (grob)
        (let ((par-list (parentheses-item::calc-parenthesis-stencils grob)))
          (list point-stencil (cadr par-list))))
}

#(define-markup-command (arrow layout props) ()
   "Draw an Arrow."
   (interpret-markup layout props
     #{\markup \overlay {
        \override #'(thickness . 3)
        \translate #'( 0 . 1.82)\draw-line #'(-1.5 . 0)
        \translate #'( 1.3 . 1.8)\arrow-head #X #RIGHT ##f
        }
     #}
    ))


Chords =
\chordmode {
  s4 \startParenthesis
  \parenthesize g:m f \endParenthesis \parenthesize ef
  \bar "||"
  d1:7 | s | g:m | s1
  d:7 | s | g:m | g:7 |
  c:m | s | g:m | s
  d:7 | s | g4:m d:7 g2:m \bar "||"

  g2:m g2:m/f | e2:m5-7 ef4:7 \parenthesize d4:7 |
  g2:m ef2:7 | d1:7 |
  a1:m5-7 | d:7 | a2:m5-7 d:7 | g:m d:7 |
  g2:m g2:m/f | e2:m5-7 ef4:7 \parenthesize d4:7 |
  g2:m g2:7 | c1:m |
  c:m | g:m | d:7 | g4:m d:7 g2:m \bar "||"

  g2:m d:7 | g:m g:7 | c:m7 f:7 | bf d:7 |
  g2:m d:7 | g:m g:7 | c:m7 f:7 | bf g:m7 |
  \parenthesize d2:m5-7 g:7 |
  c1:m d:7 | g2:m g2:m7 | g:m6 ef:7 |
  a1:m5-7 | d1:7 | g4:m
  \startParenthesis
  \parenthesize g:m f \endParenthesis \parenthesize ef

}

Notes = \relative c'{
  \time 4/4
  \key g \minor
  \once\override Score.RehearsalMark.self-alignment-X = #2
  \mark \markup{ \box{\fontsize #4 A}}
  s1
  d4 c' a fs | r8 d ef d cs4 d | d d' bf g | r8 d8 ef d cs4 d |
  d4 c' a fs | r8 d ef d cs4 d | d d' bf g | r8 d8 ef d cs4 d |
  c4 g' fs g | r8 fs g fs g4 ef | d4 g fs g | r8 fs g fs g4 ef |
  d4 c' a fs | r8 ef' d c bf a4 g16 fs |
  g4 r r2


\once\override Score.RehearsalMark.self-alignment-X = #2
  \mark \markup{ \box{\fontsize #4 B}}

  g'8 a bf4 r8 g a bf | a2 g | r8 g g f f ef ef d | d2 c2 |
  r8 a' a g g fs fs4 | r8 ef ef d d2 | r4 c' ~ c8 bf4 a8 | g2 d |
  g8 a bf4 r8 g a bf | a2 g | r8 g g f f ef ef d | c2. r4 |
  c8 ef4 g8 g fs g4 | bf,8 d4 g8 g fs g4 | r8 d a' fs d8 c4 a8 | g4 r
\once\override Score.RehearsalMark.self-alignment-X = #-1

\mark \markup{\fontsize #4 {
        \arrow\box{A}\arrow\box{C} }}|
  r2

\once\override Score.RehearsalMark.self-alignment-X = #2
  \mark \markup{ \box{\fontsize #4 C}}


  g'8 fs g a bf4. a8 | g2 d | ef8 d ef f g4. ef8 | d2 bf |
  g'8 fs g a bf4. a8 | g2 d | ef8 d ef f g4. ef8 | d2 bf |
  r4 d ef4. d8  | d4. c8 c ef d4 | r4 c d4. c8 | c4 r8 bf8 bf d c4 |
  r4 bf c4. bf8 | bf4. a8 a c bf4 | r a g fs | g
  \once\override Score.RehearsalMark.self-alignment-X = #-2

\mark \markup{\fontsize #4 {
        \arrow\box{A}\arrow\box{B} }}|
s2. \bar "||"

}


\score {
  <<
    \new ChordNames \Chords
    \new Voice = soloist \Notes
  >>
  \layout {
    %\override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
    %\override Score.KeySignature #'break-visibility = #'#(#f #f #f)  % make only the first time signature visible
    \override Score.SystemStartBar #'collapse-height = #1  % allow single-staff system bars
  }
}