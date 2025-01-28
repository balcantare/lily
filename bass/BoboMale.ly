\version "2.24.0"
sheetName = "Bobo Malé"
sheetComposer = "trad. Bukina Faso"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  %\set stanza = #"1. "
  Bo -- bo Ma -- lé,
  Bo -- bo Ma -- lé
  shu -- shu -- ma -- ya,
  Bo -- bo Ma -- lé,
  Bo -- bo Ma -- lé,
  Bo -- bo Ma -- lé
  shu -- shu -- ma -- ya,
  Bo -- bo Ma -- lé.
}}

strophe = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \major
  \partial 2
  d8 d4 e8
  fs1~ 
  fs2 d8 d4 e8
  fs2 fs8 fs4 e8
  d2 \break fs8 fs4 d8
  e1~
  e2 e8 e4 fs8
  g1~ 
  g2 \break e8 e4 fs8 
  g2 fs8 fs4 e8
  d2 fs8 fs4 e8
  d1~
  d2
\bar "|."
}

stropheBass = \relative c {
  \key d \major
  \clef "bass"
  \accidentalStyle neo-modern %-voice-cautionary
  \partial 2
  s2
  s1*11
  s2
 
}

chrdStrophe = \chordmode { 
  s2 d1 s s b:m a s e:m s g d
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Staff <<
      \new Voice = "Basso" { \stropheBass }
      >>
    >>

  }
  \markup { \vspace #5  \hspace #6 \fontsize #2
    \column{
      \line{ Geist, ziehe in den Körper ein  }
      \line{ und bringe ihn zum Tanzen!}
     }
  }
}
