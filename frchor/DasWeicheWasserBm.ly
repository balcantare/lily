\version "2.22.2"
sheetName = "Das weiche Wasser"
sheetComposer = "Bots"
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
  \skipA
  \lyricmode {
  \set stanza = #"1,5. Inst, 2."
  Die Bom -- be die kein Le -- ben
  schont,
  Ma -- schi -- nen nur und Stahl -- be -- ton,
  hat uns zu ei -- nem Lied ver -- eint,
  das
  \dropLyricsA
  wei -- che(s) Was -- ser bricht den Stein!
  \raiseLyrics
  \set stanza = #"1. "
  Eu -- ro -- pa hat -- te zwei -- mal
  Krieg,
  der drit -- te wird der letz -- te sein,
  gib bloß nicht auf, gib nicht klein bei,
  \dropLyricsA
  das wei -- che Was -- ser bricht den Stein!
  \raiseLyrics
}}

skipC = \repeat unfold 7 { \skip 2 }
lyrStropheB = {
  \lyricmode {
    \skipA
  %das wei -- che Was -- ser bricht
  %den Stein!
  \set stanza = #"3. "
  Ra -- ke -- ten stehn vor uns -- rer
  Tür, die solln zu uns -- rem Schutz
  hier sein!
  Auf sol -- chen Schutz ver -- zich -- ten
  wir, das %wei -- che Was -- ser bricht den Stein!
  \skipC
  \set stanza = #"2-4,6,7. "
  Es reißt die schwers -- ten
  Mau -- ern ein und sind wir
  schwach und sind wir klein,
  wir wol -- len wie das
  Was -- ser sein,

}}

lyrStropheC = {
  \lyricmode {
    \skipA
    %\skipB
    \set stanza = #"4. "
    Die Rüs -- tung sitzt am Tisch der Welt
    und Kin -- der die vor Hun -- ger schrein!
    Für Waf -- fen fließt das gro -- ße Geld,
    doch %wei -- ches Was -- ser bricht den Stein!
    \skipC
    \set stanza = #"5. "
    Komm fei -- ern wir ein
    Frie -- dens -- fest
    und zei -- gen wie sich's
    le -- ben läßt
    Mensch! Men -- schen kön -- nen Men -- schen
    sein,
    %das wei -- che Was -- ser bricht den Stein!

}}

strophe = \relative c' {
  %\voiceOne
  \time 2/2
  \key e \minor
  \partial 4

  b'4^\markup{  \box{\fontsize #4 B}}
  d4. d8 d4 b8( d)
  e4 e d4. a8
  g8 4 8~ 4 fs8( g)
  a4. e8 fs2
  <<
    {
     \voiceTwo
     s1
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
  %\set Score.measureLength = #(ly:make-moment 3/4)
  e2 r4_\markup{\box{\fontsize #3 2..I}}^\fermata
  \break
  \repeat volta 2 {
    <b \parenthesize b'>4 ^\markup{ \box{\fontsize #4 A}}
  %\bar "||"
  e4. fs8 g4 a
  b4 b a d
  b4. b8 a4 d
  b4 4 a4. b8
  e,4. fs8 g4 a
  b4 b a d
  b8 b b b a4 g
  e2 r4%_\markup{\box{\fontsize #3 {7..I}}}
   \once \override Score.RehearsalMark.break-visibility =
    #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X =
    #RIGHT
  \mark \markup{\box{wdhl:6.}}
  }
  \bar ":|." \break
  %\break
  %\set Score.measureLength = #(ly:make-moment 4/4)

  %\bar "|."
}

chrdStrophe = \chordmode {
    s4
    g2 s c2 g2
    e2:m s a2:m b2
    s s s
    e2:m d g2 d2
    g2 b2 e2:m s4
    %s4 c2 s4
    s4
    e2:m s g2 d
    g2 d2 g b
    e2:m d
    g2 d2 b2. s4 e1:m
}


\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout {#(layout-set-staff-size-with-jazz 22)}
    <<
    \new ChordNames { \transpose g d \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose g d \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
