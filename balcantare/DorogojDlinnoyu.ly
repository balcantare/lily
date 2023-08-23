\version "2.22.2"
sheetName = "Dorogoj Dlinnoyu"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Е -- ха -- ли на трой -- ке с_бу -- бен -- ца -- ми,
  \set stanza = #"1. "
  А_в -- да -- ли мель -- ка -- ли о -- гонь -- ки.
  \set stanza = #"1. "
  Эх, ког -- да б,_со -- ко -- ли -- ки, за ва -- ми,
  \set stanza = #"1. "
  Ду -- шу бы раз -- ве -- ять от тос -- ки!

  До -- ро -- гой длин -- но -- ю
  Да ноч -- кой лун -- но -- ю,
  Да с_пес -- ней той
  Что вдаль ле -- тит звен -- я,
  Да с_той ста -- рин -- но -- ю
  Да се -- ми -- струн -- но -- ю,
  Что по но -- чам
  Так му -- чи -- ла мен -- я.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Да, вы -- хо -- дит пе -- ли мы за -- да -- ром,
  \set stanza = #"2. "
  По -- на -- прас -- ну ночь за ночь -- ю жгли.
  \set stanza = #"2. "
  Ес -- ли б_мы по -- кон -- чи -- ли со ста -- рым,
  \set stanza = #"2. "
  Так и но -- чи б_э -- ти о -- то -- шли.
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    В_даль род -- ну -- ю но -- вы -- ми пут -- я -- ми
    \set stanza = #"3. "
    Нам от -- ны -- не е -- хать суж -- де -- но.
    \set stanza = #"3. "
    Е -- ха -- ли на трой -- ке с_бу -- бен -- ца -- ми
    \set stanza = #"3. "
    Да те -- перь про -- е -- ха -- ли
    дав -- но.
}}


strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key d \minor
  \bar ".|:"
  \repeat volta 2 {
  d8 d e f g f e d
  f4 d2.
  a8 a bf c d a bf a
  g1
  d'8 d e f g f e d
  f4 d2.
  e8 8 e e e b cs d
  e1 } r4
  \repeat volta 2 {
    f f e
    e d8 8~ 8 d d c
    c4 bf8 8~ 8 g a bf
    c4. d8 e d c bf
    a2 r8 f g a
    c4 bf8 8~ 8 bf8 c d
    g4 f8 8~ 8 d e f
    a4. g8 f e d cs
    d4-\fermata
  }
  % \bar "|."
}

chrdStrophe = \chordmode {
  d1:m s
  d1 g:m s
  d:m e a
  \set chordBassOnly = ##t
  s4 a:/a a:/b a:/cs
  d1:m g:m c f g:m d:m a d4:m
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
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
    >>
  }
}
