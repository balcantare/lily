\version "2.24.0"
sheetName = "Riu Riu Chiu"
sheetComposer = "Cancionero de Uppsala"
#(define book-staff-size 16)
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    Ri -- u, ri -- u
    Chi -- u la guar -- da -- ri -- be -- ra.
    Dio guar -- do el
    lo -- bo de nues -- tra cor -- de -- ra.
 }}


lyrStropheB = {
  \lyricmode {
    \set stanza =
    \markup {\circle{\pad-around #1 {\fontsize #6 *}}}
    Ri8 -- u, ri -- u
    Chi4 -- u8 la4 guar8 -- da -- ri -- be4 -- ra.
    \skip 4 Dios8 guar8 -- do8 el8
    lo4 -- bo,8 el8
    lo4 -- bo8 de4 nues8 -- tra cor -- de4 -- ra.
    \skip 4 Dios8 guar8 -- do8 el8
    lo4 -- bo,8 el8
    lo4 -- bo8 de4 nues8 -- tra cor -- de4 -- ra.
}}

lyrStropheBsop = {
  \lyricmode {
    \repeat unfold 11 { \skip 4 }
    Dios8 guar -- do el
    \repeat unfold 9 { \skip 4 }
    Dios8 guar -- do el
}}
lyrStropheBalt = {
  \lyricmode {
    \repeat unfold 10 { \skip 4 }
    Dios8 guar -- do el lo -- bo,
    \repeat unfold 8 { \skip 4 }
    Dios8 guar -- do el lo -- bo,
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = "1. "
    El lo -- bo ra -- bio -- so
    la qui -- so mor -- der
    Mas Dios po -- de --
    \set stanza = "1. "
    ro -- so
    la su -- po de -- fen -- der
    Qui -- so le ha -- cer
    que no _ pu -- di --
    \set stanza = "1. "
    e -- se
    pe -- car on or -- gi -- nal
    es -- ta Vir -- gen no tu -- vie -- ra.
 }}

lyrStropheD = {
  \lyricmode {
    \set stanza = "2. "
    Es8 -- te ques na -- ci4 -- do8 es4 el8
    gran mo -- nar4 -- ca.
    Chris8 -- to pa -- tri --
    \set stanza = "2. "ar4 -- ca8 de
    car4 -- ne8 ves -- ti4 -- do.
    A8 nos re -- di -- mi4 -- do8 con
    se ha -- cer chi --
    \set stanza = "2. "
    qui4 -- to8 A
    un que16 -- ra in8 -- fi -- ni4 -- to8
    fi -- ni -- to se hi -- cie4 -- ra.
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = "3. "
    Mu8 -- chas pro -- fe -- ci4 -- as8 lo
    han pro -- fe -- ti -- za4 -- do.
    Ya8 en nues -- tras
    \set stanza = "3. "
    di4 -- as8 lo
    he -- mos al -- can -- za4 -- do.
    A8 Dios hu -- ma -- na4 -- do8 lo
    ve8 -- mos en el
    \set stanza = "3. "
    cie4 -- lo.
    A16 al hom8 -- bre nel
    cie4 -- lo8 pues quel4 -- le8 quis -- te4 -- ra.
}}

lyrStropheF = {
  \lyricmode {
    \set stanza = "4. "
    Yo8 vi mil gar -- co4 -- nes8 que
    an -- du -- an  can -- tan4 -- do.
    Por8 a -- qui vo --
    \set stanza = "4. " lan4 -- do8
    ha -- zien4 -- do8 mil so4 -- nes.
    Di8 -- cien -- do a gas4 -- co8 -- nes,
    Glo -- ria en el \set stanza = "4. " cie4 -- lo.
    Es8 -- tes al dor -- cie4 -- ro8 pues
    Je4 -- su8 na -- ci4 -- do.
}}

lyrStropheG = {
  \lyricmode {
    \set stanza = "5. "
    Es8 -- te vie -- ne a4 dar8 a4 -- los8
    muer -- tos vi4 -- da.
    Y8 vie -- ne a \set stanza = "5. "
    re -- pa -- rar de
    to -- dos la -- ca -- y4 -- da.
    Es8 la luz del di4 -- a8
    a ques -- te mo -- cu -- \set stanza = "5. " e4 -- lo.
    Es8 -- tes al dor -- de4 -- ro,8
    Que San Ju -- an di -- xe4 -- ra.
}}

lyrStropheH = {
  \lyricmode {
    \set stanza = "6. " Mi8 -- ra bien que os quad -- re que
    an -- si na l'o -- e4 -- ra.
    Que8 Dios no pu -- \set stanza = "6. "
    die4 -- ra8 ha -- ze
    la mos que Nad4 -- re.
    El8 que -- ra su Pa4 -- dre8 oy
    de _ la nas -- \set stanza = "6. " ci4 -- o.
    Y8 el que la cri4 -- o8 su
    Hy -- o -- so  di -- xe4 -- ra.
}}

lyrStropheI = {
  \lyricmode {
    \set stanza = "7. " Pues8 que ya te -- ne4 -- os8 lo4
    que8 de -- se -- a4 -- mos.
    To8 -- dos jun -- tos
    \set stanza = "7. " va4 -- mos8 pre8 --
    sen4 -- tes8 lle -- ve4 -- mos.
    To8 -- dos le da -- re4. -- mos,8
    Nues8 -- tra vo -- lun --
    \set stanza = "7. " tad.2
    Pues8 as -- ci -- gu -- al4 -- ar8 con
    si hom -- bre vi -- nie4 -- ra.
}}

stropheA = \relative c'' {
  \key a \minor
  \time 2/4 a8 a g a
  \time 4/4 f4 e8 d4 e8 f[ g]
  \time 3/4 a4 a r
  \repeat volta 2 {
    \time 2/4 a8 a g a
    \time 4/4 f4 e8 g4 g8 e[ f]
    \time 3/4 d4 d r
  }
}

stropheBsop = \relative c'' {
  \voiceOne
  \override Rest.staff-position = #0
  \key a \minor
  \time 2/4 a8 a g a
  \time 4/4 f4 e8 d4 e8 f[ g]
  \time 3/4 a4 a r
  \time 2/4 r2
  a8 a g a
  \time 4/4 f4 e8 f4 f8 e[ e]
  \time 3/4 d4 d r
  \time 2/4 r2
  a'8 a g a
  \time 4/4 f4 e8 d4 d8 c[ c]
  \time 2/4 d4 d
  \bar "||"
}

stropheBalt = \relative c' {
  \voiceTwo
  f8 f e c
  d4 e8 f4 e8 d[ d]
  c4 c s
  r4 e8 e
  d8 c e c
  d4 c8 d4 d8 c[ c]
  d4 d s
  r e8 e
  d8 c e c
  d4 c8 a4 a8 a[ a]
  a4 a
}

stropheBten = \relative c' {
  \override Rest.staff-position = #0
  \voiceOne
  \clef "bass"
  c8 c c a
  a4 a8 a4 a8 d,[ d]
  e4 e r
  c'8 c b c
  a4 b8 a
  a4 a8 a4 a8 a[ a]
  a4 a r
  c8 c b c
  a4 b8 a
  a4 a8 f4 f8 e[ e]
  d4 d
}
stropheBbas = \relative c {
  \voiceTwo
  f8 f c f
  d4 a8 d4 c8 bf[ bf]
  a4 a s
  a'8 a g a
  f4 e8 f
  d4 a8 d4 d8 a[ a]
  d4 d s
  a'8 a g a
  f4 e8 f
  d4 a8 d4 d8 a[ a]
  d4 d
}

