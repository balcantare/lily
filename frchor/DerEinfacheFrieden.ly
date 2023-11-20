\version "2.24.0"
sheetName = "Der einfache Frieden"
sheetComposer = "Klaus Schneider"
sheetPoet = "Giesela Steineckert"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    \set stanza = "1. "
    Wenn ein Gras wächst,
    wo nah ein Haus steht,
    und vom
    \set stanza = "1. "
    Schorn -- stein steigt der Rauch.
    Soll'n die Leu -- te
    beiei -- nan -- der
    \set stanza = "1. "
    sit -- zen,
    vor sich Brot und Ru -- he auch,
    und Ru -- he auch.

    Das ist der ein -- fa -- che Frie -- den,
    den schät -- ze nicht ge -- ring.
    Es ist um den ein -- fa -- chen Frie -- den
    seit Tau -- sen -- den von Jah -- ren
    ein be -- schwer -- lich Ding.
}}
lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Wo ein Mann wohnt,
    soll ei -- ne Frau sein,
    daß da
    \set stanza = "2. "
    eins das and -- re wärmt,
    soll'n sich lie -- ben und soll'n sich
    \set stanza = "2. "
    strei -- ten,
    von der Angst nicht ab -- ge -- härmt,
    nicht ab -- ge -- härmt.
}}
lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
    Wo ein Ball liegt,
    soll nah ein Kind spiel'n,
    das zwei \set stanza = "3. "
    gu -- te El -- tern hat,
    und soll al -- le Aus -- _ sicht
    \set stanza = "3. "
    ha -- ben,
    ob im Land, ob in der Stadt,
    ob in der Stadt.
}}
lyrStropheD = {
  \lyricmode {
    \set stanza = "4. "
    Wo ein Leben war, da soll ein Tod sein,
    un -- ter \set stanza = "4. "
    Trä -- nen still ins Grab,
    wo der Nach -- fahr manch -- _ mal
    \set stanza = "4. "
    hin -- geht
    zu dem Men -- schen, den es gab,
    den __ _ es gab.
}}
lyrStropheE = {
  \lyricmode {
    \set stanza = "5. "
    Wo die Welt war,
    da soll die Welt sein
    und die
    \set stanza = "5. " Er -- de mit -- ten -- drin,
    daß ich sel -- ber auch __ _ ein
    \set stanza = "5. " Ah -- ne
    un -- ge -- bor' -- ner Men -- schen
    bin, Men -- _ schen bin.
}}

strophe = \relative c'{
  \time 3/4
  \key f \major
  \partial 4
  \bar "|."
  c8 c
  g'4 c,2
  g'4 a bf
  bf
  a2 r2.
  r2 c,8 c
  d' d c4 bf
  a2.
  r2 c,8 c
  g'4 c,2
  g'4 a bf
  a8( g) f2
  d8 e f a d e
  f( e d2)
  a4 g f
  g2. r2. \break
  \bar "||"
  f'4 c c
  c d ef
  ef d2~
  d4 r4 f~
  f c a~
  a g f
  g2.~ g4 r c,
  a'4 a a
  a bf c
  c bf2
  r8 f g8. f16 e8 f
  a2 c,4
  bf'8. a16 f4 f
  f2. r2
  \bar "|."
}
chrdStrophe = \chordmode {
  s4
  c2.:7 s f s c s f s c s d:m s
  d:m bf c s
  f f:7 bf s
  f s c s
  f s g:m7 b:dim f bf f
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \transpose f c \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose f c \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
    \layout {
      \context {
        \Lyrics
        \override LyricText.font-size = #+1.8
      }
    }
  }
}
