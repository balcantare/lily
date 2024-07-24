\version "2.24.2"
sheetName = "Disleur que l'on s'aime"
sheetComposer = "HK"
#(define book-staff-size 16)
\include "../include/book.ily"

skipA=\repeat unfold 21 \skip 8
skipB=\repeat unfold 86 \skip 8

lyrStropheA = {
  \lyricmode {
  \skipA
  \set stanza = #"ref. "
  Oh mais dis -- -leur que l'on s'ai -- me
  Dis -- -leur que ça nous fait du bien
  En quoi ce -- la serait-il un pro -- blè -- me
  Nous nous te -- nons par la main

  Oh mais dis -- -leur que l'on sè -- me
  Dis -- -leur que ça nous fait du bien
  Non nous ne sommes pas un pro -- blè -- me
  Nous sommes le mon -- de de de -- main.

  \set stanza = #"1. "
  Dis -- -leur que c'est ain -- si
  Que nais -- sent les co -- lom -- bes
  Dis -- -leur que c'est i -- ci
Que com -- mence le nou -- veau mon -- de
Dis leur nos cœurs qui s'ouvrent
Quand le monde_s 'i -- so -- le
Dis -- -leur qu'on se re -- trouve
É -- man -- ci -- pés des ca -- mi -- so -- les

Dis -- -leurs nos corps qui vi -- brent
Nos no -- tes de mu -- si -- que
Dis -- -leur que nous som -- mes lib -- res
A cha -- que pas de danse sur la pla -- ce pu -- blique

}}

lyrStropheB = {
  \lyricmode {
  \skipB  
  \set stanza = #"2. "
Dis -- -leur qu'on est u -- ni-es
Dis -- -leur qu'on est en -- sem -- ble
Dis -- -leur qu'on est en vie
Sur cet -- te_Terre qui nous res -- sem -- ble
Dis -- -leur que l'on a -- vance
Que c'est in -- ex -- orab -- le
Croi -- sant nos dif -- fé -- ren -- ces
Sui -- vant l'in -- ac -- ces -- sible é -- toile
Dis -- -leur que l'on in -- ven -- te
Un autre chant des pos -- sib -- les
Comme ces oi _ -- seaux qui chan -- tent
Au petit matin d'un grand soir,
heu -- reux et in -- do -- ciles
}}


lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"4. "
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
}}

strophe = \relative c'' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key bf \minor
  \partial 2.
  bf4 df f 
  gf1~ 
  8 r4 bf,8 df8 ef4 df16 ef
  f1~ 
  8 r bf,4 df f
  gf1~ 
  8 r f4 df bf
  df2 c4.-\prall af8
  bf8 r \break 
  \bar ".|:" 
  bf[ c] df c4 bf16 af 
  af8 gf4.~ 2
  r8 af8 af bf c16 bf af4 gf8 
  f1
  r8 bf bf c df c bf df 
  ef bf4.~ 2
  r4 af8 bf df c bf af bf1
  r4 bf8 bf bf bf df bf
  f'8 ef4.~ 2
  r8 ef ef ef ef16 ef ef4 df8
  df1
  r8 f f f f ef df f 
  ef bf4. ~ 2
  r8 bf bf c df c4 bf16 af
  bf1 \bar "||" \break
  r4. bf8 bf bf bf ef 
  ef4 r8 ef ef ef ef df
  df c \break  r c c c c ef 
  ef8 df16 df16 df4~ df8 c8 df c 
  df bf \break  r bf8 bf bf bf ef 
  ef4 r4 ef8 ef ef df 
  df c8 \break  r c c c c ef
  ef df df c df c df c 
  df bf \break  r bf bf bf bf ef
  ef bf r4 r2
  r4 r8 ef ef ef ef c 
  df bf \break  r4 r2
  f'8 f4. f16 16 f4 df8
  ef8 bf r4 r4. \break ef8 
  ef ef ef c df4. df8 c df c 
  af bf4 r4
  \bar ":|."
}


chrdStrophe = \chordmode {
  s2.
  ef1:m s bf:m s 
  ef:m s bf2:m af2 
  bf1:m ef:m af df2 f:m
  bf1:m ef:m af df2 f:m
  bf1:m ef:m af df2 f:m
  bf1:m ef:m af df2 f:m
  bf1:m ef:m af df2 f:m 
  bf1:m ef:m af df2 f:m 
  bf1:m ef:m s bf:m s
  ef:m s2 bf:m af bf:m
  }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \transpose df c \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose df c \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
