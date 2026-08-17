\version "2.24.2"
sheetName = "Hochzeitsmarsch"
sheetComposer = "Felix Mendelssohn Bartholdy"
\include "../include/book.ily"

sheetTonality = bf
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key ef \major
\language "english"
  \partial 4
  \tuplet 3/2 {ef8 ef8 ef8} |
  \repeat volta 2 {
ef2 r4   \tuplet 3/2 {ef8 ef8 ef8} |
ef2 r4   \tuplet 3/2 {ef8 ef8 ef8} |
ef4   \tuplet 3/2 {ef8 ef8 ef8} ef4   \tuplet 3/2 {ef8 ef8 ef8} |
ef4   \tuplet 3/2 {ef8 ef8 ef8} ef4   \tuplet 3/2 {ef8 ef8 ef8} |
\bar "||" \break
  \mark \markup{ \box{\fontsize #4 A}}
ef'2 d4. a8 |
c4( bf4) af4 f4 |
ef4. d16( ef16 f4) bf,8. f'16( |
g4) ef8 g8 bf8 ef,8 g8 bf8 |
ef2 d4. a8 |
c4( bf4) af4 f4 |
ef4. d16( ef16 g4 f8.) g16 |
f2 ef2 | \bar "||" \break
  \mark \markup{ \box{\fontsize #4 B}}
ef2 ef4. ef8 |
g4( f4) d4 bf4 |
bf4. ef8 ef4. g8 |
g4( f4) d4 bf4 |
bf4. g'8 g4. bf8 |
bf2 af4 g4 |
f4 e8. g16 f4 c8. ef16 |
d4 bf'4 c4 d4 |
\bar "||" \break
  \mark \markup{ \box{\fontsize #4 A}}
ef2 d4. a8 |
c4 bf4 af4 f4 |
ef4. d16 ef16 f4 bf,8. f'16 |
g4 ef8 g8 bf8 ef,8 g8 bf8 |
ef2 d4. a8 |
c4 bf4 af4 f4 |
ef4. d16 ef16 g4 f8. g16 |f2 ef4 r8. bf16 
%\bar "||" 
\break
  \key bf \major
  \mark \markup{ \box{\fontsize #4 C}}
\repeat volta 2 {
  bf4.. d16 d4.. f16 |
f4.. bf16 bf4.. g16 |
f4.. g16 g4.. ef16 |
d4.. f16 f4.. d16 |
c4.. f16 f4.. d16 |
c2 f4 a4 |
d,4.. fs16 fs4.. a16 |
a4.. d16 d4.. b16 |
a4.. b16 b4.. g16 |
fs4.. a16 a4 f4 |
}

%bf,4. d16 d4. f16 |
%f4.. bf16 bf4.. g16 |
%f4.. g16 g4.. ef16 |
%d4 f4 r4   \tuplet 3/2 {bf8 bf8 bf8} |
%  \mark \markup{ \box{\fontsize #4 A}}
%ef2 d4. a8 |
%c4 bf4 af4 f4 |
%ef4. d16 ef16 f4 bf,8. f'16 |
%g4 ef8 g8 bf8 ef,8 g8 bf8 |
%ef2 d4. a8 |
%c4 bf4 af4 f4 |
%ef4. d16 ef16 g4 f8. g16 |
%f2 ef4 ef4 |
%  \mark \markup{ \box{\fontsize #4 D}}
%bf4 c4 df4 d4 |
%ef4 a4 c4 a4 |
%g4 f4 ef4 d4 |
%d2 ef4 ef4 |
%a'2 ef4 c4 |
%ef2 c4 a4 |
%c4 bf4 c4 df4 |
%c2. ef,4 |
%ef'4 c4 g4 a4 |
%c4. bf8 a4 g4 |
%ef'4 c4 g4 a4 |
%c4. bf8 a4 g4 |
%bf4. a8 g4 f4 |
%e4 f4 a4 f4 |
%ef4 c4 bf4 df4 |
%c2. c4 |
%c4. df8 c4 c4 |
%c'2 a4 c,4 |
%c4. d8 c4 c4 |
%c'2 a4 f4 |
%g4. f8 f4 f4 |
%g4. f8 f4 f4 |
%a4 g4 f4 g4 |
%f2 e4 c8 d8 |
%ef4.~ f8 ef4 ef4 |
%ef'2~ bf4 ef,4 |
%ef4. f8 ef4 ef4 |
%ef'2~ bf4   \tuplet 3/2 {ef,8 ef8 ef8}  }|
%|
%\bar "|."
}
}
chrdStrophe = \chordmode {
  s4 | ef1 | s | s | s | 
  c2:m6 d:7 | g:m f:m | ef/bf bf | ef1 |
  c2:m6 d:7 | g:m f:m | ef/bf bf | s2 ef2 |
  ef1 | bf1 | ef1 | bf1 | s | af:7+ | f:7 | bf | 
  c2:m6 d:7 | g:m f:m | ef/bf bf | ef1 | 
  c2:m6 d:7 | g:m f:m | ef/bf bf | s2  ef2 |
  bf1 | s s2  ef 2 | bf1 | f2 bf2
  f1 | d1 s | s2 g d f:7
  %s2. g1 | d1 f1:7 | bf1 | s4 | s2. ef1 | bf1 | c1:m6 d1:7 | g1:m f1:m | ef1/Bf bf1 | ef1 | c1:m6 d1:7 | g1:m f1:m | ef1/Bf bf1 | s2 ef1 | bf1 | af1/Ef | af1m/Ef | s2 ef1 | af1/C | af1 | ef1 | af1 | af1/C | df1 | af1/C | df1 | bf1/D | bf1/F | bf1 ef1 | af1 | c1/E | f1:m | c1:7/Bf | f1m/Af | bf1:m6 f1m/Af | bf1:m6 f1m/Af | bf1:m6 | /1:C c1:7 | af1:m | ef1:m | af1:m | s4 | ef1:m | 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
%    subtitle = \markup { Hochzeitsmarsch }
  }
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
