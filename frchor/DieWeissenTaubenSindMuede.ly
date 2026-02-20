\version "2.22.2"
sheetName = "Die weißen Tauben sind müde"
%sheetComposer = "Bots"
#(define book-staff-size 16)
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
  ein letz -- tes Glas,
  ge -- nie -- ßen wir den
  Au -- gen -- blick,
  \set stanza = #"1."
  ab mor -- gen gibt's statt Wein nur Was -- ser.
  \set stanza = #"1."
  Komm her und schenk uns noch -- mal ein,
  so viel wird mor -- gen
  an -- ders sein!
  \set stanza = #"1."
  Ma -- rie, die Welt wird lang -- sam blas -- ser.
  \set stanza = #"1-3."
  Die wei -- ßen Tau -- ben sind mü -- de,
  sie flie -- gen lan -- ge schon nicht \set stanza = #"1-3." mehr.
  Sie ha -- ben viel zu schwe -- re Flü -- gel,
  und ih -- re 
  \set stanza = #"1-3."
  Schnä -- bel sind längst
  
  leer.

  Je -- doch die Fal -- ken flie -- gen wei -- ter!
  \set stanza = #"1-3." Sie sind so stark wie nie vor --
  her,
  und ih -- re Flü -- gel wer -- den
  brei -- ter,
 \set stanza = #"1-3." und täg -- lich 
  kom -- men im -- mer mehr,
  nur wei -- ße Tau -- ben flie -- gen nicht mehr.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2."
  Bleib noch, Ma -- rie, der letz -- te Rest
  reicht für uns bei -- de
  al -- le -- mal,
  \set stanza = #"2."
  ab mor -- gen gibt's statt Brot nur Stei -- ne
  \set stanza = #"2."
  Komm her und schenk uns noch -- mal ein,
  denn so wie heut' wird's
  nie mehr sein.
   \set stanza = #"2."
  Ma -- rie, die Welt kreist von al -- lei -- ne.
  \set stanza = #"4-5."
  Die wei -- ßen Tau -- ben sind mü -- de,
  doch las -- sen wir sie nicht al -- \set stanza = #"4-5."
 lein.
    Wir sind der Wind für ih -- re Flü -- gel.
  Wir kön -- nen \set stanza = #"4-5." ih -- nen Auf -- trieb
   sein.
  Wenn auch die Fal -- ken wei -- ter flie -- gen,
  \set stanza = #"4-5." so sind doch ih -- re Her -- zen 
  leer.
  Und des -- halb könn’ sie uns nicht krie -- gen
 \set stanza = #"4-5." und uns -- re 
  Tau -- ben ziehn’ übers Meer,
  ja, wei -- ße Tau -- ben ziehn’ ü -- bers Meer!
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3."
    Sie her, Ma -- rie, das lee -- re Bett,
    der Spie -- gel uns' -- rer
    gro -- ßen Zeit;
    \set stanza = #"3."
    ab mor -- gen gibt's statt Glas nur Scher -- ben.
    \set stanza = #"3."
    Komm her und schenk uns noch -- mal ein,
    den letz -- ten Schluck vom
    letz -- ten Wein.
    \set stanza = #"3."
    Ma -- rie, die Welt be -- ginnt zu ster -- ben.
}}
lyrStropheD = {
  \lyricmode {
    \set stanza = #"4."
    Wach auf, Ma -- rie, ein neu -- er Tag
    der für uns al -- le
    heut be -- gann!
    \set stanza = #"4."
    Wir las -- sen uns den Mut nicht neh -- men.
    \set stanza = #"4."
    Wo ges -- tern noch der Rot -- wein lag
    fängt heut ein Quell zu
    spru -- deln an:
    \set stanza = #"4."
    die Kraft, nach der wir uns so seh -- nen!
}}
lyrStropheE = {
  \lyricmode {
    \set stanza = #"5."
    Komm mit, Ma -- rie, mach auf dein Herz!
    Wir neh -- men all die
    an -- dern mit,
    \set stanza = #"5."
    die lang schon auf den Auf -- bruch hof -- fen.
    \set stanza = #"5."
    Komm mit, Ma -- rie, be -- sieg den Schmerz,
    wir sin -- gen heut’ ein
    neu -- es Lied!
    \set stanza = #"5."
    Ma -- rie, die Welt- sie steht uns of -- fen.
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
  g8. fs16 d8. \break d16
  g8 g g g
  g4. d8
  d8 e4.~
  e4 r8
  \break
  a,
  fs'8. fs16 a8. fs16
  e8. e16 a8. e16
  a8 g a g
  g8. fs16 d8. \break d16
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
  s
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
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout {#(layout-set-staff-size-with-jazz 17)}
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
    >>
  }
}
