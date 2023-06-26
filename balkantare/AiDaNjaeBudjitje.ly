\version "2.22.2"
fileName = "AiDaNjaeBudjitje.ly"
sheetName = "Ai da njä Budjitje"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
  Ai da njä bu -- dji -- tje
  tu -- men man ma -- la -- do -- wa
  ai da po -- ka sol -- nusch -- ka
  ro -- ma -- le
  njä sai -- djot.

  e -- e -- ej e -- ej lju -- ba
  da -- nu -- li tscha -- tscho da -- le
  ai po -- ka sol -- nusch -- ka
  ro -- ma -- ___ -- le
  njä said -- jot.
}}

skipA = \repeat unfold 14 { \skip 4 }

lyrStropheB = {
  \lyricmode {
  Ai -- ___ -- den tschi den tschi
  ___ zi -- wo -- nes -- ke wol -- ja
  jo -- ___ -- we we -- li -- dja -- la
  pre ba -- ch i dol -- ja
  \skipA
  jo -- we we -- li -- dja -- la
  pre ba -- ch i dol -- ___ -- ja
}}

lyrStropheC = {
  \lyricmode {
  Ai sa -- chatsch -- ki rend -- tsches
  oi lus -- tri o jaga o__ja -- ga
  tscho ___ njä sa -- patsch -- ka -- tj
  tscha -- ves -- ke te -- ra -- cha
  \skipA
  tscho  njä sa -- patsch -- ka -- tj
  tscha -- ves -- ___ -- ke te -- ra -- cha
}}

strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle modern %-voice-cautionary
  \time 4/4
  \key e \minor
  b4. a8 b4 b8( c) |
  a4.( g8) g4 r8. b16 |
  b4. a8 b4 b8( c) |
  a4.( g8) g4 r4 | \break
  b4. a8 b4 b8( c) |
  a4. g8 a4 r8 b |
  a8( g) g2 fs8 e8 |
  e2 r2 | \break
  b' d |
  cs4. r8 d4 cs |
  b4 b r b8 b |
  b4. a8 c4 b8 a |
  r4 b4 b b8( c) |
  a4. g8 a4 r8 b8 |
  a4 b8( a) g4 fs8 e |
  e2 r |

  \bar "|."
}

chrdStrophe = \chordmode {
  e2.:m s4 %a4:m
  b2:7 e:m
  e2.:m s4 %a4:m
  b2:7 e:m
  e2.:m s4 %a4:m
  a2:m b2:7
  c b:7  e1:m
  g a e:m
  a2:m b2:7
  e1:m
  a2:m b2:7
  c2 b2:7
  e1:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName

  \score {
  <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
       >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
  >>
  }
}
