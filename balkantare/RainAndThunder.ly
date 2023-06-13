\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Rain and Thunder"


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
    #:factor (/ staff-height pt 23)
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
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -3)
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
skipA = \repeat unfold 4 { \skip 4 }
skipB = \repeat unfold 8 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Rain, rain rain and thun -- der,
  wake the thir -- ty earth from slum -- ber.
  Rain, rain rain and thun -- der
  fal -- ling on the ground.

  If I had a piece of ground,
  then I would plant seeds all a -- round.
  Beans and peas and corn so sweet,
  the things I like to eat.

  If I had the time to grow it,
  plant and wa -- ter, rake and hoe it,
  it would be the gree -- nest gar -- den
  a -- ny -- one has seen.
}}

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "

}}


lyrStropheC = {
  \lyricmode {
   \set stanza = #"3. "

}}

lyrStropheD = {
  \lyricmode {
   \set stanza = #"4. "
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
}}

lyrStropheF = {
  \lyricmode {
  }}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \major
  \bar ".|:"
  \repeat volta 2 {
  d4 d d8 d fs a
  g8.[ fs16 e8 d] cs e cs a
  d4 d d8 d fs a
  g8[ fs e8. cs16] d2 }
  a'16[ a8. a8. fs16] g8[ g g8. e16]
  fs8[ fs fs d ] e cs16( b) a4
  a'8 a a fs g[ g g8. g16]
  fs8 d e cs d2 |
  a'16[ a8. a8. fs16] g8 g g16 e r8
  fs8 fs fs d e e e cs
  a'[ 16 a8. fs8] g8[ g g8. e16]
  fs8[ d e16 cs8( d16)~] d8 d4.
  \bar "||" \break
  a'4 fs g e |
  fs a g8 fs e4
  a4 fs g e
  fs a a2
  a4 fs g e |
  fs a g8 fs e4
  a4 fs g e
  fs a d,2
\bar "|."
}

stropheSopran = \relative c'' {
  %\voiceThree

}

stropheAlt = \relative c'' {
  %\voiceTwo

}

stropheBass = \relative c {
  \clef bass
  \key a \minor

}

chrdStrophe = \chordmode {
   d2 b:m g a d b:m g4 a d2
   d2 g d a d g d4 a d2
   d2 g d a d g d4 a d2
   d2 g d a d g d4 a d2
   d2 g d a d g d4 a d2
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
     %\new Voice = "StropheSopran" { \stropheSopran }
     \new Voice = "Strophe" { \strophe }
     \new Voice = "StropheAlt" { \stropheAlt }
   >>
  % \new Lyrics \lyricsto "Refrain" \lyrRefrain
  \new	Lyrics \lyricsto "Strophe" \lyrStropheA
  \new	Lyrics \lyricsto "Strophe" \lyrStropheB
  \new Lyrics \lyricsto "Strophe" \lyrStropheC
  \new Lyrics \lyricsto "Strophe" \lyrStropheD
  \new Lyrics \lyricsto "Strophe" \lyrStropheE
  \new Lyrics \lyricsto "Strophe" \lyrStropheF
   %\new Staff <<
   %  \new Voice = "Tenor" { \stropheSopran }
   %>>
 >>
}
