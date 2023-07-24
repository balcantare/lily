\version "2.22.2"
sheetName = "Heute und hier"
sheetComposer = "Beate Tarach"
\include "book.ily"


skipA = \repeat unfold 7 { \skip 2 }

lyrStropheA = {
  \lyricmode {
    \skipA
     \set stanza = #"1. "
    Was wird aus uns' -- rem Mor -- gen?
    Wo -- hin wird un -- ser Weg uns führ'n?
    Blei -- ben uns die Sor -- gen,
    daß wir im Krie -- ge uns ver -- lier'n?
    Die Hoff -- nung in den Her -- zen,
    sie darf nie -- mals ver -- geh'n.
    Daß auf der Er -- de Frie -- den wer -- de,
    lasst uns zu -- sam -- men steh'n.

    Heu -- te und hier sin -- gen wir
    sin -- gen wir un -- ser Lied in die Welt,
    denn ein Lied ent -- facht in den
    Men -- schen ei -- ne Kraft und es macht,
    daß ein Son -- nen -- strahl in
    uns' -- re Her -- zen fällt. fällt.
}}
lyrStropheB = {
  \lyricmode {
    \skipA
    \set stanza = #"2. "
    \skip 8 Sin -- gen wir ge -- mein -- sam,
    ent -- steht ein un -- sicht -- ba -- res
    Band zwi -- \skip 8 schen \skip 8 Men -- schen,
    \skip 8 die sich vor -- her nie ge -- kannt.
    \skip 16 Lasst es stär -- ker wer -- den,
    \skip 8 dann be -- kommt's die Kraft,
    \skip 16 die \skip 8 in den Her -- zen die -- ser
    \skip 16 Er -- de Frie -- den schafft!
}}

lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = #"3. "
    \skip 8 Klin -- gen uns -- 're Lie -- der
    \skip 8 lan -- ge noch in je -- dem fort,
    se -- hen wir uns wie -- der,
    \skip 8 ir -- gend -- wann am glei -- chen Ort.
    Wird un -- ser Chor ge -- wach -- sen
    \skip 8 und
    noch bun -- ter sein,
    und al -- \skip 8 le \skip 8 stim -- men
    in den \skip 16
    gro -- ßen  Chor mit ein.
}}

lyrStropheD = {
  \lyricmode {
}}

strophe = \relative c'{
  %\voiceOne
  \time 4/4
  \key c \major
  %\partial 8
  e4. f8 e4. f8
  d4. c8 c4. \bar "" \break
  \bar ".|:" g8
  e'8 e8 e8. g16 g8 g4 g8
  f8 f g8. f16 e8 d c4
  f8 f f f e e4 e8
  d d fs a a8. g16 g8. \bar "" \break g16
  a8 a a8. a16 g8 c,4 c8
  f8 f g f e4. \bar "" \break
  r16 d16 d8 d8 d8. e16 fs8 fs e d16 d
  g8 g g16 a8 g16~ g2 \bar "||" \break
  e4 e8 e d2
  f4. f8 e4 e8. d16
  c4 c8 c c4 d8 e
  d2. \break
  \repeat volta 2 {
    g,8 g
    a4. a8 b4 b8 b
    c c d8. e16 d4 e8 f
    g4 e8 g f16 e8. d8 c
    d8 d d16 c8. }
   \alternative {
     { e4 }
     { c4. }
   }
  \bar ":|."
}

chrdStrophe = \chordmode {
  c1 g2 c2
  c2 g2
  f c
  f c
  d g
  f c
  f c
  d1 g1
  c2 g
  f c
  a1:m
  g1
  f2 g2
  c g
  c f
  g c4
  c4
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
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

    >>
    \layout {
      \context {
        \Lyrics
        \override LyricText #'font-size = #+1
      }
    }
    \midi {}
  }
}
