\version "2.24.0"
sheetName = "Die Erde ist unsere Mutter"
sheetComposer = "Beate Tarrach"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  Die Er -- de ist un -- se -- re Mut -- ter
  die uns das Le -- ben gab.
  Der Wind ist un -- ser Bru -- der,
  der da singt für uns je -- den Tag.

  ha -- yo -- weh ha -- yo -- weh
  ha -- yo -- weh ha -- yo -- weh
  ha -- yo -- weh ha -- yo -- weh
  ha -- yo -- weh ha -- yo -- weh

  Die Blu -- men sind un -- se -- re
  Schwes -- tern
  er -- blühn je -- den Mor -- gen
  der Welt.
  Und all die Träu -- me von ges -- tern
  ha -- ben uns die Bäu -- me er -- zählt.

  %ha -- yo -- weh ha -- yo -- weh
  %ha -- yo -- weh ha -- yo -- weh weh

  Der Him -- mel ist un -- ser Va -- ter
  be -- hü -- tet uns al -- le hier:
  die Pflan -- zen im Er -- den -- gar -- ten.
  Uns Men -- schen und je -- des Tier.
  Ge -- mein -- sam kön -- nen
  wir da sein auf die -- ser
  herr -- li -- chen Welt.
  Denn wir sind ei -- ne
  Fa -- mil -- ie un -- ter
  dem Ster -- nen -- zelt.
}}

lyrStropheB = {
  \lyricmode {
  ha -- yo -- weh ha -- yo -- weh
  ha -- yo -- weh ha -- yo -- weh
  ha -- yo -- weh ha -- yo -- weh
  ha -- yo -- weh ha -- yo -- weh
}}

strophe = \relative c' {
  %\voiceOne
  \time 2/2
  \key d \minor
  \partial 4
  a4
  d4 8 8 4 f8 e
  d2 d
  f4 8 8 a4 g8( a)
  g2. \bar "" \break
  a4
  bf4. a8 bf4 a
  g2 d4 a'8 g
  f4 d8 d d4 c
  d1
  \bar "||" \break
  <<
    {
      \voiceTwo
      \mark \markup{\fontsize #2 \box H}
      a'8 a8 4 4 f
      g1 r1
      g8 g8 4 a bf
      a1 r1
      a8 a8 4 4 f
      g1 r1
      g8 g8 4 a f
      d1
      r2.
    }
    \new Voice = "StropheB" {
     \relative c'' {
      \voiceOne
      \override Rest.staff-position = #0
      r1 c8 c8 c4 4 a
      g1
      r1
      d'8 d8 d4 4 c
      a1 \break
      r1 c8 c8 c4 4 a
      g1 r1
      d'8 d8 d4 4 c
      d2.
     }
    }
  >>
  \bar "||" \break
  \oneVoice
  a4
  d4 d8 d d4 f8 e
  d2 d4. c8
  f4 f8 f a4 g8 a
  g2. \bar "" \break
  a4
  bf4. a8 bf4 a8 a
  g2 d4 a'8 g
  f4. d8 d4 c8 e
  d1
  \once \override Score.RehearsalMark.break-visibility =
    #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X =
    #RIGHT
  \mark \markup {\fontsize #2 \box ..H }
  \bar "||" \break
  %{
  \repeat volta 2 {
    \mark \markup{\fontsize #1 \box H}
    a'8 a a4 a f
    g1
    g8 g g4 a f
  } \alternative {
    { d1 }
    { d2. \bar "||" }
  } \break
  %}
  \set Score.measureLength = #(ly:make-moment 1/4)
  a4
  \set Score.measureLength = #(ly:make-moment 2/2)
  d4 d8 d d4 f8( e)
  d2 d4. c8
  f4 f8 f a4 g8( a)
  g2. \bar "" \break
  a4
  bf4 bf8 a bf4 a
  g2 d4. e8
  f4 d8 d d4 c
  d1
  \bar "||"
  \once \override Score.RehearsalMark.break-visibility =
    #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X =
    #RIGHT
  \mark \markup {\fontsize #2 \box ..H }
  \break
  \set Score.measureLength = #(ly:make-moment 1/4)
  a4
  \set Score.measureLength = #(ly:make-moment 2/2)
  d4 d d f8 e
  d2 d4. c8
  f4 f a4 g8 a
  g2. \bar "" \break
  a4
  bf4. a8 bf4 a8 a
  g2 d
  f4 d8 d d4 c
  d1
  \once \override Score.RehearsalMark.break-visibility =
    #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X =
    #RIGHT
  \mark \markup {\fontsize #2 \box ..H }

  \bar "|."
}

chrdStrophe = \chordmode {
  s4
  d1:m s
  f c
  g:m s
  d:m s
  s8 d2:m s4. c1 s s
  d:m s s
  c s s
  d:m s
  d:m s f c g:m s d:m s
  s4 % d1:m  c s d:m d:m
  d1:m s f c g:m s d:m s s4
  d1:m s f c g:m s d:m s
}


staffSize = #(define-music-function (parser location new-size) (number?)
  #{
    \set fontSize = #new-size
    \override StaffSymbol.staff-space = #(magstep new-size)
    \override StaffSymbol.thickness = #(magstep new-size)
  #})

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff \with { %\staffSize #-2
    } <<
      \new Voice = "StropheA" { \strophe }
      >>
    \new Lyrics \lyricsto "StropheA" \lyrStropheA
    \new Lyrics \lyricsto "StropheB" \lyrStropheB
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
      #(layout-set-staff-size 20)
    }
  }
}
