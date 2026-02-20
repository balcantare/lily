\version "2.24.0"
sheetName = "Nein, meine Söhne geb' ich nicht!"
sheetComposer = "Reinhard Mey"
#(define book-staff-size 16)
\include "../include/book.ily"

skipA = \repeat unfold 8 { \skip 2 }

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = " 1."
  Ich denk, ich schreib euch bes -- ser schon
  bei -- zei -- ten
  \set stanza = " 1."
  und sag euch heu -- te schon end -- gül -- tig
  ab.
  Ihr braucht nicht lan -- ge Lis -- ten
  aus -- zu -- \set stanza = " 1." brei -- ten,
  um zu se -- hen, daß ich auch zwei Söh  ne
  hab'.
  \set stanza = " 1."
  Ich lieb die bei -- den,
  das will ich euch sa -- gen,
  \set stanza = " 1."
  mehr als mein Le -- ben, als mein Au -- gen -- licht,
  \set stanza = " 1."
  und die, die wer -- den kei -- ne Waf -- fen
  tra -- gen.
  Nein, mei -- ne Söh -- ne geb' ich nicht.
  \repeat unfold 4 { \skip 2 }
  Nein, mei -- ne Söh -- ne geb' ich nicht.

}}
lyrStropheB = {
  \lyricmode {
    \skipA
    \set stanza = " 2."
    Ich ha -- be sie die Ach -- tung vor dem
    Le -- ben,
    \set stanza = " 2."
    vor je -- der Kre -- a -- tur als höch -- sten
    Wert,
    ich ha -- be sie Er -- bar -- men und Ver --
    \set stanza = " 2." ge -- ben
    und wo im -- mer es ___ ging lie -- ben ge -- lehrt.
    \set stanza = " 2."
    Nun wer -- det ihr sie nicht mit Hass ver -- der -- ben,
    \set stanza = " 2." keine Zie -- le, kei -- ne Eh -- re, kei -- ne Pflicht
    \set stanza = " 2." sind's Wert, da -- für zu tö -- ten und zu ster -- ben,
}}

lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = " 3." Ganz si -- cher nicht für euch hat ih -- re
    Mut -- ter \set stanza = " 3." sie un -- ter Schmer -- zen auf
    die Welt ge -- bracht.
    Nicht für euch und nicht als Ka -- no -- nen --
    \set stanza = " 3." fut -- ter.
    Nicht ___ für euch hab' ich man -- che Fie -- ber -- nacht
    \set stanza = " 3." ver -- zwei -- felt an dem klei -- nen Bett ge -- stan -- den,
    \set stanza = " 3." und kühlt' ein klei -- nes glü -- hen -- des Ge -- sicht,
    \set stanza = " 3." bis wir in der Er -- schöpf -- ung Ru -- he fan -- den,
}}
lyrStropheD = {
  \lyricmode {
    \skipA
    \set stanza = " 4." Sie wer -- den nicht in Reih' und Glied mar --  schie -- ren,
    \set stanza = " 4." nicht durch -- hal -- ten, nicht kämp -- fen bis zu -- letzt,
    auf ei -- nem gott -- ver -- lass' -- nen Feld
    er -- \set stanza = " 4." frie -- ren,
    wäh -- rend ihr euch in ___ wei -- che Kis -- sen setzt.
    \set stanza = " 4." Die Kin -- der schüt -- zen vor al -- len Ge -- fah -- ren
    \set stanza = " 4." ist_doch mei -- ne ver -- dammte Va ___ -- ter ___ -- pflicht,
    \set stanza = " 4." und das heißt auch sie vor euch zu be --  wah -- ren!
}}
lyrStropheE = {
  \lyricmode {
    \skipA
    \set stanza = " 5." Ich wer -- de sie den Un -- ge -- hor -- sam
    leh -- ren,
    \set stanza = " 5." den Wi -- der -- stand und die Un -- beug -- sam -- keit
    gegen je -- _ den Be -- fehl auf -- zu -- be --
    \set stanza = " 5." geh -- ren
    und ___ nicht zu bu -- ckeln vor der Ob -- rig -- keit.
    \set stanza = " 5." Ich werd' sie lehr'n, den eig' -- nen
    Weg zu ge -- hen,
    \set stanza = " 5." vor kei -- nem Po -- panz, kei -- nem
    Welt -- ge -- richt,
    \set stanza = " 5." vor kei -- nem als sich sel -- ber
    grad' zu ste -- hen,
}}
lyrStropheF = {
  \lyricmode {
    \skipA
    \set stanza = " 6." Und e -- her wer -- de ich mit ih -- nen
    flie -- hen, \set stanza = " 6." als dass ihr sie zu eu -- ren
    Knech -- ten macht,
    eher mit ih -- _ nen in die Frem -- de
    \set stanza = " 6." zie -- hen,
    in ___ Ar -- mut und wie Die -- be in der Nacht.
    \set stanza = " 6." Wir ha -- ben nur dies ei -- ne kur -- ze
    Le -- ben,
    \set stanza = " 6." ich schwör's und sag's euch gra -- de ins
    Ge -- sicht:
    \set stanza = " 6." Sie wer -- den es für eu -- ren Wahn
    nicht ge -- ben:
}}



strophe = \relative c' {
  %\voiceOne
  \time 4/4
  \key e \major
  %\partial 2.
  \mark \markup{ \fontsize #4 *}
  e4. gs8~ 2
  gs4. e8~ 2
  gs4. fs8~ 2
  cs4. ds8~4 r8 \bar "||" \break
  b8
  gs'8 8 8 8 8 fs fs e
  e4 b r4 r8 \bar "" \break
  b
  cs e e e e cs cs b
  b4 r4 r4 r8 b
  b fs' fs fs fs fs gs a
  gs4( ds) e r8 e16 e
  e8 fs4 fs16 gs gs8 a gs a
  fs4 r4 r4 r8 \bar "" \break
  b8
  b b b b b a a gs
  gs( fs) fs4 r4 r8 \bar "" \break
  b,
  gs' b b b cs b b gs
  fs4 r4 r4 r8 \bar "" \break
  b,8
  gs' b b b cs cs cs b
  b4( a) gs r \break
  r8 cs,4 e16 e fs8 gs a fs
  gs4 r <cs, a'>8 <b gs'> <a fs'> <b gs'>
  r8 cs4 e16 e fs8 gs gs gs
  \mark \markup{ \fontsize #4 *}
  e1
  \bar "|."
}

chrdStrophe = \chordmode {
  %\set chordBassOnly = ##t
  e1 a e2:/b b b:24 b
  e2 b e1 a
  e b gs2:m cs:m
  a1:7+ b
  e2 a
  b1 e2 a b1
  e2 a b e a b
  e1 a2 b e1
}

\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 14)
      \context {
        \Lyrics
        \override LyricText.font-size = #+0
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF

    >>
  }
}
