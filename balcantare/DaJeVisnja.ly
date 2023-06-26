\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Da je višnja"


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
dropLyricsA = {
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


lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Da je viš -- nja ko treš -- nja.
  Ja bi' bi -- la naj -- lep -- ša.
  A -- li viš -- nja ma -- lo ki -- si,
  slat -- ko la -- ne di si?
  A -- li viš -- nja ma -- lo ki -- si,
  slat -- ko la -- ne di si?

}}

skipA = \repeat unfold 2 { \skip 8 }
lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Slat -- ko la -- ne di si ti?
  Vo -- le -- la -- b'te
  vi -- de -- ti.
  Vo -- le -- la -- b'te
  vi -- det' di -- ko,
  al' da ne zna ni -- ko.
  Vo -- le -- la -- b'te
  vi -- det' di -- ko,
  al' da ne zna ni -- ko.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Dve ja -- bu -- ke tri du -- nje.
  Na or -- ma -- nu i -- stru -- le.
  I -- stru -- le su
  sta -- ja -- ju -- či,
  di -- ku če -- ka -- ju -- či.
  I -- stru -- le su
  sta -- ja -- ju -- či,
  di -- ku če -- ka -- ju -- či.

}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"su) "
}}


strophe = \relative c'' {
  \voiceOne
  \time 3/2
  \key c \major
  \partial 2
  g4 g8( a)
  f4.( e8) d2 e8 c4.
  d1 g4 g8( a)
  f4.( e8) d2 e8 c4.
  d1 f4. g8
  a2 a g4 g8( a)
  f4.( e8) d2 e4 c
  g'2 f4( g) e4( d8 c)
  d1 f4. g8 a2 a g4 g8( a)
  f4.( e8) d2 e4 c
  g'2 f4( g) e( d8 c)
  d1
  \bar "|."
}

stropheAlt = \relative c'' {
  \voiceTwo
  e,4 e8( f)
  d4.( c8) b2 c8 c4.
  b1 e4 e8( f)
  d4.( c8) b2 c8 c4.
  b1 c4. e8
  f2 f e4 e8( f)
  d4.( c8) b2 c4 c
  e2 d4( e) c2
  b1
  c4. e8 f2 f e4 e8( f)
  d4.( c8) b2 c4 c
  e2 d4( e) c2
  b1
}

stropheBass = \relative c' {
  \clef "treble_8"
  c4 c
  g2 g c8 c4.
  g1 c4 c
  g2 g c8 c4.
  g1 c4. c8
  c2 c c4 c4
  g2 g g4 g4
  c2 g a
  g1 c4. 8
  c2 c c4 c4
  g2 g2 g4 g4
  c2 g a
  g1
}

chrdStrophe =  \chordmode {
  c2
  g1 c2
  g1 c2
  g1 c2
  g1 f2
  f1 c2
  g1 c2
  c2 g c
  g1 f2
  f1 c2
  g1 c2
  c2 g c g1
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
   \new Staff <<
     \new Voice = "Basso" { \stropheBass }
   >>
  >>
}
