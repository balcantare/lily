\version "2.24.0"
sheetName = "Ljublju Zigana Jana"
\include "../include/book.ily"

% https://youtu.be/LpMWk2rlQ6Q
% https://duckduckgo.com/?q=%D0%9B%D1%8E%D0%B1%D0%BB%D1%8E+%D1%86%D1%8B%D0%B3%D0%B0%D0%BD%D0%B0+%D0%AF%D0%BD%D0%B0&t=epiphany&iax=videos&ia=videos&iai=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DSaYZV1yKcnA
% https://webkind.ru/text/0145948_37019p81411778_text_pesni_lyublyu-cygana-yana.html
lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Цы -- га -- не люб -- ят коль -- ца,
  Да коль -- ца не прос -- ты -- е.
  \set stanza = #"1. "
  Цы -- га -- не люб -- ят коль -- ца,
  А коль -- ца зо -- ло -- ты --  е.
 
 % А мо -- ло -- дой цы -- ган -- ке
 % А до -- ма не си -- дит -- ся,
 % О -- на бер -- ёт ги -- та -- ру,
 % По -- ёт и ве -- се -- лит -- ся.
  
  Ой, ма -- ма, ма -- ма, ма -- ма,
  Люб -- лю цы -- га -- на Я -- на,
  Люб -- лю цы -- га -- на Я -- на,
  И_вы -- й -- ду за цы -- га -- на.
  % Ой, вер -- ю, вер -- ю, де -- ти,
  % Что есть лю -- бовь на све -- те.
}}


lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Цы -- га -- не люб -- ят шу -- бы, 
  Да шу -- бы не прос -- ты -- е 
  \set stanza = #"2. "
  Цы -- га -- не люб -- ят шу -- бы, 
  Да шу -- бы ме -- хо -- вы -- е.
}} 


lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Цы -- га -- не люб -- ят джин -- сы, 
  Да джин -- сы не прос -- ты -- е 
  \set stanza = #"3. "
  Цы -- га -- не люб -- ят джин -- сы, 
  Да джин -- сы фир -- мо -- вы -- е.
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"4. "
  Цы -- га -- не люб -- ят ви -- на, 
  Да ви -- на не прос -- ты -- е 
  \set stanza = #"4. "
  Цы -- га -- не люб -- ят ви -- на, 
  Арм -- янс -- ко -- го раз -- ли -- ва.
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
  Цы -- га -- не люб -- ят жен -- щин, 
  Да жен -- щин не -- прос -- ты -- х 
  \set stanza = #"5. "
  Цы -- га -- не люб -- ят жен -- щин, 
  Кра -- си -- вых, мо -- ло -- ды -- х.
}}

lyrStropheF = {
  \lyricmode {
  \set stanza = #"6. "
  Цы -- га -- не люб -- ят тан -- цы, 
  Да тан -- цы не -- прос -- ты -- е 
  \set stanza = #"6. "
  Цы -- га -- не люб -- ят пляс -- ки, 
  Да пляс -- ки ог -- не -- вы -- е.
}}

strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key e \minor
  r8 g g g g4 a
  g2 fs
  r8 fs8 fs fs fs4 g 
  fs2 e
  r8 g g g g4 a
  g2 fs
  r8 a a a a4 b
  a2 g
  r8 b8 b b b4 c
  b2 a
  r8 a8 gs a c4 b
  a2 g \break
  r8 g fs g b4 a
  g2 fs
  r8 fs fs fs a4 g
  fs2 e \break		
  %r8 b' b b b4 e
  %b2 a
  %r8 a8 gs a c4 b
  %a2 g
  %r8 g8 fs g b4 a
  %g2 fs
  %r8 fs8 es fs a4 g
  %fs2 e
  \bar "|."
  
  
}


chrdStrophe = \chordmode {
  e1:m a:m b:7 e:m
  e:m a:m d:7 g
  e:7 a:m d:7 g
  c a:m b:7 e:m
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    >>
  }
}
