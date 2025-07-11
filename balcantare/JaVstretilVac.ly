\version "2.24.0"
sheetName = "Ja Vstretil Vac"
sheetPoet = "Fyodor Tyutchev"
sheetComposer = "Sheremetev"
\include "../include/book.ily"

% https://lyricstranslate.com/en/i-have-met-you-and-past-desires-lyrics.html
% https://youtu.be/9JXybc0bfmw

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Я встре -- тил вас и всё бы -- ло -- е
  \set stanza = #"1. " 
  В_от -- жив -- шем сер -- дце о __ _ _ жи -- ло
  \set stanza = #"1. "
  Я вспом -- нил врем -- я врем -- я зо -- ло -- то -- е
  \set stanza = #"1. "
  И серд -- цу ста -- ло та __ _ к теп -- ло
  \set stanza = #"1. "
  Я вспом -- нил врем -- я врем -- я зо -- ло -- то -- е
  \set stanza = #"1. "
  И серд __ _ _ цу ста -- ло так теп -- ло


}}


lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Как поз -- дней о -- се -- ни по -- ро -- ю
  \set stanza = #"2. "
  Бы -- ва -- ют дни, бы -- ва __ _ _ ет час,
  \set stanza = #"2. "
  Ког -- да по -- ве -- ет вдруг _ _ вес -- но -- ю
  \set stanza = #"2. "
  И что то встре -- пе -- нет __  _ _ ся в_нас
}} 


lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Тут не од -- но вос -- по -- ми -- на -- нье,
  \set stanza = #"3. "
  Тут жизнь за -- го -- во -- ри __ _ _ ла вновь,
  \set stanza = #"3. "
  И то же в_нас о -- ча _ _ -- ро -- ван -- ье,
  \set stanza = #"3. "
  И та_ж в_ду -- ше мо -- ей __ _ _ лю -- бовь!
  \set stanza = #"3. "
  И то же в_нас о -- ча _ _ -- ро -- ван -- ье,
  \set stanza = #"3. "
  И та __ _ ж в_ду -- ше мо -- ей лю -- бовь!
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key a \minor
  \bar "|."
  \partial 4
  e4 
  e2 c'2 
  b2. a4
  g2. f4
  e4 g2 \break g4
  g4( f2) b,4 
  e2. e4
  fs4 c' b a 
  gs2. \break gs4
  a2 g2
  f2. a4
  g4 g2 g8 f
  e4 g2 \break g4
  g4( f2) b,4
  e2. e4 
  fs4 c' b a 
  gs2. \break gs4
  a2 e' 
  d2. c4
  b4 4 a b
  d2 c4 \break c
  b a f b, 
  e2. e4 
  fs2 gs
  a2.
  \bar "|."
}


chrdStrophe = \chordmode {
  s4
  a1:m
  d:m
  g:7
  c
  d:m
  a:m
  b:7
  e:7
  a:7 d:m g:7 c
  d:m a:m b:7 e:7
  a:7 d:m g:7 c
  d2:m b:m5-7 
  a1:m
  b2:7 e:7 a2:m
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
      \new ChordNames { \transpose c bf \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \transpose c bf, \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
