\version "2.22.2"
sheetName = #"Zogen einst fünf wilde Schwäne"
\include "book.ily"


dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -4.5)
\override LyricHyphen.extra-offset = #'(0 . -4.5)
\override LyricExtender.extra-offset = #'(0 . -4.5)
\override StanzaNumber.extra-offset = #'(0 . -3.5)
\set stanza = \markup{ \right-brace #70 }
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

skipA = \repeat unfold 18 { \skip 2 }
skipB = \repeat unfold 5 { \skip 2 }
lyrStropheA = {
  \skipA
  \lyricmode {
  \set stanza = #"1. "
  Zo -- gen einst fünf wil -- de
  Schwä -- ne,
  \set stanza = #"1. "
  Schwä -- ne leuch -- tend
  weiß und schön.
  %\dropLyricsA
  Sing, sing was ge -- schah?
  %\raiseLyrics
  \set stanza = #"1. "
  Kei -- ner ward mehr ge -- sehen, ja
  sehn.
}}

lyrStropheB = {
  \lyricmode {
    \skipA
   \set stanza = #"2. "
   Wu -- chsen einst fünf
   jun -- ge Bir -- ken
   \set stanza = #"2. "
   grün und frisch am
   Ba -- ches -- rand.
   \skipB
   %Sing, sing was ge -- schah?
    \set stanza = #"2. "
    Kei -- ne in Blü -- ten stand, ja
   stand.
}}

lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = #"3. "
  Zo -- gen einst fünf jun -- ge
  Bur -- schen
  \set stanza = #"3. "
  stolz und kühn
  zum Kampf hi -- naus.
  \skipB
  %Sing, sing, was ge -- schah?
  \set stanza = #"3. "
  Kei -- ner kehrt mehr nach Haus, ja
  Haus.
}}

lyrStropheD = {
  \lyricmode {
  \skipA
    \set stanza = #"4. "
  Wu -- chsen einst fünf jun -- ge
  Mäd -- chen
  \set stanza = #"4. "
  schlank und schön am
  Mem -- mel -- strand.
  \skipB
  % Sing, sing, was ge -- schah?
  \set stanza = #"4. "
  Kei -- ne den Braut -- kranz wand. ja
  wand.
}}

strophe = \relative c' {
  %\voiceOne
  \time 2/2
  \key g \major
  \partial 4
  \bar ".|:"
  \repeat volta 2 {
  d4
  g4.a8 b4 a8 b
  c4. b8 a4 g
  fs4. g8 a[ g]
  } \alternative {
    {a4 b2. }
    {fs4 g1 }

  } \bar "||" \break
  %\bar "||"
  \repeat volta 2 {
  d4 g g8( fs) e4
  d4 d d b
  c c e e d fs g2 }
  \break
  \repeat volta 2 {
   d2 c'
   b4 g b2
   a4 a8 a fs4 d
  } \alternative {
   { g4( b) d2 }
   { g,1 }
  }
  \bar "|."
}

chrdStrophe = \chordmode {
  s4
  \set chordBassOnly = ##t
  g2 g:/d
  a:m a:m/c
  d d:/a g1 g
  g2 g:/d g:/b g:/g
  c c:/e d g
  d d:/a g e:m
  a:m d g g:/d
  g1
}


\bookpart {
  \paper {
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \score {
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
