\version "2.22.2"
sheetName = "Solange unsre Lieder klingen"
sheetComposer = "Beate Tarrach"
\include "../include/book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -3)
%\set stanza = \markup{ \right-brace #50 }
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

skipB = {} %\repeat unfold 6 { \skip 8 }

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Son -- nen -- hel -- le Stra -- ßen
  bun -- te Blu -- men blühn am Rand.
  \set stanza = #"1. "
  uns -- re We -- ge führ -- ten uns heut quer ü -- bers Land
  \set stanza = #"1. "
  Strah -- lend bun -- te Som -- mer -- grü -- ße
  brin -- gen wir euch mit.
  Und in
  \set stanza = #"1. "
  tau -- send Far -- ben ma -- len wir da -- raus mit euch ein Lied!
  \set stanza = #"ref. "
  So -- lan -- ge uns -- re Lie -- der klin -- gen,
  sind wir stark. So -- lan -- ge wir zu -- sam -- men
  sin -- gen loht sich je -- der neu -- e Tag!
  So -- lan -- ge uns -- re Lie -- der klin -- gen,
  spü -- ren wir, was wirk -- lich zählt, ja
  wir stehn hier und sin -- gen
  un -- ser Lied in die bun -- te Welt.
}}

skipA = {} %\repeat unfold 59 { \skip 1 }
lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = #"2. "
  Leu -- te, macht die Her -- zen auf und lasst die Son -- ne rein.
  \set stanza = #"2. "
  Wär -- me gibt uns Men -- schen Kraft
  und läßt uns ver -- zeihn.
  \set stanza = #"2. "
  Viel -- falt öff -- net uns -- re We -- ge,
  Ein -- falt macht sie dicht.
  Bun -- te
  \set stanza = #"2. "
  Far -- ben sind ein Se -- gen.
  Bunt ist selbst das Son -- nen -- licht!
}}


lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = #"3. "
    Öff -- net heu -- te al -- le Stra -- ßen
    und die Tü -- ren weit.
    \set stanza = #"3. "
    Lasst den fri -- schen Wind he -- rein,
    es ist an der Zeit,
    \set stanza = #"3. "
    daß der Welt an al -- len Or -- ten
    bun -- te Freu -- de sprüht,
    und das
    \set stanza = #"3. "
    Lie -- be
    wie ein Vo -- gel frei durch un -- sern Him -- mel zieht.
    }}

strophe = \relative c' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \major
  %\partial 8
  fs16[ fs16~ 8 fs8 a16 g16]~ 8 fs8 e d
  d8 d d b16 a~ 2
  d8[ d d e16 g]~ 8 fs e d
  e4 fs8 g e2
  fs8 8 8 a g16[ fs8 d16~ 8 b]
  d16[ 16~ 8 8b] a4 d8 e
  g8 fs~ 2 e8 d
  d4 b2 d8 8
  d2~ 8 8 fs a
  a2
  %\once \override Rest.extra-spacing-width = #'(0 . 0)
  \once \override Rest.minimum-distance = #0
  r4 r8
  \bar "||" \break
  a,8
  a'8[ 8 8 16 16]~ 8 g fs e
  d4 g8 fs~ fs4. fs8
  g8[ 8 8 16 16]~ 8 fs e d
  a'8 a a b a16 g8 e16~ 4
  r2 r4 r8 a,8
  a'8[ 8 8 16 16]~ 8 g fs e
  g8 8 8 8 16[ fs16~ fs8 e d]
  fs2~ 8 8 8 a
  g8 fs~ 2 g8 a
  g4 g~ 8[ 8 8 g16 fs]~
  1
  \bar "|."
}

chrdStrophe = \chordmode {
 % s2 s
 % s8
 d2 g
 e:m d
 s b:m
 e:m a:7
 d g e:m d
 b1:m g e:m
 a4 g a2

 d1 g2 d g1
 e2:m a:7
 g4 a2.
 d1
 g1
 d b:m g d
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
    \new ChordNames { \chrdStrophe }
    %\new Voice = "Refrain" { \refrain
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      %  \new Voice = "StropheAlt" { \stropheAlt }
      >>
    % \new Lyrics \lyricsto "Refrain" \lyrRefrain
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    %\new Staff <<
    %   \new Voice = "StropheAlt" { \stropheAlt }
    %  >>
    %\new Lyrics \lyricsto "StropheAlt" \lyrStropheD
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
