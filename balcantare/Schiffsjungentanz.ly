\version "2.22.2"
sheetName = "Schiffsjungentanz"
\include "../include/book.ily"

strophe = \relative c'' {
  %\voiceOne
  \time 2/4
  \key g \major
   \mark \markup{ \box{\fontsize #4 I}}
   \acciaccatura e8 d8 8 8 8
   \acciaccatura e8 d8 8 8 8
   d16( cs d e ) d( cs d e)
   d8 r4 \break
   \mark \markup{ \box{\fontsize #4 A}}
   \repeat volta 2 {
    g16( fs
    g8)-. d d d16( c) |
    b16( d g8) g a16( gs
    a8)-. d, d d16( cs)
    d16( fs a8) a e16 fs
    g16 fs e d e d c b
    c b a g a g fs e
    d e fs g a b c a
    b8 g g } \break
   \mark \markup{ \box{\fontsize #4 B}}
   \repeat volta 2 {
    d'16( c)
    b16( d g d) b( d g d)
    e8 c c e16( d)
    cs16( e a e) cs( e a e)
    fs8 d d e16 fs
    g16 fs e d e d c b
    c b a g a g fs e
    d e fs g a b c a
    b8 g g } \break
   \mark \markup{ \box{\fontsize #4 C}}
   \repeat volta 2 {
     \key c \major
     r8
     e8( g) g8( c)
     c8( e) <c e>4
     g'16( fs g a) g( fs g a)
     g8 f <b, d>4 \break
     g8( b) b( d)
     d( g) <b, g'>4
     g'16( fs g a) g( fs g a)
     g8 e c4 \break
     g8( c) c( e)
     e( g) <c, e g>4
     a8( c) c( f)
     f( a) <c, f a>4
     g'16( d b d) g( d b d)
     g( e c e) g( e c e)
     g f e d c b a b
     c8-> c-> c->
   }
    %\bar "|."
}

chrdStrophe = \chordmode {
  d2 g d s
  g2 s d s
  c4 e:m
  a:m d
  d2:7 g
  g c
  a d
  c4 e:m
  a:m d
  d2:7 g
  c2 s s g
  g s s c
  c s f s
  g c g c4
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.5))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 24)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
