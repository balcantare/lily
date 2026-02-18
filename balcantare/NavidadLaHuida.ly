\version "2.24.0"
sheetName = "Nuestra Navidad  - 6 - La Huida"
sheetComposer = "Ariel Ramierez"
#(define book-staff-size 22)
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    Va -- mos! Va -- mos!
   Bu -- rri -- to‿a pu -- rá!
   \set stanza = "1. "
   Si no te‿a -- pu -- ras los van a pi -- llar
   \set stanza = "1. "
   lar -- go‿el ca -- mi -- no lar -- go‿el sa -- li -- tral
   \set stanza = "1. "
   Ya to -- can a de -- go -- llar
   \set stanza = "1. "
   Ya‿es -- tá san -- gran -- do‿el pu -- ñal
   \set stanza = "1. "
   Si no te‿a -- pu -- ras los
   van a pi -- llar.
 }}

lyrStropheB = {
  \lyricmode {
    \repeat unfold 9 {\skip 8}
    \set stanza = "2. "
    Ni -- ño bo -- ni -- to no llo -- ris mi‿a -- mor
   \set stanza = "2. "
   ya lle -- ga -- re -- mos a tier -- ra -- me -- jor.
   \set stanza = "2. "
   Duér -- me -- te ya no llo -- ris
   \set stanza = "2. "
   ou -- na‿en mis bra -- zos te‿ha -- ré.
   \set stanza = "2. "
   Bom -- bos le -- güe -- ros en mi co -- ra -- zón.
 }}

strophe = \relative c'' {
  \accidentalStyle modern %neo-modern % -voice-cautionary
  \time 3/4
  \key e \minor
  \bar ".|:"
  \partial 4
  \repeat volta 2 {
    e4
    d2 e4
    d2 e4
    d4 d cs
    b2
  } r4 \break

    g'4. g8 fs4
    e4. d8 cs4
    b4 b a
    g2 r4 \break
    g'4. g8 fs4
    e4. d8 cs4
    b4 b a
    g2 r4 \break
    e'4. ds8 e4
    fs4. e8 ds4
    e2.~ e8 r r2 \break
    g4. fs8 g4
    a4. g8 fs4
    g2.~ g8 r8 r2 \break
    g4. g8 fs4
    e4. d8 cs4
    b4 b a
    g2
  \bar "|."
}

chrdStrophe = \chordmode {
  e4:m
  b2:m7/fs e4:m
  b2:m7/fs e4:m
  b2:m7/fs a4
  e2:m s4
  e2:m fs4:m5-7/e
  e2:m a4
  e2:m fs4:m5-7/e
  e2.:m
  e2:m fs4:m5-7/e
  e2:m a4
  e2:m fs4:m5-7/e
  e2.:m
  c4.:/g b8:/fs c4:/g
  d4.:/a c8:/g b4:/fs
  c2.:/g s
  e4.:m/b b8 e4:m/b
  b2:m7 b4
  e2.:m/b s
  e2:m fs4:m5-7/e
  e2:m a4
  e2:m fs4:m5-7/e
  e2:m
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    >>
  }
}
