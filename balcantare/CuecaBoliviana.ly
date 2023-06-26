\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Cueca Boliviana"


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
    #:factor (/ staff-height pt 21)
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
  U -- nos quie -- ren con el al -- ma,
  o -- tros con el co -- ra --
  \set stanza = #"1. "
  zoń ___
  Yo so -- li -- to te -- he que -- ri -- do al -- ma,
  \set stanza = #"1. "
  vi -- da y co -- ra -- zoń ___
  Yo so -- li -- to te -- he que --
  \set stanza = #"1. "
  ri -- do al -- ma,
  vi -- da y co -- ra -- zoń ___
}}

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   Wohnt die Lie -- be in der See -- le
   o -- der tief im Her -- zen
   \set stanza = #"2. " drin?
   Lass von der See -- le es dir er --  zäh -- len
   und hör
   \set stanza = #"2. " mit dem ___ Her -- zen hin.
   Lass von der See -- le es dir er --
   \set stanza = #"2. " zäh -- len
   und hör mit dem ___ Her -- zen hin.
}}


lyrStropheC = {
  \lyricmode {
   \set stanza = #"3. "
  Sagt die See -- le: 'Ich kann flie -- gen,
  wie ein Vo -- gel hoch und
   \set stanza = #"3. " weit! ___
  Spür ich tief ___ in mir die Lie -- be,
  schweb ich
   \set stanza = #"3. " ü -- ber ___ Raum und Zeit.
  ___ Spür ich tief ___ in mir die
   \set stanza = #"3. " Lie -- be,
  schweb ich ü -- ber ___ Raum und Zeit.'
}}

lyrStropheD = {
  \lyricmode {
   \set stanza = #"4. "
   Fragt das Herz: 'Hörst du mein Sin -- gen,
   mei -- nen wil -- den Trom -- mel --
   \set stanza = #"4. " schlag? ___
   Könnt vor Lie -- ___ -- be fast zer -- sprin -- gen,
   wenn ich
   \set stanza = #"4. "  je -- man -- den ger -- ne mag. ____
   Könnt vor Lie -- ___ -- be fast zer --
   \set stanza = #"4. " sprin -- gen,
   wenn ich je -- man -- den ger -- ne mag.' ____

}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
  'Lass uns doch zu -- sam -- men tan -- zen!'
  Sagt die See -- le, 'denn ich
  \set stanza = #"5. " spür:
   ___ Lie -- ben, das ___ geht nur im Gan -- zen!
   Komm mein
   \set stanza = #"5. " Herz, da -- rum tanz mit mir!
   ___ Lie -- ben, das ___ geht nur im
   \set stanza = #"5. " Gan -- zen!
   Komm mein Herz, da -- rum tanz mit mir!'

}}

lyrStropheF = {
  \lyricmode {
  }}

strophe = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \key c \minor
  g8[ 8 8] 8[ 8 f]
  c4. c
  c'8[ 8 8] ef[ c bf]
  g4. ef8 ef f |
  g4 bf8 bf[ g f]
  ef4 c8~ c[ ef f]
  g4 f8 g[ g ef]
  c4. ef8 ef f
  g4 bf8 bf[ g f]
  ef4 c8~ c[ ef f]
  g4 f8 g[ f ef]
  c4. r4.
\bar "|."
}


stropheAlt = \relative c'' {
  \voiceTwo
  g8[ 8 8] 8[ 8 f]
  c4. c
  g'8[ g g] ef[ ef ef]
  ef4. ef8[ 8 d]
  ef4 g8 g[ ef d]
  ef4 c8~ c[ ef ef]
  d4 d8 d[ ef d]
  c4.
   ef8[ 8 d]
  ef4 g8 g[ ef d]
  ef4 c8~ c[ ef ef]
  d4 d8 d[ ef d]
  c4.
}

stropheBass = \relative c {
  \clef bass
  \key a \minor

}

chrdStrophe = \chordmode {
  c2:m g4 c2.:m s s
  ef c:m g c:m ef c:m g c:m
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
  \new Lyrics \lyricsto "Strophe" \lyrStropheE
  \new Lyrics \lyricsto "Strophe" \lyrStropheF
   %\new Staff <<
   %  \new Voice = "Basso" { \stropheBass }
   %>>
 >>
}
