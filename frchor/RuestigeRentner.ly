\version "2.24.0"
sheetName = "Rüstige Rentner"
sheetPoet = "Beate Tarrach"
sheetComposer = "Reinhard Simmgen"
#(define book-staff-size 20)
\include "../include/book.ily"

dropA = {
\override LyricText.extra-offset = #'(0 . -1)
\override LyricHyphen.extra-offset = #'(0 . -1)
\override LyricExtender.extra-offset = #'(0 . -1)
\override StanzaNumber.extra-offset = #'(1 . -0.5)
\set stanza = \markup{ \right-brace #30 }
}
raise = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}



lyrA = {
  \lyricmode {
     \set stanza = #"1. "
     Herr Krau -- se ist drei -- und -- acht -- zig
     und 'n rüs -- ti -- ger Mann,
     \set stanza = #"1. "
     er fängt  sei -- nen Tag um acht
     mit Kaf -- fee und Zei -- tung an.
     \set stanza = #"1. "
     Er liest, was die heu -- te schrei -- ben:
     von nem rie -- sen Haus -- halts -- loch.
     \set stanza = #"1. "
     Doch Mil -- liar -- den für die Rüs --
     tung blei -- ben!
     \set stanza = #"1. "
     Da kommt Krau -- se der Kaf -- fee hoch!
     
     \set stanza = #"1. "
     Er wünscht sich
     \dropA 
     rüs -- ti -- ge Rent -- ner statt
     Rüs -- tungs -- ren -- di -- ten!
     \raise
     Auf, ihr Leu -- te, lasst euch das nicht mehr
     bie -- ten: daß Rüs -- tungs -- ren -- di -- ten 
     im -- mer wich -- ti -- ger sind,
     als 'n rüs -- ti -- ger Rent -- ner
     und 'n fröh -- li -- ches Kind!
   
}}
lyrB = {
  \lyricmode {
    \set stanza = #"2. "
  Wenn an -- dre _ Leu -- te schlie -- fen,
  stand er auf fast_in der Nacht
  \set stanza = #"2. "
  sei -- ne Ar -- beit mit den Kühen ach,
  die hat er gern ge -- macht.
  \set stanza = #"2. "
  Fri -- sche Milch für al -- le Leu -- te
  Das gab sei -- nem Le -- ben Sinn!
  \set stanza = #"2. "
  Doch schaut er auf sei -- ne Ren -- te heu -- te,
  \set stanza = #"2. "
  reicht er damit kaum zum Le -- ben hin!
  \set stanza = #"2-4. "
  Wir wol -- len
   }}

lyrC = {
  \lyricmode {
    \set stanza = #"3. "
  Sein Kum -- pel, _ der Heinz Mül -- ler,
  ist nun schon_im Pfle -- ge -- heim.
  \set stanza = #"3. "
  Krau -- se geht auch mal zu ihm,
  doch er selbst will da nicht rein!
  \set stanza = #"3. "
  Zwar ist's sau -- ber und das Es -- sen
  schmeckt recht gut und man wird satt.
  \set stanza = #"3. "
  Doch oft fühlt der Heinz sih ganz ver -- ges -- sen,
  \set stanza = #"3. "
  weil kaum einer Zeit zum Re -- den hat.
}}

lyrD = {
  \lyricmode {
 \set stanza = #"4. "
 Mil -- liar -- den _ für die Rüs -- tung
  und man spricht_hier schon von Krieg.
  \set stanza = #"4. "
  Krau -- ses Va -- ter starb im letzten,
  fest im Glau -- ben an den Sieg.
  \set stanza = #"4. "
  Krau -- se denk: Sind die zu ret -- ten?
  Ist es wirk -- lich schon so weit?
  \set stanza = #"4. "
  Denkt dran, was wir zu ver -- lie -- ren
  hät -- ten!
  \set stanza = #"4. "
  Un -- ser Le -- ben in Frie -- dens -- zeit!
}}

strophe = \relative c'{
  %\voiceOne
  \time 4/4
  \key c \major
  \partial 8
  g8 
  e'4 g8 g g4 a8 g8~
  8 e4. r4 d8 c
  d2 d4 e8 d~
  d2 r4 \break d8 c
  b4 c8 d8~ d8 e f4~
  f2 r4 g8 g
  a8 g4. g4 e8 g~ 
  g2 r4 \break g8 g
  a4 a a g8 a~
  a f4. r4 f8 f
  g4 g a8 g4 g8~ 
  2 r4 \break  c,8 c
  f8 f f e f e4 d8~
  d c4. \break r4 c8 c
  f4 f8 f f g4.
  g2 r2 \bar "||"
  
  r2  r8 g g g
  e e d e~ e c c4
  f8 f e f~ f d4 r8
  g4 g8 g~ g g g g
  a8 g g a~ a g4 g8
  e8 e d e~ e c c c
  f f g f~ f r e f
  g8 g g a~ a g4.
   
  r2^\markup{1, 2, 3} r4 g8 g
  \time 2/4
  e8 e d4
  \time 4/4
  c2 
  r4.
  \bar "|."
}

chrd = \chordmode {
 s8
 \set chordBassOnly = ##t
 c1 s g s
 s s c s
 f s c s
 d:m s f g
 s4 g:/g g:/a g:/b
 c1 f
 g c s 
 f g s1 s2 c2
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
  }
  \bookItem
  \score {
    <<
    \new ChordNames \chrd 
    \new Staff <<
      \new Voice = "Strophe" \strophe 
      >>
    \new Lyrics \lyricsto "Strophe" \lyrA
    \new Lyrics \lyricsto "Strophe" \lyrB
    \new Lyrics \lyricsto "Strophe" \lyrC
    \new Lyrics \lyricsto "Strophe" \lyrD
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 20)
      #(layout-set-staff-size 20)
    }
  }
}
