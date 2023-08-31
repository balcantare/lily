\version "2.24.0"
sheetName = "Home is where my heart is"
sheetComposer = "arr. Reinhard Simmgen"
sheetPoet ="dt. Beate Tarrach"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  've_been trav' -- ling a day,
  've_been trav' -- ling a year,
  've_been \set stanza = #"1. "
  trav' -- ling a life -- time
  to find my way home.
  \set stanza = #"1. "
  Home is where my heart is,
  home is where my heart is,
  \set stanza = #"1. "
  home is where my heart is,
  my heart is with you.
}}

lyrStropheABass = {
  \lyricmode {
  \set stanza = #"1.  "
  Trav' -- ling,
  trav' -- ling,
  trav' -- ling,
  trav' -- ling,
  trav' -- ling,
  trav' -- ling,
  my way home.
  \set stanza = #"1. "
  Home is where heart is,
  home is where heart is,
  \set stanza = #"1. "
  home is where heart is, \skip 8
  heart is with you.
}}


lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   Bin_ge -- reist ei -- nen Tag,
   bin_ge -- reist für ein Jahr,
   bin_ge -- 
   \set stanza = #"2. "
   reist all mein Le -- ben,
   mein Herz blieb bei dir.
   \set stanza = #"2. "
   Hei -- mat, wo mein Herz blieb,
   Hei -- mat, wo mein Herz blieb,
   \set stanza = #"2. "
   Hei -- mat, wo mein Herz blieb,
   mein Herz blieb bei dir.
}}

lyrStropheBBass = {
  \lyricmode {
  
  \repeat unfold  15 {\skip 8} 
  \set stanza = #"2. "
  Hei -- mat wo_mein Herz blieb,
  Hei -- mat wo_mein Herz blieb,
  \set stanza = #"2. "
  Hei -- mat wo_mein Herz blieb, mein
Herz blieb bei dir.
}}

strophe = \relative c'' {
  \voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 3/4
  \key c \major
  \partial 4
  \override Rest.staff-position = #0
  \bar ".|:-|"
  \repeat volta 2 {
    r8 g8
    c4 d e d2 r8 g,
    c4 d e d2 r8 g,
    c4 d e  f e r8 c
    f4 e c d2
  } \break
  \repeat volta 2 {
    r4
    c4. g8 c d e4 d2
    c4. g8 c d e4 d2
    c4. g8 c d e4 e4. c8
    f4 e c d2.
  }
  % \bar "|."
}

stropheSopran = \relative c'' {
  \voiceOne
  s8 c
  e4 f g g2 s8 c,
  e4 f g g2 s8 c,
  e4 f g g g s8 g
  a4 g g g2
  s4
  e4. c8 e8 f g4 g2
  e4. c8 e8 f g4 g2
  e4. c8 e8 f g4 g4. g8
  a4 g g g2.
}

stropheBass = \relative c {
  \key c \major
  \clef "bass"
  \accidentalStyle neo-modern %-voice-cautionary
  \partial 4
  r4
  c2 c4 d g,2
  c2 e4 d g,2
  c2 c4 a2 a4
  c4( d) c
  <b d>2_\markup{1.x}^\markup{2.x}
  r4
  c4 c c c d2
  c4 c c c f2
  e4 c c c f4. f8
  f4 g e d2.
}
chrdStrophe = \chordmode {
   s4
   c2. g c g
   c a:m d:m g
   c  g
   c2.  g
   c2.  a:m
   d:m g
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "StropheSopran" { \stropheSopran }
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Staff <<
      \new Voice = "Basso" { \stropheBass }
      >>
        \new Lyrics \lyricsto "Basso" \lyrStropheABass
        \new Lyrics \lyricsto "Basso" \lyrStropheBBass
    >>

  }
}
