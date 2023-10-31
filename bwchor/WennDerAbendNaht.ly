\version "2.24.2"
sheetName = "Wenn der Abend naht"
sheetComposer = "Erik Martin"
sheetPoet = "bearb. Beate Tarrach"
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace75"
}
stanzaA = \markup {
  \column { \vspace #.4 "1. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaAn = \markup {
  \column { \vspace #-.4 "1. "}
  \column { \vspace #-.8 \leftbrace }
}
stanzaB = \markup {
  \column { \vspace #.4 "2. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaBn = \markup {
  \column { \vspace #-.4 "2. "}
  \column { \vspace #-.8 \leftbrace }
}
stanzaC = \markup {
  \column { \vspace #.4 "3. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaCn = \markup {
  \column { \vspace #-.4 "3. "}
  \column { \vspace #-.8 \leftbrace }
}
stanzaD = \markup {
  \column { \vspace #.4 "ref. "}
  \column { \vspace #.2 \leftbrace }
}

lyrStropheA = {
  \lyricmode {
  \set stanza = \stanzaA
  Wenn der A -- bend naht ganz sacht und leis
  fin -- den wir uns
  \set stanza = \stanzaA
  ein im Feu -- er -- kreis.
  \set stanza = \stanzaD
  Da, wo je -- der an den An -- dern denkt,
  wo man a -- bends ro -- ten
  \set stanza = \stanzaD
  Wein aus -- schenk,
  ist das Le -- ben uns ein Fest.
}}

lyrStropheB = {
  \lyricmode {
  Wenn der A -- bend
  \set stanza = \stanzaAn
  naht ganz sacht und leis
  fin -- den wir uns ein
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = \stanzaB
    Schat -- ten fla -- ckern am Ru -- i -- nen -- rand.
    Welch ein Zau -- ber
    \set stanza = \stanzaB
    liegt heut über dem Land!
    Drau -- ßen weht ge -- wiss ein kal -- ter
    Wind doch die Feu -- er nicht er -- lo -- schen sind
    für uns Sän -- ger wie \skip 4 \skip 2. ihr wißt!
}}
lyrStropheD = {
  \lyricmode {
    Schat -- ten fla -- ckern
    \set stanza = \stanzaBn
    am Ru -- i -- nen -- rand.
    liegt heut ü -- ber'm Land!
}}
lyrStropheE = {
  \lyricmode {
    \set stanza = \stanzaC
    Wer da denkt, er muss al -- lei -- ne gehn,
    dem soll un -- ser
    \set stanza = \stanzaC
    Lied zur Sei -- te stehn.
}}
lyrStropheF = {
  \lyricmode {
    Wer da denkt, er
    \set stanza = \stanzaCn
    muss al -- lei -- ne gehn,
    Lied zur Sei -- te stehn.
}}

strophe = \relative c' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key c \major
  \voiceTwo
  c4 c d d
  f f e c
  d2 s2 s1
  c4 c d d
  f f e c
  d2 s2 s2. \break
  \repeat volta 2 {
    g8 g
    g4. g8 g4. g8
    g4 f e d8 d
    c4. c8 c4. e8
    e4 d c b8 b
    c4 c d
  } \alternative {
    { g8( f) e2. }
    { e8( d) c2. }
  }
  r4
  \bar "|."
}

stropheSopran = \relative c'' {
  s1 s1
  \voiceOne
  b4 b b g
  a a b g
  e2 s s1
  b'4 b b g
  f2 s4
  g8 g
  g4. c8 c4. c8
  d4 b g g8 g
  a4. a8 a4. a8
  e4 e e e8 e
  e4 e g g
  g2.
  g8( f) e2.
}


chrdStrophe = \chordmode {
  c2 g f a:m g1
  d2:m g
  c g f a:m g1 d2:m g
  c1 g a:m e:m
  a2:m g4
  s4 c2.
  s4 c2.
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
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheF
    >>
  }
}
