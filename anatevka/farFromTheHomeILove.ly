\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Far from the Home I love"
sheetNr   = #"26"

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
  page-count = #1
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
        \hspace #1 - \commitDate
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1 5 13 21 25 29 37 41 43 47 56  )) #f))))


BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \set Score.currentBarNumber = #1
    %\override ParenthesesItem.font-size = #4
    \key c \minor
    r4 c''8(-5 d-2 ef-3 c-5 g-4 f)-3 |
    ef(-2 g-5 ef-4 bf-3 g2-2) |
    af8(-2 c-3 ef4)-4 df8(-2 f-3 af4)-4 |
    g8(-2 b-3 df2-4 b4)-3\fermata \bar "||"
    \time 2/2
    r4^"In2" c8(-5 d-2 ef-3 c-5 g-4 f)-3 |
    ef(-2 g-5 ef-4 bf-3 g2)-2 |
    af8( c ef4) df8( f af4) |
    g8(-2 b-3 df2-4 b4)-3
    r4 c8(-5 d-2 ef-3 c-5 g-4 f)-3 |
    ef(-2 g-5 ef-4 bf-3 g2)-2
    f2( g)
    r1
    \break
    \key c \major
    \bar "||"
    <e b'-\balloonText #'(-0.5 . 1.5) \markup {"vl"}>4-- 2-- 4--
    <g d'>-- 2-- 4--
    <f c'>-- 2-- 4--
    <b, b'>-- 2-- 4--
    <e b'>-- 2-- 4--
    <g d'>-- 2-- 4--
    <f c'>2( <b, b'>2)
    r4 g'8( a b a g fs)
    c2( b) | b1 | c |
    r4 <b e>8( <d g>) <d g>( <e b'>) <e b'>( <g d'>)
    \time 4/4
    \set fingeringOrientations = #'(right)
    <a-2 e'-3 c'-5>4( r <g d' b'> r <f c' a'> r <e b' g'>) r
    <f c' a'>( r <g d' b'>) r|
    <a e' c'>2 cs'4(-5 d)-4
    \bar "||"
    \key c \minor
    \time 2/2
    \repeat unfold 3 { <ef,, g>4( <ef g>2 <ef g>4) }
    <f g>4( 2 4)
    <ef g>4( 2 4) <ef g>4( 2 4)
    <f af>2( <f g>)
    r1
    \break
    \bar "||"
    \key c \major
    \repeat unfold 3 r1
    r2 r8 g'(-2 c-5 d-2 |
    \bar "||"
    \key c \minor
    ef4)-3 c8(-5 d-2 ef-3 c-5 g-4 f)-3 |
    ef(-2 g-5 ef-4 bf-3 g2)-2
    \time 4/4
    af4( bf8 af g4 f) |
    r4 <c-4 ef-2>( <e-2 g-3>8) r r4 |
    <d-2 f-3>2( <df-5 f-3>)\fermata |
    <c-4 ef-2>4 ~ 8 r r2 |
    \break
    \bar "||"
    a'4 a a-- g8( a) | b4 b b a8( b) |
    c4-- c-- c-- b8( c) | d1-- |
    e4( c) d( b) | c( a) b2 |
    c4( a) b( g) | a2( f) \fermata |
    r1
    \break
    \bar "||"
    \key g \minor
    r4 <g bf>2.
    f2( d) | ef2.( g4) |
    af2. c4 | bf2 c\fermata |
    r1
    r2 r4 r8 a(-2 | bf)-3 cs(-2 d)-3 fs-4 <bf,-2 d-3 g-5>4--\fermata r
    \bar "|."
  }
}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \key c \minor
    s1*10
    \set fingeringOrientations = #'(right)
    <d,-2 af'-4 c-5>2 <g,-3 ds'-2 b'-5>
    r1
    \key c \major
    \bar "||"
    <c b'>4 2 4
    <e b'>4 2 4
    <d a'>4 2 4
    <g, f'>4 <g ef'>2 <g d' >4
    <c b'>4 2 4
    <e b'>4 2 4
    <d a'>2
    << { g,2 } \new Voice { \voiceOne e'4 d} >>
    \oneVoice
    r4 e8( f g f e ds)
    a'2( g) | g1 | a | r1 |
    f'4 r e r | d r c r | d r e r | f1 |
    \bar "||"
    \key c \minor
    \set fingeringOrientations = #'(right)
    <c,-2 c'-5>4 2 4
    <ef-2 bf'-4>4 2 4
    <af,-3 c'-5>4 2 4
    <g-2 b'-4>4 2 4
    <c-2 c'-5>4 2 4
    <ef-2 bf'-4>4 2 4
    <d-2 c'-5>2 <g,-3 b'-4>
    r1
    \bar "||"
    \key c \major
    s1*4
    \key c \minor
    s1*3
    r4 <g'-2 c-4> <b-3 df-4>8 r r4
    <af-3 c-4>2 <g-2 b-3> | <g-2 c-4>4 ~ 8 r8 r2
    \repeat unfold 8 s1
    g,1
    \key g \minor
    \clef treble
    r4 d''2. |
    d2( bf) | <g bf>2.( <bf ef>4) |
    <c ef>2. <ef af>4 |
    <c fs>2  <d af'> | r1 |
    g,8(-3 a-4 bf)-3 cs(-4 d)-3 fs(-5 g)-4 r8 | r1
  }
}

Chords = \chords {
  \set chordChanges = ##t
  c1:m | ef | af2 df | g1:5-.7 |
  c:m | ef | af2:7+ df:7+ | g1:5-.7 |
  c:m | ef | d2:m5-.7 g:7 | s1
  c:7+|e:m7| d:m7 | g:7
  c:7+|e:m7| d2:m7 g:7 |
  s1 | d2:m7 g:7 | c:7+ cs:m5-7 |d:m7 ds:m5-7 |e1:m7 |
  f2:7+ e:m7| d:m7 c:7+ | d:m7 e:m7 | f:7+ g:7 |
  c1:m | ef | af:7+ | g:5-7 | c:m| ef | d2:m5-7 g:7 | s1
  c:7+ | e:m7| d:m7 | g:7.13| c:m | ef|d2:m5-7 g:7 |
  c2:m cs:dim | d:m5-7 g:5-7 | c1:m
  d2:m7 g:7 | c:7+ cs:dim | d:m7 ds:dim |e1:m7 |f2:7+ e:m7|
  d:m7 c:7+| d:m7 e:m | f1:7+
  g | g:m | bf | ef:7+ | af | d:5-7 | a2:m5-7 d:5-7
  g1:m
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
    \new Staff = "up" \with {
      \consists "Balloon_engraver"
      \override BalloonTextItem #'annotation-balloon = ##f
    }
    {
      \BandR
    }
    \Chords
    \new Staff = "down"  {
      \clef bass
      \BandL
    }
  >>
}

