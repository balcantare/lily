\version "2.24.2"
sheetName = "Disleur que l'on s'aime"
sheetComposer = "HK"
#(define book-staff-size 20)
\include "../include/book.ily"

transTo=bf,
%transTo=df

skipA=\repeat unfold 21 \skip 8
skipB=\repeat unfold 86 \skip 8

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace60"
}
stanzaA = \markup {
  \column {\vspace #.40 "1. "}
  \column {\vspace #.10 \leftbrace}
}
stanzaB = \markup {
  \column {\vspace #.40 "2. "}
  \column {\vspace #.10 \leftbrace}
}

lyrStropheA = {
  \lyricmode {
    \skipA
    \set stanza = #"ref. "
    Oh mais⃫ dis⃫ -- -leur que l'on s'ai -- me⃫
    Dis⃫ -- -leur que ça nous⃫ fait du bien
    En quoi c'‿la s'rai -- t‿il un pro -- blè -- me
    Nous⃫ nous⃫ te -- nons⃫ par la main

    Oh mais⃫ dis⃫ -- -leur que l'on sè -- me
    Dis⃫ -- -leur que ça nous⃫ fait du bien
    Non nous⃫ ne somm⃫e⃫s⃫ pas‿ un pro -- blè -- me
    Nous⃫ somm⃫e⃫s⃫ le mon -- de de de -- main.

    \set stanza = \stanzaA
    Dis⃫ -- leur que c'es⃫ -- t‿ain -- si
    Que nais -- sen⃫t⃫ les⃫ co -- lom -- bes⃫
    \set stanza = \stanzaA
    Dis⃫ -- leur que c'es⃫ -- t‿i -- ci
    Que commence _ _ le nou -- veau mon -- de
    \set stanza = #"1. "
    Dis⃫ -- leurs⃫ nos⃫ corps⃫ qui vi -- bren⃫t⃫
    _ _ Nos⃫ no -- tes⃫ de mu -- si -- que
    \set stanza = #"1. " Dis⃫ -- leur que nous som -- mes⃫ lib -- res⃫
    \set stanza = #"1. " A cha -- que pas⃫ de danse⃫ sur la pla -- ce pu -- blique⃫

  }
}

lyrStropheAA = {
  \lyricmode {
    \skipB
    Dis⃫ -- leur nos⃫ cœurs⃫ qui s'ouvre⃫n⃫t⃫
     Quand⃫ le mon -- de s'‿i -- so -- le
    Dis⃫ -- leur qu'on se re -- trouve
    É -- man -- ci -- pés⃫ des⃫ ca -- mi -- so -- les⃫
}}

lyrStropheB = {
  \lyricmode {
    \skipB
    \set stanza = \stanzaB
    Dis⃫ -- leur qu'o -- n‿es⃫ -- t‿u -- nie⃫s⃫
    Dis⃫ -- leur qu'o -- n‿es⃫ -- t‿en -- sem -- ble
    \set stanza = \stanzaB
    Dis⃫ -- leur qu'o -- n‿es⃫ -- t‿en vie
    Sur cet -- te Terr⃫e⃫ qui nous⃫ res⃫ -- sem -- ble
    \set stanza = #"2. "
    Dis⃫ -- leur que l'o -- n‿in -- ven -- te 
    Un au -- tre chant _ des⃫ pos⃫ -- sib -- les⃫
    \set stanza = #"2. "
    Comm⃫e⃫ ce -- s‿oi _ -- seaux qui chan -- ten⃫t⃫
    \set stanza = #"2. "
    Au petit⃫ matin d'un grand soir,
    heu -- reux⃫ et⃫ in -- do -- cile⃫s⃫
  }
}

lyrStropheBB = {
  \lyricmode {
    \skipB
    Dis⃫ -- leur que l'on a -- vance
    Que c'est in -- ex -- o -- rab -- le
    Croi -- sant nos 
    dif -- fé -- rence⃫s⃫ Sui -- vant⃫ 
    l'i -- n‿ac -- ces⃫ -- sib -- le⃫‿é -- toi -- le
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
  r4 af8 bf df c bf af bf1 \break
  r4 bf8 bf bf bf df bf
  f'8 ef4.~ 2
  r8 ef ef ef ef16 ef ef4 df8
  df1 \break
  r8 f f f f ef df f
  ef bf4. ~ 2
  r8 bf bf c df c4 bf16 af
  bf1 \bar "||" r4 \break
  \repeat volta 2 {
    r8 bf8 bf bf bf ef
  ef4 r8 ef ef ef ef df
  df c \break  r c c c c ef
  %ef8 df16 df16 df4~ df8 c8 df c
  ef df df c df c df c
  df[ bf] } \break  
  %r bf8 bf bf bf ef
  %ef4 r4 ef8 ef ef df
  %df c8 \break  r c c c c ef
  %ef df df c df c df c
  %df bf \break  
  r bf bf bf bf ef
  ef bf \voiceOne r4 r2
  r8 ef ef ef ef ef ef c
  df bf \break \voiceOne r4 r4.
  f'8 f4 f8 8 f4 df
  ef8 bf r4 r4. \break ef8
  ef ef ef c df4. df8 c c  df 
  c bf4 r4
  \bar ":|."
}

accomp = \relative c'' {
  \voiceThree
  s2.
  s1*28
  s4 \voiceTwo ef8 bf a bf ef bf
  ef4 s2.
  s4 df8 bf \voiceTwo a bf df4 s4 s2.
  s4 ef8 bf a bf ef4 
}

chrdStrophe = \chordmode {
  s2.
  ef1:m s bf:m s
  ef:m s bf2:m af2
  bf1:m ef:m af df
  bf1:m ef:m af bf:m
  bf1:m ef:m af df
  bf1:m ef:m af bf:m
  s4 \parenthesize bf2.:m ef1:m af df2 f:m
  bf1:m %ef:m af df2 f:m
  %bf1:m 
  ef:m s bf:m s
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
      \new ChordNames { \transpose df \transTo \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \transpose df \transTo \strophe }
        \new Voice = "Accomp" { \transpose df \transTo \accomp }
      >>
      \new Lyrics \lyricsto "Strophe" \lyrStropheA
      \new Lyrics \lyricsto "Strophe" \lyrStropheAA
      \new Lyrics \lyricsto "Strophe" \lyrStropheB
      \new Lyrics \lyricsto "Strophe" \lyrStropheBB
    >>
  }
}
