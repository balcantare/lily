\version "2.24.2"
sheetName = "Hütet die Flamme"
sheetComposer = "Beate Tarrach"
#(define book-staff-size 16)
\include "../include/book.ily"

skipA = \repeat unfold 26 \skip 8
lyrRefrain = {
  \lyricmode {
  \skipA
  \set stanza = #"ref. "
  Hü -- tet die Flam -- me und schürt
  die Glut,
  Feu -- er tut uns Men -- schen gut.
  }}

lyrStropheA = {
  \lyricmode {
  Wärmt uns -- re Kör -- per,
  wärmt uns -- re See -- len,
  Feu -- er gib uns Kraft und Mut.
  La la la la La la la la la
  Feu -- er gib uns Kraft und Mut.
  \set stanza = #"1. "
  Feu -- er ken -- nen die Men -- schen
  schon lang,
  \set stanza = #"1. "
  fan -- den es einst am glü -- hen -- dem
  Vul -- kan,
  \set stanza = #"1. "
  o -- der am Baum, der vom Blitz -- schlag
  ent -- brannt.
  \set stanza = #"1. "
  Und seit die -- ser Zeit
  hat -- ten sie sei -- ne Kraft er -- kannt.
  }}

skipB=\repeat unfold 33 \skip 8
lyrStropheB = {
  \lyricmode {
    \skipB
  \set stanza = #"2. "
  Sie_koch -- ten Sup -- pe und brie -- ten ihr
  Fleisch.
  \set stanza = #"2. "
  Feu -- er mach -- te ihr Le -- ben schön und reich.
  \set stanza = #"2. "
  Es wärmt sie gut in  der kal -- ten _ Zeit,
  \set stanza = #"2. "
  es gab Hoff -- _ nung und _ Licht in der
  Dun -- kel -- heit.
}}

lyrStropheC = {
  \lyricmode {
    \skipB
  \set stanza = #"3. "
  So viel Gu -- tes das Feu -- er uns schafft,
  \set stanza = #"3. "
  wohnt doch in ihm eine an _ -- dre _ Kraft,
  \set stanza = #"3. "
  die_Le -- ben zer -- stört und die al -- les
  ver -- brennt.
  \set stanza = #"3. "
  Drum ach -- tet ihr Men -- schen, das ihr die
  Ge -- fahr er -- kennt.
}}

lyrStropheD = {
  \lyricmode {
    \skipB
  \set stanza = #"4. "
  Sitzen wir a -- bends am fla -- ckern -- den
  Schein,
  \set stanza = #"4. "
  falln' uns die al -- ten_Ge -- schich -- ten wie -- der
  ein.
  \set stanza = #"4. "
  Und ir -- gend -- wer singt uns ganz leis
  ein Lied.
  \set stanza = #"4. "
  Es macht, das der Frie -- den der Nacht in die Her -- zen
  zieht.
}}

refrain = \relative c'' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key e \minor
  \mark \markup{ \box{\fontsize #1 Vorspiel}}
  e4. fs8 g4. fs8
  e4 e8 d b2
  b4. b8 d4 d
  e1
  e4. fs8 g4. fs8
  e4 e8 d b2
  d4. d8 g4 fs
  e1 \bar "||" \break
  %\mark \markup{ \box{\fontsize #1 Refrain}}
  e,4 e8 fs g4 g8 fs
  e4 e8( d) b2
  c4 c e e
  ds e fs2
  %\bar "|."
}

stropheSopran = \relative c'' {
  \voiceOne
  b4 b8 c d4 d
  d d8 e d4 b8( a)
  g4 g b b
  a c b2
  b4 b8 a g2
  fs8 g a fs g2
  a4 a c c
  b a b2
}

stropheAlt = \relative c'' {
  \time 2/2
  \key e \minor
  \voiceTwo
  \bar ".|:"
  \repeat volta 2 {
    g4 g8 a b4 4
    a4 a8 g fs( e) d4
    e4 e g g
    fs g8( fs) e2
  }
  \repeat volta 2 {
    g4 g8 fs e2
    d8 e d cs b2
    c4 c e e
    ds g8( fs) e2
  }
  \break
  %\override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1)
  b4 b e fs8 g
  fs4 g8 fs e2
  d4 d8 d g4 g
  a8 b c a b2
  a4 a8 a a4 e8 e
  g4 g8 fs e4 r8 \break e8
  ds4 ds8 e fs4 fs8 g
  a1
  r4 b8 a g4 fs
  e1
  \bar "|."
}

stropheTenor = \relative c' {
  \key e \minor
  d4 d8 d g4 g
  fs4 fs8 e d4 d
  b4 b b b
  a a b2
  e4 e8 fs e2
  d4 d8 a b2
  c4 c c c
  a a b2
}


chrdRefrain = \chordmode {
 e1:m s s s s s d e:m
 e1:m s a:m b:7
 }

chrdStrophe = \chordmode {
 g d e:m b2:7 e:m
 e1:m d2 g
 a1:m b2:7 e:m
 e1:m b2 e:m d g d g
 a1:m e:m b:7 s s e:m
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdRefrain }
    \new Staff <<
      \new Voice = "Refrain" { \refrain }
      >>
    \new Lyrics \lyricsto "Refrain" \lyrRefrain
    >>
  }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff \with {\omit TimeSignature }
      <<
      \new Voice = "StropheSopran" { \stropheSopran }
      \new Voice = "Strophe" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Staff \with {\omit TimeSignature }
      <<
      \new Voice = "StropheTenor" { \stropheTenor }
      >>
    >>
\layout {
      #(layout-set-staff-size 20)
    }
  }
}
