\version "2.22.2"
sheetName = "De Colores"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  De co -- lo -- res, de co -- lo -- res se vis -- ten
  los  cam -- pos  en la pri -- ma -- ve -- ra,
  \set stanza = #"1. "
  de co -- lo -- res, de co -- lo -- res son los
  pa -- ja -- ri -- tos que vien -- en
  d'a -- fue -- ra,
  \set stanza = #"1. "
  de co -- lo -- res, de co -- lo -- res es el ar -- co
  i -- ris que ve -- mos lu -- cir,
  y por
  \set stanza = #"1&2. "
  e -- so los gran -- des a -- mo -- res
  de mu -- chos co -- lo -- res
  me gus -- tan a mi,
  y por
  \set stanza = #"1&2. "
  e -- so los gran -- des a -- mo -- res
  de mu -- chos co -- lo -- res
  me gus -- tan a mi,
}}

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   Cant' el gall -- o,
   cant' el gall -- o con il,
   ci -- ri, ci -- ri, ci -- ri, ci -- ri, ci -- ri,
   \set stanza = #"2. "
   la ga -- lli -- na,
   la ga -- lli -- na con el
   ca -- ra, ca -- ra, ca -- ra, ca -- ra, ca -- ra,
   \set stanza = #"2. "
   los po -- llu -- elos,
   los po -- llu -- elos con il
   pi -- o, pi -- o, pi -- o, pi -- o, pi,
   y por
}}

strophe = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \key d \major
  a4.~ 4 g8 |
  g fs4~ fs8[ fs g]
  \repeat unfold 2 {a8[ a a] a[ g fs]}
  a8 g4~ g4.
  r2.
  g4.~ 4 fs8
  fs8 e4~ 8[ g a]
  \repeat unfold 2 {b8[ 8 8] b[ a g]}
  b8 a4~ a4. |
  r2.
  a4.~ a4 g8 |
  g8 fs4~ fs8[ fs g] |
  a8[ a a] a[ g fs] |
  a8[ a a] a8 b c] |
  b4. r8 g[ a] |
  b8[ b b] b[ cs b] |
  b8[ a a] a[ b a] |
  a[ g a] b[ a g] |
  fs4. r8 g[ a] |
  b[ b b] b[ cs b]
  b8[ a a] a[ b a] |
  a[ g a] b[ a cs,] |
  d2.
  \bar "|."
}

stropheSopran = \relative c'' {
  %\voiceThree
  \key d \major
  \accidentalStyle neo-modern %-voice-cautionary
  d4.~ 4 b8 |
  b a4~ a8[ a b] |
  d8[ d d] d[ b a] |
  d8[ d d] d[ cs b]|
  cs8 a4~ a4.
  r2. \break
  cs4.~ cs4 b8 |
  b8 a4~ a8[ cs d] |
  \repeat unfold 2 {e8[ 8 8] e[ d cs]}
  e8 d4~ d4. |
  r2. \break
  d4.~ d4 b8 |
  a8 a4~ a8[ a b] |
  d8[ d d] d[ b a] |
  d8[ d d] d8[ cs c] |
  b4. r8 b[ cs] |
  d8[ d d] d[ e d] |
  d8[ a a] a[ b a] |
  a[ g a] b[ a g] |
  a4. r8 b[ cs] |
  d[ d d] d[ e d]
  d8[ a a] a[ b a] |
  a[ g a] b[ a cs,] |
  d2.
  \bar "|."
}

stropheAlt = \relative c'' {
  \voiceTwo
  fs,4.~ 4 e8 |
  e d4~ d8[ d e]
  \repeat unfold 2 {fs8[ fs fs] fs[ e d]}
  fs8 e4~ e4.
  r2.
  e4.~ 4 d8
  d8 cs4~ 8[ e fs]
  \repeat unfold 2 {g8[ 8 8] g[ fs e]}
  g8 fs4~ fs4. |
  r2.
  fs4.~ fs4 e8 |
  e8 d4~ d8[ d e] |
  fs8[ fs fs] fs[ e d] |
  fs8[ fs fs] fs8 g a] |
  g4. r8 e[ fs] |
  g8[ g g] g[ a g] |
  g8[ fs fs] fs[ g fs] |
  fs[ e fs] g[ fs e] |
  d4. r8 e[ fs] |
  g[ g g] g[ a g]
  g8[ fs fs] fs[ g fs] |
  fs[ e fs] g[ fs e] |
  d2.
}

chrdStrophe = \chordmode {
   d2. s s s a s a s s s
   d s d s s s g g d a d g d a d
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Staff <<
      \new Voice = "Tenor" { \stropheSopran }
      >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
