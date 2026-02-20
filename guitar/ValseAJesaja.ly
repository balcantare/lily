\version "2.24.2"
sheetName = "Valse a Jesaja"
sheetComposer = "Titi Winterstein"
sheetPoet = "Lulu Reinhardt"
#(define book-staff-size 20)
\include "../include/book.ily"

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle modern
  \time 3/4
  \key a \minor
  %\set Timing.measurePosition = #(ly:make-moment -5/8)
  %\bar ".|:"
  \mark \markup{ \box{\fontsize #2 A}}
  
  \partial 4.
  \repeat volta 2 {
    \set Score.repeatCommands = #'((volta "1.") end-repeat)
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #4
  b8 c[ ef]
  e gs a[ gs] a b
  \bar "||" |
  \set Score.repeatCommands = #'((volta "2...") end-repeat)
  \set TabStaff.minimumFret = #7
  r8 e,, a[ b] c ef
  e ef e[ a] b b
  \bar "|" |
  \set Score.repeatCommands = #'((volta #f))
  \set TabStaff.minimumFret = #4
  c c b[ b] \tuplet 3/2 { a8( b a)}
  f2.
  <d f c'>4 <d f b> r8 \break a'8
  e2.
  r8 \tuplet 3/2 { e16( f e) } ef8[ e] g fs
  f2.
  \tuplet 3/2 { e8( f e) } d8[ cs] \tuplet 3/2 { c8 
  \set TabStaff.minimumFret = #7                                               
                                                 d ef } 
  e2.
  r8 e, a[ b] c ef \bar "||"
  e8 ef e[ a] b c(
  e4) \tuplet 3/2 4 { d8( e d) c( d c) }
  f,2 r8 c'
  d8[ d] \tuplet 3/2 4 { c8( d c) b(c b) }
  e,2 r8 e8
  \set TabStaff.minimumFret = #5
  ef[ fs] a[ c] b a 
  \set TabStaff.minimumFret = #4
  gs f e[ d] \tuplet 3/2 {c16( d c)} b8
  a2 
  
  
  r4
  \once \override Score.RehearsalMark.break-visibility =
    #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X =
    #RIGHT
 \once \override Score.RehearsalMark.Y-offset = #-3
 
  \mark \markup{ \box{\fontsize #2 ..A,A}}
  \bar ":|." }  
  \break
  
  r8 \mark \markup{ \box{\fontsize #2 B}}

  gs' a[ gs] a gs \bar "||"
  \tuplet 3/2 {a8( bf a)} f2
  fs4 g f8 e
  a8 a e16( f e f e f e f
  e2 ) \tuplet 3/2 {e8( f e)}
  ef8 e( ef4) c
  \set TabStaff.minimumFret = #1
  
  b2 \tuplet 3/2 {a8( b a)} 
  \tuplet 3/2 {gs8 a bf} b2
  \set TabStaff.minimumFret = #7

  r8 e, a[ b] c ef \bar "||"
  e ef e[ a] b c( e4) 
  \tuplet 3/2 4 {d8( e d) c( d c)}
  f,2 r8 \break c'
  d8 d \tuplet 3/2 4 {c8( d c) b( c b)}
  e,2 \bar "" 
  \repeat volta 1 {
    \set Score.repeatCommands = #'((volta "1 & 2.") end-repeat)
  r8 e8
  ef fs a[ c] b
  \set TabStaff.minimumFret = #4
  a
  gs f e[ d] \tuplet 3/2 {c16( d c)} b8
  a2 r4 
  \set Score.repeatCommands = #'((volta #f))
  }
  \bar "||"
  s2
  \once \override Score.RehearsalMark.Y-offset = #-3
  \mark \markup{ \box{\fontsize #2 ..A,B}}
  s4 \pageBreak
  \bar "||"
  r8 \mark \markup{ \box{\fontsize #2 C}}
  \set TabStaff.minimumFret = #9
  \tuplet 3/2 {d,16( e d)} cs8[ d] fs a
  \bar "||"
  \key d \major
  cs,8 d fs[ a] c ef
  \set TabStaff.minimumFret = #10
  cs d fs[ a] cs c
  \tuplet 3/2 { b8( cs b~)} b2
  \set TabStaff.minimumFret = #9
  r8 \tuplet 3/2 { d,,16( e d) } cs8[ d] fs a
  \set TabStaff.minimumFret = #10 
  c d fs[ a] b cs
  cs e cs[ e] cs fs
  b,2.
  \set TabStaff.minimumFret = #7
  r8 ds, e[ g] b d
  \tuplet 3/2 {cs8 d cs~} cs2
  \set TabStaff.minimumFret = #6
  r8 b g[ e] \acciaccatura cs d8 cs 
  b2 b8 bf
  \set TabStaff.minimumFret = #5
  \tuplet 3/2 { a8( b a~) } a4  \tuplet 3/2 {b,8 bf a}
  \set TabStaff.minimumFret = #4
  gs8 a cs[ e] g a
  \set TabStaff.minimumFret = #9
  cs e \tuplet 3/2 {g8 bf cs} e8( cs)
  cs2. 
  b
  a8 b d[ f] e d
  cs b a[ fs] a b
  \set TabStaff.minimumFret = #10
  cs[ fs] cs \tuplet 3/2 {b16( cs b)} a8 fs
  \set TabStaff.minimumFret = #9
  d b a[ fs] d4
  \set TabStaff.minimumFret = #1
  f,8 fs bf[ cs] e g
  f fs bf[ cs] e ef
  \tuplet 3/2 {d8( ef d)~} d2
  \set TabStaff.minimumFret = #6
  r2 \tuplet 3/2 {cs,8 c b}
  bf8 b ef[ fs] a c
  bf b ef[ fs] a gs
  g2. 
  r4. bf,8 b[ d]
  e8 fs g[ b] d b
  bf g  bf[ g] bf c16( bf)
  \set TabStaff.minimumFret = #5
  a8 fs a[ fs] a cs
  \set TabStaff.minimumFret = #7
  \tuplet 3/2 4 {b8( c b) a fs ef b bf a}
  \set TabStaff.minimumFret = #4
  gs4 <d' fs>2
  g,4 <cs fs>4. cs,8
  d2. \bar "||" \break
  \mark \markup{ \box{\fontsize #2 C}}
  \set TabStaff.minimumFret = #9
  r8 \tuplet 3/2 {d16( e d)} cs8[ d] fs[ a]
  \bar "||"
  c8 d fs[ a] b d
  fs cs e[ d] 
  \set TabStaff.minimumFret = #9
  fs, a
  cs 
  \set TabStaff.minimumFret = #12
  \tuplet 3/2 {cs16( b cs)} 
  \set TabStaff.minimumFret = #9
  a8 fs \tuplet 3/2 {d8( cs c)}
  b8 a fs[ e] cs d
  fs a c[ d] fs a
  \set TabStaff.minimumFret = #10
  cs e cs[ c] b a
  \set TabStaff.minimumFret = #8
  g a \tuplet 3/2 {g( a g)} b,4
  b2 r8 
  \set TabStaff.minimumFret = #6 
  b'
  d8 d cs[ cs] \tuplet 3/2 {b( cs b)}
  g8 g e[ e] \tuplet 3/2 {d( e d) }
  cs2
  \set TabStaff.minimumFret = #4 \tuplet 3/2 {c8( cs c)} 
  b2 \tuplet 3/2{ b,8 bf a}
  gs8 a cs[ e] g bf
  gs a \tuplet 3/2 4 {cs e fs a cs c b( cs b)~}
  b4. b8
  b2 r8 
  \set TabStaff.minimumFret = #9 \break d,,8
  cs8 d fs[ a] c d
  fs a b[ d] fs cs
  e d fs,[ a] cs \set TabStaff.minimumFret = #7 c
  \tuplet 3/2 {b( c b) } r4 
  \set TabStaff.minimumFret = #1 \tuplet 3/2 {gs,,8 g fs}
  f fs bf[ cs] e g
  f fs bf[ cs] e ef
  \tuplet 3/2 {d( ef d)~} d2
  \set TabStaff.minimumFret = #6
  r2 \tuplet 3/2 {cs,8 c b}
  bf8 b ef[ fs] a c
  bf b ef[ fs] a gs
  g2.
  \set TabStaff.minimumFret = #5
  r4 g,8 a b[ d] 
  e8 fs g[ b] d b
  bf g bf[ c] bf8 c16( bf)
  a8 fs a[ b] cs c
  \set TabStaff.minimumFret = #7
  b a fs[ ef] b a
  \set TabStaff.minimumFret = #4
  gs4 <d' fs>2
  g,4 <cs fs>4. cs,8 d2. \break
  \bar "||"
  \key a \minor
  s2
  \once \override Score.RehearsalMark.Y-offset = #-3
  \mark \markup{ \box{\fontsize #2 ..A,A,B}}
  s4 %\break
  \bar "||"
  \repeat volta 1 {
    \set Score.repeatCommands = #'((volta "3.") end-repeat)
    \set Timing.measurePosition = #(ly:make-moment 2/4)
  \set TabStaff.minimumFret = #9
  \tuplet 3/2 { e'8( fs e) }
  \set TabStaff.minimumFret = #7
    ef8 fs a[ c] b a
  \set Score.repeatCommands = #'((volta #f))
  }  
    gs f e[ d] c b
    \set TabStaff.minimumFret = #5
    gs a ef[ e] \tuplet 3/2 {c8 b bf}
    a4 r2
  \bar "|."

}


chrdStrophe = \chordmode {
  s4. 
  s2.  a:m s a:m/g
  d:m/f s a:m a:m/g d:m/f e:7 a:m e:7
  a:m a:m/g d:m/f s
  a:m b:7/fs e:7 a2:m e4:7 
  a2.:m d:m/f s a:m a:m/g b:7/fs
  b:7 d:m/f e:7
  a:m a:m/g d:m/f s
  a:m b:7/fs e:7 a2:m e4:7
  s2.
  a2.:7
  d:/fs s s s s
  f:dim e:m s
  s s s s 
  a:7 s d:dim d
  d:/fs s s s
  fs:7 s b:m s
  b:7 s  e:m s
  g gs:dim d b:7
  e:7 a:7 d s
  d:/fs s s s 
  s f:dim e:m s
  s s s s
  a:7 s d:dim d
  d:/fs s s s
  fs:7 s b:m s
  b:7 s e:m s
  g gs:dim d b:7
  e:7 a:7 d
  s2. s4
  b2.:7/fs e:7 a2:m e4:7 a:m
}

\bookpart {
  \paper {
    page-count = #3
    #(define fonts (book-font 1))
    ragged-last-bottom = ##t
  }
  \bookItem 
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff { \clef "G_8" \strophe }
    \new TabStaff \with {
      fontSize = #-1
      \override StaffSymbol.staff-space = #(magstep -1)
    }{ \tabChordRepeats \strophe }  
    %\new Staff <<
    %  \new Voice = "Bass" { \stropheBass}
    %>>
    >>
  \layout {
      #(layout-set-staff-size-with-jazz 20) 
    \omit Voice.StringNumber 
  }

  }
}
