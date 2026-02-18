\version "2.22.2"
sheetName = "Podmowskoje Wecera"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Не слыш -- ны в_са -- ду
  да -- же шо -- ро -- хи
  \set stanza = #"1. "
  всё здесь за -- мер -- ло
  до у -- тра.
  \set stanza = #"1. "
  Ес -- ли_б зна -- ли вы
  как мне до -- ро -- ги
  \set stanza = #"1. "
  под -- мос -- ков -- ны -- е
  ве -- че -- ра.
  }}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Реч -- ка дви -- жет -- ся,
  и не дви -- жет -- ся,
  \set stanza = #"2. "
  Вся из лун -- но -- го се -- реб -- ра.
  \set stanza = #"2. "
  Пес -- ня слы -- шит -- ся
  и не слы -- шит -- ся
  \set stanza = #"2. "
  В_э -- ти ти -- хи -- е ве -- че -- ра.
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Что ж_ты, ми -- ла -- я,
    смо -- тришь ис -- ко -- са,
    \set stanza = #"3. "
    Низ -- ко го -- ло -- бу на -- клон -- я?
    \set stanza = #"3. "
    Труд -- но вы -- ска -- зать и не
    вы -- ска -- зать
    \set stanza = #"3. "
    Всё, что на серд -- це у мен -- я.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    А рас -- свёт у -- же все за -- мет -- не -- е
    \set stanza = #"4. "
    Так, по -- жа -- луйс -- та,
    будь доб -- ра,
    \set stanza = #"4. "
    Не за -- будь и ты э -- ти лет -- ни -- е
    \set stanza = #"4. "
    Под -- мос -- ков -- ны -- е ве -- че -- ра!
}}

strophe = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key a \minor
  a4 c e c
  d2 c4 b
  e2 d
  a1 \break
  c4 e g g
  a2 g4 f
  e1
  \break
  \repeat volta 2 {
    fs2 gs
    b4 a e2~ 2 b4 a
    e' d f2~
    2 \bar "" \break  g4 f
    e2 d4 c e2 d a1
  }
  % \bar "|."
}

chrdStrophe = \chordmode {
  a1:m d:m e:7
  a:m c f2 g:7
  c1 b2:7 e:7 a1:m
  \parenthesize a:7
  d:m d:m6 a:m e:7 a:m
  }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.5))
  }
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
