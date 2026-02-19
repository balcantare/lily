\version "2.24.0"
sheetName = "Brot und Rosen"
sheetComposer = "Text von 1917"
#(define book-staff-size 20)
\include "../include/book.ily"

lyrA = {
  \lyricmode {
  \set stanza = "1. "
  Wenn wir zu -- sam -- men gehn,
  geht mit uns ein schö -- ner Tag
  _ durch 
  \set stanza = "1. "
  all die dunk' -- len Kü -- chen,
  _ und wo grau ein Werk -- hof lag,
  \set stanza = "1. "
  be -- ginnt _ plötz -- lich die Son -- ne,
  uns' -- re 
  \set stanza = "1. "
  ar -- me Welt zu ko -- sen _ _
  und je -- der hört uns 
  \set stanza = "1. "
  sin -- gen: _
  Brot und Ro _ -- sen!
}}

lyrB = {
  \lyricmode {
  \set stanza = "2. "
  Wenn wir zu -- sam -- men gehn,
  käm -- pfen wir auch für den Mann,
  _ weil \set stanza = "2. "
  un -- be -- mut -- tert kein _ 
  Mensch auf die Er -- de kom -- men kann.
  \set stanza = "2. "
  Und wenn ein Le -- ben nur mehr ist als _ 
  \set stanza = "2. "
  Ar -- beit  Schweiß und Bauch, _ wol -- len wir
  mehr Gebt uns das \set stanza = "2. "
  Brot, _ doch gebt die Ro -- sen auch!
}}

lyrC = {
  \lyricmode {
  \set stanza = "3. "
  Wenn wir zu -- sam -- men gehn,
  gehen uns' _ -- re To -- ten mit.
  _ Ihr \set stanza = "3. "
  un -- er -- hör -- ter Schrei _
  nach Brot schreit auch durch un -- ser Lied.
  \set stanza = "3. "
  Sie hat -- ten für die_Schönheit, _
  Lie _ -- be, _ \set stanza = "3. "
  Kunst, er -- schöpft nie Ruh', _
  drum käm -- pfen wir ums Brot und \set stanza = "3. "
  wol -- len die 
  Ro _ -- sen da -- zu! 
 }}

lyrD = {
  \lyricmode {
  \set stanza = "4. "
  Wenn wir zu -- sam -- men gehn,
  kommt mit uns ein bes' -- rer Tag.
  _ Die \set stanza = "4. "
  Frau -- en die sich weh -- ren,
  _ weh -- ren al -- ler Men -- schen Plag'.
  \set stanza = "4. "
  Zu En -- de sei, daß_klei -- ne Leu _ -- te _ 
  \set stanza = "4. "
  schuf -- ten
  für die Großen.
  Her_mit dem gan -- zen Leben: _
  Brot und 
  \set stanza = "4. "
  Ro -- sen! _ Brot und Ro _ -- sen!
}}

lyrE = {
  \lyricmode {
    \set stanza = "5. "
  Wenn wir zu -- sam -- men gehn,
  kommt mit uns ein fri -- scher Wind
  in Bü -- 
  \set stanza = "5. "
  ros und dunk -- le Kü -- chen,
  wo wir nur Ar -- beits -- tie -- re sind.
  \set stanza = "5. "
  Was sie uns nicht ge -- ben woll'n, _
  die_kleinen  _ 
  \set stanza = "5. "
  Herr'n _ und die Großen,
  das_for -- dern wir und singen: _
  Brot und 
  \set stanza = "5. "
  Ro -- sen!  _ Brot und Ro _ -- sen!
}}

lyrF = {
  \lyricmode {
  \set stanza = "6. "
  Wenn wir zu -- sam -- men gehn,
  kämpfen wir _ nicht nur um Lohn,
  auch wenn \set stanza = "6. "
  die da o -- ben den -- ken,
  _ da -- mit packen _ wir sie schon.
  \set stanza = "6. "
  Das ist doch nur das_hal -- be Le _ -- ben: _
  \set stanza = "6. "
  Ar -- beit, Schweiß und Bauch. _ _
  Wir woll'n nicht _ nur das 
  \set stanza = "6. "
  Brot, _
  die Ro -- sen wollen wir auch!
}}

lyrG = {
  \lyricmode {
    \set stanza = "7. "
    Wenn wir zu -- sam -- men stehn,
    kommt mit uns ein bes' -- rer Tag.
    _ Ob 
    \set stanza = "7. "
    Frau, ob Mann, ob Kind, _ _
    ge _ -- mein -- sam sind wir stark.
    \set stanza = "7. " 
    _ Schluß da -- mit,
    daß_klei -- ne Leu _ -- te _ 
    \set stanza = "7. " schuf -- ten für
    die Großen!
    _ Wir ho -- len uns das gan -- ze 
    \set stanza = "7. "
    Le -- ben:
    _ Brot und Ro _ -- sen.
}}

voice = \relative c'' {
  %\voiceOne
  \time 3/4
  \key g \major
  g4 g8 fs g fs
  g2 b,4
  c4 c8 d c b
  a2 d8 d8
  g4. fs8 g fs
  g8 g4  b,8 b b
  c4. c8 c b
  a4 \break r8 d8 d d
  d4 d4. e8
  e8 e e4. e8
  e4. e8 e fs
  fs4 fs8 d8 d d
  b'4. a8 b8 a
  b8 b~ 4 b
  c2 b4 
  a4.( g8) fs4
  g2.
  \bar "|."
}

chrd = \chordmode {
  %\set chordBassOnly = ##t
  g2. e:m a:m d g e:m a:m d
  g e:m a:m d g e:m c d g
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom =  ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrd }
    \new Staff <<
      \new Voice = "Strophe" { \voice }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrA
    \new Lyrics \lyricsto "Strophe" \lyrB
    \new Lyrics \lyricsto "Strophe" \lyrC
    \new Lyrics \lyricsto "Strophe" \lyrD
    \new Lyrics \lyricsto "Strophe" \lyrE
    \new Lyrics \lyricsto "Strophe" \lyrF
    \new Lyrics \lyricsto "Strophe" \lyrG 
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 20)
      #(layout-set-staff-size 20)
    }
  }
}
