\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Act 1 Opening"
sheetNr   = #"2"

bookTitle = \markup {
  \fontsize #3 \larger \larger
  \line { \box{ #sheetNr } #sheetName }
}
\header { title = \bookTitle  tagline = ##f }

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 0.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  %page-count = #1
  markup-system-spacing = #'((basic-distance . 2)
                             (minimum-distance . 2)
                             (padding . 1))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \line{
        \box{ #sheetNr } #sheetName \hspace #1
        - \hspace #1 \fromproperty #'page:page-number-string
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1 6 11 15 )) #f))))


BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \set Score.currentBarNumber = #1
    %\override ParenthesesItem.font-size = #4
    \key g \major
    \repeat unfold 2 {
    b4 a8 b c4 b8 c |
    d8 d c d e4 d8 e |
    f4 e8 f g4 f8 g |
    a8 a g a b4 b8 c |
    << { \voiceOne d1 }
       \new Voice
       { \voiceTwo \repeat unfold 2 { r8 <g, b>[ r8 <g b>]} }
    >> \oneVoice
    }
    d4 g g <fs a>8 8 |
    8 <g b>8 8 8 4 <a cs>4 |
    <b d>4 4 <a cs>4 4 |
    <g b>8 8 a a g2 |
    << { \voiceOne
         \repeat unfold 2
           \repeat unfold 2 { r8 <g b>[ r8 <g b>] } }
       \new Voice { \voiceTwo f1 ~ 1 }  >>
    \bar "|."
  }
}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c {
    \key g \major
    \repeat unfold 2 {
      \repeat unfold 4
        \repeat unfold 4 { g8 <f' a> }
      \repeat unfold 4 { d cs' }
    }
    \repeat unfold 4
      \repeat unfold 4 { d,8 <g b cs> }
    \repeat unfold 2
      \repeat unfold 2 { <d cs'>[ r <d cs'>] r }
  }
}

Chords = \chords {
  \set chordChanges = ##t
  \repeat unfold 2 {
  d1:m/g s1*3
  g1:11+/d
  }
  g1:11+/d

}

\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override BarNumber.Y-offset = 0
    \override BarNumber.X-offset = 0
  }
}


\score {
  \new GrandStaff <<
    \new Staff = "up" {
      \BandR
    }
    \Chords
    \new Staff = "down" {
      \clef bass
      \BandL
    }
  >>
}

