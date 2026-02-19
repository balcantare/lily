\version "2.22.2"
sheetName = "Ai da njä Budjitje"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Ai da njä bu -- dji -- tje
  \set stanza = #"1. "
  tu -- men man ma -- la -- do -- wa
  \set stanza = #"1. "
  ai da po -- ka sol -- nusch -- ka
  ro -- ma -- le
  njä sai -- djot.

  a -- a -- ej e __ ej __ lju -- ba
  da -- nu -- li tscha -- tscho da -- le
  ai po -- ka sol -- nusch -- ka
  ro -- ma -- le
  njä sa -- id -- jot.
}}

skipA = \repeat unfold 14 { \skip 4 }

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Ai -- ___ -- den tschi den tschi
  \set stanza = #"2. "
  ___ zi -- wo -- nes -- ke wol -- ja
  \set stanza = #"2. "
  jo __ _ we we -- li -- dja -- la
  pre ba -- ch i dol -- ja
  \skipA
  jo -- we we -- li -- dja -- la
  pre ba -- ch i dol __ _ ja
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Ai sa -- chatsch -- ki rend -- tsches
  \set stanza = #"3. "
  oi lus -- tri o jaga o__ja -- ga
  \set stanza = #"3. "
  tscho ___ njä sa -- patsch -- ka -- tj
  tscha -- ves -- ke te -- ra -- cha
  \skipA
  tscho  njä sa -- patsch -- ka -- tj
  tscha -- ves -- ke te -- ra __ _ cha
}}

strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle modern %-voice-cautionary
  \time 4/4
  \key e \minor
  b4. a8 b4 b8( c) |
  a4.( g8) g4 r8. \bar "" \break b16 |
  b4. a8 b4 b8( c) |
  a4.( g8) g4 r4 | \break
  b4. a8 b4 b8( c) |
  a4. g8 a4 r8 b |
  a8( g) g2 fs8 e8 |
  e2 r2 | \break
  \repeat volta 2 {
   <b' g> <d b> |
  <cs a>4. r8 <d b>8( <cs a>) <d b>8( <cs a>) |
  <cs a>8( <b g>8) 4 r <b g>8 8 |
  <b g>4. <a fs>8 <c a>4 <b g>8 <a fs> |
  r4 <b g>4 4 8( <c a>) |
  <a fs>4. <g e>8 <a fs>4 r8 <b g>8 |
  <a fs>8( <g e>8) <g e>4 <g e>4 <fs e>8 <e ds> |
  e2 r |
  }
  %\bar "|."
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
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 24)
  }
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
