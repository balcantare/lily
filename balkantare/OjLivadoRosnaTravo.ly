\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Oj livado rosna travo"


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
    #:factor (/ staff-height pt 17)
  ))
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 4\cm
  between-system-padding = #4
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  page-count = #1
  markup-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 6)
                             (padding . 8))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
 % oddFooterMarkup = \markup {
 %   \fill-line {
 %     \on-the-fly \print-page-number-check-first
 %     \line{
 %       - \hspace #1 \commitDate \hspace #1 -
 %     }
 %   }
 % }
 % evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1  )) #f))))
dropLyrics = {
\override LyricText.extra-offset = #'(0 . -4.5)
\override LyricHyphen.extra-offset = #'(0 . -4.5)
\override LyricExtender.extra-offset = #'(0 . -4.5)
\override StanzaNumber.extra-offset = #'(0 . -4.5)
}
raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}
skipSeven = \repeat unfold 6 { \skip 4 }
skipEight = \repeat unfold 8 { \skip 4 }
lyrStropheA = {
  \lyricmode {
    Oj li -- va -- do ros -- na -- tra -- vo,
    \dropLyrics
    ja -- vo -- re ja vo -- re
    \raiseLyrics
    Koj po te -- bi ču va sta -- do,
    \dropLyrics
    zla -- to mo -- je
    \raiseLyrics
}}

lyrStropheB = {
  \lyricmode {
    Ču -- va -- la ga dje -- voj -- či -- ca,
    \skipSeven
    Od se -- dam -- naest go -- di -- ni -- ca,
    \skipEight
}}

lyrStropheC = {
  \lyricmode {
  Ov -- ce ču -- va pes -- mu pe -- va,
  \skipSeven
  Moj dra -- ga -- ne, što te ne -- ma,
  \skipEight
}}

lyrStropheD = {
  \lyricmode {
  Gde si dra -- gi, o -- vih da -- na,
  \skipSeven
  Kad ja ov -- ce ču -- vam sa -- ma,
  \skipEight
}}


strophe = \relative c' {
  \voiceOne
  \time 4/4
  \key c \major
  \partial 4
  \repeat volta 2 {
    \bar ".|:"
    c4 |
   d4 d8 d~ 4 c |
   d4 d8 d~ 2 |
   d4 d8( e) f2 |
   e8([ g)] f([ e)] d4 } s4 \break
  \repeat volta 2 {
    a'4. g8 a8([ g)] f[( e]) |
    f8 f4( e8) f([ e)] d4 |
    f4.( e8) f[( g)] e([ d)]
    d1
  }
}

stropheAlt = \relative c' {
  \voiceTwo
   c4 |
   b4 b8 b~ 4 c |
   b4 b8 b~ 2 |
   b4 b8( c) d2 |
   c4 a b r4  |
   f'4. e8 f8([ e)] d[( c]) |
   d8 d4( c8) d([ c)] b4 |
   d2 c4 c
    b1
}

stropheBass = \relative c' {
  \clef bass
  g4 |
  4 8 8~ 4 4 |
  4 8 8~ 2 |
  4 4 2 |
  c,4 d g r4 |
  c,4. 8 4 4 |
  g'8 4. 4 4 |
  c,2 d4 4 |
  g1
}

chrdStrophe = \chordmode {
  s4 g1 s s c4 d:m g2
  f1 g c2 d:m g1
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
   \new ChoirStaff <<
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
  >>
}
