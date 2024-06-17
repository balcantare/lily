\version "2.22.2"
sheetName = "Pacha Mama"
sheetComposer = "Ronny Hickel"
\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
    Pa -- cha ma -- ma, __
    I'm co -- ming home
    to the place __ where I be -- long.
  
    I wa -- na be free, so free like the dol -- phin in the sea,
    like the flo -- wers and the bees, like the birds in the trees.
    I wa -- na fly high, so high like an eag -- le
    in the sky.
    And when my time has come I'm gon -- na lay down and die.
    And when my time has come I'm gon -- na rise up and fly.
    
 }}

strophe = \relative c'' {
  \partial 2
  \voiceOne
  \override Rest.staff-position = #0
  \time 4/4
  \key c \minor
  \bar ".|:"
  \repeat volta 2 {
    r4 g8 g
    c c4.~ c8 8 8 8
    bf2. bf8. bf16
    c2~ c8 c c bf
    c2
  } \break
  r8 c c16 bf c8
  c4. g8 bf4. bf16 bf
  a8 a a bf c4. \break  g16 g
  c8 c c c bf4.  bf16 bf
  a4 a8 a g c c16 bf c8
  c4. \break c8 bf4. bf16 16
  a8 a a bf c4. c8
  c8 c c c bf bf bf bf
  a4 a8 bf c4. g8
  c8 c c c bf8 bf bf bf
  a4 a8 bf c2
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  s4 c8 c
  g' g4.~ 8 8 8 8 
  f2. f8. ef16
  f2~ 8 ef f ef
  c2 s8 g' g16 f g8
  c,4. g'8 f4. f16 ef
  f8 f f ef c4. c16 16
  g'8 g g g f4. f16 ef
  f4 f8 ef c g' g16 f g8
  c,4. g'8 f4. f16 ef
  f8 f f ef c4. c8
  g'8 g g g f f f ef
  f4 f8 ef c4. c8
  g'8 g g g f f f ef
  f4 f8 ef c2
  

}

stropheBass = \relative c' {
%  \clef "bass"
  \key c \minor
  r4 ef8 ef
  ef ef4.~ 8 8 8 8
  d2. f8. g16
  a2~ 8 a f g
  g2
  r8 g g16 f g8
  g4. ef8 d4. d16 ef
  c8 c d ef c4. c16 16
  ef8 8 8 8 d4. d16 ef
  c4 d8 ef c g' g16 f g8
  g4. ef8 d4. d16 ef
  c8 c d ef c4. c8
  ef8 8 8 8 d d d ef 
  c4 d8 ef c4. c8
  ef8 ef ef ef d d d ef
  c4 c8 bf c2
}

chrdStrophe =  \chordmode {
  s2 c1:m 
  bf f c:m
  c2:m bf f c:m
  c bf f c c bf f c
  c bf f c c bf f
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \transpose c c \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose c c \strophe }
      \new Voice = "StropheAlt" { \transpose c c \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Staff <<
      \new Voice = "StropheBass" { \transpose c c \stropheBass }
      >>

    >>
    \layout {
      \context {
        \Lyrics
        \override LyricText.font-size = #2.5
      }
    }
  }
}
