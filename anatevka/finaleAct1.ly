\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Finale Act 1"
sheetNr   = #"19"

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
    '(10 15 )) #f))))


BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c'' {
    \set Score.currentBarNumber = #10
    %\override ParenthesesItem.font-size = #4
    \key g \major

    d8.( cs16 d8 b) g( a) b-. b-. |
    c8( d16 c b8 a-.) b4-- 4-- |
    \time 2/4
    r2 |
    \time 4/4
    d8.( cs16 d8 b) g( a) b-. b-. |
    c8( d16 c b8 a g2) \breathe
    \mark \markup { \musicglyph #"scripts.ufermata" } |
    s1 s1
    c,4--( d8 c b4\mf a)
    d2.\ppp\< <d d'>4\!\f |
    <d d'>2:32\<
    <b' d g>2:32\!\fermata
    g8-^\sfz r r4 r2
  }
}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \key g \major
    s1 s1 s2 s1 s1
    r4 g-.\p <b d>-. r |
    g-. r <b d>-. r\fermata |
    g4 d2 d4 |
    d2. d4-> |
    d2-> g->\fermata |
    g,8-^ r r4 r2
    \bar "|."
  }
}

Chords = \chords {
  \set chordChanges = ##t
  s1 s1 s2 s1 s1
  g1
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

