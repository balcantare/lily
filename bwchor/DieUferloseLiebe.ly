\version "2.24.2"
sheetName = "Die Uferlose Liebe"
sheetComposer = "Kurt Demmler / Renft"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    \set stanza = #"1. "
  Bleich und u -- fer -- los
  liegt die Lie -- be bloß.
    \set stanza = #"1. "
    Auf ei -- nem Stock ir -- gend -- wo
    \set stanza = #"1.      " hängt ihr Rock
  ir -- gend -- wo  
    \set stanza = #"1.      " 
    auf dem Stein muß ihr
  Hemd -- chen sein.
    \set stanza = #"5. " Fin -- den nur den Rock, Hemd -- chen Span -- ge und Schuh
  und die u -- fer -- lo -- se Lie -- be
  Fin -- den nur den Rock, Hemd -- chen Span -- ge und Schuh
  und die u -- fer -- lo -- se Lie -- be
  nicht da -- zu.
}}


lyrStropheB = {
  \lyricmode {
    \set stanza = #"2. "
    Hat sich hin -- ge -- streckt
    wo kein Mensch sie weckt.
    \set stanza = #"2. "
    hat ih -- re Schuh auf die Wie -- 
    \set stanza = #"2.      "
      se ge -- stellt
    und die Span -- 
    \set stanza = #"2.      "
    ge ent -- fernt,
    die das Haar falsch hält.
}}

lyrStropheC = {
  \lyricmode { 
  \set stanza = #"3. "
  Ach, wie hat sie satt
  Falsch -- heit und Ver -- rat
  \set stanza = #"3. "
  Gibt al -- le Schwü -- re den 
  Vö -- 
  \set stanza = #"3.      " geln zum Fraß,
  und den Schlan -- 
  \set stanza = #"3.      " gen, den gibt sie vom bit -- tern Hass.
}}

lyrStropheD = {
  \lyricmode { 
    \set stanza = #"4. "
  Lieb -- ste, lass uns gehn,
  nach der Lie -- be sehn,
      \set stanza = #"4. "
  so, wie sie schläft auf dem 
  samt -- 
      \set stanza = #"4.      "
  grü -- nen Moos,
  al --  ler Sa -- 
      \set stanza = #"4.      "
  chen ent -- le -- digt,
  so  bleich und bloß.
}}

lyrStropheE = {
  \lyricmode { 
  \set stanza = #"5. "
  Lieb -- ste o -- der sind
  Men -- schen Au -- gen blind?
}}



strophe = \relative c'' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key e \major
  b4 a gs e8 cs~ 
  2. r4
  b'4 a gs e8 cs~
  2. r4 \break
  \repeat volta 2 {
    b'8 b b b~ b b cs b~
    b a a a~ a a b a~
    a e e e~ e fs e g~
    g fs4 e8~ e4 r4 
  } \break
  \repeat volta 2 {
    b'8 b b b b4 b8 cs
    b8 a a a~ a4 a8 b
    a8 e e e e e r4  
  } \alternative {
    {r0 gs8 8 8 8 gs4 8 a8
     gs8 fs fs fs~ 4 fs8 gs
     fs8 e e e e e r4 r0
    }
    {
      g4 fs8 e8~ e2
    }
  }
  \bar "|."
}

chrdStrophe = \chordmode {
  e1 a:7 e2. a4 s1
  e1 b:7 a:7 e
  e b:7 a:7 s
  cs:m b:7 a:7
  s1 s2 e2
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
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
