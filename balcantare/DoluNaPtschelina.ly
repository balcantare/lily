\version "2.22.2"
fileName = "DoluNaPtschelina.ly"
sheetName = "Dolu na ptschelina"
\include "../include/book.ily"

bookTitle = \markup {
  \fontsize #2 \larger
  \line { #sheetName }
}

#(define-markup-command (arrow layout props) ()
   "Draw an Arrow."
   (interpret-markup layout props
     #{\markup \overlay {
        \override #'(thickness . 3)
        \translate #'( 0 . 1.82)\draw-line #'(-1.5 . 0)
        \translate #'( 1.3 . 1.8)\arrow-head #X #RIGHT ##f
        }
     #}
    ))

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Kak -- wa mo -- ma wid -- jech, ma -- mo
  kak -- wa mo -- ma wid -- jech,
  \set stanza = #"1. "
  do -- lu na ptsche -- li -- na ma -- mo,
  do -- lu na ptsche -- li -- na.
  Do -- lu, do -- lu, do -- lu, do -- lu, do -- lu
  na ptsche -- li -- na.
  Hej, do -- lu, do -- lu, do -- lu, do -- lu
  na ptsche -- li -- na.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Tscher -- ni ot -- schi i -- ma, ma -- mo,
  tscher -- ni ot -- schi i -- ma,
  \set stanza = #"2. "
  ka -- to dwe tsche -- re -- schi, ma -- mo,
  ka -- to dwe tsche -- re -- schi.
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Bja -- lo li -- tze i -- ma, ma -- mo,
    bja -- lo li -- tze i -- ma,
    \set stanza = #"3. "
    ka -- to bjal tran -- da -- fil, ma -- mo,
    ka -- to bjal tran -- da -- fil.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Ru -- sa ko -- sa i -- ma, ma -- mo,
    ru -- sa ko -- sa i -- ma,
    \set stanza = #"4. "
    ka -- to tyn -- ka sli -- wa, ma -- mo,
    ka -- to tyn -- ka sli -- wa.
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"5. "
    I -- di ja po -- is -- kaj, ma -- mo,
    I -- di ja po -- is -- kaj,
    \set stanza = #"5. "
    da -- no mi ja da -- dat ma -- mo,
    da -- no mi ja da -- dat.
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle modern %-voice-cautionary
  \time 4/4
  \key d \minor
  d4 e f f
  f e e d
  d e f f
  f( e) e2
  d4 e f f
  f e e d
  g d d c
  d2 d \break
  \repeat volta 2 {
    \voiceOne
    d4 e f  f
    f g a a
    a g f g
    a2 a
    c2 g4 f
    e f g g
    g f e c
    d2 d
  }
  %\bar "|."
}


stropheAlt = \relative c' {
  s1 s s s s s s s
  \voiceTwo
  a4 c d d
  d e f f
  f e d e
  f2 f
  e2 e4 d c d e e
  e d a c d2 d
}

chrdStrophe = \chordmode {
 d1:m s s s2 a:m7
 d1:m s g:m d:m
 d:m s s s
 c s s2 a:7 d1:m
 }


\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.35))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 24)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
