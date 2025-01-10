\version "2.24.2"
sheetName = "La Lune B"
sheetComposer = "RY"
#(define book-staff-size 20)
\include "../include/book.ily"

strophe = \relative c {
  %\voiceOne
  \accidentalStyle modern
  \time 2/4
  \key fs \minor
 % \set Timing.measurePosition = #(ly:make-moment -5/8)
  \bar ".|:"
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #6
  %\partial 4.
  \mark \markup{ \box{\fontsize #2 A}}
  \override Fingering.font-size = #-3
  r8 e8-2 fs gs 
  b a gs a cs a cs gs' 
  <fs cs a e>4. e8-4 cs a fs f 
  e fs  gs a cs a cs gs'
  <fs d gs, e>4. e8 d b gs e
  ds e gs b d b d gs
  <fs d gs, e>4. e8 d b gs e
  ds e gs b d b gs' g
  <fs cs a e>4. e8 cs a fs f 
  e fs gs a cs a cs gs'
  <fs cs a e>4. e8 cs a fs f
  fs as cs e g fs as cs
  <b fs d a>4. cs8 b8 a f d
  b a f-4 \set TabStaff.minimumFret = #4
  d-1
  a-2 cs e gs-1 
  \set TabStaff.minimumFret = #6
  fs-4 as cs e
  d-1 b d fs gs-3 e-1 gs cs
  a2-2
  %\bar "||"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #2 B}}
  r8 e[-\prall-2 ds e]
  gs d' gs, e 
  \set TabStaff.minimumFret = #8
  fs e ds e 
  \set TabStaff.minimumFret = #5
  a, cs e cs
  fs e cs a
  \set TabStaff.minimumFret = #4
  e gs d' b
  fs' e d b
  a cs e fs
  e2
  \set TabStaff.minimumFret = #8
  r8 e[-\prall-2 ds e]
  gs d' gs, e 
  fs e ds e 
  \set TabStaff.minimumFret = #5
  a, cs e cs
  fs e cs a
  \set TabStaff.minimumFret = #4
  e d' b gs
  e d b gs }
  \alternative {
    { a cs e a cs e a4 } 
    { a,,8 cs e4~ <e gs d' e> r4}
  }
  s4
  \mark \markup{ \box{\fontsize #2 A}}
  s4
  \bar "||" \break
  \mark \markup{ \box{\fontsize #2 C}}
  \repeat volta 2 {
    \set TabStaff.minimumFret = #8
     r8 cs''-\prall-2 bs cs
     d cs b-4 gs-1
     es-2 cs'-\prall-2 bs cs
     d cs-1 a-2 fs-3 
     cs-3 cs'-\prall-2 bs cs
     d gs, b es,
     gs b, d f,
     fs a cs fs
     a gs-\prall fs es
     gs fs d b
     a' \tuplet 3/2 {gs8([ a gs)]} fs8
     gs fs cs a 
     fs a gs fs
     cs es gs b
     d cs es gs
  }
  \alternative {
    { fs8 gs a4 }
    { fs4 f-\prall e2 }
  }
  \bar "||"
  s4
  \mark \markup{ \box{\fontsize #2 A}}
  s4
\bar "|."
}


chrdStrophe = \chordmode {
  s2
  a1 s1*2 e1:7 s1*3
  a1 s1*2 fs1:7 b2:m
  s2*2 a2 fs:79- b:m e:7 a
  s2 e:7 s a s e:7 s
  a s s e:7 a s e:7 s a s
  s s e:7 s
  s cs:7 s fs:m s cs:7 s fs:m s
  b:m s fs:m s cs:7 s fs:m fs4:m f:7 e:7
  
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
