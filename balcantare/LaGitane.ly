\version "2.24.2"
sheetName = "La Gitane"
sheetComposer = "Paul Tchan Tchou Vidal"
#(define book-staff-size 20)
\include "../include/book.ily"

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle modern
  \time 3/4
  \key d \minor
  \set Timing.measurePosition = #(ly:make-moment -5/8)
  \bar ".|:"
  \repeat volta 2 {
    \mark \markup{ \box{\fontsize #2 A}}
  f8 \tuplet 3/2 {g8 f e} \tuplet 3/2 {d c bf}
  a4 r8 a8 \tuplet 3/2 {f g gs} 
  a8 f' \tuplet 3/2 {g8 f e} \tuplet 3/2 {d c bf}
  a4 r8 a8 \tuplet 3/2 {f g gs} 
  a8 f' \tuplet 3/2 {g8 f e} \tuplet 3/2 {d c bf}
  a8[ f'] e[ d] c bf
  a[ f'] e[ d] c bf
  \tuplet 3/2 {a8 bf a } g2~
  4 \tuplet 3/2 {bf8 a g} \tuplet 3/2 {f e d }
  cs4~ <cs e g b>2
  r4 \tuplet 3/2 {bf'8 a g} \tuplet 3/2 {f e d }
  cs4~ <cs e g b>2  %\break 
  \repeat volta 2 { \bar "|" }
  \alternative{
   {r8 a cs[ e] g bf
    cs e g[ f] e d
    cs16( d cs8) bf[ a] g f
    e16( f e8) d8[ e] f g
    a8 \bar "||" % \break 
  }
  { r4 \tuplet 3/2 4 {a,8 cs e g bf~ <bf cs g'>~}
    4 4 <cs e bf'>4 
    4 <e g cs>4 4
    <g bf e>4 r8 <f a d>8 4 
    r8 \bar "||" 
  }
  } %\break
  f \tuplet 3/2 {g8 f e} \tuplet 3/2 {d c bf}
  a4 r8 a8 \tuplet 3/2 {f g gs} 
  a8 f' \tuplet 3/2 {g8 f e} \tuplet 3/2 {d c bf}
  a4 r a4
  r8 e'16( d) cs8[ d] cs d
  ef d c[\3 bf] a g
  fs a c[\3 ef] fs a
  g16( a g8) \parenthesize d8 bf8 g[ f]
  e g bf[ d] g a
  bf g ef[ bf] g\4 bf
  ef g a[ g] a g
  g16( a g8) f8[ d] a4
  \tuplet 3/2 {f'8 g f} \tuplet 3/2 {e d c} bf8 a
  gs4 <d gs b f'>2
  a4~ <a e' g cs f>4. cs'8
  d4 a f 
  d8 }
  \break
    \mark \markup{ \box{\fontsize #2 B}}
    r8 \tuplet 3/2 { a''8( bf) a } gs8 a
    bf a g\2[ f\2] e\2 d\3
    \set TabStaff.minimumFret = #5
    \set TabStaff.restrainOpenStrings = ##t
    cs e g[ bf] a cs,
    \tuplet 3/2 { e8( f) e } \tuplet 3/2 {d cs d } \tuplet 3/2 { e f g }
    a4 \tuplet 3/2 { a8( bf a) } g8 a
    bf e, f[ g] cs, d 
    e f g[ a] bf c
    \tuplet 3/2 { bf( c bf) } bf gs\1 a4
    r4 \tuplet 3/2 { a8( bf a) } g f 
    ef f g[ a] bf c
    \tuplet 3/2 {bf16( c bf) } a8 g[ f] e bf'
    \tuplet 3/2 {a8( bf a) } f d a4
    r8 e' f[ g] f g
    \tuplet 3/2 {f8( g f) } e d c4
    b\3 r8 f' f[ f]
    f4. ef8\2 e4
    r8 a8 a[ bf] a bf
    \tuplet 3/2 4 {a8( bf a) g f e g f e}
    \tuplet 3/2 4 {d cs d e f g a bf bf}
    bf16( c bf8) r gs\1 a4
    r8 \tuplet 3/2 {a16( bf a)} gs8\1[ a] c b
    bf a g[ f] e d
    cs e f[ g] a cs,
    \tuplet 3/2 4 { e( f e) d cs d e f g}
    a4 \tuplet 3/2 { a8( bf) a} g f
    ef f g[ a] bf c
    \tuplet 3/2 { bf16( c bf)} a8 g[ f] e bf'
    \tuplet 3/2 { a( bf a) } f8 d a4
    r8 \tuplet 3/2 { a'16( bf a) } gs8\1[ a] c b
    bf a g[ f] e d
    cs e g[ bf] a f\1
    \set TabStaff.minimumFret = #0
    d4 a f 
    d8 \bar "||" \break
    \mark \markup{ \box{\fontsize #2 A}}
    f'8 \tuplet 3/2 {g8 f e} c bf
    a4 r8 a8 \tuplet 3/2 {f g gs} 
    a8 f' \tuplet 3/2 {g8 f e} \tuplet 3/2 {d c bf}
    a4 r2 r2.
    \set TabStaff.minimumFret = #5
    \tuplet 3/2 {d'4 cs c~} 8 b
    bf16( c bf8)~ 8 a g f
    f16 g f8~ 8 e \tuplet 3/2 {e f fs} 
    g4 r4 \parenthesize f,4
    \set TabStaff.minimumFret = #9
    \tuplet 3/2 4 {gs8 a cs e g bf cs d ef}
    e4 \tuplet 3/2 4 {d8 e d cs e cs}
    \set TabStaff.minimumFret = #8
    bf cs bf[ g] bf g
    \set TabStaff.minimumFret = #6
    e g e[ cs] e cs
    \set TabStaff.minimumFret = #5
    a gs g[ a] cs e
    g bf a[ g] f e
    g fs f16([ g) f8] d c
    b4\3 r2
    \tuplet 3/2 4 { \repeat unfold 18 <d f b e>8 }
    4 r <cs e bf' ef>8 8 
    <d f b e>4 r8 ef'16 d cs8 d
    \set TabStaff.minimumFret = #9
    ef8 d c[ bf] a g
    fs a c[ ef] d fs,
    \tuplet 3/2 4 {a8( bf a) g fs g a bf c }
    d4 r8 d8 e f
    e16 f e d cs8[ d] bf g
    e g bf[ d] e f
    d16( e d8) a[ f] d c
    b d f[ a] d ef
    e \tuplet 3/2 {d16 e d} cs8 bf \tuplet 3/2 { a8( bf a)}
    g8 f e[ g] f e
    \tuplet 3/2 4 {d8 cs d f f f a a a }
    d4 \bar "||" \break
    \mark\markup{ \box{\fontsize #2 C}}
    \key d \major
    r8 a8 b d
    \tuplet 3/2 { cs( d cs) } b8[ a] fs d
    \tuplet 3/2 { d( cs d) } b8 d \tuplet 3/2 {fs a bf}
    b2. 
    r4 a8[ b] cs d
    cs16( d cs8)~ 8[ 8] d cs
    \set TabStaff.minimumFret = #7   
    c16( cs c8)~ 8[ 8] cs c
    b16( c b8)~ b2
    \set TabStaff.minimumFret = #9
    r2 \tuplet 3/2 {e8 ef d}
    cs b \tuplet 3/2 {a( b a)} g8 e
    cs a \tuplet 3/2 {gs( a gs)} g gs
    a2.
    r4 \tuplet 3/2 4 {cs'8 d ef e d cs
                      d cs \set TabStaff.minimumFret = #10
    b cs b a b a g }
    a8 g fs[ \set TabStaff.minimumFret = #9
     e] f f
    bf4 b2
    a4 r8 8 b d
    \tuplet 3/2 { cs8( d cs) } b8[ a] fs d
    \tuplet 3/2 { d( cs d) } b d \tuplet 3/2 { fs a bf }
    b2.
    \set TabStaff.minimumFret = #11
    r4. c16 b bf8[ b]
    c8 b a[ g] fs e
    ef fs a[ c] ef fs
    \tuplet 3/2 { e8( fs e) } b[ g] e d
    cs e g[ b] e fs
    \tuplet 3/2 { e( fs e) } d[\1 bf] g e\3
    \set TabStaff.minimumFret = #9
    g bf d[ ef] e cs
    \tuplet 3/2 4 { d( e d) b a \parenthesize fs d cs \parenthesize c }
    \parenthesize b4 r8 b'16 a gs8[ a]
    \tuplet 3/2 { cs8( d cs) } b[ b] fs fs
    \tuplet 3/2 { a( bf a) } g[ g] e e
    \tuplet 3/2 4 { d8 8 8 fs fs fs a a a}
    d4 gs, a
    \bar "||" \break
    \mark\markup{ \box{\fontsize #2 A}}    
    \key d \minor
    \set TabStaff.minimumFret = #0    
    f'8 e e[ ef] ef d
    d cs cs[ c] c b
    b bf bf[ a] a gs
    gs g g[ fs] fs f
    f e e[ d] d cs
    cs c c[ b] b bf
    bf a a[ gs] gs g
    g2.
    \set TabStaff.minimumFret = #9
    \tuplet 3/2 4 {gs8 a cs e g b cs d ef}
    e4 \tuplet 3/2 4 {d8 e d cs e cs}
    \set TabStaff.minimumFret = #8 
    bf8 cs bf[ g] bf g
    \set TabStaff.minimumFret = #6
    e g e[ cs] e cs
    \set TabStaff.minimumFret = #5
    a gs g[ a] cs e
    g bf a[ g] f e
    g fs f16[( g) f8] d c
    b4\4 r2
    \set TabStaff.minimumFret = #10
    \tuplet 3/2 4 {f'8 g a b( a) g f g a
                   b( a) g f g a b( a) g 
                   f( g f) } d[ c] b\4 d
    f a d[ ef] d ef
    \tuplet 3/2 4 {d( ef) d c bf a c bf a 
                   g fs g a bf c d ef f
                   ef( f ef)~ } ef8 cs\1 d4
    r8 fs, g[ bf] d f
    e16 f e d cs8[\1 d] bf g
    e\3 g bf[ d] e f
    d d a[ f] d c
    b\4 d f[ a] d ef
    \set TabStaff.minimumFret = #9
    e \tuplet 3/2 { d16 e d } \tuplet 3/2 4 {cs8 cs bf a( bf a) }
    g f e[ g] f e
    \tuplet 3/2 4 { d8 cs d f f f a a a}
    d4 r2
   \bar "|."
}


chrdStrophe = \chordmode {
  s2 s8
  d2.:m s s s
  d:m s g:m6 s
  a:7 s s  s
  a:7 s d:m a:7
  a:7 s d:m a:7
  d:m s s s 
  d:7 s g:m6 s
  ef s d:m s
  e:7 a:7 d2:m a4:7
  d2.:m
  e:m5-7 a:7 d:m s
  e:m5-7 a:7 d:m s
  ef s d:m s
  e:7 s a:7 s
  e:m5-7 a:7 d:m s
  e:m5-7 a:7 d:m s
  ef s d:m s
  e:m5-7 a:7 d2:m a4:7
  d2.:m
  d2.:m s s s 
  d:m s g:m6 s
  a:7 s s s
  a:7 s d:m a:7
  d2.:m s s s 
  d:m s g:m6 s
  ef s d:m s
  e:7 a:7 d2:m a4:7
  d2.:m 
  d s d:dim d
  d:/fs f:dim a:7 s
  a:7 s s s 
  a:7 s d:dim d
  d s d:dim d
  fs:m5-7 b:7 e:m s
  e:m5-7 s d b:7
  e:m a:7 d s
  d:m s s s
  d:m s g:m6 s
  a:7 s s s
  a:7 s d:m a:7
  d:m s s s
  d:7 s g:m6 s
  ef s d:m s
  e:7 a:7 d:m s
}

\bookpart {
  \paper {
    page-count = #4
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
    \omit Voice.StringNumber 
  }

  }
}
