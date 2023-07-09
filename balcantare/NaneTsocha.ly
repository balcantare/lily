\version "2.22.2"
fileName = "NaneTsocha.ly"
sheetName = "Nane Zocha"
\include "book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -3)
}

dropLyricsB = {
\override LyricText.extra-offset = #'(0 . -1.5)
\override LyricHyphen.extra-offset = #'(0 . -1.5)
\override LyricExtender.extra-offset = #'(0 . -1.5)
\override StanzaNumber.extra-offset = #'(0 . -1.5)
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}
skipA = \repeat unfold 4 { \skip 4 }
skipB = \repeat unfold 8 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }

lyrStropheA = {
  \lyricmode {
  Na -- ne tso -- cha, na -- ne gad,
  mi ki -- nel man -- ge o dad
  sar me dža -- va pal o rom,
  mi ki -- nel man -- ge o rom ge o rom

  Naj na na na naj na na na na naj na
  na na naj na na na na na naj na
  na na naj na na na na a naj a na na na na na na naj na
  hop hop hop
}}

lyrStropheB = {
  \lyricmode {
  Da -- do ma -- mo cin če -- ňa,
  o la če -- ňa som -- na_ku -- ne
  sar tu man -- ge na ci -- ne_ha,
  na ba -- šav -- na o čha -- ja.
  o čha -- ja.
}}


lyrStropheC = {
  \lyricmode {
    Ge -- l'om me an -- dro -- da_sa -- dos,
    pri -- ker -- džo -- me
    les -- ke -- ro
    po -- ker -- džo -- me tro še -- ro,
    kaj tu ka -- mes mro ji -- lo
    mro ji -- lo

}}

lyrStropheD = {
  \lyricmode {
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key a \minor
  a4. b8 c( b) c4
  e4 d8( c) c2
  r4 a'8 a a4. 8
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
  f1 c2 cs:dim
  d:m e:7 a:m7 fs:m5-7
  d:m7 e:7 a:m7 cs:dim
  a4:m e:7 a2:m

  a1:m g2:7 c
  f1 c2 cs:dim
  d:m e:7 a:m7 fs:m5-7
  d:m7 e:7 a:m7 cs:dim
  a4:m e:7 a2:m
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
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
