\version "2.22.2"
sheetName = "Farewell my friend"
sheetComposer = "aus Sierra Leone, arr. Reinhard Simmgen"
sheetPoet = "dt. Beate Tarach"
\include "../include/book.ily"

lyrStropheAa = {
  \lyricmode {
  %\set stanza = #"1. "
  Fare -- well my friend.
  Re -- mem -- ber us.
  Re -- turn to us.
  a __ a __ a __ Fare -- well my friend.
}}

lyrStropheAb = {
  \lyricmode {
   %\set stanza = #"2. "
   Mach's gut mein Freund!
   \skip 8 Denk an uns!
   Wir sind bei Dir!
   \repeat unfold 3 { \skip 8 }
   Mach's gut mein Freund!
}}
lyrStropheBa = {
  \lyricmode {
   %\set stanza = #"3. "
   Peace go with you as you
   tra -- vel far. __
   Smile and think of all our
   fa -- ces here. __
   Jour -- ney in a cir -- cle.
   Round to where you star -- ted.
   Don't for -- get that we shall
   wait for you. __
}}

lyrStropheBb = {
  \lyricmode {
  Frie -- de sei stets mit Dir
  al -- le Zeit. __
  Mö -- ge un -- ser La -- chen
  mit Dir sein. __
  All' uns' -- re Ge -- dan -- ken
  mö -- gen Dich be -- glei -- ten,
  Dich nach Haus' ge -- lei -- ten.
  Komm gut an! __
}}
stropheA = \relative c'' {
%  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \key d \major
%  \override Rest #'staff-position = #0
  r4. r4 b8
  fs4 b8 a4.
  r2. r2.
  r4. r4 b8
  fs4 b8 a4.
  r2. r2.
  r4. r4 b8 fs4 b8 a4.
  \repeat volta 2 {
    r2.
    r4. d,4( e8
    fs2.)~ fs4 r8 fs8( e d
    e2.)~ e2.
    d4.~ d8 r8 b'8
    fs4 b8 a4.
  }
  %\bar "|."
}

stropheB = \relative c'' {
  \key d \major
  r2. r2.
  a4 a8 a4 g8
  fs4 e8~ e4.
  d4 8 d4.~ d2.
  a'4 a8 a4 g8
  fs4 e8~ e4.
  d4 d8 d4.~ d2.
  d'4 d8 d4 cs8
  b4 a8~ a4.
  b4 b8 b4 a8
  g4 fs8~ fs4.
  a4 a8 a4 g8
  fs4 e8~ e4.
  d4 d8 d4.~
  d2.
}

chrdStrophe = \chordmode {
  d2. s s a d s s a d s
  d s b:m s a s d s
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    %ragged-right = ##f
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "StropheA" { \stropheA }
      >>
    \new Lyrics \lyricsto "StropheA" \lyrStropheAa
    \new Lyrics \lyricsto "StropheA" \lyrStropheAb

    \new Staff <<
      \new Voice = "StropheB" { \stropheB }
      >>
    \new Lyrics \lyricsto "StropheB" \lyrStropheBa
    \new Lyrics \lyricsto "StropheB" \lyrStropheBb
    >>
%    \layout {
%      \context {
%        \Lyrics
%        \override LyricText #'font-size = #1
%      }
%    }
  }
}
