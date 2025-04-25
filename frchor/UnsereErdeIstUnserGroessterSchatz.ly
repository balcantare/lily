\version "2.24.0"
sheetName = "Unsere Erde ist unser größter Schatz"
sheetComposer = "Beate Tarrach"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    Har -- ter Fels und Meer,
    Har -- ter Fels und Meer,
    Le -- ben rings um -- her,
    Le -- ben rings um -- her,
    Wind der uns um -- schwärmt,
    Wind der uns um -- schwärmt,
    Son -- ne die uns wärmt,
    Son -- ne die uns wärmt.
    All die Wun -- der gibt es auf Er -- den,
    und wir ken -- nen kei -- nen schön' -- ren
    Platz. 
    Da -- rum muß doch Frie -- den wer -- den,
    uns' -- re Er -- de ist un -- ser größ -- ter Schatz.
    Da -- rum muß doch Frie -- den wer -- den,
    uns' -- re Er -- de ist un -- ser größ -- ter Schatz.
}}

lyrStropheB = {
  \lyricmode {
    Mut -- ter mit dem Kind,
    Mut -- ter mit dem Kind,
    Le -- ben neu be -- ginnt,
    Le -- ben neu be -- ginnt,
    Sa -- men -- korn das fällt,
    Sa -- men -- korn das fällt,
    Hoff -- nung für die Welt,
    Hoff -- nung für die Welt.
    
    
}}

strophe = \relative c' {
  %\voiceOne
  \time 2/2
  \key g \major
  b8 c d e d2 
  b8 c d e d2 
  g8 d d e d2
  g8 d d e d2
  d8 c c b c2
  d8 c c b c2
  fs8 g fs e d2
  fs8 g fs e d4 \break
  d8 d \bar "||"
  g4 b a8 g4 fs8
  g4 d2 \break d8 d
  e4 e e8 d c e
  d2. \break d8 d
  e4. fs8 g4 a
  g4 d2 \break d8 d
  c'4 b8 a g fs g a
  g2. \break d8 d
  e4. fs8 g4 a
  g4 d2 \break d8 d 
  e4 e8 e e d d c 
  d1
\bar "|."
}

chrdStrophe = \chordmode {
  g1 s1*3
  a1:m s
  d s
  g s 
  c d 
  c2 d
  g1 
  c2 d
  g1 
  c2 d 
  g1 c
  d
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.1))
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "StropheA" { \strophe }
      >>
    \new Lyrics \lyricsto "StropheA" \lyrStropheA
    \new Lyrics \lyricsto "StropheA" \lyrStropheB
    >>
  }
}
