\version "2.24.2"
sheetName = "Für alle Erdenkinder die noch nicht geboren sind"
sheetComposer = "Beate Tarrach"
\include "../include/book.ily"
sheetTonality = g

lyrStropheA = {
  \lyricmode {
  Es soll ein je -- der Mensch der Welt ein 
  Bäum -- chen pflan -- zen
  für al -- le Er -- den -- kin -- der, 
  die noch nicht ge -- bo -- ren  sind.
  Die wer -- den ein -- mal un -- ter 
  Baum -- rie -- sen tan -- zen,
  im Schein der Son -- ne und zum sanf -- ten Lied
  vom Wind.
  Die wer -- den ein -- mal un -- ter 
  Baum -- rie -- sen tan -- zen,
  im Schein der Son -- ne und zum sanf -- ten Lied
  vom Wind.
  \set stanza = #"1. "
  Statt grau -- em Bi -- tu -- men soll'n 
  Bäu -- me und Blu -- men in 
  Städ -- ten und Dör -- fern ge -- deihn.
  Le -- ben -- di -- ges Sprie -- ßen
  lädt ein zum Ge -- nie -- ßen,
  ist Kraft -- quell für mensch -- li -- ches 
  Sein.
}}

skipB=\repeat unfold 75 \skip 8
lyrStropheB = {
  \lyricmode {
  \skipB
  \set stanza = #"2. "
  Auf ur -- ba -- rer Er -- de stehn gra -- sen -- de
  Pfer -- de, ein Ort vol -- ler Frie -- den und
  Glück!
  im Baum -- schat -- ten lie -- gen
  die schla -- fen -- den Zie -- gen und Vö -- gel 
  kehr hier -- her zu -- rück.
}}

lyrStropheC = {
  \lyricmode {
  \skipB
  \set stanza = #"3. "
  Und blü -- hen die Bäu -- me,
  er -- wa -- chen die Träu -- me,
  wenn Win -- de durch Zwei -- ge hin wehn.
  Und wie all die Jah -- re, so
  sieht man die Paa -- re ver -- liebt un -- term 
  Blü -- ten -- meer stehn. 
}}

lyrStropheD = {
  \lyricmode {
  \skipB
  \set stanza = #"4. "
  Was wir heut ge -- stal -- ten,
  wird lan -- ge noch hal -- ten.
  Was soll von uns blei -- ben welch Land?
  Ein Gar -- ten voll Le -- ben,
  In -- sek -- ten, die schwe -- ben! 
  Der Sa -- men liegt in uns -- rer Hand.
}}

stropheSopran = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key g \major
  \partial 4.
  \voiceOne
  b8 b c
  \tuplet 3/2 { d4 g8} \tuplet 3/2 {g4 g8 } g8 g g b,
  c4 c s8 d d d 
  \tuplet 3/2 { d4 a'8 } \tuplet 3/2 { a4 a8 } a8 g fs e
  d4 c b8 b b c
  d8 g g a \tuplet 3/2 { b4 a g }
  g4 e s8 e fs g
  g16 d8. d8 b c c b c
  d2 s8 d8 d d
  g g g a \tuplet 3/2 { b4 a g}
  g4 e s8 e8 fs g 
  g16 d8. d8 g  g fs e fs
  g2 s4. d8
  \tuplet 3/2 { d4 e d } d8. d8. fs8
  \tuplet 3/2 { a4 b c } b8. g8. g8
  \tuplet 3/2 { c4 c c } \tuplet 3/2 { c b g }
  a2 s4. d,8 
  \tuplet 3/2 { d4 e d } d8. d8. fs8 
  \tuplet 3/2 { a4 b c } b8. g8. g8
  \tuplet 3/2 { c4 c c } \tuplet 3/2 { c b g} 
  d2 s8
  \bar "|."
}

stropheAlt = \relative c' {
  \key g \major
  \voiceTwo
  b8 b a
  \tuplet 3/2 { b4 b8 } \tuplet 3/2 { b4 c8 } d8 d c b
  e4 e r8 fs8 fs fs
  \tuplet 3/2 { fs4 fs8 } \tuplet 3/2 { fs4 fs8 } fs8 e d c
  b4 a g8 b b a 
  b8 d  d d \tuplet 3/2 { g4 d d }
  e4 c r8 e d c
  b16 b8. b8 b a a b a
  b2 r8 d d c
  b8 d d d \tuplet 3/2 { g4 d d }
  e4 c r8 e d c
  b16 b8. b8 d c c d c
  b2 r4. \break d8 \tuplet 3/2 { d4 c b }
  c8. a8. fs'8 
  \tuplet 3/2 { fs4 g a }
  g8. d8. d8
  \tuplet 3/2 { e4 e e } \tuplet 3/2 { e d c }
  d2 r4. d8 
  \tuplet 3/2 { d4 c b } c8. a8. fs'8
  \tuplet 3/2 { fs4 g a } g8. d8. d8
  \tuplet 3/2 { e4 e e } \tuplet 3/2 { e4 fs g}
  a2 r8
}

chrdStrophe = \chordmode {  
  s4.
  g1 a:m d g s c g2 d:7 g1 s c g2 d:7
  g2 s s a:m d g c s d s a:m d:7 s g c s d:7
}

\layout {
  \context {
    \Lyrics
    \override VerticalAxisGroup.staff-affinity = #UP
    \override VerticalAxisGroup.nonstaff-nonstaff-spacing.minimum-distance = #3
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.minimum-distance = #2
    \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing.minimum-distance = #10
  }
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
             
  \score {
    \layout { #(layout-set-staff-size-with-jazz 18)}
    <<
    \new ChordNames \doTranspose \chrdStrophe 
    \new Staff \with {\accepts ChordNames}
      <<
        \context Voice = "StropheSopran" { \doTranspose \stropheSopran }
        \context Voice = "StropheAlt" { \doTranspose \stropheAlt }
      >>
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheD
    >>
  }
}
