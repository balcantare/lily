\version "2.22.2"
sheetName = "Tum Balalaike"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Ste'it a bo -- cher
  un -- _ er tracht,
  tracht un tracht a
  gan -- ze Nacht.
  We -- men zu nem -- men
  un nischt far -- sche -- men.
  We -- men zu nem -- men
  un nischt far -- sche -- men.

  Tum ba -- la, tum ba -- la,
  tum ba -- la -- lai -- ke,
  tum ba -- la, tum ba -- la,
  tum ba -- la -- lai -- ke,
  tum ba -- la -- lai -- ke,
  schpil, ba -- la -- lai -- ke.
  Schpil, ba -- la -- lai -- ke,
  frei -- lech soll sain!
  }}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Me'i -- dl, Me'i -- dl,
  ch'wil bai dir fregn,
  Wos kenn wak -- sn, waksn
  ohn regn?
  Wo -- s kenn bren -- nen
  un nischt oif -- hern?
  \skip 8 Wo -- s kenn ben -- ken,
  we'i -- nen ohn trern?
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Narrisch -- er bo -- cher,
    wos darfs -- tu fregen?_A ste'in kenn wak -- sn,
    waksn ohn regn.
    Lie -- be kenn bren -- nen
    un nischt oif -- hern.
    \skip 8 A harz kenn ben -- ken,
    we'i -- nen ohn trern.
}}


strophe = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 3/4
  \key c \minor
  g2 g4
  g2 g4
  g f ef
  d2.
  f2 f4 f2 f4
  f( ef) d
  c2.
  c4 ef g
  c2 c4
  ef d c
  g2 g4
  bf af f
  d2 d4
  f ef d
  c2 c4
  \bar "||" \break
  g'4. g8 g4
  g4. g8 g4
  g4 f ef
  d2 d4 \break
  f4. f8 f4
  f4. f8 f4
  f4 ef d
  c2 c4 \break
  c ef4. g8
  c2 c4
  ef4 d4. c8
  g2 g4
  bf4 af4. g8
  d2 f4
  f ef4. d8
  c2 r4
   \bar "|."
}

chrdStrophe = \chordmode {
  c2.:m s s g
  f:m s  g:7 c:m
  c:m s f:m c:m f:m
  s g:7 c:m
  c2.:m s s g
  f:m s  g:7 c:m
  c:m s f:m c:m f:m
  s g:7 c:m
  
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.5))
  }
  \bookItem
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
