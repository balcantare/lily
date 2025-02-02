\version "2.24.2"
sheetName = "Валенки, валенки прячет моя маменька"
sheetComposer = "Russland"
\include "../include/book.ily"

% https://kindbi.ru/article/valenki-valenki-prjachet-moja-mamenka/

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Мой дру -- жо -- чек мен -- я ждёт
  Каж -- дый ве -- чер у во -- рот.
  \set stanza = #"1. " 
  Но‿в та -- ки -- е хо -- ло -- да
  Мне без ва -- ле -- нок бе -- да.
  \set stanza = #"1. "
  Что -- бы к‿ми -- ло -- му пой -- ти,
  На -- до ва -- лен -- ки най -- ти.
  \set stanza = #"1. "
  О __ _ _ а _ -- уо!
  На -- до ва -- лен -- ки най -- ти.

  Ва -- лен -- ки, ва -- лен -- ки
  Пря -- чет мо -- я ма -- мень -- ка.
  Всё рав -- но я их най -- ду,
  На сви -- да -- ние по -- й -- ду.

}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Го -- вор -- ят, лю -- бить зи -- мой 
  Зна -- чит до -- ма быть од -- ной.
  \set stanza = #"2. "
  На мо -- ро -- зе сты -- нет кровь.
  Не со -- гре -- ет и лю -- бовь.
  \set stanza = #"2. "
  Но не бу -- ду я стра -- дать,
  Толь -- ко б‿ва -- лен -- ки дос -- тать.
  \set stanza = #"2. "
  О __ _ _ а _ -- уо!
  Толь -- ко б‿ва -- лен -- ки до -- стать.
  
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Раз -- го -- во -- ров не бо -- юсь.
  С‿ми -- лым в‿ва -- лен -- ках прой -- дусь.
  \set stanza = #"3. "
  Пусть мо -- ро -- зец гор -- я -- чей,
  Серд -- цу толь -- ко ве -- се -- лей.
  \set stanza = #"3. "
  Бу -- ду в‿ва -- лен -- ках хо -- дить,
  Бу -- ду ми -- ло -- го лю -- бить.
  \set stanza = #"3. "
  О __ _ _ а _ -- уо!
  Бу -- ду ми -- ло -- го лю -- бить.

}}

lyrStropheD = {
  \lyricmode {
}}


strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key e \minor
  b8 b e e g g fs4 
  b,8 b ds ds fs e e4
  b8 b e e g fs fs4
  d8 d fs8. fs16 a8 g g4
  e8 e gs8. b16 b8 a a4
  d,8 fs a8. fs16 g8 g g4
  g4 g8 g 
  fs e c4
  b8 b' b8. ds,16 e8 e e4
  \break
  \repeat volta 2 {
    b'4 e,8 b' 
    b a a4
    a4 fs8 d16 d
    a'8 g g4
    e8 g g g
    fs e c4
    b8 b' b8. ds,16
    e8 e e4
  }
  %\bar "|."
}

chrdStrophe = \chordmode {
  e2:m a:m b e:m e:m a:m d g
  e:7 a:m d g
  e:m a:m b:7 e:m
  e:7 a:m d g e:m a:m b:7 e:m
}

\bookpart {
  \paper {
    page-count = #1
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
    >>
  }
}
