\version "2.22.2"
fileName = "RainAndThunder.ly"
sheetName = "Rain and Thunder"
\include "../include/book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -3)
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
skipB = \repeat unfold 8 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }

lyrStropheA = {
  \lyricmode {
  \set stanza = #"e) "
  Rain, rain rain and thun -- der,
  wake the thir -- ty earth from slum -- ber.
  \set stanza = #"e) "
  Rain, rain rain and thun -- der
  fal -- ling on the ground.
  \set stanza = #"e1. "
  If I had a piece of ground,
  then I would plant seeds all a -- round.
  \set stanza = #"e1. "
  Beans and peas and corn so sweet,
  the things I like to eat.
  \set stanza = #"e1. "
  If I had the time to grow it,
  plant and wa -- ter, rake and hoe it,
  \set stanza = #"e1. "
  it would be the gree -- nest gar -- den
  a -- ny -- one has seen.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"d) "
  Komm, oh komm nur Re -- gen
  bring der Er -- de Kraft und Se -- gen!
  \set stanza = #"d) "
  Komm, oh komm nur Re -- gen
  Le -- ben will die Welt.
  \set stanza = #"d1. "
  Hätt ich ei -- nen klei -- nen Gar -- ten
  mit -- 'ner schö -- nen Wie -- se drin,
  \set stanza = #"d1. "
  würd ich je -- des Jahr drauf war -- ten,
  daß die Blu -- men blühn.
  \set stanza = #"d1. "
  Wür -- de lie -- gen zwi -- schen Blü -- ten,
  ü -- ber mir die Son -- ne warm. ___
  \set stanza = #"d1. "
  Mei -- nen Gar -- ten würd ich hü -- ten
  und den Bie -- nen -- schwarm!
}}

skipA = \repeat unfold 25 { \skip 4 }
lyrStropheC = {
  \lyricmode {
   \skipA
   \set stanza = #"d2. "
   Und die Kin -- der spie -- len Ha -- schen
   ach so sorg -- los und so frei!
   \set stanza = #"d2. "
   Wür -- den von den Bee -- ren na -- schen,
   mir wärs ei -- ner -- lei!
   \set stanza = #"d2. "
   und auf mei -- nen Bee -- ten  ste -- hen

   Blu -- men -- kohl und Ros -- ma -- rin ___
   \set stanza = #"d2. "
   klei -- ne Pflan -- zen wach -- sen se -- hen
   gibt dem Le -- ben Sinn.
}}

lyrStropheD = {
  \lyricmode {
   \skipA
   \set stanza = #"d3. "
   Wie ein Blu -- men -- gar -- ten
   blü -- hen will in uns die Fan -- ta -- sie,
   \set stanza = #"d3. "
   uns -- re Träu -- me sol -- len sprü -- hen
   bunt und schön wie nie!
   \set stanza = #"d3. "
   Wie der Re -- gen lässt die Lie -- be

   Freu -- de wach -- sen ü -- bers Jahr, ___
   \set stanza = #"d3. "
   es ge -- dei -- hen zar -- te Trie -- be,
   Träu -- me wer -- den wahr!
}}

strophe = \relative c' {
  \voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \major
  \bar ".|:"
  \repeat volta 2 {
  d4 d d8 d fs a
  g8.[ fs16 e8 d] cs e cs a
  d4 d d8 d fs a
  g8[ fs e8. cs16] d2 } \break
  a'16[ a8. a8. fs16] g8[ g g8. e16]
  fs8[ fs fs d ] e cs16( b) a4
  a'8 a a fs g[ g g8. g16]
  fs8 d e cs d2 |
  a'16[ a8. a8. fs16] g8 g g16 e r8
  fs8 fs fs d e e e cs
  a'[ 16 a8. fs8] g8[ g g8. e16]
  fs8[ d e16 cs8( d16)~] d8 d4.
  \bar "||" \break
  a'4 fs g e |
  fs a g8 fs e4
  a4 fs g e
  fs a a2
  a4 fs g e |
  fs a g8 fs e4
  a4 fs g e
  fs a d,2
\bar "|."
}

stropheSopran = \relative c' {
  \voiceOne
  fs4 fs fs8 fs a d
  b8.[ a16 g8 fs] e fs g e
  fs4 fs fs8 8 a d
  b8[ a g8. e16] fs2
  d'16[ d8. d8. a16] b8[ b b8. b16]
  a8[ a a fs] g8 g g4

  d'8[ d d a] b8[ b b8. b16]
  a8[ fs g e] fs2
  d'16[ 8. 8. a16] b8 8 16 16 r8
  a8 8 8 fs g g g g
  d'8[ 16 8. a8] b8[ 8 8. 16]
  a8[ fs g16 e8( fs16)~] fs8 fs4.
  \bar "||" \break
  d'8. e16 fs8 d g2
  a8. g16 fs8 a g fs e cs
  d8. e16 fs8 d g2
  a16 fs8. g8 e d2
  d8 d16 e fs8 d e8 e16 fs g8 e
  fs8 fs16 g a8 fs g fs e cs
  d8 d16 e fs8 d g2
  a16 fs8. g8 e d2
}

chrdStrophe = \chordmode {
   d2 b:m g a d b:m g4 a d2
   d2 g d a d g d4 a d2
   d2 g d a d g d4 a d2
   d2 g d a d g d4 a d2
   d2 g d a d g d4 a d2
}

  \layout {
      #(layout-set-staff-size-with-jazz 24)
    \context {
      \Lyrics
     % \override LyricText #'font-size = #1.5
     % \override VerticalAxisGroup.staff-affinity = ##f
     % \override VerticalAxisGroup.staff-staff-spacing =
     %   #'((basic-distance . 0)
%	   (minimum-distance . 0.85)
%	   (padding . 1.5))
    }
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
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout {#(layout-set-staff-size-with-jazz 19)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff \with { \staffSize #-4 }
      <<
      \new Voice = "StropheSopran" { \stropheSopran }
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
