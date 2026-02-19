\version "2.24.0"
sheetName = "Hab Mut, keine Angst!"
sheetComposer = "Beate Tarrach"
%#(define book-staff-size 16)
\include "../include/book.ily"

tran=c

lyrStropheA = {
  \lyricmode {
    \set stanza = "1. "
    Vol -- ler Zwei -- fel um das Mor -- gen,
    doch im  Her --  zen noch Ge -- sang,
    \set stanza = "1. " durch uns -- re A -- dern fließt
    le -- ben -- di -- ges Blut.
    \set stanza = "1. " Die Ge -- dan -- ken sind frei,
    sie trot -- zen dem Zwang
    \set stanza = "1. " und die 
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
     Folg nicht blind -- lings je -- der Wei -- sung,
      _ fang selbst zu den -- ken an
     \set stanza = "2. " _ und hör im -- mer auf dein Bauch _ -- ge -- fühl!
     \set stanza = "2. " Leg den  Fin -- ger in_die Wunde, 
     weil_nur das was än -- dern_kann.
     \set stanza = "2. " Stell die  Fra -- ge: was_ist das für ein Spiel?
  }
}
lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
    Du kannst si -- cher sein, es geht bei
    vie -- lem nur um Macht und Geld,
    \set stanza = "3. " _ drum sei wach -- sam und gib gut auf dich acht!
    \set stanza = "3. " Du musst im -- mer frei entscheiden,
    du_musst tun, was dir gefällt,
    \set stanza = "3. " weil das  sonst ein ande -- rer für dich macht!
}}
lyrStropheD = {
  \lyricmode {
    \set stanza = "4. "
    Drum lass dei -- ne Stim -- me hö -- ren,
    auch wenn  das nicht ein -- fach ist! 
    \set stanza = "4. " _ Hab Ver -- trau -- en, _ du bist nicht al -- lein!
    \set stanza = "4. " Vie -- le Men -- schen wer -- den_da_sein,
    wenn_du klar und of -- fen_bist.
    \set stanza = "4. " Und es  wächst die Kraft beim Zu -- sam -- mensein.
}}

strophe = \relative c'{
  \time 2/4
  \key d \major
  \partial 4
  \bar "|."
  a8 a
  fs'8 8 8 16 16~ 8 8 g fs
  fs e e d16 e~ \autoBeamOff e8 \break e \autoBeamOn fs[ e]
  e d d b d e d e~
  %\set Score.measureLength = #(ly:make-moment 4/4)
  e2 r4 \break a,8 a
  fs'8 8 8 8~ fs4.  a8
  a8 g fs d( 4) \break 8 8
  d b b4 \tuplet 3/2 { d4 e d} 
  e2 r4 a
  a4 fs8 e16 d~ d4. \break d8
  \tuplet 3/2 { g4 g a} e4 fs
  g4 g8 a
  b8 b b b
  b a g a~
  a d, d d
  b'4 b8 b
  cs4 cs
  cs8 a g fs~
  2
  r4 e4
  d4 d8 d
  b'8 b b a16 a~
  a2 |
  r4 b8 cs
  d a a d,
  g4 fs8 d16 d~
  d2
  \bar "|."
}
chrdStrophe = \chordmode {
 s4
 d1 a g a d g e2:m g a1 d g2 a 
 g s e2:m a g a1 
 b:m g a d2 g4 a d2
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
    \new ChordNames { \transpose d \tran \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose d \tran \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD

    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
      \context {
        \Lyrics
        %\override LyricText.font-size = #+1.8
      }
    }
  }
}
