\version "2.24.0"
sheetName = "Roter Mond"
sheetComposer = "Hortenring Ernsthofen 1980"
\include "../include/book.ily"

% orig g
tran = f

lyrA = {
  \lyricmode {
  \set stanza = #"1. "
  Ro -- ter Mond ü -- berm Sil -- ber -- see,
  Feu -- er -- glut wärmt den kal -- ten Tee.
  Kie -- fern -- wald in der Nacht,
  und noch ist der neu -- e Tag nicht er -- wacht.
}}

lyrE = {
  \lyricmode {
  \set stanza = #"1. "
    Ro -- ter Mond,
  Feu -- er -- glut,
  %Kie -- fern -- wald in der Nacht,
  %und noch ist der neu -- e Tag nicht er -- wacht.
}}

lyrB = {
  \lyricmode {
  \set stanza = #"2. "
  Ster -- ne steh'n hell am Fir -- mam -- ment,
  sol -- che Nacht fin -- det nie ein End',
  Die -- ses Land, wild und schön,
  und wir dür -- fen sei -- ne Herr -- lich -- keit
  seh'n.
}}

lyrF = {
  \lyricmode {
  \set stanza = #"2. "
  Ster -- ne steh'n,
  sol -- che Nacht.
}}

lyrC = {
  \lyricmode {
  \set stanza = #"3. "
  Rau -- her Fels, Moos und Hei -- de -- kraut,
  weit ent -- fernt 
  schon der Mor -- gen graut,
  Win -- de wehn leicht und lau,
  das Gras schim -- mert un -- term Mor -- gen _ -- tau.
}}

lyrG = {
  \lyricmode {
  \set stanza = #"3. "
  Rau -- her Fels,
  weit ent -- fernt.
}}
lyrD = {
  \lyricmode {
  \set stanza = #"4. "
  Ler -- che singt, bald schon ziehn wir fort,
  un -- ser Lied blei -- be die -- sem Ort.
  Fahr -- ten sind un -- ser Glück!
  Und Sehn -- sucht führt uns ge -- wiss einst zu -- rück.
 }}
lyrH = {
  \lyricmode {
  \set stanza = #"4. "
  Ler -- che singt,
  un -- ser Lied.
 }}

sopran = \relative c' {
  \time 2/2
  \key e \minor
  e4 e8( d) e2
  r4 fs8 g fs e d4 \break
  e4 e8( d) e2
  r4 fs8 g fs g a4
  \repeat volta 2 {
    b4 b8( a) b2
    r4 a8 b a4. \break g8
    a4 a8 g a4 g
    e4 e8 d e2
  }
  %\bar "|."
}

alt = \relative c' {
  \key e \minor
  r2  e4 e 
  d1
  r2 e4 e 
  d1
  g2 g
  fs4 fs8 g fs4. fs8
  e4 e8 d e4 d
  e4 e8 g e2
}


chrd =  \chordmode {
  e1:m d e:m d
  g d a:m e:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames \transpose g \tran \chrd
    \new Staff <<
      \new Voice = "Sopran" \transpose g \tran \sopran 
      >>
    \new Lyrics \lyricsto "Sopran" \lyrA
    \new Lyrics \lyricsto "Sopran" \lyrB
    \new Lyrics \lyricsto "Sopran" \lyrC
    \new Lyrics \lyricsto "Sopran" \lyrD
    \new Staff <<
      \new Voice = "Alt"  \transpose g \tran  \alt 
      >>
%    \new Lyrics \lyricsto "Alt" \lyrE
%    \new Lyrics \lyricsto "Alt" \lyrF
%    \new Lyrics \lyricsto "Alt" \lyrG
%    \new Lyrics \lyricsto "Alt" \lyrH  
    >>
  }
}
