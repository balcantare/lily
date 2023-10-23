\version "2.24.0"
sheetName = "Es dunkelt schon in der Heide"
\include "../include/book.ily"
skipA= \repeat unfold 17 { \skip 8 }
lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = #"1. "
  Es dun -- kelt schon in der Hei -- de,
  \set stanza = #"1. "
  nach Hau _ -- se laßt uns gehn.
  \set stanza = #"1. "
  Wir ha -- ben das Korn _
  ge --  schnit -- ten
  \set stanza = #"1. "
  mit
  un _ -- serm blan _ -- ken Schwert.
}}
lyrStropheB = {
  \lyricmode { \skipA
  \set stanza = #"2. "
  Ich hört ein Si -- che -- lein
  rau -- schen,
  \set stanza = #"2. " wohl
  rau _ -- schen durch das Korn.
  \set stanza = #"2. "
  Ich hört' _ ein Feins _ -- lieb
  kla -- gen,
  \set stanza = #"2. "
  sie hätt' _ ihr Lieb _
  ver -- lorn.
  }
}
lyrStropheC = {
  \lyricmode { \skipA
   \set stanza = #"3. "
    Hast du dein Lieb _ ver -- lo -- ren,
    \set stanza = #"3. "
    so hab' _ ich doch das mein.
    \set stanza = #"3. "
    So wol -- len wir bei -- de
    mit -- 'nan -- der
    \set stanza = #"3. "
    uns win -- den
    ein Krän _ -- ze -- lein.
  }
}
lyrStropheD = {
  \lyricmode { \skipA
  \set stanza = #"4. "
  Ein Krän -- ze -- lein _ von Ro -- sen,
  \set stanza = #"4. "
  ein Sträu _ -- ße -- lein von Klee!
  \set stanza = #"4. "
  Zu Frank _ -- furt auf _ der Brü -- cke,
  \set stanza = #"4. "
  da liegt _ ein tie _ -- fer Schnee.
  }
}
lyrStropheE = {
  \lyricmode {\skipA
  \set stanza = #"5. "
  Der Schnee, der ist _ zer -- schmol -- zen,
  \set stanza = #"5. "
  das Was _ -- ser läuft da -- hin.
  \set stanza = #"5. "
  Kommst mir _ nicht aus _ den
  Au -- gen,
  \set stanza = #"5. "
  kommst mir _ nicht aus _ dem Sinn.
  }
}
lyrStropheF = {
  \lyricmode {\skipA
  \set stanza = #"6. "
  In mei -- nes Va _ -- ters Gar -- ten,
  \set stanza = #"6. "
  da stehn _ zwei Bäu -- me -- lein.
  \set stanza = #"6. "
  Das ei _ -- ne, das trägt Mus -- ka -- ten,
  \set stanza = #"6. "
  das an _ -- dre Braun -- nä -- ge -- lein.
  }
}

lyrStropheG = {
  \lyricmode { \skipA
  \set stanza = #"7. "
  Mus -- ka -- ten, die _ sind sü -- ße,
  \set stanza = #"7. "
  Braun -- näg _ -- lein, die sind schön.
  \set stanza = #"7. "
  Wir bei _ -- de müs _ -- sen
  schei -- den,
  \set stanza = #"7. "
  ja schei _ -- den, tut _ _  weh.
  }
}

strophe = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \key g \major
  \partial 8
  b16 c
  d8 c b a g fs
  e4 g8 d4 d8
  e4 g8 fs4 a8
  g4.~ g4 \bar "||" \break
  d8 d4 g8 g[ fs] e
  e d4 r \bar "" \break g8
  g[ b,] d d4 c8
  b4 r8 r4 \break
  \repeat volta 2 {
   d8
   d8[ b] d d[ b] d
   g4( b8) b4 \bar "" \break g8
   a8[ c] b a[ e] fs
   g4.~ g8 r
  }
}

chrdStrophe = \chordmode {
  s8
  g4. d c g c d g s
  g c g s
  g d e:m s
  g \set chordBassOnly = ##t
  g:/fs g:/e g:/d a:m d g
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    %ragged-last-bottom = ##f
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    \new Lyrics \lyricsto "Strophe" \lyrStropheG
    >>

  }
}
