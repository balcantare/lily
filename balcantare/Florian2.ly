\version "2.24.4"
\language "english"

\score {
  <<
    \new ChordNames \chordmode { a1 e:7 d2:m }
    \new Staff 
     <<
       \new Voice { 
         \relative c' 
         { c2 b4 e4 
           e8 e4. e8 fs2
       }}
     >>
    
  >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
