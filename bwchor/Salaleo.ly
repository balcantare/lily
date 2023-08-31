\version "2.24.0"
sheetName = "Salaleo"
sheetComposer = "Begrüßungslied aus Ghana, arr. Reinhard Simmgen"
sheetPoet = "dt. Beate Tarach"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1,3. "
  Sa -- la -- le -- o,
  Sa -- la -- le' hi -- dra
  Sa -- la -- le -- o,
  Sa -- la -- le' hi -- dra
  Sa -- la -- le' Ma -- ma -- deo
  Sa -- la -- le' hi -- dra
  Sa -- la -- le' Ma -- ma -- deo
  Sa -- la -- le' hi -- dra
  \set stanza = #"sop: "
  Sa -- la
  Sa -- la -- leo,
  Ma -- ma, Ma -- ma -- deo
  Sa -- la
  Sa -- la -- leo,
  Ma -- ma, Ma -- ma -- deo
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Seid will -- kom -- men,
  seid will -- kom -- \skip 8 men,
  seid will -- kom -- men,
  seid will -- kom -- \skip 8 men,
  seid will -- kom -- men bei uns,
  Men -- schen tre --  tet ein.
  Heut soll Frie -- de in un -- se -- ren
  Her -- zen sein.
  \set stanza = #"alt: "
  Sa -- la -- le -- o,
  Sa -- la -- le' hi -- dra
  Sa -- la -- le -- o,
  Sa -- la -- le' hi -- dra
  Sa -- la -- le' Ma -- ma -- deo
  Sa -- la -- le' hi -- dra
  Sa -- la -- le' Ma -- ma -- deo
  Sa -- la -- le' hi -- dra

}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Lasst uns sin -- gen,
  lasst uns sin -- \skip 8 gen.
  Lasst uns sin -- gen,
  lasst uns sin -- \skip 8 gen.
  Lasst uns sin -- gen
  im leuch -- ten -- den
  A -- bend -- schein.
  Lasst uns sin -- gen ein Lied
  vom Zu -- sam -- men -- sein.

}}

lyrStropheD = {
  \lyricmode {
  \repeat unfold 40 {\skip 8}
  \set stanza = #"bass: "
  Sa -- la -- leo
  Ma -- ma deo
  Sa -- la -- leo
  Ma -- ma deo
  }
}

strophe = \relative c' {
  \voiceOne
  \time 4/4
  \key d \major
  \partial 4
  \mark \markup{ \box{\fontsize #3 A}}
  \repeat volta 2 {
    fs8 8
    fs4.^\fermata d8~\fermata
    4^\markup{\fontsize #1 \bold fine}
    fs8 8
    fs4 a8 g ~ 4 fs8 8
    fs4. d8~ 4 fs8 8
    4 a8 g~ 4  a8 8
    a4 d8 8 b4 a8 8
    a4 g8 fs~ 4 a8 8
    a4 d8 8 b4 a8 8
    a4 g8 fs~ 4
  } \break
  \mark \markup{ \box{\fontsize #3 B}}
  \repeat volta 2 {
    r4
    r4 a8 8 r8 a8 8 16( g)~
    1
    r4 a8 8 r d8 8 16( b)~
    1
    r4 a8 8 r8 a8 8 16( g)~
    1
    r4 a8 8 r d8 8 16( b)~
    \set Score.measureLength = #(ly:make-moment 3/4)
    2.
  }
  %\bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  \repeat volta 2 {
    d8 8
    d4. a8~ 4 d8 8
    d4 e8 d~ 4 8 8
    d4. a8~ 4 d8 8
    d4 e8 d~ 4 fs8 8
    fs4 a8 8 fs4 e8 8
    d4 e8 d~ 4 fs8 8
    fs4 a8 8 fs4 e8 8
    d4 e8 d~ 4
  }
  \repeat volta 2 {
    d8 8
    d4. a8~ 4 d8 8
    d4 e8 d~ 4 8 8
    d4. a8~ 4 d8 8
    d4 e8 d~ 4 fs8 8
    fs4 a8 8 fs4 e8 8
    d4 e8 d~ 4 fs8 8
    fs4 a8 8 fs4 e8 8
    d4 e8 d~ 4
  }


}

stropheBass = \relative c {
  \clef "treble_8"
  \key d \major
  %\clef "bass"
  \repeat volta 2 {
    a8 8
    a4. a8~ 4 a8 8
    b4 b8 b~ 4 8 8
    a4. a8~ 4 a8 8
    g4 g8 g~ 4 d'8 8
    d4 fs8 8 d4 e8 fs8
    d4 b8 a~ 4 d8 8
    d4 fs8 8 d4 e8 fs8
    d4 b8 a~ 4
  }
  \repeat volta 2 {
    r4
    a2 d b2. r4
    d2 fs
    d2. r4
    a2 d
    b2. r4
    d2 fs d2.
  }
}

chrdStrophe =  \chordmode {
  s4
  d1 s2 g
  d1 s2 g
  d2 g2
  d1 s2 g
  d1
  d1 g d
  g d g d g2.
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \header {
    subtitle = "A | B | A | A"
  }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheB
    %\new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Staff <<
      \new Voice = "Basso" { \stropheBass }
      >>
    \new Lyrics \lyricsto "Basso" \lyrStropheD
    >>
    \layout {
      \context {
        \Lyrics
        \override LyricText.font-size = #0.55
      }
    }
  }
}
