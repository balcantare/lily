\version "2.22.2"
sheetName = "Apfeltraum"
sheetComposer = "Peter Gläser, Klaus Renft Combo"
sheetPoet = "Gerulf Pannach"
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

lyrStropheA = {
  \lyricmode {
  \set stanza = \stanzaA
  Hab ge -- schla -- fen un -- term
  A -- pfel -- baum und der hing mit
  Ä -- pfeln
  \set stanza = \stanzaA
  voll,
  als ich träum -- te ei -- nen
  A -- pfel -- traum in Moll.
  \set stanza = \stanzaA
  Rütt -- le shütt -- le mich,
  Frem -- der mein Ge -- wicht ist gar zu schwer.
  }}
lyrStropheB = {
  \lyricmode {
  Al -- le Ä -- pfel hat -- ten ein Ge -- sicht,
  je -- des wein -- te bit -- ter -- lich
  und der A -- pfel -- baum der neig -- te
  sich zu mir.
  Träu -- me dei -- nen Traum
  un -- term A -- pfe -- baum
  doch hin -- ter -- her.
}}
lyrStropheC = {
  \lyricmode {
  \set stanza = \stanzaB
  Kam ein Vo -- gel, flog auf ei -- nen Ast
  und er war die Gold -- ma --
  \set stanza = \stanzaB
  rie
  aus dem Mär -- chen 'Mein Freund auf -- ge  -- paßt'
  sprach sie:
  \set stanza = \stanzaB
  Re -- cke stre -- cke dich,
  ich er -- we -- cke dich aus dei -- nem Traum.
  }}
lyrStropheD = {
  \lyricmode {
  Die -- ser Baum ge -- hört dem al -- ten Mann
  aus dem Häus -- chen ne -- ben -- an.
  Wenn du kannst, denn es geht ihm sehr schlecht,
  hilf ihm.
  Stell dich nicht so an, hilf dem al -- ten Mann
  und sei -- nem Baum.
}}
lyrStropheE = {
  \lyricmode {
  \set stanza = \stanzaC
  Wach -- te auf, fast wie ein
  Trun -- ken -- bold,
  stell -- te fest: nur Phan -- ta --
  \set stanza = \stanzaC
  sie
  war der A -- pfel -- baum und auch die
  Gold -- ma -- rie.
  \set stanza = \stanzaC
  'Sie -- ben Jah -- re sind manch -- mal
  stumm und blind, mehr als ein Traum'
}}
lyrStropheF = {
  \lyricmode {
  Nahm die Ä -- pfel ab,
  gab sie dem Mann,
  der schon sie -- ben lan -- ge Jahr,
  wie er sag -- te, nicht in sei -- nem Gar -- ten war.
  sprach der al -- te Mann, bot zum Dank mir an den
  A -- pfel -- baum.
}}

strophe = \relative c' {
  \voiceOne
  \override Rest.staff-position = #0
  \time 2/2
  \key a \minor
  \bar ".|:"
  \repeat volta 2 {
  r4 e8 e e e d c
  d4. c8 b2
  r4 e8 e e e d c
  d1
  r4 e8 e e e d c
  d4. c8 b4 g
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  <<
    {
      a1
      %\set Score.repeatCommands = #'((volta "1"))
      s1 % r1
      %\set Score.repeatCommands = #'((volta #f))
    }
    \new Voice {
      \voiceOne
      r2 r8 g'8 a b c b a g a2
    }
  >>
  }
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  \break
  \repeat volta 2 {
  e'4 d8 e4 f8 e4
  \time 5/4
  d4 e8 f4 e8 d e d c
  \time 2/2
  d1
  }
}

stropheAlt = \relative c' {
  \voiceTwo
  \repeat volta 2 {
  s4 c8 c c c b a
  b4. a8 g2
  s4 c8 c c c b a
  g1
  s4 c8 c c c b a
  b4. a8 g4 g
  e1
  s1 }
  % \alternative { {s1} }
  \repeat volta 2 {
  c'4 b8 c4 d8 c4
  \time 5/4
  b4 c8 d4 c8 b c b a
  \time 2/2
  g1
  }
}

stropheBass = \relative c {
  \clef "bass"
  \key a \minor
  \repeat volta 2 {
  r4 a8 8 8 8 8 8
  g4. g8 g2
  r4 a8 a a a g a
  g1
  r4 a8 a a a a a
  g4. g8 g4 g
  a1 r1 }
  % \alternative { {r1} }
  \repeat volta 2 {
  g4 g8 a4 a8 a4
  g4 g8 c,4 c8 d8 c b c
  g'1
  }
}

chrdStrophe =  \chordmode {
  a1:m g a:m g
  a:m g a:m s
  c4 g8 c4 f8 c4
  g4 c8 f4 c8
  g8 \startParenthesis \parenthesize c g
  \endParenthesis \parenthesize c
  g1
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
    \new ChordNames { \transpose c f \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose c f \strophe }
      \new Voice = "StropheAlt" { \transpose c f \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    \new Staff <<
      \new Voice = "StropheBass" { \transpose c f \stropheBass }
      >>

    >>
    \layout {
      \context {
        \Lyrics
        \override LyricText.font-size = #1.5
      }
    }
  }
}
