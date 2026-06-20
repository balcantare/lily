\version "2.24.2"
sheetName = "Besame Mucho"
sheetComposer = "Consuelo Velazquez"
\include "../include/book.ily"

sheetTonality = ef
octaveBf = 0

Lyrics = \lyricmode 
{
 Be   --  sa  --  me, Be --  sa -- me 
 mu -- cho, 
   Co -- mo si‿fu -- e -- ra esta no -- che, 
   La ul -- ti -- ma vez 
   Be -- sa -- me, Be -- sa -- me Mu -- cho, 
   Que ten -- go mi -- e -- do per -- der -- te, 
   Per -- der -- te despu -- es
   Quie -- ro Sen -- tir -- te muy cer -- ca, 
   Mi -- rar -- me‿en tus o -- jos, 
   Ver -- te jun -- to‿a mi 
   Pien -- sa que tal vez mañ -- a -- na, 
   Yo ya‿es -- ta -- re le -- jos, Muy le -- jos de ti 
}
strophe = \relative c' {
  \time 4/4
  \key d \minor
\language "english"
  \partial 1
  \repeat volta 2 {
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 A}}
d4. d8 d2~ |
d2   \tuplet 3/2 {d4 e4 f4} |
a2 g2~ |
g2. r4 |\break
  \tuplet 3/2 {g4 g4 g4}   \tuplet 3/2 {a4 a4 a4} |
  \tuplet 3/2 {bf4 bf4 bf4}   \tuplet 3/2 {c4 d4 e4} |
a,1~ |
a2. r4 |\break
d4. d8 d2~ |
d2   \tuplet 3/2 {d4 c4 bf4} |
a2 g2~ |
g2. \break a4 |
  \tuplet 3/2 {d4 a4 f4}   \tuplet 3/2 {a4 f4 d4} |
  \tuplet 3/2 {f4 e4 d4}   \tuplet 3/2 {e4 d4 cs4} |
d1~ |
d2. r4  } \break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 B}}
  \tuplet 3/2 {bf'4 g4 g4}   \tuplet 3/2 {g4 f4 e4} |
  \tuplet 3/2 {f4 f4 f4}   \tuplet 3/2 {f4 e4 d4} |
  \tuplet 3/2 {e4 e4 e4} \tuplet 3/2 {e4 f g}  |
a2. r4 |
\break
  \tuplet 3/2 {g4 g4 g4}   \tuplet 3/2 {g4 f4 e4} |
  \tuplet 3/2 {f4 f4 f4}   \tuplet 3/2 {f4 e4 d4} |
  \tuplet 3/2 {e4 e4 e4}   \tuplet 3/2 {e4 g4 f4} |
e2. r4 |
  
\bar "|."
}

chrdStrophe = \chordmode {
  d1:m6 | s | g:m7 | s | 
  g2:m7 g:m6/fs g:m7/f a:7 | d1:m6 | a1:7 | 
  d:7 | s | g:m6 | s | 
  d:m6 | g2:m6/bf a:7 | 
  d1:m6 | \parenthesize a:7
  g1:m6 | d1:m6 |
  e2:m5-7 a:7 | d:m7 d:7 | 
  g1:m6 | d:m6 | e:7 | a:7  
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Latin | A A B | }
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
      \new Lyrics \lyricsto "Strophe" \Lyrics
    >>
  }
}
