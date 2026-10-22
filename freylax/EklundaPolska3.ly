\version "2.24.2"
sheetName = "Eklundapolska No 3"
sheetComposer = "Viksta Lasse"
\include "../include/book.ily"

sheetTonality = c

strophe =  {
  \time 3/4 
  \key g \major   
  \bar ".|:"
  \mark \markup{ \box{\fontsize #4 A}}
  \repeat volta 2 {
  g''8    fs''16    g''16    b''8    g''8    
  d''8    b'8  \bar "|"   
  c''16    b'16    c''16    d''16    e''16    g''16   
  e''16    c''16    a'8    c''8  
  \bar "|"   b'8   a'16    b'16      c''16    
  d''16    c''16    a'16      b'16    c''16    b'16    g'16  \bar "|"  
  a'8    d''8    d''2  \bar "|"       g''8    fs''16    g''16    b''8  
  g''8    d''8    b'8  \bar "|"   c''16    b'16    c''16    d''16    e''16  
  g''16    e''16    c''16    a'8    c''8  \bar "|"   b'8    a'16    b'16    
  c''16   d''16    c''16    a'16      b'16    c''16    b'16    g'16  
 \bar "|"   a'16    b'16    a'16    fs'16      g'2  
  }
  \break
  \mark \markup{ \box{\fontsize #4 B}}
  %\repeat volta 2 
  {
     <d' b'>8. 16 <d' c''>8[ 8] <d' b'>8 8
     a'8 d'' d''2 
     <d' b'>8. 16 <d' c''>8[ 8] <d' b'>8 8
     a'16 b' a' fs' d'2
     <d' b'>8. 16 <d' c''>8[ 8] <d' b'>8 8
     a'8 d'' d''2
     g'8 a'16 b' c'' d'' c'' a' b' c'' b' g' a' b'
     a' fs' g'2
    \bar "||"
  }
  \mark \markup{ \box{\fontsize #4 B'}}
  \break
  {
     <d' b'>8. 16 <d' c''>8[ 8] <d' b'>8 8
     a'8 d'' d''2 
     <d' b'>8. 16 <d' c''>8[ 8] <d' b'>8 8
     a'16 b' a' fs' d'2
     <d' b'>8. 16 <d' c''>8[ 8] <d' b'>8 8
     a'8 d'' d''2
     g'8 a'16 b' c'' d'' c'' a' b' c'' b' g' a' b'
     a' fs' g'2
  }
  \bar "|."
}

chrdStrophe = \chordmode {
  g2. c g4 c g d2.:7 
  g2. c g4 c g d4:7 g2
  g2. d:7 g d:7 g d:7
  g4 c g d4:7 g2 
  e2.:m d:7 e:m d:7 e:m d:7
  g4 c g d4:7 g2 
}

\bookpart {
  \paper {
    page-count = #1
    system-system-spacing.padding = #8
  }
  \bookItem
  \header {
    subtitle = "Polska |AABB|"
  }
  \score {
    \layout {#(layout-set-staff-size-with-jazz 24)}
    <<
    \new ChordNames \doTranspose \chrdStrophe 
    \new Staff <<
      \new Voice = "Strophe" \doTranspose \strophe 
      >>
    >>
  }
}
