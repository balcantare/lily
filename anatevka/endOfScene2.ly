\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"End of Scene 2"
sheetNr   = #"4A"

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
  ragged-bottom = ##t
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
    '(1 2 10)) #f))))


BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \set Score.currentBarNumber = #1
    %\override ParenthesesItem.font-size = #4
    \key g \major
    r8\ff <d g b>[ r8 <d g b>]
    r8\> <d g b>[ r8 <d g b>]\!
    \bar "||"
    d4\mf g g <fs a>8 8 |
    8 <g b>8 8 8 4 <a cs>4 |
    <b d>4 4 <a cs>4 4 |
    <g b>8 8 <a d,>8 8 g2 |
    <d d'>4 <g g'>4 4 <a a'>8 8 |
    8 <b b'>8 8 8 4 <cs cs'>4 |
    <d d'>4 4 <cs cs'>4 4 |
    <b b'>8 8 <a a'>8 8 <g g'>2 |
    \repeat volta 2 {
    << { \voiceOne
         \repeat unfold 2
           \repeat unfold 2 { r8 <g b>[ r8 <g b>] } }
       \new Voice { \voiceTwo f1 ~ 1^"Fade 2nd Time" }  >>
    }

  }
}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c {
    \key g \major
      \repeat unfold 11
        \repeat unfold 4 { d8 <g b cs> }
  }
}

Chords = \chords {
  \set chordChanges = ##t
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

