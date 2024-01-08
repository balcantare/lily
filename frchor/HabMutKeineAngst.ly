\version "2.24.0"
sheetName = "Hab Mut, keine Angst!"
sheetComposer = "Beate Tarrach"
#(define book-staff-size 16)
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    \set stanza = "1. "
    Vol -- ler Zwei -- fel um das Mor -- gen,
    doch im \set stanza = "1. " Her --  zen noch Ge -- sang,
    durch uns -- re A -- dern fließt
    le -- ben -- di -- ges Blut.
    \set stanza = "1. "
    Die Ge -- dan -- ken sind frei,
    sie trot -- zen dem Zwang
    und die \set stanza = "1. "
    See -- le schreit:
    Hab end -- lich Mut!
    Hab Mut, kei -- ne Angst,
    denn Angst macht dich klein!
    Hab Mut, nicht um je -- den Preis
    ge -- hor -- sam zu sein.
    Hab Mut zum eig -- nen ge -- sun -- den
    Men -- schen -- ver -- stand.
    Hab Mut, nimm dein Le -- ben
    in die Hand!
    Hab nur Mut und nimm es selbst
    in die Hand!
}}
lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Du kannst si -- cher sein, es geht bei
    vie -- lem \set stanza = "2. " nur um Macht und Geld,
    _ drum sei wach -- sam und gib gut auf dich acht!
    \set stanza = "2. " Du musst im -- mer frei entscheiden,
    du_musst tun, was dir gefällt,
    weil das \set stanza = "2. " sonst ein ande -- rer für dich macht!
}}
lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
    Es ist end -- lich an der Zeit _
    für Ge -- \set stanza = "3. " rech -- tig -- keit im Land,
    daß die Ge -- win -- ner mal die Rech -- nung
    be -- zahln'.
    \set stanza = "3. " Sie ver -- die -- nen an Kriesen,
    ha -- ben uns in der_Hand
    und wir \set stanza = "3. " las -- sen uns_das ein -- fach
    ge -- fallen.
  }
}
lyrStropheD = {
  \lyricmode {
    \set stanza = "4. "
    Drum lass dei -- ne Stim -- me hö -- ren,
    auch wenn \set stanza = "4. " das nicht ein -- fach ist! _
    Hab Ver -- trau -- en, _ du bist nicht al -- lein!
    \set stanza = "4. " Vie -- le Men -- schen wer -- den_da_sein,
    wenn_du klar und of -- fen_bist.
    Und es \set stanza = "4. " wächst die Kraft beim Zu -- sam -- mensein.
}}

strophe = \relative c'{
  \time 4/4
  \key d \major
  \partial 4
  \bar "|."
  a8 a
  fs'8 8 8 16 16~ 8 8 g fs
  fs e e d16 e~ e8 e fs e
  e d d b d e d e~
  %\set Score.measureLength = #(ly:make-moment 4/4)
  e2. \break a,8 a
  fs'8 8 8 8~ fs4.  a8
  a8 g fs d~ 4 8 8
  d b b4 d8 e d cs~
  cs2 r4 \break cs
  d4 b8 a16 b~ b4. cs8
  d4 d8 e16 d~ d4 e
  fs4 fs8 fs fs e e d
  fs e e e~ e e e fs
  g4 g8 g g4 fs
  e8 d b b~ b2
  \time 2/4
  r4 d
  \time 4/4
  d d8 d e8 e e d16 fs~
  fs2 r4 a8 g
  fs d  d d
  fs4 e8 d16 d~
  d2.
  \bar "|."
}
chrdStrophe = \chordmode {
 s4
 d1 a g a d g b:m a b:m g d a g s s2
 d2 a b1:m
 d2 b4:m a
 d2
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
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
    \layout {
      \context {
        \Lyrics
        %\override LyricText.font-size = #+1.8
      }
    }
  }
}
