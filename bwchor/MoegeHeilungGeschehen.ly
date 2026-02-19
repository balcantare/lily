\version "2.24.0"
sheetName = "Möge Heilung geschehen"
sheetComposer = "Amei Helm"
\include "../include/book.ily"

lyrA = {
  \lyricmode {
  Mö -- ge Hei -- lung ge -- scheh'n,
  mö -- ge Hei -- lung ge -- scheh'n,
  mö -- ge Hei -- lung ge -- scheh'n,
  mö -- ge Hei -- lung ge -- scheh'n.
}}

lyrB = {
  \lyricmode {
    Für die Lie -- be, 
    _ für die Er -- de und ih -- re Kin -- der,
    daß Frie -- den wer -- de.
 }}
lyrC = {
  \lyricmode {
    Für die Mee -- re,
    _ für die Wäl -- der, 
    _ für den Re -- gen und für die Fel -- der.
}}
lyrD = {
  \lyricmode {
    Für die Tie -- re, 
    _ für die Pflan -- zen,
    und daß die Men -- schen 
    zu -- sam -- men tan -- zen.
}}
lyrE = {
  \lyricmode {
  Für die Trauri -- gen und für die 
  Kran -- ken,
  für die Ge -- füh -- le
  und die Ge -- dan -- ken.
 }}

sopran = \relative c' {
  \time 4/4
  \key g \major
  \partial 2
  <g b>4 <a c> 
  <b d>2 4 <a c>8 <b d>~
  2 4 <c e>
  <a c>2 4 <g b>8 <a c>~
  2 4 <b d>
  <c e>2 4 <b d>8 <c e>~
  2 4 <e g>
  <b d>2 4 <a c>8 <b d>~
  2
  \bar "|."
}

alt = \relative c' {
  \key g \major
  b4 c 
  d2 d
  r4 r8 d8 d4 e
  c2 c
  r4 r8 \break c c4 d
  e e~ 2
  r4 e e g
  d2 d
  r2
}


chrdStrophe = \chordmode {
  s2 g1 a:m s c s g
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
    \new ChordNames \chrdStrophe 
    \new Staff <<
      \new Voice = "Sopran" \sopran 
      >>
    \new Lyrics \lyricsto "Sopran" \lyrA
    \new Staff <<
      \new Voice = "Alt" \alt 
      >>
    \new Lyrics \lyricsto "Alt" \lyrB
    \new Lyrics \lyricsto "Alt" \lyrC
    \new Lyrics \lyricsto "Alt" \lyrD
    \new Lyrics \lyricsto "Alt" \lyrE
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