stropheC = \relative c'' {
  \key a \minor
  \time 2/4 a8 a g a
  \time 4/4 f4 e8 g4 g8 e[ f]
  \time 2/4 d2
  a'8 a g a
  \time 4/4 f4 f8 e g8 g e f
  \time 2/4 d2
  a'8 a g a
  \time 4/4 f4. e8 d e f g
  \time 2/4 a4 a8 a
  a8 a g a
  \time 4/4 f4 f8 e g8 g e f
  \time 2/4 d4 d
   \once \override Score.RehearsalMark.break-visibility =
    #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X =
    #CENTER
  \once \override Score.RehearsalMark.direction = #DOWN
  \mark \markup{\circle{\pad-around #1 {\fontsize #2 ..*}}}

  \bar "||"
}

chrdStrophe = \chordmode {}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new Staff <<
      \new Voice = "Strophe" { \stropheA }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    >>
  }
  \score {
    <<
      \new ChoirStaff <<
    \new Staff <<
      \new Voice = "StropheBsop" { \stropheBsop }
      \new Voice = "StropheBalt" { \stropheBalt }
      >>
    \new Lyrics \lyrStropheBsop
    \new Lyrics \lyrStropheBalt
    \new Lyrics \lyrStropheB
    \new Staff <<
      \new Voice = "StropheBten" { \stropheBten }
      \new Voice = "StropheBbas" { \stropheBbas }
      >>
    >>
    >>
  }
  \score {
     <<
    \new Staff <<
      \new Voice = "StropheC" { \stropheC }
      >>
    \new Lyrics \lyricsto "StropheC" \lyrStropheC
    \new Lyrics \lyrStropheD
    \new Lyrics \lyrStropheE
    \new Lyrics \lyrStropheF
    \new Lyrics \lyrStropheG
    \new Lyrics \lyrStropheH
    \new Lyrics \lyrStropheI
    >>
  }
}

