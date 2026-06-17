\version "2.24.2"
sheetName = "Autumn Leaves"
sheetComposer = "Joseph Kosma / Johnny Mercer"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

Lyrics = \lyricmode {
The fal -- ling leaves drift by the win -- dow
The au -- tumn leaves of red and gold
I see your lips, the sum -- mer kis -- ses
The sun- burned hands I used to hold

Since you went a -- way the days grow long
And soon I'll hear old win -- ter's song
But I miss you most of all my dar -- ling
When au -- tumn leaves start to fall

}

strophe = \relative c'	' {
  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
   \partial 2.
  \once\override Score.RehearsalMark.self-alignment-X = #2
  \mark \markup{ \box{\fontsize #2 A}}
a4 b4 c4 |
f1~ |
f4 g,4 a4 b4 |
e2 e2~ |
e4 f,4 g4 a4 |
d1~ |
d4 e,4 fs4 gs4 |
c1 |
r4 a4 b4 c4 |
f1~ |
f4 g,4 a4 b4 |
e2 e2~ |
e4 f,4 g4 a4 |
d1~ |
d4 b4 d4 c4 |
a1 | r2 \break
\once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #2 B}}
gs4 a4 |
b4 e,4 b'2~ |
b4 b4 a4 b4 |
c1~ |
c4 c4 b4 c4 |
d1~ |
d4 g,4 g'4 f4 |
e1~ |
e2 ds4 e4 |
f4 f4 d4 d4 |
b2. f'4 |
e2 e2~ |
e2 a,2 |
d2. c4 |
b2 c4 e,4 |
a1 |
r4 
\bar "|."
}

chrdStrophe = \chordmode {
  \parenthesize a2.:7 | d1:m7 | g1:7 | c1:7+ 
  | f1:7+ | b:m5-7 | e1:7 | a1:m6 | a1:7 |
  d1:m7 | g1:7 | c1:7+ | f1:7+ | b1:m5-7 | 
  e1:7 | a1:m6 | s1 |
  b1:m5-7 | e1:7 | a1:m7 | a:7 |
  d1:m7 | g1:7 | c1:7+ | f1:7+ |
  b1:m5-7 | e1:7 | a2:m7 d:7 | g:m7 c:7 | 
  f1:7+ | e1:7 | a1:m6 |  
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Swing | A B | }
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
