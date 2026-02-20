\version "2.24.0"
sheetName = "The Rose"
sheetComposer = "Amanda Mc Broom"

\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace75"
}
stanzaA = \markup {
  \column { \vspace #.4 "1. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaB = \markup {
  \column { \vspace #.4 "2. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaC = \markup {
  \column { \vspace #.4 "3. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaD = \markup {
  \column { \vspace #.4 "4. "}
  \column { \vspace #.2 \leftbrace }
}

lyrStropheA = {
  \lyricmode {
  \set stanza = \stanzaA
  Lie -- be ist wie wil -- des Was -- ser 
  _ das sich durch Fel -- sen zwängt.
  \set stanza = "1. "
  Sie ist süß und sie ist bit -- ter,
  _ Ein Sturm -- wind und ein Hauch.
  \set stanza = "1. "
  Für mich ist sie ei -- ne Ro -- se,
  für dich ein Dor -- nen -- strauch.
  }}
lyrStropheB = {
  \lyricmode {
    Lie -- be ist so wie ein Mes -- ser,
    _ das dir im Her -- zen brennt.
}}
lyrStropheC = {
  \lyricmode {
  \set stanza = \stanzaB
  Wer nie weint und nie -- mals trau -- ert, 
  _ der weiß auch nichts vom Glück.
  \set stanza = "2. "
  Wer nie nimmt, kann auch  nicht ge -- ben.
  _ Und wer sein Le -- ben lang 
  \set stanza = "2. "
  im -- mer Angst hat vor dem Ster -- ben,
  fängt nie zu  le -- ben an.
  }}
lyrStropheD = {
  \lyricmode {
    Wer nur sucht, was e -- wig dau -- ert,
    _ ver -- säumt den  Au -- gen -- blick.
}}
lyrStropheE = {
  \lyricmode {
  \set stanza = \stanzaC
  Wenn du denkst, du bist ver -- las -- sen,
  und kein Weg führt aus der Nacht,
  \set stanza = "3. "
  Doch ver -- giss nicht, an dem Zweig dort,
  der im Schnee bei -- nah er -- fror,
  \set stanza = "3. "
  blüht im Früh -- jahr ei -- ne Ro -- se,
  so schön wie nie zu -- vor.
}}
lyrStropheF = {
  \lyricmode {
  fängst du an, die Welt zu has -- sen, die nur
  an -- d're glück -- lich macht.
}}
lyrStropheG = {
  \lyricmode {
  \set stanza = \stanzaD
  Some say, Love, it is a ri -- ver
  _ That drowns the ten -- der reed.
  \set stanza = "4. "
  Some say, Love, it is a hun -- ger,
  _ an end -- less a -- ching need.
  \set stanza = "4. "
  I say, Love, it is a flo -- wer
  and you its on -- ly seed.
}}
lyrStropheH = {
  \lyricmode {
    Some say, Love, it is a ra -- zor, 
    _ That leaves your soul to bleed.
}}



strophe = \relative c' {
  \voiceOne
  \override Rest.staff-position = #0
  \time 4/4
  \partial 4
  \key d \major
  \bar ".|:"
  \repeat volta 2 {
    \newSpacingSection
    \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/4)
    fs8 g16( fs)
    a2 r8 a a8. a16
    a4 a r a8 a
    g2 r8 g8 g8. a16
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
    a2 r4 
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  } \break
  a8 b16( a)
  cs2~ 8 8 8 8
  a4 b2 b8 b
  b2~ b8 a b b
  a2 r4 \break fs8 g16( fs)
  a2 r8 a8 a8. a16 
  a4 a2 r8 a8
  g2 r8 g g8. fs16
  fs2 r4
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
 d8 e16( d) 
 fs2 s8 fs g8. fs16
 fs4 e s e8 e
 d2 s8 d e8. fs16 
 fs2 s4
 fs8 g16( fs)
 a2~ 8 8 8 8
 4 d,2 fs8 fs 
 g2~ 8 fs e d
 a2 s4 d8 e16( d)
 fs2 s8 fs8 g8. fs16 
 fs4 e2 s8 e8
 d2 s8 d8 e8. d16
 d2 s4
}

stropheBass = \relative c {
  \clef "bass"
  \key d \major
  d8 e16( d)
  d2 r8 d d8. d16
  cs4 4 r4 cs8 8
  b2 r8 b cs8. d16 
  d2 r4 d8 e16( d)
  fs2~ 8 e d cs
  cs4 b2 b8 b
  d2~ 8 8 8 8
  cs2 r4 d8 e16( d)
  d2 r8 d8 d8. d16
  cs4 cs2 r8 cs8
  b2 r8 b cs8. d16
  d2 r4
}

chrdStrophe =  \chordmode {
 % \startParenthesis \parenthesize c g
 % \endParenthesis \parenthesize c
  s4
  d1 a g2. a4 d1
  fs:m b:m g2. e4:m a1
  d a g2. a4 d2.
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 20)
      \context {
        \Lyrics
        \override LyricText.font-size = #1.6
      }
    }
    <<
    \new ChordNames { \transpose d d \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose d d \strophe }
      \new Voice = "StropheAlt" { \transpose d d \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    \new Lyrics \lyricsto "Strophe" \lyrStropheG
    \new Lyrics \lyricsto "Strophe" \lyrStropheH
    \new Staff <<
      \new Voice = "StropheBass" { \transpose d d \stropheBass }
      >>
    >>
  }
}
