\version "2.22.2"
sheetName = "Romano Drom"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  Šu -- nas ti -- ro lav tu de -- ha
  aj -- so šaj
  tu šaj ti -- ro lav me tut mi -- ri
  la -- či oj ba -- re ver -- da  -- ne -- ha
  na do -- tra den te len šu -- nav i -- vi  i -- ti

  aj ne aj ne ne aj ne ne aj ne ne
  te len šu -- nav aj me i -- vi  i -- ti
}}

strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key a \minor
  \partial 2
  a2 |
  e1~ |
  e2 g |
  fs2 fs~ |
  fs e4.( fs8) |
  e2 c~ |
  c d4. e8 |
  d2( a)~ |
  a2. b4 |\break
  c1~ |
  c2 d |
  b2 b~ |
  b2. a4 |
  a1 |
  r4 e a gs |
  b1~ |
  b2^\fermata
  a2 |
  e'1~ |
  e2( g) |
  fs1~ |
  fs2 e4. d8 |
  e2 c~ |
  c d4. e8 |
  d2.( a4) |
  a2. g'4 |
  fs2.( g4)( |
  fs2) g2 |
  fs2. g4 |
  fs( e) g( fs) |
  e1~ |
  e~ | e
  r2 \break \repeat volta 2 {
    e2 |
    a1~ |
    a2 b4. a8 |
    g2.( e4)( |
    g1) |
    r2 f4. g8  |
    a2. g8 f |
    e2.( c4)( |
    e2.) g4 |\break
    fs2. fs4 |
    f2 f |
    d2. c4 |
    d4( c) d( e) |
    c1~ |
    c1~ |
    c1~ |
    c2 }
  %\bar "|."
}

chrdStrophe = \chordmode {
  \set chordBassOnly = ##t
  s2
  a1:m
  c  d b:m a:m a:m/g
  \set chordBassOnly = ##f
  d:/fs f a:m s2 g
  d1:m6 e a:m s1 e1 s
  a:m c d b:m a:m
  \set chordBassOnly = ##t
  a:m/g

  d d:/a fs s b s e e:/d e:/c e:/b
  f d2:m g c1 a2:m a d1:m d:m7 a:m
  a:m/g \set chordBassOnly = ##f
  d:/fs f d:m e a:m
  \set chordBassOnly = ##t
   \startParenthesis \parenthesize
   a:m/b  \endParenthesis \parenthesize a:m/c
}


\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.35))
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    >>
  }
}
