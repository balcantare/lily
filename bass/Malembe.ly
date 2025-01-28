\version "2.24.0"
sheetName = "Malembe"
sheetComposer = "trad. Toko"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  %\set stanza = #"1. "
  Na nze -- la na lo -- la to -- ko
  tam -- bo -- la ma -- lem -- be.
  Ma -- lem -- be to -- ko tam -- bo -- la.
  Ma -- lem -- be, 
  ma -- lem -- be,
  ma -- lem -- be to -- ko tam -- bo -- la.
}}

strophe = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \major
  \partial 4
   \bar ".|:"
   \repeat volta 2 {
  a4
  d,8 d d fs~ fs d e fs
  g8. g16 g8 fs e d \break r fs
  a4. fs8 fs fs g g fs2. } \break
   \repeat volta 2 {
  r8 fs
  a4. fs8~ fs( g) r8 a
  b4. g8~ g4 \break r8 b
  a4. fs8 fs fs g g 
  fs2.
   }
}

stropheSopran = \relative c' {
  \voiceOne
}

stropheBass = \relative c {
  \key d \major
  \clef "bass"
  \accidentalStyle neo-modern %-voice-cautionary
  %\partial 8
  %\voiceTwo
  % \override Rest.staff-position = #1
  s4 s1*7 s2. 
}

stropheTenor = \relative c' {
   \voiceOne
}
chrdStrophe = \chordmode { 
  s4
  d1 g2 d2 s2. e4:m d1
  d1 g2 e:m d2. e4:m d2.
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
      \new Voice = "StropheSopran" { \stropheSopran }
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Staff <<
      \new Voice = "Tenor" { \stropheTenor }
      \new Voice = "Basso" { \stropheBass }
      >>
    >>

  }
  \markup { \vspace #5  \hspace #6 \fontsize #2
    \column{
      \line{ Den Weg zum Himmel gehen wir langsam. }
     }
  }
}
