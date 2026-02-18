\version "2.24.0"
sheetName = "Wir tragen ein Licht in die Dunkelheit"
sheetComposer = "Unmada Manfred Kindel"
\include "../include/book.ily"


skipA = \repeat unfold 7 { \skip 2 }

lyrStropheA = {
  \lyricmode {
   Wir tra -- gen ein Licht in die
   Dun -- kel -- heit,
   sin -- gen ein Lied um uns Mut zu ma -- chen.
   Ist un -- ser Licht -- lein auch
   noch so klein,
   wir sind ein Lich -- ter -- meer.
   Frie -- den auf Er -- den,
   nie wie -- der Krieg.
   Hoff -- nung den Men -- schen und
   daß es Brot für al -- le gibt.
}}

strophe = \relative c'{
  %\voiceOne
  \time 4/4
  \key d \major
  \partial 4
  a4
  fs' fs8 g a4 g8 fs
  e4 a fs2
  b4 b8 cs d4 cs8 b
  a4 g8 fs~ fs4 e
  fs4 fs8 g a4 g8 fs
  e4 a fs2
  b4 b8 cs d4 b
  cs2 r2 \break \bar "||"
  %\time 7/8
  d2 b4 g
  a2 fs2
  d'2 b4 g
  a2. r4
  d2 b4 g
  a2 fs4 d
  e4 fs4 g4 a
  b8( a) b4 a4
  \bar "|."
}

chrdStrophe = \chordmode {
  s4
  d1 a2 d
  g1 d2 a
  d1 a2 fs:m
  g1 a
  g2 s2
  d2 s2
  g2 s2
  d2 s2
  g2 s2
  d2 s2
  e2:m s2
  a2 s4
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \transpose d c \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose d c \strophe }
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
