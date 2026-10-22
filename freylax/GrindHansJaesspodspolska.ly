\version "2.24.2"
sheetName = "Grind Hans Jaesspodspolska"
\include "../include/book.ily"

sheetTonality = c

strophe =  {
  \time 3/4 
  \key g \major   
  \bar ".|:"
  \mark \markup{ \box{\fontsize #4 A}}
  \repeat volta 2 {
% %abc-charset utf-8
    d'4    g'4 \grace { fs'16 g' }   a'8.    b'16    \bar "|"   
   \times 2/3 {   c''4    b'4 (   g'4  -) }   e'4   ~    \bar "|" 
   e'4    c''8    
   b'8    a'8.    g'16    \bar "|"   
   fs'8 (   g'8  -)   a'8 (   fs'8  -)   d'4  
 ~    \bar "|"   
   d'4    g'4 \grace { fs'16 g' }   a'8.    b'16    \bar "|"   
   \times 2/3 {   c''4   
 b'4 (   g'4  -) }   e'4   ~    \bar "|"     e'4    c''8[ (  \grace{ b'16 c'' } b'8]  -)   a'8.    
g'16    \bar "|"   fs'8    e'16    fs'16    g'2    } 
\break
\mark \markup{ \box{\fontsize #4 B}}
\repeat volta 2 {   g'8. 
   b'16 (   d''8    c''8  -)   b'8.    a'16    \bar "|"   g'8 (   c''8  -)   
e''8 (   d''8  -)   c''8.    b'16    \bar "|"   a'8.    b'16 (   c''16    d''16 
 -)   c''16    a'16    b'8.    g'16    \bar "|"     fs'8 (   g'8  -)   a'8 (   
fs'8  -)   d'4   ~    \bar "|"   d'4    d''8 (   c''8  -)   b'8.    a'16    
\bar "|"   g'8 (   c''8  -)   e''8 (   d''8  -)   c''8.    b'16    \bar "|"   
a'8.    b'16 (   c''16    d''16  -)   c''16    a'16    b'8.    g'16    \bar "|" 
  fs'8    e'16    fs'16    g'2    }   
}

chrdStrophe = \chordmode {
 g2.
 a:m s
 d
 g a:m s d4 g2
 g2. c d s g c d d4 g2
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
