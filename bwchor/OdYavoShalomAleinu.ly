\version "2.22.2"
sheetName = "Od yavo' shalom aleinu"
sheetComposer = "Mosh Ben-Ari"
\include "../include/book.ily"
dropLyricsA = {
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
lyrStropheA = {
  \lyricmode {
  \set stanza = #"h) "
  Od ya -- vo' sha -- lom a -- lei -- nu,
  \set stanza = #"h) "
  od ya -- vo' sha -- lom a -- lei -- nu,
  od ya -- vo' sha --
  \set stanza = #"h) "
  lom a -- lei -- nu,
  Ve al ku -- lam.
  \dropLyricsA
  Sa -- laam
  \raiseLyrics
  \set stanza = #"h) "
  A -- lei -- nu ve' al kol ha o -- lam
  Sa -- laam Sa -- la -- am.
}}

skipA = \repeat unfold 2 { \skip 8 }
lyrStropheB = {
  \lyricmode {
  \set stanza = #"d) "
  Al -- len Men -- schen die -- ser Er -- de
  \set stanza = #"d) "
  wün -- schen wir, daß Frie -- den wer -- de,
  daß die Völ -- ker
  \set stanza = #"d) "
  die -- ser Er -- de fried -- lich
  ver -- eint!
  \skipA
  %Sa -- laam!
  \set stanza = #"d) "
  Wir hal -- ten fest an un -- se -- rem
  Traum %Sa -- laam!
}}

strophe = \relative c' {
  %\voiceOne
  \time 2/4
  \key d \major
  \partial 8
  \bar ".|:"
  \repeat volta 2 {
  r8
  r8 d16 d d8 e
  fs fs e d
  r8 g16 16 8  8
  8 8 fs e
  r8 d16 d d8 e
  fs8 fs e d
  g8. fs16~ 8 e
  d4. } \break
  \repeat volta 2 {
  a'8
  a2~ 4 r8 d,
  b' a a g
  b a a fs~
  fs4 a8 d,~ d4 fs8 e~
  e8 d4.~
  d8 r4}
  % \bar "|."
}

chrdStrophe =  \chordmode {
  s8
  d2 s
  g2 s
  d2 s
  g4 a d4.
  s8
  d2 s
  g2 s
  d2 s
  g2 s4.
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
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
