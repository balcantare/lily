\version "2.22.2"
sheetName = "Nane Zocha"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Na -- ne zo -- cha, na -- ne gad,
  me ki -- nel
  \set stanza = #"1. "
  man -- ge jo dad!
  Syr vy -- dža -- va pa -- le rom.
  \set stanza = #"1. "
  Me ki -- nel man -- ge jo rom. ge jo rom.

  Naj na na na naj na na na na naj na
  na na naj na na na na na naj na
  na na naj na na na na a naj a na na na na na na naj na
  hop hop hop
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Da -- do, kin man -- ge čin -- ja!
  O čin -- ja
  \set stanza = #"2. "
  som -- na ku -- ne.
  Na -- ki -- ne -- sa o čin -- ja,
  \set stanza = #"2. "
  Na -- be -- ša -- va dro ča -- ja.
  dro ča -- ja.
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Za -- ge -- jom me dre da_sa -- do,
    Sris -- ker -- diom \set stanza = #"3. "
    ___
    man sve -- to.
    Pri -- ker -- diom les ke še -- ro,
    \set stanza = #"3. "
    Te ka -- mes mi -- ro i -- lo.
    ro i -- lo.
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key a \minor
  a4. b8 c( b) c4
  e4 d8( c) c2
  r4 a'8 a a4. \bar "" \break 8
  a8( g) g( fs) g4( a4) %\break
  \repeat volta 2 {
  r8 f4 d8 g4. f8
  e8( f) e( ds) e4( c)
  r4 f8 f e4 d }
  \alternative {
    { a4 a a'( g) }
    { a,4 gs a r }
  } \bar "||" \break
  a4. b8 c b c4
  d8 e8 d b c4 c
  r8 a'4 a8 a4. 8
  a8 g g fs g4 a4 % \break
  \repeat volta 2 {
  r8 f4 d8 g4. f8
  e8 f e ds e4 c
  r4 f8 f e4 d }
  \alternative {
    { a4 a a' g }
    { a,4 gs a r }
  } \break
  \bar "|."
}

chrdStrophe = \chordmode {
  a1:m g2:7 c
  f1 c2 a:7
  d1:m a:m
  d2:m e:7 a:m a:7
  a4:m e:7 a2:m

  a1:m g2:7 c
  f1 c2 a:7
  d1:m a:m
  d2:m e:7 a:m a:7
  a4:m e:7 a2:m
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
