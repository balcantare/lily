\version "2.22.2"
fileName = "AjDevlaleKojOdi.ly"
sheetName = "Aj Dewlale Koj Odi"
\include "../include/book.ily"

skipA = \repeat unfold 24 { \skip 2 }

lyrStropheA = {
  \lyricmode {
    Aj Dēw -- la -- le koj o -- di
    Ta -- vel man -- ge Bach -- ta -- li
    %\dropLyrics
    Oi le le le le le
    tai na na nai na na
    Oi le le le le ta -- i na na na na na
    %\raiseLyrics
    Mu -- ri zi -- ni lu -- lud -- ji
    lu -- lu djen -- gi schu -- kar raji
    %\dropLyrics
    tai na na na na le le le le na na na na na
    %\raiseLyrics
    Oi le le da -- na da da da ne ne ne
    tai na na na na tai la la la da da da de na
}}

lyrStropheB = {
  \lyricmode {
    Tschor da -- ni pe lu -- lu -- dji
    te na djal -- tar la -- ko dji
    \skipA
    te na djal -- tar la -- ko dji
    Tsch'av -- lā me schu -- kar bōr -- ōri
}}

lyrStropheC = {
  \lyricmode {
  Usch -- ti op -- re sche -- je Hoj,
  Hū -- lav tut tai la -- schār tut
  \skipA
  Hū -- lav tut tai la -- schār tut
  A -- ven le rom, man -- gen tut!
}}

lyrStropheD = {
  \lyricmode {
  Aj, Dēw -- la -- le Jal -- din -- la
  pe Ker -- tschi -- ma tra -- de -- la
  \skipA
  pe Ker -- tschi -- ma, pe bā -- ri
  kaj pi -- jen e -- mol ta -- ti
}}

strophe = \relative c' {
  %\voiceOne
  \time 2/4
  \key e \minor
  \repeat volta 2 {
    \set Score.repeatCommands = #'((volta "1") end-repeat)
   e8 g g fs |
   g16 fs8. e8 r |
   e'16 d8. d8 b |
   b a g r
   \bar "||" | \break
   \set Score.repeatCommands = #'((volta "2") end-repeat)
   \bar ".|:" r8 g g fs |
   g4 fs8 e |
   r8 e' d b |
   b4 a8 g
   \bar "|" |
  \set Score.repeatCommands = #'((volta #f))
   \break
   r a a16 g a8 |
   a a16 c b8 a |
   b8 b4 b8~ |
   b8 r8 r4 |
   \break
   e,8 g g fs |
   g fs e4 |
   e'8 d d b |
   b a g r |
   \break
   fs16 e d8 d fs |
   g16 fs g8 a g16 fs |
   e8 e4 e8~ |
   e r r4  \bar ":|.|:" |
   \break
   \repeat volta 2 {
      <g b>2 |
      <a c>4. 8 |
      <g b>16 <fs a>16 <g b>8 8 8 |
      <b d>8 <a c> <g b> r |
      \break
      fs16 e d8 d fs |
      g16 fs g8 a4 |
      g16 fs e8 e4~ |
      e8 8 r4 |
   }
  }
}

chrdStrophe = \chordmode {
  e2:m s g s
  e2:m s s4 g s2
  a:m s b:7 s
  e:m s g s
  d b:7 e:m s
  g d:7 g s
  d b:7 e:m s
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
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
