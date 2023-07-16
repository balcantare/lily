\version "2.22.2"
sheetName = "Nein, meine Söhne geb' ich nicht!"
#(define book-staff-size 16)
\include "book.ily"


skipA = \repeat unfold 8 { \skip 2 }

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = " 1."
  Ich denk, ich schreib euch bes -- ser schon
  bei -- zei -- ten
  und sag euch heu -- te schon end -- gül -- tig
  ab.
  Ihr braucht nicht lan -- ge Lis -- ten
  aus -- zu -- brei -- ten,
  um zu se -- hen, daß ich auch zwei Söh  ne
  hab'.
  Ich lieb die bei -- den,
  das will ich euch sa -- gen,
  mehr als mein Le -- ben, als mein Au -- gen -- licht,
  und die, die wer -- den kei -- ne Waf -- fen
  tra -- gen.
  Nein, mei -- ne Söh -- ne geb' ich nicht.
  \repeat unfold 4 { \skip 2 }
  Nein, mei -- ne Söh -- ne geb' ich nicht.

}}
lyrStropheB = {
  \lyricmode {
    \skipA
    Ich ha -- be sie die Ach -- tung vor dem
    Le -- ben,
    vor je -- der Kre -- a -- tur als höch -- sten
    Wert,
    ich ha -- be sie Er -- bar -- men und Ver -- ge -- ben
    und wo im -- mer es ___ ging lie -- ben ge -- lehrt.
    Nun wer -- det ihr sie nicht mit Hass ver -- der -- ben,
    keine Zie -- le, kei -- ne Eh -- re, kei -- ne Pflicht
    sind's Wert, da -- für zu tö -- ten und zu ster -- ben,
}}

lyrStropheC = {
  \lyricmode {
    \skipA
    Ganz si -- cher nicht für euch hat ih -- re
    Mut -- ter sie un -- ter Schmer -- zen auf
    die Welt ge -- bracht.
    Nicht für euch und nicht als Ka -- no -- nen -- fut -- ter.
    Nicht ___ für euch hab' ich man -- che Fie -- ber -- nacht
    ver -- zwei -- felt an dem klei -- nen Bett ge -- stan -- den,
    und kühlt' ein klei -- nes glü -- hen -- des Ge -- sicht,
    bis wir in der Er -- schöpf -- ung Ru -- he fan -- den,
}}
lyrStropheD = {
  \lyricmode {
    \skipA
    Sie wer -- den nicht in Reih' und Glied mar --  schie -- ren,
    nicht durch -- hal -- ten, nicht kämp -- fen bis zu -- letzt,
    auf ei -- nem gott -- ver -- lass' -- nen Feld
    er -- frie -- ren,
    wäh -- rend ihr euch in ___ wei -- che Kis -- sen setzt.
    Die Kin -- der schüt -- zen vor al -- len Ge -- fah -- ren
    ist_doch mei -- ne ver -- dammte Va ___ -- ter ___ -- pflicht,
    und das heißt auch sie vor euch zu be --  wah -- ren!
}}
lyrStropheE = {
  \lyricmode {
    \skipA
    Ich wer -- de sie den Un -- ge -- hor -- sam
    leh -- ren,
    den Wi -- der -- stand und die Un -- beug -- sam -- keit
    ge -- gen je -- den Be -- fehl auf -- zu -- be -- geh -- ren
    und ___ nicht zu bu -- ckeln vor der Ob -- rig -- keit.
    Ich werd' sie lehr'n, den eig' -- nen
    Weg zu ge -- hen,
    vor kei -- nem Po -- panz, kei -- nem
    Welt -- ge -- richt,
    vor kei -- nem als sich sel -- ber
    grad' zu ste -- hen,
}}
lyrStropheF = {
  \lyricmode {
    \skipA
    Und e -- her wer -- de ich mit ih -- nen
    flie -- hen, als dass ihr sie zu eu -- ren
    Knech -- ten macht,
    e -- her mit ih -- nen in die Frem -- de
    zie -- hen,
    in ___ Ar -- mut und wie Die -- be in der Nacht.
    Wir ha -- ben nur dies ei -- ne kur -- ze
    Le -- ben,
    ich schwör's und sag's euch gra -- de ins
    Ge -- sicht:
    Sie wer -- den es für eu -- ren Wahn
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF

    >>
    \layout {
      \context {
        \Lyrics
        \override LyricText #'font-size = #+0
      }
    }
  }
}
