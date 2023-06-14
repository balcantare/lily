\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Ederlezi"


bookTitle = \markup {
  \fontsize #2 \larger
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
    #:factor (/ staff-height pt 18)
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
      %\on-the-fly \print-page-number-check-first
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
dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -4.5)
\override LyricHyphen.extra-offset = #'(0 . -4.5)
\override LyricExtender.extra-offset = #'(0 . -4.5)
\override StanzaNumber.extra-offset = #'(0 . -3.5)
\set stanza = \markup{ \right-brace #70 }
}

dropLyricsB = {
\override LyricText.extra-offset = #'(0 . -1.5)
\override LyricHyphen.extra-offset = #'(0 . -1.5)
\override LyricExtender.extra-offset = #'(0 . -1.5)
\override StanzaNumber.extra-offset = #'(0 . -1.5)
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}
skipA = \repeat unfold 21 { \skip 4 }
skipB = \repeat unfold 11 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }

lyrStropheA = {
  \lyricmode {
  Sa me a -- ma -- la __
  o -- ro khe -- le -- na __
  o -- ro khe -- le -- na __
  di -- ve ke -- re na.
  A __ _ _ _ _ _ da -- je
  Sa o ro -- ma ba -- bo ba -- bo
  sa o ro -- ma o da -- je.
  Sa o ro -- ma ba -- bo ba -- bo
  E __ E -- der -- le -- zi
  E -- der -- le -- zi
  Sa o ro -- ma da -- je.
}}

lyrStropheB = {
  \lyricmode {

  \set stanza = #"2. "

}}


lyrStropheC = {
  \lyricmode {
}}

lyrStropheD = {
  \lyricmode {
}}


strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle modern %-voice-cautionary
  \time 2/4
  \key d \minor
  \bar ".|:"
  \repeat volta 2 {
    \slurUp
    r4 a8 bf |
    c( bf) a( g)
    a2( |
    g8 f16 g f4) |
    r4 g8 g |
    g4 g8( e) |
    f4.( g8 |
    e8 d16 e d4) |
    r4 g8 g |
    g4 g8( e) |
    f4.( g8 |
    e8 d16 e d4) |
    r4 f8( e) |
    g8 e4 d8 |
    d2
    r2
  } \break
    a'2 c b
    c8( b) c( b)
    \tieUp
    a2~ 4 g8( a)
    a2 r2 \break
    f8 f a a
    g f e d
    f f e f
    a a g4 \break
    f8 f a a
    g f e d
    d'2~ 4 c8 bf
    a4 g \break
    r c8 bf
    a4 g
    r f8 e
    g8 e4 d8
    d2

  \bar "|."
}


stropheAlt = \relative c' {
  \voiceTwo
  s4 f8 g
  a( g) f( e)
  f2(
  e4 d)
  s4 d8 d
  d4 bf
  d2
  bf4 a
  s4 bf8 bf
  bf4 c
  d2~ d
  s4 bf
  a8 a4 a8
  a2
  s2
  f'2 a g
  a8( g) a( g)
  f2~ 4 e8( f)
  f2 s2
  d8 d f f
  e d d d
  d d cs d
  f f e4
  d8 d f f
  e d d d
  bf'2~ 4 a8 g
  g4 g
  s4 a8 g
  g4 g
  s4 f8 e
  c8 c4 d8
  d2
}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  d2:m s s s
  g:m s d:m s
  g:m s d:m s
  bf a:m d:m s
  d2:m s g s
  d:m s s s
  d:m g:m d:m g:m
  d:m g:m bf s s
  g:m s d:m a:m d:m
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
   %\new Voice = "Refrain" { \refrain
   \new Staff <<
     \new Voice = "Strophe" { \strophe }
     \new Voice = "StropheAlt" { \stropheAlt }
   >>
  % \new Lyrics \lyricsto "Refrain" \lyrRefrain
  \new	Lyrics \lyricsto "Strophe" \lyrStropheA
  \new	Lyrics \lyricsto "Strophe" \lyrStropheB
  \new Lyrics \lyricsto "Strophe" \lyrStropheC
  \new Lyrics \lyricsto "Strophe" \lyrStropheD
  % \new Staff <<
  %   \new Voice = "Basso" { \stropheBass }
  >>
}
