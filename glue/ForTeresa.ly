\version "2.24.2"
sheetName = "For Teresa"
sheetComposer = "Dirk Reuter"
\include "../include/book.ily"

strophe = \relative c' {
  %\voiceOne
  \time 4/4
  \clef "treble" \numericTimeSignature\time 4/4 
  \key c \major | % 1
  r2 - "Bossa Nova" \stemUp e8 \stemUp f8 \stemUp e8 \stemUp
  c'8 ~ | % 2
  \stemDown c4 r8 \stemDown b8 \stemUp c8 \stemUp b8 \stemUp a8
  \stemUp gs8 | % 3
  \stemUp a2  r8 \stemUp f8 \stemUp e8 \stemUp d8 ~ | % 4
  \stemUp d4 r8 \stemUp f8 \stemDown gs8 \stemDown b8 \stemDown d8
  \stemDown f8 | % 5 
  \break
  \stemDown b,2  r8 \stemDown c8 \stemDown b8 \stemDown gs'8 ~ | % 6
  \stemDown gs4. \stemDown gs8 \times 2/3 {
    \stemDown gs4 \stemDown a4 \stemDown b4
  }
  | % 7
  e,1  | % 8
  \stemDown e'8 -.  r8 r8 \stemDown e8 -. r2 | % 9 
  \break
  r2  \stemUp e,,8 \stemUp f8 \stemUp e8 \stemUp c'8 ~ |
  \barNumberCheck #10
  \stemDown c4. \stemDown b8 \times 2/3 {
    \stemDown b4 \stemDown c4 \stemDown cs4
  }
  | % 11
  \stemDown d4.  \stemDown e16 \stemDown f16 \times 2/3 {
    \stemDown e4 \stemDown d4 \stemDown c4
  }
  | % 12
  \stemDown b4. \stemDown b8 \times 2/3 {
    \stemDown b4 \stemDown c4 \stemDown d4
  } 
  \break
  | % 13
  \stemDown e8  \stemDown d8 \stemDown f8 \stemDown d8 \stemDown
  gs8 \stemDown d8 \stemDown gs8 \stemDown a8 | % 14
  \stemDown b4. \stemDown b16 \stemDown c16 \times 2/3 {
    \stemDown b4 \stemDown a4 \stemDown gs4
  }
  | % 15
  a1 | % 16
  R1
\bar "|."
}

chrdStrophe = \chordmode {
  a1:m6 s d:m6 s e:7 s a:m6 e:7
  a:m6 s d:m6 s e:7 s a:m6
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##t
    system-system-spacing.padding = #8
  }
  \bookItem
  \score {
    \layout {#(layout-set-staff-size-with-jazz 24)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
