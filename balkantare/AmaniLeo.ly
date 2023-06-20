\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Amani Leo"


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
    #:factor (/ staff-height pt 16)
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
                             (minimum-distance . 6)
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
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -2.5)
\set stanza = \markup{ \right-brace #50 }
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
skipA = \repeat unfold 3 { \skip 4 }
skipB = \repeat unfold 11 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  A -- ma -- ni le -- o,
  a -- ma -- ni le -- o,
  a --
  \set stanza = #"1. "
  ma -- ni le -- o,
  \dropLyricsA
  tu -- me -- kom -- bo -- le -- wa.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Fu -- ra -- ha le -- o,
  fu -- ra -- ha le -- o,
  fu --
  \set stanza = #"2. "
  ra -- ha le -- o,

}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
   U -- pen -- do le -- o,
   u -- pen -- do le -- o,
   u --
   \set stanza = #"3. "
   pen -- do le -- o,
}}

lyrStropheD = {
  \lyricmode {

}}


strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key d \major
  \partial 8
  a8
  a8. fs16~ 8 d8
  g4 r8 a8
  a8. fs16~ 8 d8
  e4 r8 fs8
  fs8. e16~ 8 d
  g4 r8 g8
  fs8 fs e e
  d4 r8
  \bar "|."
}


stropheAlt = \relative c' {
  %\voiceTwo
  \key d \major
  fs8
  fs8. d16~ d8 a
  d4 r8 fs8
  fs8. d16~ d8 a
  cs4 r8 d8
  d8. cs16~ cs8 d
  d4 r8 d8
  d8 d cs cs
  d4 r8
}

stropheBass = \relative c' {
  %\clef bass
}

chrdStrophe = \chordmode {
   s8
   d2 g d a d g d4 a d4
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
     %\new Voice = "StropheAlt" { \stropheAlt }
   >>
  % \new Lyrics \lyricsto "Refrain" \lyrRefrain
  \new	Lyrics \lyricsto "Strophe" \lyrStropheA
  \new	Lyrics \lyricsto "Strophe" \lyrStropheB
  \new Lyrics \lyricsto "Strophe" \lyrStropheC

  \new Staff <<
     \new Voice = "StropheAlt" { \stropheAlt }
    >>

  \new Lyrics \lyricsto "StropheAlt" \lyrStropheD
  >>
}
