\version "2.22.2"
fileName = "AiMoridschej.ly"
sheetName = "Ai Moridschej"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  Wa -- da -- schu -- ka tru szen -- ja
  Po -- re scha -- ka -- tri qui -- je
  Usch -- da -- dil -- la tru szen -- ja
  Po -- re schu -- ka tri qui -- je.
    A mo -- ri -- dschej
    a mo -- ri tra -- ko tri kon -- je
    A la la la la la la la la la la la la

}}

lyrStropheB = {
  \lyricmode {
    Is -- ta dil -- la tru szen -- ja
    Po -- re schu -- ka hi ki je
    Kos -- te  te sžo pos -- zen -- ja
    Po -- re scha -- ko tri qui je
  }}

lyrStropheC = {
  \lyricmode {
    Ne -- ma kil -- la ne -- ma szar
    Po -- re scha -- ko tri qui je
    Pos -- ta dil -- la pos -- zen -- ja
    Po -- re scha -- ko tri qui -- je
}}


strophe = \relative c'' {
  %\voiceOne
  \time 2/2
  \key a \minor
   %\partial 4.
  a4 a a4 b
  a g a8( g4.)
  e4  e e d
  f8 e4. e2
  a4 a a4 b
  a g a8( g4.)
  e4 e e d
  f8 e4. e2 \break
  \repeat volta 2 {
    d1
    e8 fs4. g4 g4
    g4 a a g
    a8 g4 e8~ 2
    d4 d2 c4
    e4 d8 c e4 d8 c
    a4 a2 g4
    a1
  }
%\bar "|."
}

chrdStrophe = \chordmode {
  a1:m s c s
  a1:m s c s
  g1 s a:m s
  g1 s a:m s
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
    >>
  }
}
