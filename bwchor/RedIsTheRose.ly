\version "2.22.2"
sheetName = "Red is the Rose"
sheetComposer = "arr. Reinhard Simmgen"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Come o -- ver the hills,
  \skip 8 my bon -- nie I -- rish lass
  Come o -- ver the hills
  to your dar -- ling
  \skip 8 You choose the road, love, and I'll make the vow
  And I'll be your true love for -- e -- ver.
}}

lyrStropheB = {
  \lyricmode {
    \skip 8
  \set stanza = #"ref 2,4,6. "
  Red is the rose that in yon -- der
  gar -- den grows
  \skip 8 Fair is the lily of the val -- ley
  \skip 8 Clear is the wa -- ter that flows from
  the Boyne
  But my love is fai -- rer than a -- ny.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  'Twas down by Ki -- llar -- ney's
  green wo -- ods that we strayed
  When_the moon and the stars they were shi -- ning
  The moon shone its rays on her locks_of gol -- den hair
  And_she swore she'd be my love for -- e -- ver.
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"5. "
  It's not for the par -- ti -- ng that my sis -- ter pains
  It's not for the grief of my mo -- ther
  'Tis all for the loss of my bonny I -- rish lass
  That my heart is brea -- king for -- e -- ver.
}}

strophe = \relative c' {
  \voiceOne
  \time 2/4
  \key d \major
  \partial 8
  d8
  fs4 fs8. g16
  a4 g8 fs
  g8 g g a
  g4. fs8
  fs4 fs8. g16
  a16( a8.) a8 a
  b2
  cs4. 8
  b4 b8. cs16
  a4 a8 a
  b( a) g a
  g4. g8
  fs4 a8 d
  d4 d8 a
  a4( g)
  fs2
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  a8
  d4 d8. e16
  fs4 e8 d
  e8 fs e d
  b4. a8
  d4 d8. d16
  d16( d8.) fs8 a
  b2
  a4. 8
  b4 b8. a16
  fs4 fs8 a
  g8( fs) e d
  b4. a8
  d4 fs8 a
  b4 a8 fs
  e2 d
}

stropheBass = \relative c {
  \clef "treble_8"
  \key d \major
  %\clef "bass"
  a8
  a4 a8. a16
  d4 d8 d
  b8 b b d
  e4. a,8
  a4 a8. a16
  d16( d8.) d8 d
  g4. fs8 e4. 8
  g4 g8. fs16
  d4 d8 d
  e( d) d d
  b4. d8
  a4 d8 d
  g4 fs8 d
  cs4( d)
  d2
}

chrdStrophe =  \chordmode {
  s8
  d2 s
  e:m s4 a
  d2 d:/b g a
  g d e:m
  a d g a d
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
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Staff <<
      \new Voice = "Basso" { \stropheBass }
      >>
    >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}
