\version "2.24.0"
sheetName = "La Pigiatura"
sheetComposer = "Traubenpresserlied aus \"Der gezähmte Widerspenstige\""
sheetPoet = "dt. Text Beate Tarrach"
\include "../include/book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -1)
\override LyricHyphen.extra-offset = #'(0 . -1)
\override LyricExtender.extra-offset = #'(0 . -1)
\override StanzaNumber.extra-offset = #'(0 . -1)
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

skipA = \repeat unfold 6 { \skip 8 }

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1,2. "
  Fio -- rie fan -- ta -- sia
  %\skipA
  la la -- la la -- la la
  for -- za che sei tut -- ti noi
  %\skipA
  la la -- la la -- la la
  \set stanza = #"1,2. "
  fe -- sta di co -- lori
  %\skipA
  la la -- la la -- la la
  pi -- gia for -- te_e
  can -- ta_in -- sie  -- me_a noi.

  \set stanza = #"1,2. "
  Gra -- po -- li d'o -- ro
  la la -- la la -- la la og -- ni
  goccia_è un te -- so -- ro
  la la -- la la -- la la
  %\dropLyricsA
  \set stanza = #"1,2. "
  mo ti fer -- ma -- re
  la la -- la la -- la la
  %\raiseLyrics
  pi -- gia
  for -- te_e can -- ta_in -- sie  -- me_a noi.
  \set stanza = #"1. "
  E ris -- po -- di -- gli che hai
  de pro -- fu -- mi di lil -- là
  \repeat unfold 7 {\skip 8}
  \set stanza = #"1. "
  sei for -- te_e vin -- ce -- rai.
  vin -- ce -- rai
  vin -- ce -- rai
  \set stanza = #"2. "
  E se cre -- di_in ciò che fai
  ved -- rai che rius -- ci -- rai
  \set stanza = #"2. "
  ed il vo -- lo di_un gab -- bia -- no
  sei for -- te_e vin -- ce -- rai.
  vin -- ce -- rai
  vin -- ce -- rai
}}


lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  L'u -- vae l'al -- e -- gria
  la la -- la la -- la la
  for -- za dai che ce la fai
  la la -- la la la -- la
  \set stanza = #"2. "
  non fer -- mar -- ti mai
  la la -- la la -- la la
  sei_il più
  for -- te,_in -- si -- sti_e vin -- ce -- rai.
  \repeat unfold 35 { \skip 8 }
  \set stanza = #"2. "
  sei_il più for -- te,_in
  -- si -- sti_e vin -- ce -- rai.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3,4. "
  Blu -- men_und Fan -- ta -- sie
  \skipA
  und ein Fest so bunt wie nie!
  \skipA
  \set stanza = #"3,4. "
  Gol -- den prangt der Wein
  \skipA
  Heu -- te fah -- ren wir die Ern -- te ein!
  \set stanza = #"3. "
  Kommt, lasst uns sin -- gen!
  \skipA
  Die -- sen Tag froh ver -- brin -- gen
  \skipA
  \set stanza = #"3. "
  Tanzt durch die Trau -- ben
  \skipA
  Und bald trin -- ken wir den jun -- gen Wein!
  \set stanza = #"3. "
  \skip 8 Es ju -- beln al -- le Sinne
  \skip 8 bei die -- ser Far -- ben -- pracht
  ein ed -- ler Trop -- fen rin -- ne
  \set stanza = #"3. "
  von uns -- rer Hand ge -- macht
  gut ge -- macht
  gut ge -- macht
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key c \major
  \mark \markup{ \box{\fontsize #3 A}}
  e4 g, e'8. g16 e4
  <g c>8. <e g>16 8. <d f>16 8 <c e>8 g[ g]
  f'4 f g,8. f'16 d4
  a'4. g8 g f d f
  e4 g, e'8. g16 e4
  <g c>8. <e g>16 8. <d f>16 8 <c e>8 e[ f]
  g4 c8( g) g g g8. f16
  e2 r2^\markup{\fontsize #2 \bold fine}
  e4 c8 g' e4 c
  g'8. e16 8. d16 d8 c g[ g]
  f'8 f~ 8. e16 e8 d r4
  a'4. g8 g f d f
  e4 c8 g' e4 c
  g'8. e16 8. d16 d8 c e[ f]
  g4 c8( g) g g g8. f16
  e2 r2 \bar "||"
  \break
  \mark \markup{ \box{\fontsize #3 B}}
  d'8 d d d d4 b8 c~
  8( g)~ 4 r2
  d'8 d d d d4 b8 c~
  c2 r2
  \bar "|"
  \set Score.repeatCommands = #'((volta "3") )
  r8 c c c c4 g8 f8~ 8 g~
  g4 r2
  \break
  \set Score.repeatCommands = #'((volta "1,3."))
  r8
  \set Score.repeatCommands = #'((volta #f))
   d'8 d d e4 b8 c~
  8 c16 16 c4 r2
  r8 c16 16 c4 r2 \bar "||"
  \break
  \mark \markup{ \box{\fontsize #3 C}}
  g8 e g e g4 c,8 b~
  8( d)~ d2 r4
  r8 d' d d d4 b8 c~
  c8( g)~ g4 r2
  c8 c c c c4 g8 f~
  f g~ 2.
  r8 d' d d e4 b8 c~
  8 c16 16  c4 r2
  r8 c16 16 c4 r2 \bar "||"
  % \bar "|."
}

chrdStrophe = \chordmode {
  c1 s g s
  c s s2 g c1
  c1 s g s
  c s s2 g c1
  s8 g2. s8 c1 g c
  c g
  s8 g2. s8  c1 s
  s8 c2. s8 g1 s c
  c g g c s
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header {
    subtitle = "A | B | A | C | A | B | A "
  }
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 20)
      \context {
        \Lyrics
        \override LyricText.font-size = #1.2
      }
    }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    %\new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
