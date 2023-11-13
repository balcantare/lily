\version "2.24.0"
sheetName = "Wir sind eins"
sheetComposer = "Pit Budde"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  Der Frie -- den ist so wie ein Fluss,
  der durch mei -- ne Träu -- me fließt.
  Sanft und ru -- hig durch Wie -- sen
  glei -- tet und don -- nernd durch
  tie -- fe Schluch -- ten schießt.
  Es ist ein Le -- ben, ei -- ne Zeit,
  ei -- ne Lie -- be, ei -- ne Welt.
  Wir sind Eins!
  Wir sind eins und doch nicht das Glei -- che,
  wir sind so ver -- schie -- den wie
  Pal -- me und Ei -- che. Sind so ver -- schie -- den
  wie Son -- ne und Re -- gen und doch wolln
  wir al -- le in Frie -- den le -- ben.
  Wir sind Eins!
}}

strophe = \relative c'{
  \time 4/4
  \key d \major
  r8 fs8 fs fs g fs4 r8
  e4 fs8 e~ e4 r
  fs4 e d b
  d8 e4. d4. r8
  fs4 fs g8 fs fs4
  e4 e8 fs e4. e8
  fs8 e r d8 d4 b
  d8 e4. d4 r
  r8 fs fs fs g4 fs
  e8 fs4. e2
  fs8 e4 d8~ d d4 r8
  d8 e4 d8~ d fs8 e r
  d4 r r2
  r1 r1 r1
  r8 fs fs g~ g4 fs
  e8 e e fs8~ fs e4 e8
  fs8 e d4 d d8 b
  b8 d d e~ e d4 r8
  fs8 fs fs g~ g4 fs8 fs
  e8 e e fs~ fs4 e8 e
  fs8 e d d~ d d4 b8
  d8 d e d r fs e4
  d2 r2
  \bar "|."
}

chrdStrophe = \chordmode {
  d1 a b:m g
  d a b:m
  g d a b:m
  g d a b:m g
  d a b:m
  g d a
  b:m g d
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \transpose d d \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose d d \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    >>
%    \layout {
%      \context {
%        \Lyrics
%        \override LyricText.font-size = #+1
%      }
%    }
    %\midi {}
  }
}
