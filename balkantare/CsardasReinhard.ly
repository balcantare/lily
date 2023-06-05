\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Csárdás (Reinhard)"


bookTitle = \markup {
  \fontsize #3 \larger
  \line { #sheetName }
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

% parentheses
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

\header { title = \bookTitle  tagline = ##f }

\paper {
  #(define fonts
    (set-global-fonts
    #:music "lilyjazz"
    #:brace "lilyjazz"
    ;;#:roman "lilyjazz-text"
    #:sans "lilyjazz-chord"
    #:factor (/ staff-height pt 20)
  ))
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 3\cm
  between-system-padding = #2
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  page-count = #1
  markup-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 3)
                             (padding . 8))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
 %     \on-the-fly \print-page-number-check-first
      \line{
        - \hspace #1 \commitDate \hspace #1 -
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1  )) #f))))
dropLyrics = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -3)
}
raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \key d \minor
   \partial 4.
   \mark \markup{ \box{\fontsize #4 A}}
   c8 d e |
   \repeat volta 2 {
   f4 f c f |
   a a~ 8 fs g a |
   bf4 a g g8 e |
   f a g f e f g e |
   f4 f c f |
   a a~ 8 fs g a |
   bf4 a g g8 e |
   f a g e f2
   } \break
   \mark \markup{ \box{\fontsize #4 B}}
   \repeat volta 2 {
   a4 a gs4. f8 |
   e f gs f e4. d8 |
   f4 f e8 d cs e |
   d a b cs d e f gs |
   a4 a gs4. f8 |
   e f gs f e4. d8 |
   f4 f e8 d cs e |
   }
   \alternative{
     {d2~ d8 e f gs}
     {d1}
   } \break
   \mark \markup{ \box{\fontsize #4 C}}
  \time 2/4
  \key d \minor
   \repeat volta 2 {
   a8 b16 cs d8 e |
   f f e d |
   f f e d |
   f16 e f g f e d8 |
   a8 b16 cs d8 e |
   f f e d |
   f e16 d cs16 d e8 |
   }
    \alternative{
      {d2}
      {d4. c8}
    } \break
   \mark \markup{ \box{\fontsize #4 D}}
   \repeat volta 2 {
     a'4 g |
     f4. g8 |
     a8. g16 a8. b16 |
     c4. bf8 |
     a4 g |
     f4 \tuplet 3/2 { e8( f g) }
     f4 e |
   }
   \alternative{
     { d4. c8 }
     { d2 }
   } \break
   \mark \markup{ \box{\fontsize #4 E}}
   \repeat volta 2 {
     bf'16 a g8 g f16 g |
     a16 g f8 f8. f16 |
     e8 d e fs |
     g4 g |
     bf16 a g8 g f16 g |
     a16 g f8 f8. f16 |
     e8 d e f |
      d4 \mark \markup{ \box{\fontsize #2 Fine}} d
   } \break
   \mark \markup{ \box{\fontsize #4 F}}
   \repeat volta 2 {
   cs4 cs |
   cs bf8 a |
   d4 d |
   d8. f16 e8. d16 |
   cs4 cs |
   cs bf8. a16 |
   d2~ }
   \alternative {
     {d8. f16 e8. d16 }
     {d2}
   } \break
   \mark \markup{ \box{\fontsize #4 G}}
   \repeat volta 2 {
     a8 d4 e8 |
     f4 a |
     gs8. f16 e8. d16 |
     a'4 a |
     a,8 d4 e8 |
     f4 a |
     gs8. f16 e8. f16 |
     d4 d |
   }
   \mark \markup{ \box{\fontsize #4 C..E}}
   s2
    \bar "|."
}

chrdStrophe = \chordmode {
  s4.
  f1
  s
  c
  f2 c
  f1
  s
  c
  f

  d1:m
  s
  s2 a2
  d1:m
  d:m
  s
  s2 a:
  d1:m
  d:m

  d4:m
  \set chordBassOnly = ##t
  d:m/a
  d:m/d
  d:m/f
  \set chordBassOnly = ##f

  \mark \markup{ \fontsize #4 ...}
  \repeat unfold 4{s2}
  s4 a
  d2:m
  d2:m

  f2
  \repeat unfold 4{s2}
  d:m
  s4 a
  d2:m
  d2:m

  g:m
  \set chordBassOnly = ##t
  d4:m s %d:m/a
  s % d:m/d
  \set chordBassOnly = ##f
  d:/fs
  g:m
   \set chordBassOnly = ##t
  s %g:m/bf
  s2 % g2:m
  d:m
  s4 a
  d2:m

  a2  s
  d:m s
  a s
  d:m
  s s

  d:m s s s s s s4 a d2:m
}


\layout {
  \context {
    \Lyrics
    \override LyricText #'font-size = #+2
  }
  \context {
    \Score
%    \override BarNumber.break-visibility = ##(#f #t #t)
%%    \override BarNumber.Y-offset = 0
%    \override BarNumber.X-offset = -2
  }
}

\score {
  <<
   \new ChordNames { \chrdStrophe }
   \new Staff <<
     \new Voice = "Strophe" { \strophe }
   >>
  >>
}
