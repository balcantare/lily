\version "2.24.2"
sheetName = "La Lune A"
sheetComposer = "RY"
#(define book-staff-size 20)
\include "../include/book.ily"

strophe = \relative c {
  %\voiceOne
  \accidentalStyle modern
  \time 4/4
  \key fs \minor
 % \set Timing.measurePosition = #(ly:make-moment -5/8)
  \bar ".|:"
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #6
  \partial 4.
  e8 fs gs 
  b a gs a cs a cs gs' 
  <fs cs a e>4. e8 cs a fs f 
  e fs  gs a cs a cs gs'
  <fs d gs, e>4. e8 d b gs e
  ds e gs b d b d gs
  <fs d gs, e>4. e8 d b gs e
  ds e gs b d b gs' g
  <fs cs a e>4. e8 cs a fs f 
  e fs gs a cs a cs gs'
  <fs cs a e>4. e8 cs a fs f
  fs as cs e g fs as cs
  <b fs d a>4. a8 fs d b a
  f e d e f a d e
  <fs cs a e>4. e8 cs a fs e
  \tuplet 3/2 {ds4~ <ds a' cs fs> ds}
  \tuplet 3/2 {e4~ <e gs d' e\2 > e}
  a,4-0 <e' a cs e a>4. 
\bar "|."
}


chrdStrophe = \chordmode {
 
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    % ragged-last-bottom = ##t
  }
  \bookItem 
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff { \clef "G_8" \strophe }
    \new TabStaff \with {
     % fontSize = #-1
     % \override StaffSymbol.staff-space = #(magstep -1)
    }{ \tabChordRepeats \strophe }  
    >>
    \layout { 
      \omit Voice.StringNumber 
    }
  }
}
