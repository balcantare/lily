\version "2.24.0"
sheetName = "Maria durch ein Dornwald ging"
sheetComposer = "Satz: Cesar Bresgen"
\include "../include/book.ily"

rightbrace = \markup {
  \rotate #180 {
    \override #'(font-encoding . fetaBraces)
    \lookup "brace110"
  }
}

stanzaA = \markup { \column { \vspace #-.2 \rightbrace} }

lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  Ma -- ri -- a durch ein Dorn -- wald ging,
  \repeat unfold 5 \skip 8
  \set stanza = "1. "
  Ma -- ri -- a durch ein __ _ Dorn -- wald ging,
  der hat
  \set stanza = "1. "
  sie -- ben Jahr kein Laub
  ge -- tragn.
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Was trug Ma -- ri -- a un -- term Herzn?
    \set stanza = \stanzaA
    Ky -- rie -- e -- lei -- son!
    \set stanza = "2. "
    Ein klei -- nes Kind -- lein __ _
    oh -- ne Schmerzen, das __ _
    \set stanza = "2. "
    trug Ma -- ri -- a un -- term
    Herzn.
    \set stanza = \stanzaA
    Je -- sus und Ma -- ri -- a!
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
    Da habn die Dor -- nen Ro -- sen_ge -- tragn.
    \repeat unfold 5 \skip 8
    \set stanza = "3. "
    Als sie das Kind durch den Wald ge -- tragn,
    da __ _
    \set stanza = "3. "
    habn die Dor -- nen Rosn ge -- tragn.
}}

lyrStropheD = {
  \lyricmode {
    \skip 4
    \repeat unfold 3 \skip 1
    son __  e -- le -- i -- son __ _

}}
stropheSopran = \relative c' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \partial 4
  \key g \minor
  d4
  g4. a8 bf4 d
  bf4 a8( g) a2
  bf4 bf8 bf c2
  d2. \breathe \break bf8( c)
  d4. c8d4 ef8 d
  c4. bf8 c4 d8 c
  bf4. a8 bf4 c8( bf)
  a4. g8 a2
  g4. a8 bf4 d
  bf4( a) g-\fermata
  \bar "|."
}

stropheAlt = \relative c'' {
  \voiceOne
  \key g \minor
  s4
  s1*2
  bf4 a8 a g2
  a2( f4) \breathe g8 a
  bf4. a8 bf4 c8 bf
  a4. g8 a4 bf8 a
  g4.  f8 g4 g
  a8 bf d bf a2 \breathe
  g4. g8 g4 f
  f2 d4-\fermata
}


stropheTenor = \relative c'' {
  \accidentalStyle neo-modern-voice-cautionary
  \voiceTwo
  \key g \minor
  s4 s1*2
  g4 f8 f ef2
  d1~ d1~ d2. d4
  ef4.( f8 ef4) c
  d1
  g4. f8 ef4 bf
  c2 g4
}

stropheBass = \relative c' {
  \accidentalStyle neo-modern-voice-cautionary
  \clef "bass"
  \key g \minor
  r4
  g4 fs g2
  g d
  g2 c,4 ef
  fs g a fs
  g fs g ef
  fs e fs d
  ef d ef ef
  c ef d fs
  g f ef2
  d g,4
}


chrdStrophe = \chordmode {
  s4
  g1:m
  s2 d
  g:m f
  bf1
  g:m d
  g:m d
  g2:m bf
  d g4:m
  }

zsAlt = \relative c' {
   \set Staff.keyAlterations = #`((1 . ,FLAT)
                                 (5 . ,FLAT)
                                 (6 . ,FLAT))
   \time 2/2

   c4. df8
   e8 f g af bf af g f
   e2 f4. g8
   af8 c df c bf af g f
   e2    f4. g8
   af4 c af8 g f4~
   f2
   \bar "||"
}

chrdZs = \chordmode {
  c2 s bf:m c df s bf:m c df s c4 f2.:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom =  ##f
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \transpose bf af \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \transpose bf af \stropheSopran }
              >>
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new Staff <<
      \new Voice = "StropheAlt" {  \transpose bf af \stropheAlt }
      \new Voice = "StropheTenor" {  \transpose bf af \stropheTenor }
      >>
    \new Lyrics \lyricsto "StropheTenor" \lyrStropheD
      \new Staff <<
        \new Voice = "StropheBass" { \transpose bf af \stropheBass }
      >>
    >>
  }
  \score {
    <<
    \new ChordNames { \chrdZs }
    \new Staff << \new Voice = "ZsAlt" { \zsAlt } >>
    >>
  }
}
