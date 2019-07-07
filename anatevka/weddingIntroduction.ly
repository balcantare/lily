\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Wedding Introduction"
sheetNr   = #"13"

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
    '(1 5 17 25 )) #f))))


BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \set Score.currentBarNumber = #1
    %\override ParenthesesItem.font-size = #4
    \time 3/2
    \key d \major
    \mark "Allegretto-In3"
    r2 r2 r4 a'--\mp | a2-- <d fs>1-- | r2 r2\fermata r4 a-- |
    a2 <d fs>1 \breathe |
    \bar "||"
    e4(\mp fs g2) g--\mf |
    fs4( e d\< fs g a)\! |
    b( a g\> fs ~ fs2)\! |
    e2( d1) |
    b'2( a1) |
    g2( fs e) | e( fs g) |
    fs4( e d fs g a) |
    b1( a2) |
    b4( a g2 fs) |
    e2( d1) |
    e2( d1) |
    \bar "||"
    \time 4/4 \key f \major
    \mark "March-In4"
    f,4\f a8 bf c c c c |
    ef8 \tuplet 3/2 {d16( ef d)} c8 bf a4 c |
    f,8 a bf c d4 c |
    g4 g b8 c d4 |
    g,4 b8 c d d d d  |
    g8-> \tuplet 3/2 {f16( g f)} e8 d b c d4 |
    g,4 b8 c d4 d |
    f8-> \tuplet 3/2 {e16( f e)} d8 c bf a c g |
    \bar "||"
    \time 4/4
    \mark "Allegretto"
    r8 c8( ef af bf c) c,( ef |
    af bf c) c,( ef af bf c)
    \time 3/4
    \repeat unfold 2 { c,8([ ef] af bf4 c8) }
    c,8( ef af bf c4)
    c,8([ ef af bf] c8)\fermata r8
    \bar "|."

  }
}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \key d \major
    r1. r1. r1. r1.
    d1 d,2 | d'2. d,2.
    \repeat unfold 4 { d'1 d,2 |}
    d'2 d,1 | d'2. d,2. | d'2 d,1
    \repeat unfold 3 { d'1 d,2 |}
    \key f \major
    \repeat unfold 2 {<f, c' a'>4-> r r <f c' a'>4-> |}
    <f c' a'>4-> r <f c' a'>4-> 4-> |
    \repeat unfold 3 {<g d' b'>4-> r r <g d' b'>4-> |}
    <g d' b'>4-> r <g d' b'>4-> 4-> |
    <f c' a'>4-> r <f c' f>4-> r |
    \bar "||"
    df'2 af'4 df, ~ | 4 bf' df, af' |
    \time 3/4
    df,4  bf' af | bf af df, | bf' af df, | bf' af df,8\fermata r |
  }
}

Chords = \chords {
  %\set chordChanges = ##t
  s1. s2 d1 s1.
  s2 d1 s1.*12
  f1 s1*2
  g1 s1*3
  f1

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

