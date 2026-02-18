\version "2.22.2"
sheetName = "Der Pfahl"
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace70"
}
stanzaA = \markup {
  \column { \vspace #.33 "1. "}
  \leftbrace
}
stanzaB = \markup {
  \column { \vspace #.33 "2. "}
  \leftbrace
}
stanzaC = \markup {
  \column { \vspace #.33 "3. "}
  \leftbrace
}
stanzaD = \markup {
  \column { \vspace #.33 "ref "}
  \leftbrace
}

lyrStropheA = {
  \lyricmode {
    \set stanza = \stanzaA
    Son -- nig be -- gann es zu ta -- gen,
    \set stanza = \stanzaA
    ich stand ganz früh vor dem Tor,
    sah nach dem fah -- ren -- den
    \set stanza = \stanzaA
    Wa -- gen,
    da sprach Alt Si -- set zu mir:

   \set stanza = \stanzaD
   Ich drü -- cke hier und du ziehst weg,
   so krie -- gen
   \set stanza = \stanzaD
   wir den Pfahl vom Fleck,
   wer -- den ihn fäl -- len, fäl -- len,
   \set stanza = \stanzaD
   fäl -- len
   wer -- fen ihn faul und morsch zu Dreck.
}}

lyrStropheB = {
  \lyricmode {
    %\set stanza = #"1b) "
    'Siehst du den brü -- chi -- gen Pfahl dort,
    %\set stanza = #"1b) "
    mit unse -- ren Fes -- seln um -- schnürt?
    Schaf -- fen wir doch die -- se
    %\set stanza = #"1b) "
    Qual fort,
    ran an ihn, daß er sich rührt!'

  %\set stanza = #"ref b) "
  Erst wenn die Ein -- tracht uns be -- wegt,
  ha -- ben wir
  %\set stanza = #"ref b) "
  ihn bald um -- ge -- legt,
  und er wird fal -- len, fal -- len,
  %\set stanza = #"ref b) "
  fal -- len,
  wenn sich ein je -- der von uns regt.
}}


lyrStropheC = {
  \lyricmode {
 \set stanza = \stanzaB
 Ach, Si -- set, noch ist es nicht_ge -- schafft,
 \set stanza = \stanzaB
 an mei -- ner Hand platzt die Haut,
 lang ___ -- sam schwin -- det auch
 \set stanza = \stanzaB
 meine Kraft,
 er ist zu mäch -- tig ge -- baut.
}}

lyrStropheD = {
  \lyricmode {
    %\set stanza = #"2b) "
 Wird es uns je -- mals ge -- lin -- gen?
    %\set stanza = #"2b) "
    Si -- set, es fällt mir so schwer!
    Wenn wir das Lied noch mal
    %\set stanza = #"2b) "
    sin -- gen geht es viel
    bes -- ser komm her!
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = \stanzaC
  Der al -- te Si__  - set sagt_nichts mehr,
  \set stanza = \stanzaC
  bö -- ser Wind hat ihn ver -- weht,
  kei -- ner weiß von sei -- ner
  \set stanza = \stanzaC
  Heim -- kehr,
  od -- er gar wie es ihm geht.

}}

lyrStropheF = {
  \lyricmode {
  %\set stanza = #"3b) "
  Alt Si -- set sagt__ _  uns al -- len,
  %\set stanza = #"3b) "
  hör auch du krieg__ _ es mit:
  'Der mor -- sche Pfahl wird schon
  %\set stanza = #"3b) "
  fal -- len,
  wie es ge -- schieht__ _  im Lied!
}}

strophe = \relative c' {
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
  \markup {
    \vspace #0.5
    \override #'(baseline-skip . 0.75)
    \column {
    \null
    \fill-line {\line { Katalanisches Lied, während der Franko - Diktatur
            verboten}}
    \fill-line {\line { das spanische Wort für Pfahl bedeutet auf
            Katalanisch Staat }}
  } }
}
