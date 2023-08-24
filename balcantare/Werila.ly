\version "2.22.2"
sheetName = "Werila"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  До -- мик сто -- ит над ре -- ко -- ю
  при -- стан у са -- мой ре -- ки
  Па -- рен дев -- чон -- ку
  це -- лу -- ет про -- сит он пра -- вой ру -- ки.
  Ве -- ри -- ла, ве -- ри -- ла, ве -- рю,
  ве -- ри -- ла, ве -- ри -- ла я,
  но ни -- ког -- да не по -- ве -- рю
  что ты раз -- лю -- бишь мен -- я.
  }}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Бе -- ла -- я ро -- за
  сви -- дан -- ье,
  Крас -- на -- я ро -- за лю -- бовь,
  Жёл -- та -- я ро -- за раз -- лу -- ки
  Нас раз -- лу -- чи -- ла с_то бой.
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Бе -- лу -- ю ро -- зу сры -- ва -- ю,
    Крас -- ну -- ю ро -- зу дар -- ю,
    Жёл -- ту -- ю ро -- зу раз -- лу -- ки,
    Я под но -- га -- ми топ -- чу.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"3. "
    Го -- ды прой -- дут мо -- ло -- ды -- е
    Мор -- щи -- ны по -- кро -- ют лицо
    Во -- ло -- сы ста -- нут се -- ды -- е
    Боль -- ше не ну -- жен ник -- то.
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"3. "
    Лю -- бишь, не лю -- бишь
    не на -- до
    Ты ведь е -- щё мо -- ло -- да
    Врем -- я на -- ста -- нет по -- лю -- бишь
    Позд -- но уж бу -- дет тог -- да!
}}

strophe = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 3/4
  \key b \minor
  b4 b d
  fs e d
  d cs2~ 2.
  cs4 cs d
  e d cs
  d2.( cs)
  b4 b d
  fs e d
  fs e2~ 2.
  fs4 g fs
  e d cs
  b2.~ 2.
  \break
  \repeat volta 2 {
   b'4 b b
   b a g
   b a2~ 2.
   g4 g a
   b a g
   b( fs2)~ 2.
   e4 e fs
   g fs e
   d fs2~ 2.
   fs4 g fs
   e d cs
   b2.~ 2.
  }
  % \bar "|."
}

chrdStrophe = \chordmode {
  b2.:m s e:m s a:7 s d fs:7
  b:m s e:m s fs:7 s b:m s
  g s d s e:m s b:m s
  e:m s b:m s fs:7 s b:m s
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.5))
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
