\version "2.24.2"
sheetName = "Unter den Toren"
sheetComposer = "Erik Martin"
sheetPoet = "Erich Scholz"
\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Un -- ter den To -- ren im Schat -- ten der Stadt
  schläft man \set stanza = #"1. " gut, wenn man sonst kei -- ne Schlaf -- stel -- le hat.
  \set stanza = #"1. " Kei -- ner, der fragt nach wo -- her nach wo -- hin 
  \set stanza = #"1.-4. " und zu
  kalt ist die Nacht für Gen -- dar -- men.
  \set stanza = #"1.-4. " He -- jo, ein Feu -- er -- lein brennt,
  kalt ist es für Gen -- dar _ -- men. 
  _ dar -- men.
  }}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Sil -- ber -- ne Löf -- fel und Ket -- ten im Sack
  legst du \set stanza = #"2. " bes -- ser beim Schla -- fen dir un -- ter's Ge -- nack.
  \set stanza = #"2. " Zeig nichts und sag nichts,
  die Mes -- ser sind stumm 
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Greif nach der Fla -- sche doch trink nicht zu viel,
  dei -- ne \set stanza = #"3. " Wür -- fel sind gut a -- ber falsch ist das Spiel.
  \set stanza = #"3. " Spuck in die A -- sche und schau lie -- ber zu
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"4. "
  Rückt dir die freund -- li -- che Schwes -- ter zu nah,
  das ist \set stanza = #"4. " nur für die Wär -- me mal hier und mal da.
  \set stanza = #"4. " Kein Kind der Nacht, das ver -- rät sein Ge -- sicht,
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
  Geh mit der Nacht, eh der Früh -- ne -- bel steigt
  nur das \set stanza = #"5. " Feu -- er brennt stumm, und das Scheit das ver -- schweigt.
  \set stanza = #"5. " Laß nichts zu -- rück und ver -- schweig was du sahst,
  \set stanza = #"5. " denn die Son -- ne bringt bald die Gen -- dar -- men.
  \set stanza = #"5. " He -- ho, das Feu -- er geht aus,
  bald kom -- men die Gen -- dar _ -- men. 
  _ dar -- men. 
}}

stropheSopran = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \key e \minor
  e8 b' b b a g
  a fs fs fs e fs
  g e e e ds e 
  fs b, b b4.
  e8 g g g fs g
  a g a b \break a[ g]
  fs b, b b cs ds
  e4. e4.  \break
  \repeat volta 2 {
  b'4. a4 d8
  b8 a g fs4.
  g8 fs e ds4 b8
  } \alternative {
    { e4 fs8 g4 a8}
    { e4. e4. }
  }
  \bar "|."
}


chrdStrophe = \chordmode {
  e2.:m d c b:7
  e:m d4. e:m b2.:7 e:m
  g4. d g d e:m b:7 e2.:m e:m

}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
   ragged-last-bottom = ##f
  }
  \bookItem
             
  \score {
    <<
    \new ChordNames \transpose g f \chrdStrophe 
    \new Staff \with {\accepts ChordNames}
    <<
      \context Voice = "StropheSopran" \transpose g f \stropheSopran
    >>
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheD
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheE
    >>
  }
}
