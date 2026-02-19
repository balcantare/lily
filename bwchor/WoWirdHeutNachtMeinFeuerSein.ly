\version "2.24.2"
sheetName = "Wo wird heut Nacht mein Feuer sein?"
%#(define book-staff-size 20)
\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Mein Haus das ist ein Wa -- gen,
  gleich 
  \set stanza = #"1. " 
  hin -- ter ei -- nem Pfer -- de -- paar
  und je -- der kann wohl 
  \set stanza = #"1. "
  sa -- gen, daß mein Va -- ter
  braun wie Kaf -- fee war.
  Hei -- hü, hei -- hü, wo wird heut Nacht mein Feu -- er sein,
  hei -- hü, hei -- hü, wo schlaf ich heut' Nacht ein?}
}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Ich ken -- ne vie -- le Stra -- ßen,
  doch 
  \set stanza = #"2. " nie den Weg von mor _ -- gen,
  den Ha -- fer und den 
  \set stanza = #"2. " liebs -- ten Schatz,
  den tu' ich mir meist' bor _ -- gen.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Ich glau -- be an den lieben Gott
  der \set stanza = #"3. " Bett -- ler und der Die _ -- be, _
  an das li -- la \set stanza = #"3. " Lum -- pen -- pack
  und an die frei -- e Lie _ -- be.
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"4. "
  Mal schmück' ich mich mit Wiesen -- schaum
  und \set stanza = #"4. " mal mit Samt und Sei _ -- de,
  mal küß' ich dei -- nen \set stanza = #"4. " Mund im Traum
  und mal auf grü -- ner Hei _ -- de.
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
  So fahr' ich durch die schöne Zeit
  auf \set stanza = #"5. " Ro -- den und auf Stei _ -- nen
  und holt mein dunk -- ler \set stanza = #"5. " Bru -- der mich,
  so braucht ihr nicht zu wei _ -- nen.
}}
stropheSopran = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \major
  \partial 4
  a4
  d4. d8 d4 d
  d( fs) a fs
  e e d e
  fs e d a
  d4. d8 d4 d
  d fs a fs
  e e d e
  fs8 e4. d4 r \bar "||" \break
  b'4 d a4 d8. fs,16
  a8 g g e b' a a4
  b4 d a4 d8. fs,16
  a8 g fs e d4
  \bar "|."
}


chrdStrophe = \chordmode {
  s4
  d1 s a d d s a d g2 d a d g d a d4
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##f
  }
  \bookItem
             
  \score {
    <<
    \new ChordNames \chrdStrophe 
    \new Staff \with {\accepts ChordNames}
    <<
      \context Voice = "StropheSopran" \stropheSopran
    >>
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheD
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheE
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
