\version "2.19"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

\language "english"

title = #"Laurita"
composer = #"Richard Galliano"
meter = #"Ballad"
%instrument = #"for Pegueri Bandoneon"

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  system-count = 8
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
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
  tagline = ##f
}

Chords =
\chordmode {
  d2.:m7 | g:7 | c:7+ | f:7+
  b:m5-7 | e:7 | a:m | a:7.9-|
  d2.:m7 | g:7 | c:7+ | f:7+
  b:m5-7 | e:7 | a:m | s |

  a:m | fs:dim7 | f:dim7 | a:m/e |
  d:m7 | a:m/c | b:7 | e:7.5+ |
  a:m | fs:dim7 | f:dim7 | a:m/e |
  d2:m7 g4:7 | c2:7+ f4:7 | b2:7 e4:7 | a2.:m |

}

Notes = \relative c'''{
  \time 3/4
  \key c \major
  \once\override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #4 A}}
  g8 f g f c a | af4 g' gf | f8 e f e b g | f4 e' ef |
  d4. cs8 d cs | c2 gs4 | b a c | e2. |
  g8 f g f c a | af4 g' gf | f8 e f e b g | f4 e' ef |
  d4. c8 b a | gs e e' d c b | a2. ~ | a2. \bar "||" \break
  \mark \markup{ \box{\fontsize #4 B}}
  <<
    {\voiceOne
     c2( ~ c8 d | c4 b2) | b4.( c16 b as b d c | b2 a4) |
    }
    \new Voice { \voiceTwo
                 e8 e c' a f e | ef8 d ef b' a4 |
                 d,8 d b' gs e d | c b c b' a e |
    }
  >>
  g'8 f a, b c d | f e gs, a b c | e ds g, fs a d | c2. |
  <<
    {\voiceOne
     c2( ~ c8 d | c4 b2) | b4.( c16 b as b d c | b2 a4) |
    }
    \new Voice { \voiceTwo
                 e8 e c' a f e | ef8 d ef b' a4 |
                 d,8 d b' gs e d | c b c b' a e |
    }
  >>
  f8 g a b c d | ds e d c b a |
  \tuplet 3/2 {ds,8 e ds } d8 ds  c' b | a2. \bar "|."

}


\score {
  <<
    \new ChordNames \Chords
    \new Voice = soloist \Notes
  >>
  \layout {
    \override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
    \override Score.KeySignature #'break-visibility = #'#(#f #f #f)  % make only the first time signature visible
    \override Score.SystemStartBar #'collapse-height = #1  % allow single-staff system bars
  }
}