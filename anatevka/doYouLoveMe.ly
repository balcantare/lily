\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Do You Love Me"
sheetNr   = #"24"

bookTitle = \markup {
  \fontsize #3 \larger \larger
  \line { \box{ #sheetNr } #sheetName }
}
\header { title = \bookTitle  tagline = ##f }

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 0.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  %page-count = #1
  markup-system-spacing = #'((basic-distance . 2)
                             (minimum-distance . 2)
                             (padding . 1))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \line{
        \box{ #sheetNr } #sheetName \hspace #1
        - \hspace #1 \fromproperty #'page:page-number-string
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1 9 12 19 22 28 32 35 38  43 47 49)) #f))))


BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \time 2/2
    \key ef \major
    %\override ParenthesesItem.font-size = #4
    s2. b4(\pp |
    \set Score.currentBarNumber = #1
    af' g8 8 4 4 | 4 2 4 | 4 2 4 | 4 2) c,4(
    bf' af8 8 4 4) |
    \time 4/4
    af4(^"In4" cf bf af) | g2\fermata df\fermata |
    \bar "||"
    \key f \major
    << { \voiceOne \tiny r2 r4 c8 f |}
        \new Voice
        {\voiceTwo \normalsize c4--\mf\> c-- c2--\fermata\!}
    >>
    \oneVoice
    %\set Score.barNumberFormatter = #(double-bar-number 10)

    \tiny
    g'4 a r c,8 f | d'4 r r c,8 f | g4 a r c,8 bf'8 |
    \normalsize a,4( b2) r4 |
    r4 <c ef>2( <c d>4) r4
    <bf d>( << {\voiceTwo bf2)} \new Voice {\voiceOne df4 c} >>
    \oneVoice
    e2( d2) |
    r4 <c ef>2( <c d>4) |
    r4 d( df2) |
    r8 c'16( e df8 c <gf' bf>4 )
    \tiny c,,8 f
    g4 a r c,8 f | d'4 r r c,8 f | g4 a r c,8 bf'8 |
    \normalsize a,4( b2) r4 |
    r4 <c ef>2 <c ef>4 |
    r4 <bf d>( <bf df>2)
    r4 <a c> r <a c>\fermata
    r4 <c ef> <c ef>( <c d>) |
    b2( af'4) \breathe r4 \fermata
    r1 r1
    c,4( bf c bf) |
    c bf a ~ 8 r |
    r4 <df f> r <df ef> |
    r4 <c ef> r <c ef> |
    r4 <bf d>( <bf c>)\fermata \breathe \tiny c8 f |
    g4 a r c,8 f | d'4 r r8 c,8 c f | g4 a r c,8 bf'8 |
    \normalsize
    <b, a' ds>4 <c bf' e>2 \breathe r4 |
    r4 <c ef>2. |
    r4 <bf d>4( <bf df>2) |
    c4 d e f8 \breathe r |
    <a, c>4. \breathe r8 <c ef>4\fermata \breathe r4
    f4( bf bf2)\fermata
    af4( c c4.) r8 |
    c,2( bf4 ef | f--) f-- f-- f-- |
    f2( e8) \breathe r8  r4 |
    ef2( d) f2  c'16( f,) f8-- f4-- |
    r1 | r2 r8 c8( f4-.) |
    <f c' a'>2\fermata r
    \bar "|."
   }
}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    s1*12
    c2 c, |
    g'( fs) | f( e)
    e( d) | g( fs)\fermata
    g4 r g2 | r1
    s1*3
    c2 c, |
    g'( fs) | f( e)
    e( d)\fermata | a fs'
    g( f)\fermata \breathe
    f4( g f c) f( g f c) f( c f c)
    f( c2 ~ 8) r | af'2( g)
    g2( f) | f( e4)\fermata \breathe r4
    s1*3 r2 c|
    g'( fs) | f( e)
    f,2. ~ 8 \breathe r |
    a4.-- \breathe r8 d4\fermata \breathe r4
    g,2( c)\fermata
    f,4( a d4.) r8 |
    g,2 <c, e'>  | f4. r8 r2 |
    r1 r1 | g'2 r |
    <c, bf' e>1
    <f, c' a'>1 ~ 2 r


  }
}

Chords = \chords {
  \set chordChanges = ##t
  s1 ef1 s1
  df:7.9
  c:7 af/ef
  d:dim df:6.11+
  s1*4
  c1:7 | a2:m5-7 d:7 |
  g:m7 c:7 |
  f:7+ f:6/c  |
  a:m5-7 d:7 |
  g:m7 g:m5-7 |
  c1:7 |
  r1 s1*2 |
  c1:7 | a2:m5-7 d:7 |
  g:m7 c:7 | f:7+ f:6 |
  a:m5-7 d:7 | g4:m7 c:7.9- f2:m |
  s1*2
  f4:m c:7 f:m c:7 |
  f:m c:7 f2:7/c |
  bf:m7 ef:7 | af:7+ af:6/ef | g:m7 c:7 |
  s1*3 b4:7 c2.:7 |
  a2:m5-7 d:7-9 |
  g:m7 c:7-9 |
  f:7+ f:6 |
  a:m5-7 d:7 |
  g:m7 c:7 |
  f4:7+ a:m7 d2:7.9- |
  g:m7 c:7 | f1 | s1
  ef2 bf |
  g1:m5-7 |
  c:7.9- |
  f | f:6
}

\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override BarNumber.Y-offset = 0
    \override BarNumber.X-offset = 0
  }
}


\score {
  \new GrandStaff <<
    \new Staff = "up" {
      \BandR
    }
    \Chords
    \new Staff = "down" {
      \clef bass
      \BandL
    }
  >>
}

