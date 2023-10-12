\version "2.24.0"
sheetName = "Nuestra Navidad - 2 - La Peregrinacion"
sheetComposer = "Ariel Ramierez"
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace75"
}
stanzaA = \markup {
  \column { \vspace #.4 "1. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaB = \markup {
  \column { \vspace #.4 "2. "}
  \column { \vspace #.2 \leftbrace }
}

skipA=\repeat unfold 16 { \skip 8 }

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = \stanzaA
  A la hue -- lla, la hue -- lla
  Jo -- sé‿y Ma -- ri -- a,
  \set stanza = \stanzaA
  Por las pam -- pas he -- la -- dos
  Car -- dos y'‿or -- ti -- gas,

  \set stanza = \stanzaA
  A la hue -- lla, la hue -- lla
  Cor -- tan -- do cam -- po,
  \set stanza = \stanzaA
  No‿hay co -- bi -- jo ni fon -- da
  Si gan an -- dan -- do.

  Ah --  Jo -- sé‿y Ma -- ri -- a,
 Con un Dios na -- die sa -- bi -- a.
 A la hue -- lla la hue -- lla, hue -- lli -- ta
 Jo -- sé‿y Ma -- ri -- a.
}}
lyrStropheB = {
  \lyricmode {
    \skipA
    Flo -- re -- ci -- ta del cam -- po
 cla -- vel del ai -- re,
 Si nin -- gu -- n tea -- lo -- a
 A -- don -- de na -- ces,
 Don -- de na -- ces flor -- ci -- ta
 Que‿es -- tás cre -- cien -- do,
 Pa -- lo -- mi -- ta‿a -- sus -- ta -- da
 Gri -- llo sin sue -- ño.
  }
}
lyrStropheC = {
  \lyricmode {
    \skipA
  \set stanza = \stanzaB
  A la hue -- lla, la hue -- lla,
 Los per -- e -- gri -- nos,
  \set stanza = \stanzaB
  Pres -- ten -- me‿un -- a ta --
  pe -- ra, Pa -- ra mi ni -- ño,
  \set stanza = \stanzaB
 A la hue -- lla, la hue -- lla,
 Sol -- es y lu -- nas,
  \set stanza = \stanzaB
 Los o -- si -- tos de‿al -- men -- dra,
 Piel de‿a -- cei -- tu -- na.
}}
lyrStropheD = {
  \lyricmode {
    \skipA
    Ay bur -- ri -- to del cam -- po
 Ay buey bar -- ci -- no,
 Que mi ni -- ño ya vie -- ne,
 Há -- gan -- le si -- tio,
 Un ran -- chi -- to de quin -- cha,
 So -- lo me‿am -- pa -- ra,
 Dos a -- lien -- tos a -- mi -- gos,
 La lu -- na cla -- ra.
}}

strophe = \relative c'' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 6/8
  \key g \minor
  \mark \markup{\box{Zs}}
  d2. ef c d bf c c bf \break
  d g, c f bf, bf a g %\bar "||"
  \break
  \repeat volta 2 {
  r8 d'8 c bf c d |
  d4 ef8 r ef4 |
  ef8 ef4 ef4. |
  d4.~ d4 r8 |

  r8 bf a g a bf |
  bf4 c8 r c4 |
  c8 c4 c4. |
  bf4.~ bf4 r8

  r8 d c b c d |
  d4 ef8 r ef4 |
  ef8 ef4 ef4. |
  d4.~ d4 r8 |

  r8 bf a g a bf |
  bf4 c8 r c4 |
  ef8 ef4 d8( c4) |
  bf4.~ bf4 r8
  \once \override Score.RehearsalMark.break-visibility =
    #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X =
    #RIGHT
  \mark \markup{\box{..Coda}}
  } \break
  f'2.( | ef4.) r8 ef4 |
  ef8 ef4 ef4. |
  d4.~ d4 r8 |
  bf4. bf4. |
  c4. r8 a4 |
  a8 a4 c4. |
  %\ccharnote{17}{\hskip2cm\hbox{\boxit{..Zwischenspiel}}}\

  bf4.~ bf4 r8
  \once \override Score.RehearsalMark.break-visibility =
    #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X =
    #RIGHT
  \mark \markup{\box{..Zs}}
  \bar "|."
  \break
  %\ccharnote{10}{\hskip1cm\hbox{\boxit{Coda}}}\
  r8^\markup{\box{\fontsize #2 Coda}} d d d d d |
  d d d d d4 | r8 d4 d d8 |
  d4. d4.~ d4.  r4.

  \bar "|."
}

chrdStrophe = \chordmode {
  g2.:m c:m7 f:7 bf:7+
  g:m c:m7 d:7 g:m
  g2.:m c:m7 f:7 bf:7+
  g:m c:m7 d:7 g:m
  g2.:m c:m7 f:7 bf:7+
  g:m c:m7 d:7 g:m
  g:7 c:m7 f:7 bf:7+
  g:m af:7 a4.:m5-7 d:7 g2.:m

  g:7 c:m7 f:7 bf:7+ g4.:m g:m7
  c:7 a:m5-7 d d:7 g2.:m
   s4.
  g:69
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.1))
    ragged-last-bottom = ##f
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
    >>
  }
}
