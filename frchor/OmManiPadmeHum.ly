\version "2.24.0"
sheetName = "Om Mani Padme Hum"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    Om ma -- ni pad -- me hum.
    Om ma -- ni pad -- me hum.
    Om ma -- ni pad -- me hum.
    Om ma -- ni pad -- me hum.
    Om ma -- ni pad -- me hum.    
    Om ma -- ni pad -- me hum.
}}

strophe = \relative c'{
  \time 2/2
  \key c \major
  %\partial 2
  e1 
  e4 d d c
  c1~ 1 \break
  f1 
  f4 e e d~ 
  d4 d2.~ d1 \break
  e1 g2. a4 
  e2 d c1 \break
  f1 f4 e e d~
  d4 d2.~ d1 \break
  a'1 a4 g g f~
  f f2.~ f1 \break
  e1 
  e4 d d c
  d1~ 1
  \bar "|."
}

chrdStrophe = \chordmode {
  c1 s s s
  d:m s g s
  c g:/b a:m e:m/g
  f s g s
  f s s s
  c s g
  
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    % ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}
