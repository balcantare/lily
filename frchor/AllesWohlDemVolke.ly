\version "2.24.0"
sheetName = "Alles Wohl dem Volke!"
sheetComposer = "Beate Tarrach"
#(define book-staff-size 16)
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {

  \set stanza = #"1-4. "
  'Al -- les Wohl dem Vol -- ke!'
  hat -- tet ihr uns einst ge -- schworn.
  \set stanza = #"1-4. "
  'Al -- les Wohl dem Vol -- ke!'
  doch ihr habt das Ge -- wis -- sen ver -- lorn.
  \set stanza = #"1-4. "
  'Al -- les Wohl dem Vol -- ke!'
  da -- raus wur -- de ü -- ber Nacht,
  \set stanza = #"1-4. "
  Ver -- rat am eig -- nen Vol -- ke,
  das nie -- mals woll -- te
  daß es je -- mals wie -- der
  Krieg mit -- macht.

  \set stanza = #"1. "
  Ja ihr seid die Ma -- rio -- net -- ten
  an den Ket -- ten der Kon -- zer -- ne,
  \set stanza = #"1. "
  Woll'n die ih -- re Ak -- tien ret -- ten,
  helft ihr ih -- nen da -- bei ger -- ne.
  \set stanza = #"1. "
  Und der Waf -- fen -- ex -- port
  ist ein gut -- be -- zahl -- ter
  Sport.
  \set stanza = #"1. "
  Da -- rum lasst die Kor -- ken knal -- len
  werft die Skru -- pel ü -- ber Bord!

  \set stanza = #"5. "
  'Al -- les Wohl dem Vol -- ke!'
  da -- für käm -- pfen wir und für' -- ne
  bess' -- re Zeit!
}}

skipA = \repeat unfold 62 { \skip 2 }

lyrStropheB = {
  \lyricmode {
  \set stanza = #"5. "
  'Al -- les Wohl dem Vol -- ke!'
  neh -- men wir's jetzt \skip 16 in_die Hand!
  \set stanza = #"5. "
  'Al -- les Wohl dem Vol -- ke!'
  und wir rufen \skip 16 es laut in das Land!
  \set stanza = #"5. "
  'Al -- les Wohl dem Vol -- ke!'
  da -- für sind wir \skip 8 be -- reit!
  \repeat unfold 21 {\skip 16}
  \set stanza = #"2. "
  Al -- les lasst ihr euch ge -- fal -- len,
  als A -- me -- ri -- kas Va -- sal -- len!
  \set stanza = #"2. "
  Die die schlimm -- sten Krie -- ge
  füh -- ren, dür -- fen Bom -- ben
  sta -- tio -- nie -- ren,
  \set stanza = #"2. "
  hier in un -- se -- rem Land!
  Doch ihr habt's nicht in der Hand.
  \set stanza = #"2. "
  Wür -- den die einst de -- to -- nie -- ren,
  gäb's nen Wel -- \skip 16 ten -- \skip 16 brand!
}}

lyrStropheC = {
  \lyricmode {
    \skipA
  \set stanza = #"3. "
  Ja, ihr schwört die Men -- schen ein,
  \skip 16 daß sie den -- ken, was sie  sol -- len!
  \set stanza = #"3. "
  Denn es kann ja wohl nicht sein, \skip 16
  daß sie ma -- chen was sie wol -- len.
  \set stanza = #"3. "
  Uns -- 're De -- mo -- kra -- tie
  ist be -- droht \skip 16 wie noch nie.
  \set stanza = #"3. "
  Hörn wir jetzt nicht auf zu schwei -- gen,
  dann ver -- lie -- \skip 16 ren wir sie!
}}

lyrStropheD = {
  \lyricmode {
    \skipA
  \set stanza = #"4. "
  Es wird klar: ihr habt ge -- lo -- gen,
  habt die Men -- schen auf -- ge -- hetzt!
  \skip 16 \set stanza = #"4. "
  Man -- che See -- le schon ver -- bo -- gen,
  man -- ches Mes -- ser schon ge -- wetzt!
  \skip 16 \set stanza = #"4. " \skip 16 Ihr macht_für Krieg be -- reit,
  doch nun ist es an der Zeit \set stanza = #"4. "
  für Ver -- hand -- lung
  statt Ver -- der -- ben, daß bald Schluß ist mit dem Leid!
}}
strophe = \relative c''{
  %\voiceOne
  \time 4/4
  \key d \minor
  \partial 8
  \bar "."
  a16 g
  a4.. g16 f8 d4 d16 d
  e8 e16 e16~ e8 f16( e) d4. \bar "" \break
  a'16 g
  a4.. g16 f8 d4 e16 d
  e8 e16 e16 \tuplet 3/2 { e8 f g} a4. \bar "" \break
  bf16 a
  bf4.. a16 g8 d4 d16 d
  f8 f f8. g16 a4
  r8_\markup{\box{\fontsize#3 5..Coda}} \bar "" \break
  r16 f16
  e4 r16 a a a bf8 a r16 a16 a a
  \time 2/4
  a g g f f f f g
  \time 4/4
  e4. d8
  d4 r8
  \bar "" \break
  e16 d
  cs16 cs cs d e e f e  f e d cs d[ d] \bar "" \break e d
  cs cs cs d e e f e f d  d cs d[ d]  \bar "" \break d d
  g16 g g g~ g8 a16 g f d d cs d8 \bar "" \break d16 d
  \time 3/4
  e e e d e e e e a a a bf
  \time 2/4
  \set Score.measureLength = #(ly:make-moment 3/8)
  a4.
  \bar ":|." \break
  \set Score.measureLength = #(ly:make-moment 1/8)
  a16^\markup{\box{\fontsize #3 Coda}} a
  \set Score.measureLength = #(ly:make-moment 4/4)
  a4.. a16 bf8 a4 a16 a
  \set Score.measureLength = #(ly:make-moment 3/4)
  a g g f f e e cs d4
  \bar "|."
}

chrdStrophe = \chordmode {
  s8
  d1:m a2 d:m
  s1
  c2 f
  g1:m d:m
  a1 s2 s2 d2:m
  a2 d:m
  a2 d:m
  g:m d:m
  e a4 s2
  a1 s2 d4:m
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 16)
      \context {
        \Lyrics
        \override LyricText.font-size = #+1
      }
    }
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
