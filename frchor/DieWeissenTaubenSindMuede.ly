\version "2.22.2"
sheetName = "Die weißen Tauben sind müde"
%sheetComposer = "Bots"
\include "../include/book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(1 . -2.5)
\set stanza = \markup{ \right-brace #50 }
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

skipA = {} %\repeat unfold 0 { \skip 2 }
skipB = \repeat unfold 32 { \skip 2 }
lyrStropheA = {
  \lyricmode {
  \set stanza = #"1."
  Komm her, Ma -- rie,
  ei letz -- tes Glas,
  ge -- nie -- ßen wir den
  Au -- gen -- blick,
  ab mor -- gen gibt's statt Wein nur Was -- ser.
  Komm her und schenk uns noch -- mal ein,
  so viel wird mor -- gen an -- ders sein!
  Ma -- rie, die Welt wird lang -- sam blas -- ser.

  Die wei -- ßen Tau -- ben sind mü -- de,
  sie flie -- gen lan -- ge schon nicht mehr.
  Sie ha -- ben viel zu schwe -- re Flü -- gel,
  und ih -- re Schnä -- bel sind längst leer.

  Je -- doch die Fal -- ken flie -- gen wei -- ter!
  Sie sind so stark wie nie zu -- vor,
  und ih -- re Flü -- gel wer -- den
  brei -- ter,
  und täg -- lich kom -- men im -- mer mehr,
  nur wei -- ße Tau -- ben flie -- gen nicht mehr.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2."
  Bleib noch, Ma -- rie, der letz -- te Rest
  reicht für uns bei -- de al -- le -- mal,
  ab mor -- gen gibt's statt Brot nur Stei -- ne
  Komm her und schenk uns noch -- mal ein,
  denn so wie heut' wird's nie mehr sein.
  Ma -- rie, die Welt kreist von al -- lei -- ne.
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Sie her, Ma -- rie, das lee -- re Bett,
    der Spie -- gel uns' -- rer gro -- ßen Zeit;
    ab mor -- gen gibt's statt Glas nur Scher -- ben.
    Komm her und schenk uns noch -- mal ein,
    den letz -- ten Schluck vom letz -- ten Wein.
    Ma -- rie, die Welt be -- ginnt zu ster -- ben.

}}

strophe = \relative c' {
  %\voiceOne
  \time 2/4
  \key b \minor
  \partial 8
  a8
  fs'8. fs16 a8. fs16
  e8. e16 a8. e16
  g8 g a g
  g8. fs16 d8. d16
  g8 g g g
  g4. d8
  d8 e4.~
  e4 r8
  a,
  fs'8. fs16 a8. fs16
  e8. e16 a8. e16
  a8 g a g
  g8. fs16 d8. d16
  g4. fs8
  fs8 e d cs
  cs8 d4.~
  d4 r \break
  r8 d d d
  d cs b b8~
  b8 a4.~
  a2
  r8 d d d
  b'16 b8.
  b8 a8 a2 ~
  a4 r
  r8 fs8 fs a
  a g g a
  g8 fs4.~
  2
  r8 d d d
  d d d e
  e2~
  e4 r
  r8 a, a d
  d e e e
  e fs4.~
  fs4 r4
  r8 d d d
  g b b a
  a2~
  a4 r
  r8 fs8 fs a
  a g g a
  g fs4.~
  fs4 r
  r8 d g fs
  e16 e8. d8 cs
  d4. d8
  d4 e
  g8 fs4.
  e8 d4 cs8
  d2~
  d4 r8


  \bar "|."
}

chrdStrophe = \chordmode {
  s8
  d2 a g d g d a
  d
  d a g d g a d s
  d g d s
  b:m g a s
  d g  d s
  g s a s
  d g d s
  b:m g a s
  d g d s
  g a g s
  d a d
}


\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
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
    >>
  }
}
