\version "2.22.2"
sheetName = "Avec que la Marmotte"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Ich kom -- me schon durch man -- ches Land,
  a -- vec que la mar -- mot -- te
  \set stanza = #"1. "
  und im -- mer was zu es -- sen fand,
  a -- vec que la mar -- mot -- te,
  a -- vec que si, a -- vec que la, 
  a -- vec que la mar -- mot -- te,
  a -- vec que si, a -- vec que la, 
  a -- vec que la mar -- mot -- te.
}}

skipA=\repeat unfold 7 \skip 8
lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Ich hab ge -- sehn gar man -- chen Herrn,
  %a -- vec que la mar -- mot -- te,
  \skipA
  \set stanza = #"2. "
  der hat die Jung -- frau gar zu gern,
  
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Hab auch ge -- sehn die Jung -- fer schön,
  %a -- vec que la mar -- mot -- te,
  \skipA
  \set stanza = #"3. "
  die tä -- te nach mir Frem -- den sehn,
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Nun laßt mich nicht so gehn, ihr Herrn,
    %a -- vec que la mar -- mot -- te,
    \skipA
    \set stanza = #"4. "
    die_Ge -- sel -- len essen und trin -- ken gern,
    
}}


strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \key e \minor
  \partial 8
  b8
  e4 e8 e4 e8
  fs8( g) fs e4 \break e8
  fs4 fs8 g( fs) e
  fs4. b,4 \break b8
  e4 e8 e4 e8
  fs8( g) fs e4 \break e8
  fs4 fs8 b,4 b8
  e4. e4 \break e16( fs)
  g4 g8 a4 a8
  b4 b8 a4 \break a8 
  g8( fs) e g( fs) e
  fs4. fs4 \break e16( fs)
  g4 g8 a4 a8
  b4 b8 a4 \break a8
  g8( fs) e fs( g) fs
  e4. e4
  \bar "|."
}

chrdStrophe = \chordmode {
  s8
  e2.:m 
  b4.:7 e:m
  b4.:7 e:m
  b2.:7 
  e:m
  b4.:7 e:m
  b2.:7 
  e:m
  e4.:m d
  g a:m
  e2.:m
  b:7
  e4.:m d
  g a:m
  e:m b:7
  e:m
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    ragged-last-bottom = ##f
    #(define fonts (book-font 1.4))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
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
