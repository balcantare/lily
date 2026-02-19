\version "2.22.2"
fileName = "Devojko.ly"
sheetName = "Devojko"
\include "../include/book.ily"

skipA = \repeat unfold 21 { \skip 4 }

lyrStropheA = {
  \lyricmode {
  \skipA
  \set stanza = #"1. "
  De -- voj -- ko de -- voj -- ko
  mo -- me mre -- na ri -- ba.
  \set stanza = #"1. "
  Mo -- me mre -- na ri -- ba
  cr -- ve -- na ja -- bla -- ka.
}}

lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = #"2. "
  Sa te -- bje sym sle -- sal
  i_ot wrag i_ot pla -- ni -- na.
  \set stanza = #"2. "
  I_ot wrag i_ot pla -- ni -- na
  na zrs -- ta plad -- ni -- na.
}}


lyrStropheC = {
  \lyricmode {\skipA
    \set stanza = #"3. "
    To -- ku da te wid -- ja
    po -- wej -- na -- lo li si.
    \set stanza = #"3. "
    Po -- wej -- na -- lo li si
    i -- li po -- zer -- na lo.
}}

lyrStropheD = {
  \lyricmode {
    \skipA
    \set stanza = #"4. "
    De -- voj -- ko de -- voj -- ko
    kit -- ka zif -- ti na -- bra.
    \set stanza = #"4. "
    Kit -- ka zif -- ti na -- bra
    kit -- ka ras -- scha -- re -- na.
}}


strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle modern %-voice-cautionary
  \time 5/8
  \partial 4
  \key e \minor
  \bar ".|:"
  \repeat volta 4 {
     g8 a |
     b e, e a e |
     b' e, e a e |
     g fs d e fs |
  } \alternative {
     { e e e }
     { e4. }
  } \break
  \repeat volta 2 {
    \voiceOne
  g4 |
  a4. b4 |
  \appoggiatura b16 a4. a4 |
  \acciaccatura {g16 fs} e4. d4 |
  e4. fs4 |
  e4. e4 |
  e4.
  } \break
  \repeat volta 2 {
   d4 |
   e4. fs4 |
   e4. g4 |
   fs4. d4 |
   e4. fs4 |
   e4. e4 |
   e4.
  }
  %  \bar "|."
}


stropheAlt = \relative c' {
  \partial 4
  s4 |
  s8 s s s s | s8 s s s s | s8 s s s s |
  s8 s s s s | s
  \voiceTwo
  e4
  e4. e4 |
  e4. e4 |
  e4. d4 |
  d4. d4 |
  e4. e4 |
  e4.
  d4
  d4. d4 |
  d4. d4 |
  d4. d4 |
  d4. d4 |
  e4. e4 |
  e4. s4 |
}

chrdStrophe = \chordmode {
  s4
  e4.:m s4
  s4. s4
  d4. s4
  e4.:m
  e4.:m s4
  e4.:m s4
  s4. s4 s4. s4 s4. s4 s4. s4 s4. s4
  e4.:m s4
  d4. s4 s4. s4 s4. s4
  e4.:m s4
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.6))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 24)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new	 Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
