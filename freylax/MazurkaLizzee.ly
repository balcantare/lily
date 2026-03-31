\version "2.24.2"
sheetName = "Mazurka Lizzée"
\include "../include/book.ily"

sheetTonality = c

strophe = \relative c' {
  \time 3/4
  \key a \minor
  \partial 4.
  \bar "|:"
  \repeat volta 2 {
    \mark \markup{ \box{\fontsize #4 A}}
  e8 a8. c16
  a4. e8 a8. c16
  a4. e8 a8. c16
  b4 d8[ c] b[ d]
  c4 
  \autoBeamOff
  a8 \break e 
  \autoBeamOn a8. c16
  a4. e8 a8. c16 a4. e8 a8. c16
  b4 d8[ c] b[ c] a4. }
  \break
  \repeat volta 2 {
    \mark \markup{ \box{\fontsize #4 B}}
    r8 e'8 f
    e4. c8 d e
    a,4. b8 c a
    b4 d8[ c] b[ d]
    c4 a \break  e'8 f
    e4. c8 d e
    a,4. b8 c a
    b4 d8[ c] b[ d]
    a4.
  }
  \bar "|."
}

chrdStrophe = \chordmode {
  s4.
  a2.:m f g a:m a:m f g a:m
  a:m f g a:m a:m f g a4.:m
}

\bookpart {
  \paper {
    page-count = #1
    system-system-spacing.padding = #8
  }
  \bookItem
  \header { subtitle = "Mazurka |AABB|" }
  \score {
    <<
    \new ChordNames \doTranspose \chrdStrophe 
    \new Staff <<
      \new Voice = "Strophe" \doTranspose \strophe 
      >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
  }
}
