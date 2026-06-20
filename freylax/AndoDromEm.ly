\version "2.24.2"
sheetName = "Ando Drom Em"
sheetComposer = "Ando Drom"
\include "../include/book.ily"

sheetTonality = g
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key e \minor
\language "english"
e4 e2 e8 g8 |
b2 g2 |
a4 a2 gs8 a8 |
b8 a4. gs8 a4. |\break
fs4 fs2 fs8 g8 |
a2 fs2 |
g4 g2 fs8 g8 |
a8 g4. fs8 g4. |\break
b2 g2 |
e2 b2 |
b4 fs'2 es8 fs8 |
g8 fs4. es8 fs4. |\break
b4 b2 c4 |
b4 a4 g4 fs4 |
g4 e2 ds8 e8 |
fs8 e4. ds8 e4. |
\bar "|."
}

chrdStrophe = \chordmode {
  e1:m | s | a:m | s | 
  d:7 | s | g | b:7 |
  e:m | s | b:7 | s | 
  b:7 | s | e:m |  
}
\bookpart {
  \paper {
    page-count = #1
    system-system-spacing.padding = #6
  }
  \bookItem
  \header{
    subtitle = \markup { langsam .. schnell }
  }
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
