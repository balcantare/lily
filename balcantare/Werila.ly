\version "2.22.2"
sheetName = "Werila"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  До -- мик сто -- ит над ре -- ко -- ю
  при -- стан у
  \set stanza = #"1. "
  са -- мой ре -- ки
  Па -- рен дев -- чон -- ку
  \set stanza = #"1. "
  це -- лу -- ет про -- сит он пра -- вой ру -- ки.
  }}

lyrRefr = {
  \lyricmode {
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
  Крас -- на -- я \set stanza = #"2. "
  ро -- за лю -- бовь,
  Жёл -- та -- я ро -- за
  \set stanza = #"2. "
  раз -- лу -- ки
  Нас раз -- лу -- чи -- ла с_то бой.
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Бе -- лу -- ю ро -- зу сры -- ва -- ю,
    Крас -- ну -- ю \set stanza = #"3. "
    ро -- зу дар -- ю,
    Жёл -- ту -- ю ро -- зу
    \set stanza = #"3. "
    раз -- лу -- ки,
    Я под но -- га -- ми топ -- чу.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Го -- ды прой -- дут мо -- ло -- ды -- е
    Морщи -- ны по -- \set stanza = #"4. "
    кро -- ют ли -- цо
    Во -- ло -- сы ста -- нут
    \set stanza = #"4. "
    се -- ды -- е
    Боль -- ше не ну -- жен ник -- то.
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"5. "
    Лю -- бишь, не лю -- бишь
    не на -- до
    Ты ведь е -- \set stanza = #"5. "
    щё мо -- ло -- да
    Врем -- я на -- ста -- нет
    \set stanza = #"5. " по -- лю -- бишь
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
  fs e \bar "" \break d
  fs e2~ 2.
  fs4 g fs
  e d cs
  b2.~ 2.
}

refrSopran = \relative c' {
  %\break
  \accidentalStyle neo-modern %-voice-cautionary
  \time 3/4
  \key b \minor
  \voiceOne
  \bar ".|:"
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
}

refrAlt = \relative c'' {
  \voiceTwo
  g4 g g 
  g fs e
  g4 fs2~ 2.
  e4 e fs
  g fs e
  fs( d2)~ 2.
  cs4 cs d 
  e d cs
  b4 d2~ 2.
  fs4 g fs
  e d cs
  b2.~ 2.
}

refrBass = \relative c' {
  \voiceTwo
  \clef "bass"
  \key b \minor
  g4 g g 
  g g g
  d2.~ 2.
  e4 e e
  e e e
  b2.~ b2.
  e4 e e 
  e4 e e
  b4 b2~ b2.
  fs'4 g fs
  e d cs
  b2.~ 2.
}


refrTenor = \relative c' {
  \voiceOne
  d4 d d
  d cs b
  d4 d2~ 2.
  b4 b cs 
  d cs b
  d4( b2)~ 2.
  g4 g a
  b a g
  b fs2~ 2.
  fs4 g fs
  e d cs
  b2.~ 2.
}
  
chrdStrophe = \chordmode {
  b2.:m s e:m s a:7 s d fs:7
  b:m s e:m s fs:7 s b:m s
}
chrdRefr = \chordmode {
  g s d s e:m s b:m s
  e:m s b:m s fs:7 s b:m s
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
      \new ChordNames \chrdStrophe 
      \new Staff <<
        \new Voice = "Strophe" \strophe 
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
  >> }
  \score {
    <<
      \new ChordNames \chrdRefr
       \new Staff <<
         \new Voice = "RefrSopran" \refrSopran 
         \new Voice = "RefrAlt" \refrAlt
       >>
       \new Lyrics \lyricsto "RefrSopran" \lyrRefr
       \new Staff <<
         \new Voice = "RefrTenor" \refrTenor
         \new Voice = "RefrBass" \refrBass 
       >>  
    >>
    \layout {
      \context {
      \Staff
      \omit TimeSignature
      }
    }
  }
}
