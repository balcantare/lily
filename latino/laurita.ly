\version "2.24.2"
sheetComposer = "Richard Galliano"
sheetName = "Laurita"
\include "../include/book.ily"


Notes = \relative c'''{
  \time 3/4
  \key c \major
  \once\override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #4 A}}
  g8 f g f c a | af4 g' gf | f8 e f e b g | f4 e' ef \break |
  d4. cs8 d cs | c2 gs4 | b a c | e2. \break |
  g8 f g f c a | af4 g' gf | f8 e f e b g | f4 e' ef \break  |
  d4. c8 b a | gs e e' d c b | a2. ~ | a2. \bar "||" \break
  \mark \markup{ \box{\fontsize #4 B}}
  <<
    {\voiceOne
     c2( ~ c8 d | c4 b2) | b4.( c16 b as b d c | b2 a4) \break |
    }
    \new Voice { \voiceTwo
                 e8 e c' a f e | ef8 d ef b' a4 |
                 d,8 d b' gs e d | c b c b' a e |
    }
  >>
  g'8 f a, b c d | f e gs, a b c | e ds g, fs a d | c2. \break |
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

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = "Walzer"
  }
  \score {
    <<
    \new ChordNames { \Chords }
    \new Staff <<
      \new Voice = "Strophe" { \Notes }
      >>
    >>
  }
}
