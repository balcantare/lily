\version "2.22.2"
fileName = "DerPfahl.ly"
sheetName = "Der Pfahl"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
    \set stanza = #"1a) "
    Son -- nig be -- gann es zu ta -- gen,
    \set stanza = #"1a) "
    ich stand ganz früh vor dem Tor,
    sah nach dem fah -- ren -- den
    \set stanza = #"1a) "
    Wa -- gen,
    da sprach Alt Si -- set zu mir:

   \set stanza = #"ref a) "
   Ich drü -- cke hier und du ziehst weg,
   so krie -- gen
   \set stanza = #"ref a) "
   wir den Pfahl vom Fleck,
   wer -- den ihn fäl -- len, fäl -- len,
   \set stanza = #"ref a) "
   fäl -- len
   wer -- fen ihn faul und morsch zu Dreck.
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = #"1b) "
    'Siehst du den brü -- chi -- gen Pfahl dort,
    \set stanza = #"1b) "
    mit unse -- ren Fes -- seln um -- schnürt?
    Schaf -- fen wir doch die -- se
    \set stanza = #"1b) "
    Qual fort,
    ran an ihn, daß er sich rührt!'

  \set stanza = #"ref b) "
  Erst wenn die Ein -- tracht uns be -- wegt,
  ha -- ben wir
  \set stanza = #"ref b) "
  ihn bald um -- ge -- legt,
  und er wird fal -- len, fal -- len,
  \set stanza = #"ref b) "
  fal -- len,
  wenn sich ein je -- der von uns regt.
}}


lyrStropheC = {
  \lyricmode {
 \set stanza = #"2a) "
 Ach, Si -- set, noch ist es nicht_ge -- schafft,
 \set stanza = #"2a) "
 an mei -- ner Hand platzt die Haut,
 lang ___ -- sam schwin -- det auch
 \set stanza = #"2a) "
 meine Kraft,
 er ist zu mäch -- tig ge -- baut.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"2b) "
 Wird es uns je -- mals ge -- lin -- gen?
    \set stanza = #"2b) "
    Si -- set, es fällt mir so schwer!
    Wenn wir das Lied noch mal
    \set stanza = #"2b) "
    sin -- gen geht es viel
    bes -- ser komm her!
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"3a) "
  Der al -- te Si __  _ set sagt_nichts mehr,
  \set stanza = #"3a) "
  bö -- ser Wind hat ihn ver -- weht,
  kei -- ner weiß von sei -- ner
  \set stanza = #"3a) "
  Heim -- kehr,
  od -- er gar wie es ihm geht.

}}

lyrStropheF = {
  \lyricmode {
  \set stanza = #"3b) "
  Alt Si -- set sa __ gt uns al -- len,
  \set stanza = #"3b) "
  hör auch du krie__ -- g es mit:
  'Der mor -- sche Pfahl wird schon
  \set stanza = #"3b) "
  fal -- len,
  wie es ge -- schie __ ht  im Lied!
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \partial 4.
  \key e \minor
  \bar ".|:"
  \repeat volta 2 {
  r4. |
  e8[ 8 8] fs[ 8 8]
  g4. e4.
  g8[ 8 8] 8[ fs e]
  fs4. r4.
  e8[ 8 8] fs[ 8 8]
  g4.~8 e4
  e8[ 8 8] ds[ cs ds] |
  e4.
  } \break
  \repeat volta 2 {
    g8 fs e |
    b4 ds8 fs4 ds8
    e4. g8 fs e
    b4 ds8 fs4 ds8
    e4. e8 fs g
    a4 fs8 a4 fs8
    b4 g8 g fs e
    b4 ds8 fs4 ds8
    e4.
  }
%\bar "|."
}

chrdStrophe = \chordmode {
  s4.
  e4.:m b:7 e2.:m e2.:m b2.:7
  e4.:m b:7 e2.:m a4.:m b4.:7 e:m
  s b2.:7  e:m   b2.:7  e:m
  a:m e:m b:7 e4:m
 }

\bookpart {
  \paper {
    ragged-right = ##f
    page-count = #1
    #(define fonts (book-font 1.1))
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    >>
  }
}
