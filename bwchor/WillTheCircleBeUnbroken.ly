\version "2.22.2"
sheetName = "Will the circle be unbroken"
sheetComposer = "Jonny Cash"
sheetPoet = "Jerry Lee Lewis"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"ref 1-11. "
  Will the circ -- le
  be un -- bro -- ken
  \set stanza = #"ref 1-11. "
  By and by Lord, by and by
  There's a bet -- ter
  \set stanza = #"ref 1-11. "
  home a -- wai -- ting
  In the sky Lord, in the sky
}}

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   I was stan -- ding
   by the win -- dow
   \set stanza = #"2. "
   On one cold and clou -- dy day
   When I saw the
   \set stanza = #"2. "
   hearse come rol -- ling
   For to car -- ry_my mo -- ther_a -- way
}}
lyrStropheC = {
  \lyricmode {
   \set stanza = #"4. "
   I said to the un -- der -- ta -- ker
   \set stanza = #"4. "
   Un -- der -- ta -- ker please drive slow
   For this la -- dy
   \set stanza = #"4. "
   you are car -- rying
   Lord I hate to see her go
}}
lyrStropheD = {
  \lyricmode {
   \set stanza = #"6. "
   Oh, I fol -- lowed close be -- hind her
   \set stanza = #"6. "
   Tried to hold up and be brave
   But I could not
   \set stanza = #"6. "
   hide my sor -- row
   When they laid her in the grave
}}
lyrStropheE = {
  \lyricmode {
   \set stanza = #"8. "
   I went back home,
   the_home was lone -- some
   \set stanza = #"8. "
   Since my mo -- ther, she was gone
   All my bro -- thers
   \set stanza = #"8. "
   and_sis -- ters cry -- ing
   What a home so sad and_a -- lone
}}
lyrStropheF = {
  \lyricmode {
   \set stanza = #"10. "
   We sang so -- ngs o -- f child -- hood
   \set stanza = #"10. "
   Hymns of faith that made us strong
   Ones that mo -- ther
   \set stanza = #"10. " may -- belle
   taught us
   Hear the an -- gels sing a -- long
}}

strophe = \relative c' {
  \voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key g \major
  \partial 4
  \override Rest #'staff-position = #0
  d8 e
  g4 g r b8 a
  g4 b r \bar "" \break
  b8 a
  g4 a g e
  d2. d8 e
  g4 g r \bar "" \break
  b8 d
  d4( b8 a) g4 g8 a
  b4 b a b8( a)
  g2.
  \bar "|."
}

stropheSopran = \relative c'' {
  \voiceOne
  g8 a
  b4 b s d8 c
  b4 d s d8 d
  c4 c c d
  b2. b8 a
  g4 b s d8 g
  g4( e) d b8 c
  d4 d c d8 c
  b2.
}

stropheBass = \relative c {
  \key g \major
  \clef "bass"
  \accidentalStyle neo-modern %-voice-cautionary
  \bar "|."
  \partial 4
  d8 e
  g4 g r g8 e
  d4 g r g8 g
  c4 c a g
  g2. d8 e
  g4 g r g8 a
  b4 g g e
  d4 g e fs
  g2.
}


chrdStrophe = \chordmode {
   s4
   g1 s c g  s e:m g2 d g
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    \new Staff <<
      \new Voice = "Basso" { \stropheBass }
      >>
    >>
  }
}
