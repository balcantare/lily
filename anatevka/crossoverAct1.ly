\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Crossover Act 1"
sheetNr   = #"12"

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
    '( 2 10 13 14 22 23 28 )) #f))))


BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \set Score.currentBarNumber = #1
    %\override ParenthesesItem.font-size = #4
    \time 2/2
    \key d \major
    \bar ".|:"
    \repeat volta 2 {
      d4-^ \glissando d''8 r d4-^ \glissando d,,8 r
    }
    r8 <a' d fs>8-.\mf 8-. 8-. 8-. 8-. <b fs' a>-. r
    <d fs>-. 8-. <fs b>-. r <d fs>-. 8-. <fs a>-. r
    r <d fs>-. 8-. 8-. 8-. 8-. <fs a>-. r |
    \repeat unfold 2 {<d fs>-. 8-. <fs a>-. r}
    r <cs e>-. 8-. 8-. 8-. 8-. <e g>-. r
    r <b d>-. 8-. 8-. 8-. 8-. <d fs>-. r
    r <a cs>-. 8-. 8-. 8-. 8-. <g e'>-. r
    <fs d'>4-. r r2
    <e' e'>8->(\mp <d d'>8\> ~ 2.\!\pp ~ | 2) r |
    <e e'>8->(\mp <d d'>8\> ~ 2.\!\pp) |
    \repeat volta 2 { r1^"ad lib repeat" }
    \key c \major
    r8 <g, c e>8-.\mp\> 8-. 8-. 8-. 8-.\! <a e' g>-.\p r
    <c e>-. 8-. <e a>-. r <c e>-. 8-. <e g>-. r
    r <c e>-. 8-. 8-. 8-. 8-. <e g>-. r |
    \repeat unfold 2 {<c e>-. 8-. <e g>-. r}
    r <b d>-. 8-. 8-. 8-. 8-. <d f>-. r
    r <a c>-. 8-. 8-. 8-. 8-. <c e>-. r
    r <g b>-. 8-. 8-. 8-. 8-. <f d'>-. r
    <e c'>4-. r r2
    \repeat volta 2 { r1^"ad lib repeat" }
    \key f \major
    r8 <f' a>8-.\pp 8-. 8-. 8-. 8-. <a c>-. r
    <f a>-. 8-. <a d>-. r <f a>-. 8-. <a c>-. r
    r <e g>-. 8-. 8-. 8-. 8-. <g bf>-. r
    r <d f>-. 8-. 8-. 8-. 8-. <f a>-. r
    r <c e>-. 8-. 8-. 8-. 8-. <e g>-. r
    \repeat volta 2 {
      << {\voiceOne
      <g g'>8(\pp <f f'>8 ~ 2. ~ | 2) r |
      <g g'>8( <f f'>8 ~ 2. ~ | 2) r^"ad lib repeat" | }
         \new Voice { \voiceTwo
                      \repeat unfold 2 { r4 <a, c> r <a c> |
                      r4 <bf d> r <bf d> | }

      } >>
    }
  }
}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \clef treble
    \key d \major
    r1 |
    \repeat unfold 12 { d4-. e-. d-. e-. }
    \key c \major
    \repeat unfold 9 { c4-. d-. c-. d-. }
    \key f \major
    \repeat unfold 9 { f4-. g-. f-. g-. }
  }
  }
}

Chords = \chords {
  \set chordChanges = ##t
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

