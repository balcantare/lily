\version "2.24.2"
sheetName = "On The Sunny Side Of The Street"
sheetComposer = "Dorothy Fields / Jimmy McHugh"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

lyr = {
  \lyricmode {  
    Grab your coat and snatch your hat, leave your wor -- ries on the door -- step
Just di -- rect your feet to the sun -- ny side of the street

Can't you hear that pit -- ter pat and that hap -- py tune is your step
Life can be so sweet, on the sun -- ny side of the street

I used to walk in the shade with the blues on pa -- rade
No lon -- ger a -- fraid, the ro -- ver crossed o -- ver

If I ne -- ver had a cent I'll be rich as Ro -- cke -- fel -- ler
The_gold dust at my feet on the sun -- ny side of the street

  }
}


strophe = \relative c' {
  \time 4/4
  \key c \major
  \partial 4
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 A}}
e8. d16 |
c4 d4 e4 g4 |
e'2. e8. e16 |
d4 c4 a4 f4 |
e2 d2 | \break
c4 d4 e4 c'4 |
b2. gs8 a8 |
c4 a8 f8~ 8 e8 d4 |
c2. \break 
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 A}}
e8. d16 |
c4 d4 e4 g4 |
e'2. e8. e16 |
d4 c4 a4 f4 |
e2 d2 |\break
c4 d4 e4 c'4 |
b2. gs8 a8 |
c4 a8 f8~ 8 e8 d4 |
c8 r8 \break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 B}}
c'4 c4 c4 |
c2 d,8 f4 e8~ |
e2 c'4 c4 |
c2 e,8 g4 f8~ |
f2. \break 
c'4 |
c2 e,8 g4 fs8~ |
fs2. a4 |
b4 d4 r4 e,4 |
f4 a4 r4 \break 
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 A}}
e8 d8 |
c4 d4 e4 g4 |
e'2. e8. e16 |
d4 c4 a4 f4 |
e2 d2 |
c4 d4 e4 c'4 |
b2. gs8 a8 |
c4 a8 f8~ 8 e8 d4 |
c2. 
\bar "|."
}

chrdStrophe = \chordmode {
 s4 | c1 | e1:7 | f1 | g2:7 gs:dim | 
 a1:m7 | d1:7 | d2:m7 g2:7 | c2 g2:7 |
 c1 | e1:7 | f1 | g2:7 gs:dim | 
 a1:m7 | d1:7 | d2:m7 g2:7 | c1 |
 c2:7 g2:m7 | c1:7 | f2:6 c2:7 | f1:6 |
 d2:7 a2:m7 | d1:7 | g1:7 | g1:7 | 
 c1 | e1:7 | f1 | g2:7 gs:dim | a1:m7 |
 d1:7 | d2:m7 g2:7 | c2.  
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Swing | A A B A | }
  }
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 23)
    }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
     \new Lyrics \lyricsto "Strophe" \lyr
    >>
  }
}
