\version "2.24.0"
sheetName = "Sind die Lichter angezündet"
sheetPoet = "Erika Engel"
sheetComposer = "Hans Sandig"
\include "../include/book.ily"

skipA={\repeat unfold 12 \skip 8}

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = "1. "
  Sind die Lich -- ter an -- ge -- zün -- det,
  Freu -- de zieht in je -- den Raum.
  \set stanza = "1. "
  Weih -- nachts -- freu -- de wird
  ver  -- kün -- det 
  \set stanza = "1. " un -- ter je -- dem
  Lich -- ter -- baum.
  Leuch -- te Licht mit hel -- lem
  Schein, ü -- ber -- all,
  ü -- ber -- all soll Freu -- de sein.
}}

lyrStropheB = {
  \lyricmode {
    \skipA
   \set stanza = "2. "
   Sü -- se Din -- ge,
   schö -- ne Ga -- ben ge -- hen
   nun von Hand zu Hand.
   \set stanza = "2. "
   Je -- des Kind soll Freu -- de
   ha -- ben, 
   \set stanza = "2. "
   je -- des Kind in je -- dem Land.
}}

lyrStropheC = {
  \lyricmode {
    \skipA
   \set stanza = "3. "
  Sind die Lich -- ter an -- ge -- zün -- det,
  rings ist je -- der Raum er -- hellt.
  \set stanza = "3. "
  Weih -- nachts -- frie -- de wird
  ver -- kün -- det, 
  \set stanza = "3. "
  zieht hi -- naus in al -- le Welt.
  \repeat unfold 14 \skip 4
   \set stanza = "3. "
   Frie -- de sein.
}}

stropheSopran = \relative c' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 3/4
  \key c \major
  e4 g8 c4 g8
  a4 f8 d4 c8
  c4. c4 d8
  d2 r4 \bar "||" \break
  \voiceOne
  \override Rest.staff-position = #0
  e2 f4
  g2 g4
  f2 e4
  d2 d4
  c2 d4
  e2 e4
  f2 e4
  d2. \break
  e2 f4
  g2 g4
  a4( b) c
  g2 e4
  a4( b) c
  g2 e4
  g4( f) e
  d2. \break
  c2 c4
  g'2 g4
  c2 c4
  b2. \break
  a2 c4
  g2.
  f2 g4
  e2 c4
  d2.
  d2.
  c2.~
  c2.
  \bar "|."
}

stropheAlt = \relative c' {
  \repeat unfold 4 s2.
  \voiceTwo
  \language english
  c2 d4
  e2 e4
  d2 c4
  b2 b4
  a2 b4
  c2 c4
  d2 c4
  b2.
  c2 d4
  e2 e4
  f4( g) a
  e2 c4
  f4( g) a
  e2 c4
  e4( d) c
  b2.
  a2 a4
  b2 b4
  c2 c4
  d2.
  f2 d4
  e2.
  d2 b4
  c2 a4
  g2.
  g2.
  c2.~
  c2.

}

chrdStrophe = \chordmode {
  c4. a:m d:m g c f g2.
  c2. g:/b d:m g a:m
  c d:m g c
  \set chordBassOnly = ##t
  c:/e f
  c f c d:m g
  c c:/b a:m e:m f c
  d:m c f g c s
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
  }
  % \header { subtitle = "" }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \stropheSopran }
        \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheC
    >>
    %\layout {
    %  \context {
    %    \Lyrics
    %    \override LyricText.font-size = #1
    %  }
    %}
  }
}
