\version "2.24.2"
sheetName = "Hambani Kahle"
sheetComposer = "trad. Zulu"
\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
  Ham -- ba -- ni Kah -- le,
  ham -- ba -- ni Kah -- le,
  ham -- ba -- ni Kah -- le 
  in Ko -- si ma -- yi -- be -- na -- ni.
}}

lyrStropheB = {
  \lyricmode {
    Geh'n wir in Frie -- den,
    geh'n wir in Frie -- den,
    geh'n wir in Frie -- den,
    den Weg den wir _ ge -- kom -- men.
}}

lyrStropheC = {
  \lyricmode {
  Ham -- ba -- ni Kah -- le,
  ham -- ba -- ni Kah -- le.
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \key d \major
  fs4. fs8( e) fs
  d4. d
  e4. e8( d) e
  fs4. a
  fs4. fs8( e) fs
  d4. d4 d8
  e4 fs8 g fs e
  d4. d4.
  \bar "|."
}


stropheAlt = \relative c'' {
  \voiceOne
  \key d \major
  a2. b g a4. fs
  a2. b g a4. fs
}

stropheTenor = \relative c' {
  \voiceTwo
  \key d \major
  d2. g e d4. d
  d2. g e  d4. d
}

chrdStrophe = \chordmode {
   d2. g a:7 d d g a:7 d
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.35))
  }
  \header {
    title = \sheetName
  }
  \bookItem
  \header {
    subtitle = "Abshiedslied aus Südafrika"
  }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB  
    \new Staff <<
      \new Voice = "StropheAlt" { \stropheAlt }
      \new Voice = "StropheTenor" { \stropheTenor }
      >>
      \new Lyrics \lyricsto "StropheAlt" \lyrStropheC

    >>
  }
}
