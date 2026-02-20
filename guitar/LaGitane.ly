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
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #5   
  f8-2 \tuplet 3/2 {g8-4 \downbow f e} \tuplet 3/2 {d \downbow c bf}
  a4 r8 a8 \tupletDown \tuplet 3/2 {f \downbow g \downbow gs \upbow} 
  a8 \downbow f' \tuplet 3/2 {g8 f e} \tuplet 3/2 {d c bf}
  a4 r8 a8 \tuplet 3/2 {f g gs} 
  a8 f' \tuplet 3/2 {g8 f e} \tuplet 3/2 {d c bf}
  a8[ f'] e[ d] c bf
  a[ f'] e[ d] c bf
  \tuplet 3/2 {a8 bf a } g2~
  4 \tuplet 3/2 {bf8 \downbow a g} \tuplet 3/2 {f \downbow e d }
  \set TabStaff.minimumFret = #4
  cs4~-1 \set fingeringOrientations = #'(right) <cs g'-3 b-2 e-4>2
  r4 \tuplet 3/2 {bf'8-4 \downbow a g} \tuplet 3/2 {f \downbow e d }
  cs4~-1 <cs g'-3 b-2 e-4>2  %\break 
  \repeat volta 2 { \bar "|" }
  \alternative{
   {
    r8 a\5 cs[-1 e]-4 g-1 bf-4
    \set TabStaff.minimumFret = #6
    cs-1 e-4 g[ f] e d
    cs16( \downbow d cs8) bf[ a] g-4 f-2
    e16( \downbow f e8) \set TabStaff.minimumFret = #4 d8[-1 e] f g
    a8 \bar "||" % \break 
  }
  { \set TabStaff.minimumFret = #2
    r4 \tuplet 3/2 4 {a,8\5 cs-3 e-1 g-4 bf~ <bf cs g'>~}
    4 4 <cs e bf'>4 
    4 <e g cs>4 4
    <g bf e>4 r8 <f a d>8 4 
    r8 \bar "||" 
  }
  } %\break
  \set TabStaff.minimumFret = #5
  f-2 \tuplet 3/2 {g8-4 \downbow f e} \tuplet 3/2 {d \downbow c bf}
  a4 r8 a8 \tuplet 3/2 {f \downbow g \downbow gs} 
  a8 f' \tuplet 3/2 {g8 f e} \tuplet 3/2 {d c bf}
  a4 r a4
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #6  
  r8 e'16(-4 d)-2 cs8[ d] cs d
  ef d c[-4 bf] a \downbow g \downbow
  fs a c[ ef] fs a
  g16( a g8) \parenthesize d8 bf8 g[ f]
  e g bf[ d] g a
  \set TabStaff.minimumFret = #7
  bf-4 g-1 ef[-1 bf]-1 g bf
  ef g a[ g] a g
  g16( a g8) f8[-3 d]-1 a4-1
  \tuplet 3/2 {f'8-2 \downbow g\3-4 f} \tuplet 3/2 {e-3 \downbow d-1 c-4} bf8-2 a-1
  \set TabStaff.minimumFret = #6
  gs4~-1 <gs-1 d'-3 f-2 b-4>2
  \set TabStaff.minimumFret = #5
  a,4~-0 <a-0 g'-1 cs-3 f-2>4. cs'8
  d4 a f-4 
  d8-1 }
  \break
    \mark \markup{ \box{\fontsize #2 B}}
    \set TabStaff.minimumFret = #4
    r8 \tuplet 3/2 { a''8(-2 bf) a } gs8 a
    bf a g\2[-4 f\2] e\2 d\3
    \set TabStaff.minimumFret = #5
    \set TabStaff.restrainOpenStrings = ##t
    cs e g[ bf] a cs,
    \tuplet 3/2 { e8( f) e } \tuplet 3/2 {d cs d } \tuplet 3/2 { e f g }
    a4 \tuplet 3/2 { a8(-1 bf a) } gs8\1-1 a-1
    bf e, f[ g] cs, d 
    e f g[ a] bf c
    \tuplet 3/2 { bf( c bf) } bf gs\1-1 a4-1
    r4 \tuplet 3/2 { a8( bf a) } g f 
    ef f g[ a] bf c
    \tuplet 3/2 {bf16( c bf) } a8 g[ f] e bf'
    \tuplet 3/2 {a8( bf a) } f d a4
    r8 e' f[ g] f g
    \tuplet 3/2 {f8( g f) } e d c4
    b\3-1 r8 f'-3 f[ f]
    f4. ds8\2 e4
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
    cs e g[ bf] a f
    %\set TabStaff.minimumFret = #0
    d4 a f 
    d8 \bar "||" \break
    \mark \markup{ \box{\fontsize #2 A}}
    f'8-2 \tuplet 3/2 {g8-4 \downbow f e} \tuplet 3/2 {d \downbow c bf}
    a4 r8 a8 \tuplet 3/2 {f g gs} 
    a8 f' \tuplet 3/2 {g8 f e} \tuplet 3/2 {d c bf}
    a4 r2 r2.
    \set TabStaff.minimumFret = #5
    \tuplet 3/2 {d'4-4 cs c~} 8 b
    bf16( c bf8)~ 8 a g f
    f16 g f8~ 8 e \tuplet 3/2 {e f fs} 
    g4 r4 \parenthesize f,4-1
    \set TabStaff.minimumFret = #9
    \tuplet 3/2 4 {gs8-3 a cs e g bf cs d ef}
    e4 \tuplet 3/2 4 {d8 e d cs e cs}
    \set TabStaff.minimumFret = #8
    bf cs bf[ g]-1 bf-4 g
    \set TabStaff.minimumFret = #5
    e-1 g-4 e[ cs]-1 e\3-4 cs
    \set TabStaff.minimumFret = #5
    a-3 gs g[-1 a] cs e
    g bf a[ g] f e
    g fs f16([ g) f8] d c
    b4\3-1 r2
    \tuplet 3/2 4 { \repeat unfold 18 <d f b e>8 }
    4 r <cs e bf' ef>8 8 
    <d f b e>4 r8 ef'16(-3 \downbow d) cs8 d
    \set TabStaff.minimumFret = #9
    ef8 \downbow d c[-4 bf] a g
    fs a c[ ef] d fs,
    \tuplet 3/2 4 {a8( bf a) g fs g a bf c }
    d4 r8 d8-1 e f
    e16( \downbow f e) d cs8[-1 d] bf g
    e g bf[ d]-1 e-3 f
    d16( e d8) a[ f] d c
    b-1 d f[ a] d ef
    e \tuplet 3/2 {d16( e d)} cs8 bf \tuplet 3/2 { a8( bf a)}
    g8 f e[ g] f e
    \tuplet 3/2 4 {d8 cs d f f f a a a }
    d4 \bar "||" \break
    \mark\markup{ \box{\fontsize #2 C}}
    \key d \major
    r8 a8-2 b d
    \tuplet 3/2 { cs( d cs) } b8[ a] fs d
    \tuplet 3/2 { cs( d cs) } b8 d \tuplet 3/2 {fs a bf}
    b2. 
    r4 a8[ b] cs d
    cs16( d cs8)~ 8[ 8] d cs
    \set TabStaff.minimumFret = #7   
    c16(-1 cs-2 c8)~ 8[ 8] cs c
    b16(-1 c-2 b8)~ b2
    \set TabStaff.minimumFret = #9
    r2 \tuplet 3/2 {e8 ef d}
    cs b \tuplet 3/2 {a( b a)} g8 e
    cs a \tuplet 3/2 {gs( a gs)} g gs
    a2.
    r4 \tuplet 3/2 4 {cs'8-1 d ef e d cs
                      d\2-4 cs\2 \set TabStaff.minimumFret = #10
    b cs-4 b-2 a-1 b-4 a-2 
    \set TabStaff.minimumFret = #8
    g-1 }
    a8 g fs[-3 \set TabStaff.minimumFret = #9
     e]-1 f f
    bf4 b2
    a4 r8 8-2 b d
    \tuplet 3/2 { cs8( d cs) } b8[ a] fs d
    \tuplet 3/2 { cs( d cs) } b d \tuplet 3/2 { fs a bf }
    b2.
    \set TabStaff.minimumFret = #11
    r4. c16(-3 b) bf8[ b]
    c8 b a[ g] fs e
    ef fs a[ c] ef fs
    \tuplet 3/2 { e8( fs e) } b[ g] e d
    cs e g[ b] e fs
    \tuplet 3/2 { e( fs e) } d[\1-1 bf] g-3 e\3-1
    \set TabStaff.minimumFret = #9
    g-4 bf d[ ef] e cs
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
    \tuplet 3/2 4 {gs8-3 a-4 cs e g bf cs d ef}
    e4 \tuplet 3/2 4 {d8 e d cs e cs}
    \set TabStaff.minimumFret = #8 
    bf8-1 cs\2-4 bf[ g]-1 bf-4 g
    \set TabStaff.minimumFret = #6
    e-1 g\3-4 e[ cs] e cs
    \set TabStaff.minimumFret = #5
    a gs g[-1 a] cs e
    g bf a[ g] f e
    g fs f16[( g) f8] d c
    b4\3-1 r2
    \set TabStaff.minimumFret = #5
    \tuplet 3/2 4 {f'8(-2 \downbow g)-4 a-1 b(-3 \upbow a)-1 g-4 \downbow f( \downbow g) a \downbow
                   b(-3 \upbow a)-1 g-4 \downbow f(-2 \downbow g)-4 a b( a) g 
                   f(-2 g-4) f } d[-4 c]-2 b\3-1 d-4
    f-1 a\2-2 d[-1 ef]-2 d ef
    \set TabStaff.minimumFret = #9
    \tuplet 3/2 4 {d( \downbow ef) d \upbow c-4 \downbow bf a c bf a 
                   g-3 fs-2 g a-1 bf c d ef f
                   ef( f ef)~ } ef8 cs\1-1 d4-2
    r8 fs, g[ bf] d f
    e16( \downbow f e) d \upbow cs8[\1-1 d] bf g
    e\3 g bf[ d] e-3 f-4
    d-1 d a[ f] d-3 c-1
    b\4-1 d f[ a] d ef
    \set TabStaff.minimumFret = #9
    e \downbow \tuplet 3/2 { d16( \upbow e d) } \tuplet 3/2 4 {cs8-1 cs bf-4 a(-2 \downbow bf-3 a) }
    g f e[ g] f e
    \tuplet 3/2 4 { d8-4 cs-3 d f-2 f f a-2 a a}
    d4 r2
   \bar "|."
}


chrdStrophe = \chordmode {
  s2 s8
  d2.:m s s s
  d:m s g:m6 s
  a:7 s s  s
  a:7 s d:m a8:7
  s2. a:7 s d:m a8:7
  s8 s2
  d2.:m s s s 
  d:7 s g:m6 s
  ef s d:m s
  e:7 a:75+ d2:m a4:7
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
  d:7 s g:m6 s
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
      #(layout-set-staff-size-with-jazz 20) 
    \omit Voice.StringNumber 
  }

  }
}
