\version "2.19"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

\language "english"

title = #"Chiquilin de Bachin"
composer = #"Astor Piazolla"
meter = #""
%instrument = #"for Pegueri Bandoneon"

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  %system-count = 9
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
  \once\override Score.RehearsalMark.self-alignment-X = #2
  \mark \markup{ \box{\fontsize #4 I}}
  a2.:7 | d:m | g:7 | c:7+ | f:7+
  b:m5-7 | e:7 | a:m | s2.*3 |

  a2.:m | a:m/g | a:m/fs | a:m/f |
  d:m | g:7 | bf:7.5- | a:7 | d:m |
  g:7 | c | f | b:m7.5- | f:7 | e:7 | s |

  a:m | a:m/g | a:m/fs | a:m/f |
  d:m | g:7 | bf:7.5- | a:7 | d:m |
  g:7 | e:m | a:m | fs:m5- | b:7 | e:7 | s |


  a:m |  a:m/g | a:m/fs | a:m/f | b |
  e | bf:6.5- | a:7 | d:m | g:7 | c:7+ |
  f:7+ | d:m | f:7 | e:7 | s |

  e:7 | a:m

}

Notes = \relative c''{
  \time 3/4
  \key a \minor
  r8 bf bf a a g | g4 f e | d e f | g e d | c d e | %\break
  f d c | b c4. b8 | a2. ~ | a2. ~ | a2. ~ | a2 \bar "||" \break
  \once\override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #4 A}}
  \repeat volta 2 {
  \bar ".|:" e'8 d |
  c4 c c8 b | a4 a e'8 d | c4 c c8 b | a2 a'8 g | f4 f f8 e | %\break
  d4 d g8 f | e4 e e8 d | cs2. | \break
  g'4. f8 e d | %\break
  c4 b2 | f'4. e8 d c | b4 a2 | e'4. d8 c b | a4 b2 |% \break
  e2. ~  | e2  \bar "||" \break
  \once\override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #4 B}}

  e8 d | c4 c c8 b | a4 a e'8 d | c4 c c8 b | a2 a'8 g |
  f4 f f8 e | d4 d g8 f | e4 e e8 d | cs2. | \break
  a4. f'8 e d | a4 b2 | b4. g'8 fs e | b4 c2 |
  c4. b'8 a g | fs4 g a8 fs | b2. ~ | b2 \bar "||" \break
  \once\override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #4 C}}

  c8 c | c2 b8 a |
  c4 b a | c2 b8 a | c4 b a | c2 b8 a |
  a4 gs b | e,2.~ | e8 bf'8 bf a a g | \break
  g4 f e | d e f | g e d | c d e | f d c }
  \alternative{
    { b4 c d | e2. ~ | e2 }
    {
\once\override Score.RehearsalMark.self-alignment-X = #-1.2
        %\once\override Score.RehearsalMark.Y-offset = #-5
        \mark \markup{ \box{\fontsize #4 Coda}}
      b2 c8 c | }
  }



  a2. ~ a2. ~ a2. ~ a2. \bar "|."

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