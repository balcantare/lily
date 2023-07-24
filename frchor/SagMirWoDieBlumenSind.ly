\version "2.22.2"
sheetName = "Sag mir wo die Blumen sind"
sheetComposer = "Pete Seeger"
sheetPoet = "dt. Text Max Colpet"
\include "book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -5.5)
\override LyricHyphen.extra-offset = #'(0 . -5.5)
\override LyricExtender.extra-offset = #'(0 . -5.5)
\override StanzaNumber.extra-offset = #'(0 . -5.5)
}

dropLyricsB = {
\override LyricText.extra-offset = #'(0 . -2.7)
\override LyricHyphen.extra-offset = #'(0 . -2.7)
\override LyricExtender.extra-offset = #'(0 . -2.7)
\override StanzaNumber.extra-offset = #'(0 . -2.7)
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

skipA = \repeat unfold 13 { \skip 2 }

lyrStropheA = {
  \skipA
  \lyricmode {
  \set stanza =
  \markup {
    \column {
      \vspace #-1.2
      "1. " "2. " "3. "
    }
    %\vspace #-0.5 \right-brace #60
  }
  \dropLyricsB
  Sag mir wo die
  \raiseLyrics
  Blu -- men
  \dropLyricsA
  sind,
  wo sind sie ge -- blie -- ben?
  \dropLyricsB
  \set stanza =
  \markup {
    \column {
      \vspace #-1.2
      "1. " "2. " "3. "
    }
  }
  Sag mir, wo die
  \raiseLyrics Blu -- men
  \dropLyricsA sind,
  \dropLyricsB
  was ist ge -- scheh'n?
  \raiseLyrics
  \set stanza = "1-3. "
  Sag mir, wo die
  \raiseLyrics \set stanza = "1. "
  Blu -- men
  \dropLyricsA sind?
  \raiseLyrics
  Mäd -- chen pflück -- ten sie ge -- schwind.
  Wann wird man je ver -- stehn,
  wann wird man je ver -- stehn.
}}

skipB = \repeat unfold 4 { \skip 2 }
skipC = \repeat unfold 11 { \skip 2 }
skipD = \repeat unfold 9 { \skip 2 }
skipG = \repeat unfold 1 { \skip 2 }

lyrStropheB = {
  \lyricmode {
  \skipA
  \skipB
  Mäd -- chen
  \skipC
  Mäd -- chen
  \skipD
  \set stanza = "2. "
  Mäd -- chen
  \skipG
  Män -- ner nah -- men sie ge -- schwind.
}}

lyrStropheC = {
  \lyricmode {
   \skipA
   \skipB
   Män -- ner
   \skipC
   Män -- ner
   \skipD
   \set stanza = "3. "
   Män -- ner \skipG %sind?
   Zo -- gen fort, der Krieg be -- ginnt.
}}
skipE = \repeat unfold 7 { \skip 2 }
skipF = \repeat unfold 5 { \skip 2 }
lyrStropheD = {
  \lyricmode {
  \skipA
  \set stanza = "4. "
  Sag wo die Sol -- da -- ten
  \skipE
  \set stanza = "4. "
  Sag wo die Sol -- da -- ten
  \skipF
  \set stanza = "4. "
  Sag wo die Sol --
  \set stanza = "4. "
  da -- ten
  \skipG
  Ü -- ber Grä -- bern weht der Wind.
}}

lyrStropheE = {
  \lyricmode {
    \skipA
    \set stanza = "5. "
    Sag mir wo die Grä -- ber
    \skipE
    \set stanza = "5. "
    Sag mir wo die Grä -- ber
   \skipF
   \set stanza = "5. "
   Sag mir wo die
   \set stanza = "5. "
   Grä -- ber
   \skipG
   Blu -- men blüh'n im Som -- mer -- wind.

   \skipD

}}

strophe = \relative c'' {
  %\voiceOne
  \time 2/2
  \key c \major
  %\partial 2.
  \mark \markup{ \fontsize #4 *}
  c2~  c8 b c b
  a2~ a8 b8 c e
  d2~ 8 e f a
  g1
  \bar "||" \break
  r4 g,8 a g4. f8
  e8 d4 c8~ 2
  r4 c'8 c c4. d8
  b8( a4) g8~ g2
  r4 g8 a g4. f8
  e8 d4 c8~ 2
  r4 f f4. e8
  d1
  r4 g8 a g4. f8
  e8 d4 c8~ 2
  r4 c'8 c c4. d8
  b8 a4 g8~ g2 \break
  r4 a f d
  c4 e8 g~ 2
  r4 a f e
  d2~ d8( e) d c~
  \mark \markup{ \fontsize #4 *}
  c1
  \bar "|."
}

chrdStrophe = \chordmode {
  %\set chordBassOnly = ##t
  c1 a:m d:m g
  c a:m f g
  c a:m
  d:m g
  c a:m f g
  f c
  f g c
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
