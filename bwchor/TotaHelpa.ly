\version "2.22.2"
fileName = "TotaHelpa.ly"
sheetName = "Tota Hel'pa"
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
  To -- ta Hel' -- pa,
  to -- ta Hel' -- pa,
  to je pe -- kné mes -- to
  \set stanza = #"1. "
  l'en -- že má -- lo,
  l'en -- že má -- lo
  švár -- nych chlap -- cov
  jes -- to.
  \set stanza = #"1. "
  O -- ho jes -- to,
  to -- ho jes -- to,
  nie -- po mo -- jej
  vô -- li,
  \set stanza = #"1. "
  len -- za jed -- ným,
  len -- za jed -- ným,
  sr -- dieč -- ko ma bo -- lí.
}}

skipA = \repeat unfold 59 { \skip 1 }
lyrStropheB = {
  \lyricmode {
    %\skipA
  \set stanza = #"2. "
  Auf der Stra -- ße, mei -- ne Schrit -- te
  füh -- ren in die Fer -- ne.
  \set stanza = #"2. "
  Und mit je -- dem mei -- ner
  Trit -- te spür' ich Son -- nen -- wär -- me.
  \set stanza = #"2. "
  Lie -- be Son -- ne, lie -- be Er -- de,
  Ster -- ne, Mond und Bäu -- me,
  \set stanza = #"2. "
  Son -- nen -- wär -- me, grü -- ne Er -- de,
  geh' ich hin und träu -- me.
}}

lyrStropheC = {
  \lyricmode {
    %\skipA
    \set stanza = #"3. "
    Frem -- de Dör -- fer, Märk -- te, Stä -- dte,
    ru -- he -- lo -- ses Trei -- ben,
    \set stanza = #"3. "
    Lau -- fen has -- ten um die Wet -- te,
    vor -- wärts, nie -- mals blei -- ben.
    \set stanza = #"3. "
    Hu -- pen, häm -- mern, flu -- chen,
    sä -- gen, mah -- len will die Müh -- le.
    \set stanza = #"3. "
    Nie -- mals ru -- hen, stets be -- we -- gen,
    ru -- he -- lo -- se See -- le.
    }}

lyrStropheD = {
  \lyricmode {
   %\skipA
    \set stanza = #"4. "
    Ei, da lauf ich ganz schnell wei -- ter
    aus dem grau -- en Hau -- fen,
    \set stanza = #"4. "
    und ich spü -- re vor und ne -- ben
    mir die Freun -- de lau -- fen.
    \set stanza = #"4. "
    Hei, wie sprin -- gen, tan -- zen, lau -- fen,
    flie -- gen al -- le Bei -- ne:
    \set stanza = #"4. "
    ja, wir sind der bun -- te Hau -- fen und sind nicht
    al -- lei -- ne!
}}

skipC = \repeat unfold 8 { \skip 8 }

lyrStropheE = {
  \lyricmode {
   \skipA
    \set stanza = #"5. "
}}

strophe = \relative c' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key a \minor
  %\partial 8
  a4 e' e d
  g e e d
  c4. a8 c8 b4.
  a2 a4 r
  \voiceTwo
  a4 e' e d
  g e e d
  c4. a8 c8 b4.
  a2 a4 r
  \repeat volta 2 {
  a'4 a a8 g4.
  e4 e d8 c4.
  d4 d g8 f4.
  e2 4 r
  a,4 e' e d g e e d c4. a8 c8 b4.
  a2 a4 r }
  %\bar "|."
}


stropheAlt = \relative c' {
    %\voiceOne
  %\key g \major
   s1 s s s
   \voiceOne
   e4 g g f
   g g g f
   e4. e8 e8 d4.
   e2 e4 s

   c'4 c c8 b4.
   g4 g f8 e4.
   g4 g g8 f4.
   g2 gs4 s

   e4 g g f
   g g g f
   e4. e8 e8 d4. e2 e4
}

stropheBass = \relative c' {
  %\clef bass
}

chrdStrophe = \chordmode {
 % s2 s
  \set chordBassOnly = ##t
  a1:m %a4:/b
  %\parenthesize g4
  c1 % c4:/d \parenthesize d4:m
  %ef2:dim
  e1
  a1:m

  a1:m % a4:/b \parenthesize g4
  c1 % c4:/d \parenthesize d4:m
  %ef2:dim
  e1
  a1:m

  f2 g
  c1 % a:m
  g1 %g4:/b \parenthesize g4:7
  c2 e:7

  a1:m %a4:/b \parenthesize g4
  c1 %2 c4:/d \parenthesize d4:m
  %ef2:dim
  e1
  a1:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.25))
    ragged-last-bottom = ##f
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    %\new Voice = "Refrain" { \refrain
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    % \new Lyrics \lyricsto "Refrain" \lyrRefrain
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    %\new Staff <<
    %\new Voice = "StropheAlt" { \stropheAlt }
    %  >>
    %\new Lyrics \lyricsto "StropheAlt" \lyrStropheD
    >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}
