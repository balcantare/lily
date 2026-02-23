\version "2.24.2"
sheetName = "Arthurs Blues"
sheetComposer = "RY"
\include "../include/book.ily"

strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \key ef \major
  g8 fs g bf c ef4 c8~
  4 bf8 g~ g ef f ef
  g fs g bf,~ bf a bf4
  c8 b c ef~ 8 f4.
  gf8 f gf bf c ef4 c8~ 
  c4 bf8 gf8~ 8 ef f ef
  g fs g bf,~ 8 a bf4
  c8 b c e~ 8 g4.
  f8 e f a c ef4 d8~
  d4 bf8 af8~ 4 f8 fs
  g8 fs g bf,~ 8 a bf4
  c8 b c ef~ 8 f4.
  \bar "|."
}

chrdStrophe = \chordmode {
  ef2:6 c:7 f:m7 bf:7 ef1:6 bf2:m7 ef:7
  af1:7 s ef:6 c:7
  f:7 bf:7 ef2:6 c:7 f:m7 bf:7
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##t
  }
  \bookItem
  \score {
    \layout {#(layout-set-staff-size-with-jazz 24)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
