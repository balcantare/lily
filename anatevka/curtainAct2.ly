\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Curtain Act 2"
sheetNr   = #"33"

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
    '(1 7 9 17 22 26 28 35 44 )) #f))))


BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \set Score.currentBarNumber = #1
    %\override ParenthesesItem.font-size = #4
    \repeat percent 6 { c4 r g r }
    \repeat volta 3 { \repeat percent 2 { c4^"play 3x" r g r } }
    << { \voiceOne c'8 d e f g a b c |
         d4--( g,) g2-- ~ | 4 r r2 | r1 |
         bf4-. 4-. af-. bf-. | c1 | r1 |
         \time 6/4
         r2 r2 r4 c--( |
         \time 4/4 f c-.) 4-. 4-. |
         c2. c4( | bf) bf a g | f2 r2 |
         \time 6/4
         s1 s2
         \time 4/4

       }
       \new Voice { \voiceTwo
         \repeat unfold 14 { c,4 r g r }
       }
    >>
    <bf' bf'>4-. 8-. <c c'>-. <d d'>4-. <ef ef'>4-. |
    <f f'>8-. <e e'>-. <f f'>-. <g g'>-. <f f'>4-. <d d'>4-. |
    <ef ef'>4 8 <f f'> <ef ef'>4-. <c c'>-. |
    <d d'>1\>
    <<  { \voiceOne s1\! s2^"(Last Time)" s4 r8 g,  |
          g8\p <c e>8 ~ 2. ~ | 1 }
          \new Voice { \voiceTwo
                       \repeat volta 6 { c,4--\mp r g r | c r g r }
          s1 c4 r g r | c4 r g r |
          c4\> r g r | c4 r g r | c4 r\! g\ppp r |  }
          \new Voice { \voiceThree s1 s1 \tieDown g'1  ~ 1 }
    >>
    \oneVoice
    r2\fermata r4 g'4\p^"solo vl" |
    c( g-.) g-. g-. | g2~ 8 r g4( | f-.) f e f |
    g2 ~ 8 r g4 |
    c( g-.) g-. g-. | g2~_"ritard" 8 r g4 |
    f_"(dictated)" \breathe f \breathe  e \breathe f \breathe |
    r1 r1 <c c'>\p ~ 1 <c c'> ~ 1 \breathe \bar "|."

  }
}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \repeat percent 6 { c,4 r g r }
    \repeat percent 2 { c4 r g r }
    \repeat unfold 26 { c4 r g r }
    r1\fermata \repeat unfold 9 r1
    <c c'>1 ~ 1 <c c'>1 ~ 1

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

