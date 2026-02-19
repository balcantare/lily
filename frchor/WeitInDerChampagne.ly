\version "2.24.0"
sheetName = "Weit in der Champagne"
sheetComposer = "Eric Bogles"
sheetPoet = "dt. Text Hannes Wader"
#(define book-staff-size 16)
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  Weit in der Cham -- pa -- gne im
  Mitt -- som -- mer -- grün,
  \set stanza = "1. "
  dort wo zwi -- schen
  Grab -- kreu -- zen
  Mohn -- blu -- men blüh'n.
  \set stanza = "1. "
  da flüs -- tern die Grä -- ser
  und wie -- gen sich leicht
  \set stanza = "1. "
  im Wind, der sanft ü -- ber das
  Grä -- ber --  feld
  streicht.
  \set stanza = "1. "
  Auf dei -- nem Kreuz fin -- de
  ich, to -- ter Sol -- dat,
  \set stanza = "1. "
  Dei -- nen Na -- men nicht,
  nur Zif -- fern und je -- mand hat
  \set stanza = "1. " die
  Zahl neun -- zehn -- hun -- dert --
  und ___ -- sech -- zehn ge -- malt,
  \set stanza = "1. "
  und du warst nicht ein -- mal
  neun -- zehn Jah -- ___ re alt.
  \set stanza = "ref. "
  Ja, auch dich ha -- ben  sie schon
  ge -- nau -- so be -- lo -- gen,
  so wie sie es mit uns heu -- te
  im -- mer noch tun.
  \set stanza = "ref. "
  Und du hast ih -- nen al -- les
  ge -- ge -- ben:
  Dei -- ne Kraft, dei -- ne Ju -- gend,
  dein Le -- ben.
  }}

lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Hast_Du to -- ter Sol -- dat
    mal ein Mäd -- chen ge -- liebt,
    \set stanza = "2. "
    Sicher nicht, denn nur
    dort wo es
    Frie -- ___ den gibt,
    \set stanza = "2. "
    können Zärt ___ -- lich -- keit
    und Ver -- trau -- en ge -- deihn'.
    \set stanza = "2. "
    Warst_Sol -- dat um zu sterben,
    nicht um ju -- ng zu sein.
    \set stanza = "2. "
    Vielleicht dach -- test du dir, ___
    ich fal -- le schon bald.
    \set stanza = "2. " Neh -- me
    mir mein Ver -- gnü -- gen,
    wie__es kommt, mit Ge -- walt.
    \set stanza = "2. " Dazu
    warst Du ent -- schlos -- sen,
    hast Dich a -- ber \skip 8 dann
    \set stanza = "2. " vor Dir sel -- ber
    ge -- schämt und es doch nie ge -- tan.
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
    Sol -- dat gingst Du
    gläu -- big und gern' in den Tod?
    \set stanza = "3. "
    Oder hast Du ver -- zwei -- felt,
    ver -- bit -- tert, ver -- roht,
    \set stanza = "3. "
    Deinen wirk -- li -- chen
    Feind nicht er --
    kannt bis zum
    Schluß?
    \set stanza = "3. "
    Ich hof -- fe es traf Dich ein
    sau -- ber -- rer Schuß!
    \set stanza = "3. "
    Oder hat ein Ge -- schoß
    Dir die Glie  -- der
    zer -- fetzt?
    \set stanza = "3. "
    Hast Du nach Dei -- ner
    Mut -- ter ge -- schrien bis zu -- letzt.
    \set stanza = "3. "
    Bist_Du auf Dei -- nen Bein -- stüm -- pfen \skip 8
    wei -- ter ge -- rannt?
    \set stanza = "3. "
    Und Dein Grab birgt es mehr als ein Bein ei -- ne
    Hand.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = "4. "
    Es blieb nur das Kreuz ___ als
    ein -- zi -- ge Spur
    \set stanza = "4. " \skip 4
    von Dei -- nem Le -- ben
    doch hör mei -- nen Schwur:
    \set stanza = "4. "
    Für Frie -- den zu kämp -- fen
    und wach -- sam zu sein.
    \set stanza = "4. "
    Fällt_die Mensch -- heit noch
    ein -- mal auf
    Lü -- gen he -- rein.
    \set stanza = "4. "
    Dann kann es ge -- schehn', daß bald
    nie -- mand mehr lebt,
    \set stanza = "4. "
    der die Mil -- ___ -- ___ -- liard -- den von
    To -- ten be -- gräbt.
    \set stanza = "4. "
    Doch längst fin -- den sich mehr
    und mehr Men -- schen be -- reit,
    \set stanza = "4. "
    die -- sen Krieg zu
    ver -- hin -- dern,
    es ist an der Zeit!
}}


strophe = \relative c' {
  %\voiceOne
  \time 3/4
  \key g \major
  \partial 4
  d4
  d d d
  g g g
  e e c
  a2 \bar "" \break e'4
  fs4 fs g
  a b a
  g b, e
  d2 \bar "" \break r8 d
  d4 d4. d8
  g4 g g
  e e c
  a2 \bar "" \break g'4
  fs4 fs g
  a2 b8 a
  g4 a fs
  g2 \bar "" \break d'4
  d d d
  d c b
  a a4. b8
  c2 \bar "" \break c8 c
  c4 c c
  c b8 a8~ a4
  g4 a b
  a2 r4
  r2 \bar "" \break d4
  d4 d d8 d~
  d c4. b8 b
  a4 a g8 e~
  e2 \bar "" \break g8 g
  fs4 fs g
  a2 b8 a
  g4. a8 fs4
  g2 r4
  \bar "||" \break
  r4 b b
  a4. a4 a8
  a8 c4. c4
  c2 d8 c
  b( a) g4 g8 a
  a8 a4. a4
  a2 c8 c
  c d4 c4.
  b2 r4 \break
  r4 b b
  c c c
  c8 d4. c4
  b4 a r
  r2 b8 a8
  g2 b8 b
  c4. b8 c4
  a4.( g8 fs4)
  g2.
  \bar "|."
}

chrdStrophe = \chordmode {
  s4
  g2. s
  c2.
  a:m
  d s g2 c4 g2. g2. s c a:m
  d s g2 d4 g2. s s
  a:m s d s g d s g s a:m s
  d s g2 d4 g2. g
  d s c g d s c g g c s d s g c d g
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1))
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
    \layout {
      #(layout-set-staff-size-with-jazz 16)
      \context {
        \Lyrics
        \override LyricText.font-size = #0
      }
    }
  }
}
