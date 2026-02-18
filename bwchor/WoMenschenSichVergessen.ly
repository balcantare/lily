\version "2.22.2"
sheetName = "Wo Menschen sich vergessen"
sheetComposer = "Christoph Lehmann"
sheetPoet = "Thomas Laubach"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Wo Men -- schen sich ver -- ges -- sen,
  die We -- ge ver -- las -- sen
  und neu be -- gin -- nen, ganz neu.
  Da be -- rüh -- ren sich Him -- mel und Er -- de,
  daß Frie -- den wer -- de un -- ter uns.
  Da be -- rüh -- ren sich Him -- mel und Er -- de,
  daß Frie -- den wer -- de un -- ter uns.
  Da be -- rüh -- ren sich Him -- mel und Er -- de,
  daß Frie -- den wer -- de un -- ter uns.
  Da be -- rüh -- ren sich Him -- mel und Er -- de,
  daß Frie -- den wer -- de un -- ter uns.

}}


lyrStropheB = {
  \lyricmode {
    \set stanza = #"2. "
    Wo Men -- schen sich ver -- schen -- ken,
    die Lie -- be be -- den -- ken
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Wo Men -- schen sich ver -- bün -- den,
    den Haß ü -- ber -- win -- den
}}

strophe = \relative c' {
  \voiceOne
  \time 2/2
  \key f \major
  \partial 4
  \bar ".|:"
  \repeat volta 2 {
  c4
  c f f f
  f g s g
  g2 g4 g
  g a s2
  s4 a a a
  a bf s c
  g2 s2
  s4 f8 f a bf c4
  c4 bf2 a4
  g c, \tuplet 3/2 { e4 f g }
  g4 a f e8 f~
  8 s f8 f a bf c4
  c4 bf2 a4
  g c, s c
  d4 f bf a
  g2 f4 f~
  1~
  4 s2 }

  s4 \break
  \repeat volta 2 {
  s4 f8 f a bf c4
  c4 d2 bf4
  g4 c, \tuplet 3/2 { e4 f g }
  g4 a f e8 f~
  f8 s f f a bf c4
  c4 d2 bf4
  g c, s c
  d4 f bf a
  g2 f4 f~
  2-\fermata s2 }
  %\bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  c4
  a c c c
  c d r d
  c2 c4 c
  d e r2
  r4 f f f
  f f r c
  c2 r
  r4 f8 f f f f4
  f4 d2 c4
  c4 c \tuplet 3/2 { c4 c c}
  e4 e e c8 f~
  f8 r f f f f f4
  d4 d2 c4
  c c r c
  bf c c c
  c2 c4 c~
  1~ 4 r2
  r4
  r4 f8 f f f f4
  f4 f2 d4
  d4 c \tuplet 3/2 { e4 e e }
  e4 c c bf8 c~
  c r f f f f f4
  f f2 d4
  d c r c
  bf c c c
  c2 c4 c~
  2 r2
}

chrdStrophe =  \chordmode {
  s4
  f1 g:m7 c a:m7 d:m7 g:m7 c:7 f g:m c a:m7
  d:m7 g:m7 c bf2 g:m c1 f1 s
  f1 g:m c a:m7 d:m7 g:m c bf2 g:m c1 f2.
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
    >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}
