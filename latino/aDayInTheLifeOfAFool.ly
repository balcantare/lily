\version "2.19"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

%\language "english"

title = #"A Day In The Life Of A Fool"
composer = #"Luiz Bonfa"
meter = #"Slow Bossa Nova"
%instrument = #"for Pegueri Bandoneon"

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  system-count = 9
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
        \mark \markup{ \box{\fontsize #4 A}}
	\partial 2 s2 |
        %	\myMark "A"

	a1:m | b2:m7.5- e:7.9- | a1:m | b2:m7.5- e:7.9- |
	a1:m | d2:m7 g:7 | c1:maj7 | e2:m7.5- a:7.9- |
	d1:m7 | g:7 | c:maj7 | f:maj7 |
	b:m7.5- | e:7.9- | a:m | b2:m7.5- e:7.9- |

\mark \markup{ \box{\fontsize #4 B}}
	%\myMark "A'"

	a1:m | b2:m7.5- e:7.9- | a1:m | b2:m7.5- e:7.9- | \break
	e1:m7.5- | a:7.9- | d1*2:m |\break
	d2:m d:m/c |
	b:m7.5- e:7.9- | a:m a:m/g | f1:maj7 | \break
	b:m7.5- | e:7 | a2:m d:m7 | a2:m \bar ":|." \break s2


	%\myMark "B"
\mark \markup{ \box{\fontsize #4 Coda}}

	d2:m7 a:m7 | d:m7 a:m7 | d:m7 e:m7 | a1*2:m6 |

}

Notes = \relative c'{
	%\tempo "Moderato" 4 = 120
	\time 4/4
	\key c \major

	\partial 2  r4 e4 |

	%% part "A"
	c'2~ \tuplet 3/2 { c4 b a } | a2~ \tuplet 3/2 { a4 gis b } | e,1~ | e2 r4 e4 |
	c'2~ \tuplet 3/2 { c4 b a } | a2~ \tuplet 3/2 { a4 g b } | e,1~ | e2 r8 e f g |
	a4. d,8 d2~ | d r8 d e f | g4. c,8 c2~ | c r8 c d e |
	f4. b,8 b2~ | b \tuplet 3/2 { b4 c d } | e1~ | e2 r4 e |

	%% part "A'"
	c'2~ \tuplet 3/2 { c4 b a } | a2~ \tuplet 3/2 { a4 gis b } | e,1~ | e2 r4 e4 |
	bes'2~ \tuplet 3/2 { bes4 a g } | g2~ \tuplet 3/2 { g4 f e } | a1~ | a |
	r4 d, \tuplet 3/2 { d e f } | b1 | r4 c, \tuplet 3/2 { c d e } | a2. g4 |
	e1~ | e2 \tuplet 3/2 { e4 gis b } | a1~ | a2

	%% part "B"
	\tuplet 3/2 { r4 a b } |
	\tuplet 3/2 { c d c } \tuplet 3/2 { b a b } | \tuplet 3/2 { c d c } \tuplet 3/2 { b a b } |
	\tuplet 3/2 { c d c } \tuplet 3/2 { b a g } | a1~ | a2. \bar "|."
}

Lyrics = \lyricmode {
	%% part "A"
	A Day __ In The Life __ Of A Fool, __
	a sad __ and a long, __ lone -- ly day, __
	I walk the av -- e -- nue __ and hope I'll run in -- to __
	the wel -- come sight of you __ com -- ing my way. __

	%% part "A'"
	I stop __ just a -- cross __ from your door __
	but you're __ nev -- er home __ an -- y -- more. __
	So back to my room and there in the gloom
	I cry __ tears of good -- bye. __

	%% part "B"
	'Til you come back to me,
	that's the way it will be
	ev -- 'ry day in the life of a fool. __
}

\score {
  <<
    \new ChordNames \Chords
    \new Voice = soloist \Notes
    \new Lyrics \lyricsto soloist \Lyrics
  >>
  \layout {
    \override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
    \override Score.KeySignature #'break-visibility = #'#(#f #f #f)  % make only the first time signature visible
    \override Score.SystemStartBar #'collapse-height = #1  % allow single-staff system bars
  }
}