\version "2.24.2"
sheetName = "Feinslieb, nun ist das Blätterbraun"
sheetComposer = "Hans-Eckhard Wenzel"
\include "../include/book.ily"

dropA = {
\override LyricText.extra-offset = #'(0 . -5)
\override LyricHyphen.extra-offset = #'(0 . -5)
\override LyricExtender.extra-offset = #'(0 . -5)
\override StanzaNumber.extra-offset = #'(0 . -4)
\set stanza = \markup{ \right-brace #50 }
}

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Feins -- lieb nun ist das Blät -- ter -- braun
  \set stanza = #"1. "
  Schon wie -- der in den Spit -- zen,
  \set stanza = #"1. "
  Wann wir un -- term Kas -- ta -- nien -- baum
  am A -- bend frös -- telnd sit -- zen.
  \set stanza = #"1. "
  Das Jahr geht fort mit schwe -- rer Fracht,
  Es bin -- det sich die Schuh.
  \set stanza = #"1. "
  Ich bin so trau -- rig heu -- te Nacht,
  \dropA
  Und du, du lachst da -- zu. mh
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Feins -- lieb die schwar -- ze Ja -- cke hängt,
  \set stanza = #"2. "
  Die Schul -- tern ab mir wie -- der,
  \set stanza = #"2. "
  Wann scho so früh das Dun -- kel fängt
  uns und die Kält die Glie -- der.
  \set stanza = #"2. "
  In dei -- nen Au -- gen glimmt noch leis
  Der Som -- mer vol -- ler Ruh.
  \set stanza = #"2. "
  Ich wein, weil ich nicht wei -- ter weiß,
}}
lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Feins -- lieb, das war es al -- so schon,
  \set stanza = #"3. "
  Der Som -- mer ist ver -- trie -- ben,
  \set stanza = #"3. "
  Die Vö -- gel sind auf und da -- von,
  Und wir sind hier ge -- blie -- ben.
  \set stanza = #"3. "
  Fremd zieh ich ein, frem zieh ich aus,
  Ich weiß nich was ich tu.
  \set stanza = #"3. "
  Heut Nacht, ver -- welkt ist mein Zu -- haus,
}}
lyrStropheD = {
  \lyricmode {
  \set stanza = #"4. "
  Feins -- lieb, komm stirb mit mir ein Stück,
  \set stanza = #"4. "
  Sieh, müd die Blät -- ter schun -- keln,
  \set stanza = #"4. "
  Wir drehn das Jahr doch nicht zu -- rück,
  und sehn uns nicht im Dun -- keln,
  \set stanza = #"4. "
  Laß in dem Kom -- men, Blei -- ben, Gehn
  Zer -- tan -- zen uns die Schuh!
  \set stanza = #"4. "
  Ich will noch so viel Him -- mel sehn,
  
}}
strophe = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
 \override Rest.staff-position = #0
 \time 2/4
  \key c \major
  \partial 4
  c8( b)
  c4 c 
  c c 
  b c
  a2
  r4 \break a8( c)
  b4 b 
  c b
  a g
  r2
  r4 \break e8( g)
  a4 a 
  a g
  g a
  f2
  r4 g
  a4 b 
  c b
  a g 
  r2
  
  \bar "||"
  r4 \break g
  g c 
  c c
  c e,
  f2
  r4 c'4
  c4 b
  a4 b
  c2
  r2 r2
  r4 \break c
  c b 
  c b
  c b
  c r
  r4.  c8
  b4. b8 
  b4 b
  a4 a
  a a
  g g 
  a g
  f f
  a f
  e e
  f d
  e e 
  f d
  e e 
  f d 
  e2
  r4
  
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  e8( f)
  g4 g4
  g g g a f2 s4 d8( e)
  f4 f f f f g r2 r4 c,8( d)
  e4 e e e e f d2 s4 e
  f f f f f g s2
  s4 e4
  e g g g e g a2 s4 f
  a g f g e2 s2 s2 s4
  a a g a g a g a s
  s4. a8 gs4. gs8 gs4 gs a f g f
  e e f e d d f d c e d b c e d b c r4 r2  r2 
}

chrdStrophe = \chordmode {
s4 c2 s s d:m s g:7 s c s s
a:m s s d:m s g:7 s c s s 
c s s d:m s d:m6 g:7 c s s s
a:m s s s s
e:7 s f s
c s d:m s c s4 g4:7
c2 s4 g:7 c2 s4 g:7 c2

}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
  ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" \stropheAlt
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
