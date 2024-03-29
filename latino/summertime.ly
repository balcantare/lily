\version "2.19"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\language "english"

title = #"Summertime"
composer = #"Gershwin"
meter = #"Larghetto"
instrument = #"for Pegueri Bandoneon"

#(define-markup-command (arrow layout props) ()
   "Draw an Arrow."
   (interpret-markup layout props
     #{\markup \overlay {
        \override #'(thickness . 3)
        \translate #'( 0 . 1.82)\draw-line #'(-1.5 . 0)
        \translate #'( 1.3 . 1.8)\arrow-head #X #RIGHT ##f
        }
     #}
    ))

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 6)
                             (padding . 1))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \line{
        #title \hspace #1
        - \hspace #1 \fromproperty #'page:page-number-string
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}


realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
            \override #'(offset . 7)
            \override #'(thickness . 6)
            \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}
\header {
  title = \realBookTitle
  subtitle = #instrument
  tagline = ##f
}

BandR = \relative c'' {
  %\set Score.markFormatter = #format-mark-box-alphabet
  \key d \minor
  \time 6/8
  \partial 2
  \accidentalStyle modern
  a4 f
  %\mark \markup{ \box{\fontsize #4 A}}
  \repeat volta 2 {
    a2.~ a2.~
    a4 g f
    g a f
    d2. a~ a~
  }
  \alternative {
    { a4 a' f
      g2.~ g~
      g4 f d
      f d f
      e2.~ e~ e~ e4 a f} %\break
    { a,4\repeatTie a2
     c4 a c
     d2 f4
     a4 g2~ g f4
    d2.~ d~ d~ 4 a'4 f}
  }  \break
  \repeat volta 2 {
    d4. a8 d e
    f4. e8 f g
    a4. gs8 a bf
    a4. a8 cs e
    d4. cs8 d e
    f4. e8 f g
    a4. gs8 a bf
  } \alternative {
   { a4. a8 bf a
     bf4. a8 g f
    g4. f8 e f
    e4. d8 cs d
    e4. d8 cs d
    a'4. e8 a e
    cs4. a8 cs a
    g4. f8 g f
    e4. d8 cs e
   }
   { a'4. c8 bf a
     a4. f8 g a
     f4. d8 e f
     g4. f8 e f
     e4. d8 cs  e
     d4. a8 f e
     e4. d8 cs d
     e4. d8 cs d
     e4. d8 cs d
   }
  } %\break %\pageBreak
  \repeat volta 2 {
    d4 a' a
    a a bf
    a2.-\prall
    g4-\prall f4 g
    a f f
    f-\prall e d
  } \alternative {
    { a2.
      d4 f a
      g4 g g
      g g g
      g2.-\prall
      f4-\prall e f
      a e e e e f
      g2.~ g4 f e
    }
    { a,2.
      a'4 d f
      a f g
      a2 f8 g
      a4 g f
      e-\prall d c
      d2.~ d~ d~ d4 a f }
  } \break
  \repeat volta 2 {
    a2.~ 4 g f
    g2.~ 4 a f
    d2.~ d2.
  } \alternative {
    { a2.~ 4 a' f
     g2.~ 2. f2.~ 4 e4 d
    a'2.~ 2. r2. r4 a4 f}
    { a,2.~ 4 r a
    c a c d2 f4
    a4 g2~ 2 f4
    d2.~ d~ d~ d4 a' f}
  }
  \repeat volta 2 {
    <<
      {\voiceOne
     a2.~ a~ a4 g f
     g a f }
     \new Voice {\voiceTwo
       r4 d e f e d
       e2.~ e
     }
    >>
    \oneVoice
     d2.~ d

  } \alternative {
    { a~
      a4 a' f
      g2.~ g
      f~ 4 e d
      e2.~ e~ e r4 a f
    } {
      a,2. ~a4
      r4 a
      c2. a2 c4
      d2 f4
      a2. g2.~ 2 f4
      d2.~ d~ d
    }
  }


  %\%bar "|."
}

LeftPartA = {}

BandL = {
  \key d \minor
  s4 s4
  \accidentalStyle modern
  <<
   % \override Fingering.staff-padding = #'()
    \relative c, { \voiceOne
       d2. e f  a d c b bf
       g a
       bf b a g f e
       bf' f d g a d c b bf
    }
    \relative c \new Voice {\voiceTwo
       s4. <f a>
       s4. <g bf>
       s4. <d a'>
       s4. <g cs>
       \repeat unfold 3 { s4. <f d'> }
       s4. <a d>
       \repeat unfold 3 { s4. <d, bf'> }
       s4. <d gs>
       s4. <e cs'>
       s4. <e cs'>
       s4. <d a'>
       s4. <cs a'>
       s4. <f d'>
       s4. <c a'>
       s4. <f a>
       s4. <d bf'>
       s4. <g cs>
       \repeat unfold 3 { s4. <a f'> }
       s4. <f d'>
    }
   >>
   <<
   % \override Fingering.staff-padding = #'()
    \relative c, { \voiceOne
       d2. e f  a d c b bf
       g a
       bf gs a g f e
       bf' f d g a d c b bf
    }
    \relative c \new Voice {\voiceTwo
       s4. <f a>
       s4. <g bf>
       s4. <f a>
       s4. <g cs>
       \repeat unfold 3 { s4. <a d> }
       s4. <d, a'>
       s4. <d bf'>
       s4. <e c'>
       s4. <f d'>
       s4. <f b>
       s4. <e cs'>
       s4. <e cs'>
       s4. <d a'>
       s4. <cs g'>
       s4. <f d'>
       s4. <e a>
       s4. <f a>
       s4. <d bf'>
       s4. <g cs>
       \repeat unfold 3 { s4. <a f'> }
       s4. <f d'>
    }
     >>
     <<
   % \override Fingering.staff-padding = #'()
    \relative c, { \voiceOne
       d2. e f  a d c b bf
       g a
       bf gs a g f e
       b' bf a d g, a d c b bf
    }
    \relative c \new Voice {\voiceTwo
       s4. <f a>
       s4. <cs g'>
       s4. <d a'>
       s4. <e cs'>
       s4. <a f'>
       s4. <a f'>
       s4. <d, a'>
       s4. <d a'>
       s4. <d bf'>
       s4. <e c'>
       s4. <f d'>
       s4. <f b>
       s4. <e cs'>
       s4. <d bf'>
       s4. <d a'>
       s4. <cs g'>
       s4. <f d'>
       s4. <f d'>
       s4. <e c'>
       s4. <f d'>
       s4. <d bf'>
       s4. <e c'>
       \repeat unfold 4 { s4. <a f'> }
    }
     >>
  \relative c, {
    \oneVoice
    r4 d' e
    f e d
    r a b cs2.
    r4 d e f e d
    r4 e f g f e
    r4 g a bf a g
    r4 b d f e d
    r4 a, cs e g bf
    a g f e d cs
    %%
    r4 f g a g f
    r4 f e d c bf
    g2 a4 bf2.
    d4 e f a g f
    d2.~ 4 r2
    %%
    d,2. f cs a'
    << {\voiceOne
       r4 f' g a g f
       r e f g f e
       r bf' c d c bf
       r f g af g f
       r cs d e f g a g f
       e2.
       %%
       r4 e f g f e
       r4 f g a g f
       r g a bf a g
       r e f g f e
       r d e f g e
       f2.
       }
       \relative c, { \new Voice {
         \voiceTwo
     d2. f cs a'
     g bf gs b a~ a s s
     %%
     cs, a' f d bf' g a~ a d,~ d~ d
       }}
    >>

  }
  \bar "|."

}

Chords = \chords {
  %\set chordChanges = ##t
  s2 |


  d2.:m e2.:dim d2.:m/f
  a2.:7
  \set chordBassOnly = ##t
  d:m d:m/c d:m/b bf:7+
  g:m g:m/a g:m/bf
  b:dim
  a a:/g
  \set chordBassOnly = ##f
  d:m/f a:7/e
  % alt
  bf
  f d:m g:m a:7 d:m
  d:m/c d:m/b d:m/bf

  d2.:m e2.:dim d2.:m/f
  a2.:7
  \set chordBassOnly = ##t
  d:m d:m/c d:m/b bf:7+
  g:m a:m bf
  gs:dim
  a a:/g
  \set chordBassOnly = ##f
  d:m/f a:7/e
  % alt
  bf
  f:7+ d:m g:m a:7 d:m
  \set chordBassOnly = ##t
  d:m/c b:dim bf
\set chordBassOnly = ##f
  d2.:m a:7/e d2.:m/f
  a2.
  \set chordBassOnly = ##t
  d:m d:m/c d:m/b bf:7+
  g:m a:m bf
  gs:dim
  \set chordBassOnly = ##f
  a g:m d:m/f a:7/e
  % alt
  b:dim
  bf
  a:m bf g:m a:m d:m
  \set chordBassOnly = ##t
  d:m/c d:m/b d:m/bf

}
\score {
  \new GrandStaff <<
    \Chords
    \new Staff = "up" {
      \BandR
    }
    \new Staff = "down" {
      \clef bass
      \BandL
    }
  >>
}