\version "2.24.2"
sheetName = "Donauwellen"
sheetComposer = "Iosif Ivanovici"
\include "../include/book.ily"

sheetTonality = f

strophe = \relative c' {
  \time 3/4
  \key d \minor
  \accidentalStyle modern-cautionary
  \partial 2
  \bar ".|:"
  \repeat volta 2 {
    \mark \markup{ \box{\fontsize #4 A}}
    c4 bf4 |
    a2.~ |
    a4 cs4 d4 |
    e2.~ |
    e4 cs4 a4 |\break
    f'2.~ | 
    f4 e4 d4 |
    a'2.~ |
    a2 a4 | \break
    bf2.~ |
    bf4 a4 g4 |
    a2.~ |
    a4 g4 f4 | \break
    e2.~ |
    e4 f4 e4 |
    d2.~ |
    d4   
  } \break
 \repeat volta 2 {
   \mark \markup{ \box{\fontsize #4 B}}
   r2 |
   d'4 d4. d8 |
   d4 d4. d8 |
   d8 c4. b4 |
   c2 r4 |
   \break
   bf4 bf4. bf8 |
   bf4 bf4. bf8 |
   bf8 a4. gs4 |
   a2 r4 | \break
   g4 g4. g8 |
   g4 g4. g8 |
   g8 f4. e4 |
   d2 d'4 | \break
   bf4 g4 e4 |
   f2 e4 |
   d2.~ |
   d4   
 }
}

chrdStrophe = \chordmode {
  s2 | a2.:7 | s2. | s2. | s2. | d:m6 | s2. | 
  d:7 | s2. | g:m6 | s2. | d:m6 | s2. | a:7 | 
  s2. | d:m6 | s2.  | bf:7+ | 
  s | c:7 | f:7+ | g:m6 | s | a:7 | d:m6 | 
  g:m6 | s | a:7 | d:m6 | g:m6 | a:7 | d:m6  | 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Walzer |AA|BB| .. Swing }
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
