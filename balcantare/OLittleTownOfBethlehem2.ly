\version "2.24.0"
sheetName = "O little town of Bethlehem"
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
stanzaC = \markup {
  \column { \vspace #.4 "3. "}
  \column { \vspace #.2 \leftbrace }
}
% stanzaD = \markup {
%   \column { \vspace #.4 "4. "}
%   \column { \vspace #.2 \leftbrace }
% }
% stanzaE = \markup {
%   \column { \vspace #.4 "5. "}
%   \column { \vspace #.2 \leftbrace }
% }
% stanzaF = \markup {
%   \column { \vspace #.4 "6. "}
%   \column { \vspace #.2 \leftbrace }
% }
lyrStropheA = {
  \lyricmode {
  \set stanza = \stanzaA
  O litt -- le town of Beth -- le -- hem,
  how still we see thee here!
  \set stanza = "1. "
  Yet in thy dark streets shi -- neth,
  the e -- ver -- las -- ting light.
  \set stanza = "1. "
  The hopes and fears
  of all the years
  are met in thee to -- night.
}}

lyrStropheB = {
  \lyricmode {
  A -- bove thy deep and dream -- less
  sleep the si -- lent stars go by.
}}

lyrStropheC = {
  \lyricmode {
   \set stanza = \stanzaB
   All mor -- ning -- stars to -- ge _ -- ther
   pro -- claim the ho -- ly birth,
   \set stanza = "2. "
   for Christ is born by Ma -- ry;
   and, gathe -- red all a -- bove,
   \set stanza = "2. "
   while mor -- tals sleep the
   an -- gels keep their watch of
   won -- dering love.
}}
lyrStropheD = {
  \lyricmode {
    and prai -- ses sing 	to God the King, and peace
    to men on earth.
}}

lyrStropheE = {
  \lyricmode {
   \set stanza = \stanzaC
   O ho -- ly Child of Beth -- le -- hem,
   des -- cend to us we pray;
   \set stanza = "3. "
   We hear the Christ -- mas An -- gels
   the great glad ti -- dings tell:
   \set stanza = "3. "
   O come to us, a -- bide with us,
   our Lord Im -- ma -- nu -- el.
  }
}
lyrStropheF = {
  \lyricmode {
    cast out our sin and en -- ter in,
    be born in us to -- day!
  }
}

% lyrStropheG = {
%   \lyricmode {
%    \set stanza = \stanzaD
%    O Beth -- le -- hem, du klei -- ne Stadt,
%    wie stil -- le liegst du hier,
%    \set stanza = "4. "
%    Doch in den dunk -- len Gas -- sen
%    das ew -- ge Licht heut scheint
%    \set stanza = "4. "
%    für al -- le,  die da trau -- rig sind
%    und die zu -- vor ge -- weint.
% }}
% lyrStropheH = {
%   \lyricmode {
%     du schläfst, und gold -- ne Ster -- ne -- lein
%     ziehn lei -- se ü -- ber dir.
% }}
% lyrStropheI = {
%   \lyricmode {
%    \set stanza = \stanzaE
%    Des Her -- ren hei -- li -- ge Ge -- burt
%    ver -- kün -- det hell der Stern,
%    \set stanza = "5. "
%    denn Chris -- tus ist ge -- bo -- ren
%    und En -- gel hal -- ten Wacht,
%    \set stanza = "5. "
%    der -- weil die Men -- schen schla _ -- fen,
%    die gan -- ze dunk -- le Nacht.
% }}
% lyrStropheJ = {
%   \lyricmode {
%     ein ew -- ger Frie -- de sei be -- schert den
%     Men -- schen nah und fern;
% }}
% lyrStropheK = {
%   \lyricmode {
%    \set stanza = \stanzaF
%    O hei -- lig Kind von Beth -- le -- hem,
%    in uns -- re Her -- zen komm,
%    \set stanza = "6. "
%    Die Weih -- nachts -- en -- gel
%    sin -- gen die fro -- he Bot -- schaft hell:
%    \set stanza = "6. "
%    Komm auch zu uns und bleib bei uns,
%    O Herr Im -- ma -- nu -- el.
% }}
% lyrStropheL = {
%   \lyricmode {
%     wirf al -- le uns -- re Sün -- den fort
%     und mach uns frei und fromm.
% }}
stropheSopran = \relative c' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/2
  \partial 2
  \key g \major
  \bar ".|:"
  \repeat volta 2 {
  d2
  g g g a
  b4( a) b( c) d2 \breathe b2
  c2 b4( g) a2 a
  g1. \breathe
  } \break
  g4( b)
  d2. e4 d( c) b( a)
  g( a b c) d2 \breathe d,
  g b a g
  d1 \breathe
  d1
  g2 g g a
  b4( a) b( c) d2 \breathe b2
  c2 b4( g) a2 a
  g1.
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  d2
  d e d e4( fs)
  g2 g fs e
  e g g fs
  s1.
  g2
  fs2. e4 fs2 d
  d2( g) fs d
  d b c b4( c)
  s1 s
  d2 e d e4( fs)
  g2 g fs e
  e g g fs
  s1
  }

stropheBass = \relative c {
  \voiceTwo
  \clef "bass"
  \key g \major
  d2
  g <c c,> <b b,> <a a,>
  g e d \breathe e
  a, b c d
  <g g,>1. \breathe
  e2
  b2. c4 d2 e4( fs) |
  g2( e) d \breathe d4( c) |
  b2 e c e |
  d1 \breathe e2( fs) |
  g <c c,> <b b,> <a a,> |
  g e d \breathe e |
  a, b4( e) d2 d |
  <g, g'>1.
}

stropheTenor = \relative c {
  \voiceOne
  fs2
  b2 c d c
  d g, a g
  c d e d4( c)
  b1. b2
  b2. g4 d'2 d4( c)
  b2( g) a fs
  g g e4( fs) g2
  fs1 \break g2( a)
  b2 c d c
  d g, a g
  c d4( c) d2 d4( c)
  b1.

}
chrdStrophe = \chordmode {
  s2
  g1 s2 d
  g1 e:m
  a:m c2 d
  g1 s1
  g1 d
  g s
  e1:m a:m
  d d:7
  g1 s2 d2
  g1 e:m
  a:m c2 d
  g1.

  }

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \stropheSopran }
        \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheD
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheE
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheF
      \new Staff <<
        \new Voice = "StropheTenor" { \stropheTenor }
        \new Voice = "StropheBass" { \stropheBass }
      >>
    >>
   %  \layout {
%       \context {
%         \Lyrics
%         \override LyricText.font-size = #1
%       }
%     }
  }
}
