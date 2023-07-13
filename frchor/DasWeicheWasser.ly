\version "2.22.2"
sheetName = #"Das weiche Wasser"
\include "book.ily"

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

skipA = \repeat unfold 19 { \skip 2 }
skipB = \repeat unfold 32 { \skip 2 }
lyrStropheA = {
  \skipA
  \lyricmode {
  \set stanza = #"1. "
  Eu -- ro -- pa hat -- te zwei -- mal
  Krieg,
  der drit -- te wird der letz -- te sein,
  gib bloß nicht auf, gib nicht klein bei,
  \dropLyricsA
  das wei -- che Was -- ser bricht den Stein!
  \raiseLyrics
  \set stanza = #"1. "
  Die Bom -- be die kein Le -- ben
  schont,
  Ma -- schi -- nen nur und Stahl -- be -- ton,
  hat uns zu ei -- nem Lied ver -- eint,
  das
  \dropLyricsA
  wei -- che(s) Was -- ser bricht den Stein!
  \raiseLyrics
}}

skipC = \repeat unfold 8 { \skip 2 }
lyrStropheB = {
  \lyricmode {
    \skipA
   \set stanza = #"2-4,6,7. "
  Es reißt die schwers -- ten
  Mau -- ern ein und sind wir
  schwach und sind wir klein,
  wir wol -- len wie das
  Was -- ser sein,
  \skipC
  %das wei -- che Was -- ser bricht
  %den Stein!
  \set stanza = #"2. "
  Ra -- ke -- ten stehn vor uns -- rer
  Tür, die solln zu uns -- rem Schutz
  hier sein!
  Auf sol -- chen Schutz ver -- zich -- ten
  wir, das %wei -- che Was -- ser bricht den Stein!
}}

lyrStropheC = {
  \lyricmode {
    \skipA
    %\skipB
    \set stanza = #"5. "
    Komm fei -- ern wir ein
    Frie -- dens -- fest
    und zei -- gen wie sich's
    le -- ben läßt
    Mensch! Men -- schen kön -- nen Men -- schen
    sein,
    %das wei -- che Was -- ser bricht den Stein!
    \skipC
    \set stanza = #"3. "
    Die Rüs -- tung sitzt am Tisch der Welt
    und Kin -- der die vor Hun -- ger schrein!
    Für Waf -- fen fließt das gro -- ße Geld,
    doch %wei -- ches Was -- ser bricht den Stein!
}}

strophe = \relative c' {
  %\voiceOne
  \time 2/2
  \key e \minor
  % \partial 4
  r8^\markup{ \box{\fontsize #4 I}}
  e e fs g4 b
  r8 d4 c8 b4 a
  r8 g g a b4 g
  r8 a4 g8 g[ fs8] e4~

  e2 r4
  \break \repeat volta 2 {
    <b \parenthesize b'>4 ^\markup{ \box{\fontsize #4 A}}
  %\bar "||"
  e4. fs8 g4 a
  b4 b a d
  b4. b8 a4 d
  b4 4 a4. b8
  e,4. fs8 g4 a
  b4 b a d
  b8 b b b a4 g
  e2 r4_\markup{\box{\fontsize #3 {4..C}}}
   \once \override Score.RehearsalMark.break-visibility =
    #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X =
    #RIGHT
  \mark \markup{wdhl 5.,6.}
  \bar ":|." \break

  b'4^\markup{  \box{\fontsize #4 B}}
  d4. d8 d4 b8( d)
  e4 e d4. a8
  g8 4 8~ 4 fs8( g)
  a4. e8 fs2
  <<
    {
     \voiceTwo
     r1
     \time 1/2
     r4 a4
     \time 2/2
    }
    \new Voice {
      \oneVoice
      r8 b' c b a g fs e
      \voiceOne
      ds c b a
    }
  >>
  \oneVoice
  e4. fs8 g4 a
  b4 b a d
  b8 b b b a4 g
  e2 r2
  \set Score.measureLength = #(ly:make-moment 3/4)
  r2_\markup{\box{\fontsize #3 2..I}}
  r4 }
  \break
  \set Score.measureLength = #(ly:make-moment 4/4)
  \tuplet 3/2
  { e4^\markup{  \box{\fontsize #4 C}}
 fs g }
  \tuplet 3/2 { a g fs }
  fs8 g e4~ 2
  r8 fs4 g8 \tuplet 3/2 { b4 a fs }
  g2. r4
  r8 fs4 g8 \tuplet 3/2 { g4  a a }
  a8 b b4~ 2
  r8 a4 b8 \tuplet 3/2 { c4 d e }
  g2. r4

  %{fs4. fs8 a4 d
  fs4 fs a fs
  e,4. cs8 g4 a
  fs4 fs a d
  fs8 8 8 8 a4 g
  e2 r4 fs'8 c
  d4 d fs d
  e4 e d fs8 a
  %}

  \bar "|."
}

chrdStrophe = \chordmode {
    s8 e8:m s2.
    a1:m e:m a1:m e1:m
    c1 g2 d
    b1:m c2 d
    e1:m
    g2 d2 b1:m e:m
    g c2 d
    e1:m c2 b2
    s1 s2
    e1:m g2 d2
    b1 c1 e2:m s4
    s4 c2 s4
    e1:m d g a:m b:m a:m e:m
}


\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.1))
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
