\version "2.24.2"
sheetName = "Lisom, Lisom"
\include "../include/book.ily"

skipA = \repeat unfold 27 \skip 8

lyrStropheA = {
  \lyricmode {
  \skipA
  \set stanza = #"1. "
  Li -- som, li -- som
  pry do -- ly -- ni,
  \set stanza = #"1. "
  zo -- zu -- leň -- ka ku -- kat ny -- ni.
  He -- ja hoj le -- li -- ja,
  Lju -- bo -- van -- ja to 
  ve -- ly -- ka pa -- sy -- ja.
}}

lyrStropheB = {
  \lyricmode {
  \skipA
  \set stanza = #"2. "
  My zo -- zu -- li ne slu -- cha -- ly,
  \set stanza = #"2. "
  lem my zme shia lju -- bo -- va -- ly.
}}

lyrStropheC = {
  \lyricmode {
  \skipA
  \set stanza = #"3. "
  Li -- som, li -- som, do -- ly -- na -- my,
  \set stanza = #"3. "
  pod' -- me, my -- la za chry -- ba -- my.
}}

lyrStropheD = {
  \lyricmode {
  \skipA
  \set stanza = #"4. "
  A my chry -- biw nez -- by -- ra -- ly,
  \set stanza = #"4. "
  lem my zme schia lju -- bo -- va -- ly.
}}

lyrStropheE = {
  \lyricmode {
  \skipA
  \set stanza = #"5. "
  Tam na ho -- ri uz -- ki stiž -- ky,
  \set stanza = #"5. "
  pod' -- me, my -- la na o -- riš -- ky.
}}

lyrStropheF = {
  \lyricmode {
  \skipA
  \set stanza = #"6. "
  My o -- riš -- kiw nez -- by -- ra -- ly,
  \set stanza = #"6. "
  lem my zme schia lju -- bo -- va -- ly.
}}

stropheSopran = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key b \minor
  \repeat volta 2 {
  a8 a a16 b a8
  a4. a8
  a8 g g16 a g8
  g4. g8
  fs8 d fs fs
  e cs e cs
  } \alternative {
    { b4 cs d fs }
    { b,2~ b }
  }
  \break
  b8 d d d
  e d cs b
  \voiceTwo
  d8 fs fs fs 
  g16 fs8. e8 d 
  \break
  \repeat volta 2 {
    fs8 fs fs4
    g8 e e4
    fs8 d d d 
    fs fs fs16 e d8
    b4 b
  }
  r2
  \bar "|."
}

stropheTenor = \relative c' {
  s2*10
  s2*2
 \override NoteHead.font-size = #-2
  \voiceOne
  d8 a' a a
  b16 a8. g8 fs
  a8 a a4
  b8 g g4
  a8 fs fs fs
  a a a16 g g8
  fs4 fs
}
chrdStrophe = \chordmode {
  d2 s e:m s b:m fs b:m s b:m s
  b:m s d s
  d e:m b:m fs b:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  % ragged-last-bottom = ##f
  }
  \bookItem
             
  \score {
    <<
    \new ChordNames \chrdStrophe 
    \new Staff \with {\accepts ChordNames}
    <<
      \context Voice = "StropheSopran" \stropheSopran
      \context Voice = "StropheTenor"  \stropheTenor
    >>
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheD
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheE
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheF
    >>
  }
}
