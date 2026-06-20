\version "2.24.2"
sheetName = "All Of Me"
sheetComposer = "Seymour Simons Gerald Marks"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

Lyrics = \lyricmode {
 All of me
 Why not take all of me
 Can't you see
 I'm no good with -- out you
 Take my lips
 I want to lose them
 Take my arms
 I'll ne -- ver use them
 Your good -- bye left me with eyes that cry
 How can I go on dear, with -- out you
 You took the part that once was my heart
 So why not take all of me.
}

strophe = \relative c'' {
  \time 4/4
  \key c \major
\language "english"
  \partial 1
  \bar ".|:"
  \repeat volta 2 {
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 A}}
    c4. g8 e2~ |
e2   \tuplet 3/2 {c'4 d4 c4} |
b4. gs8 e2~ |
e1 |\break
a4. g8 e2~ |
e4 ds4   \tuplet 3/2 {e4 bf'4 a4} |
g2 f2~ | 
f1 |\break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 B}}
e4. ef8 d2~ |
d2   \tuplet 3/2 {e4 gs4 b4} |
d2 c2~ |
c1 |\break
b4. bf8 a2~ |
a2   \tuplet 3/2 {a4 d4 b4} |
a1 |
b1 |\break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 A}}
c4. g8 e2~ |
e2   \tuplet 3/2 {c'4 d4 c4} |
b4. gs8 e2~ |
e1 |\break
a4. g8 e2~ |
e4 ds4   \tuplet 3/2 {e4 bf'4 a4} |
g2 f2~ |
f1 |\break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 C}}
d'2 c4 b4 |
d2. c4 |
b2 e,4 g4 |
b2. a4 |\break
c2 a4 c4 |
e2 e2 |
\once \override Score.RehearsalMark.self-alignment-X = #LEFT
\mark \markup{ \box{\fontsize #2 ..Coda}}
c1 |
r1 |}
\break
\once \override Score.RehearsalMark.self-alignment-X = 0
\mark \markup{ \box{\fontsize #2 Coda}}
b2 e,4 gs
b2 a c2 a4 c4 |
e2 e2 |
c1 |
r1 |


\bar "|."
}

chrdStrophe = \chordmode {
  c1 | s1 | e1:7 | s1 | 
  a1:7 | s1 | d1:m7 | s1 | 
  e1:7 | s1 | a1:m7 | s1 | 
  d1:7 | s1 | d1:m7 | g1:7 | 
  c1 | s1 | e1:7 | s1 | 
  a1:7 | s1 | d1:m7 | s1 | 
  d1:m7 | ef1:dim | c:6 
  a:7 d:m7 | g1:7 | c1 | 
  d2:m7 g2:7 | 
  e1:m7 a:7 d:m7 g:7 c
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Swing C |: A B A C :| Coda }
  }
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 22)
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
