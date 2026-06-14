\version "2.24.2"
sheetName = "Sinti Swing 11"
sheetComposer = "Sinti Swing"
\include "../include/book.ily"


strophe = \relative c'' {
  \accidentalStyle modern
  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #4 A}}
  e4. d8 c8 b4 a8~
  8 a'4 gs8~ 8 a4.
  f4. e8 d8 e4 f8~
  f2. r4 \break
  d4. c8 b8 a4 g8~ 
  g8 g'4 fs8~ fs8 g4.
  e4. d8 c d4 e8~
  e2. r4 \break
  e4. d8 c8 b4 a8~
  8 a'4 gs8~ 8 a4.
  f4. e8 d8 e4 f8~
  f2. f4 \break
  e4 c8 a~ a2
  e8 e ds e c'8 b4 a8~
  a2 r2
  r1
  \bar "||"
  s2
  \mark \markup{ \box{\fontsize #4 A}}
  s2
  \bar "||"
  \break
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #4 B}}
  g4. fs8 g8 a4 b8~ 
  b8 e4. ds4 e
  a,4 a2. r1 \break
  g4. fs8 g8 a4 b8~ 
  b8 e4. ds4 e
  a,4 a2. r1 \break
  f'4. e8 d e4 f8~
  f4 f2 d4
  e4. d8 c d4 e8~
  e4 e2 c4 \break
  b8 ds fs a~ a8 a4.
  b,8 ds fs a~ a8 a4.
  gs4. f8 e8 d4 e8~ 
  e2. r4
  \bar "||"
  s2
  \mark \markup{ \box{\fontsize #4 A}}
  s2
  \bar "|."
}

chrdStrophe = \chordmode {
  a1:m6 a:7 d:m7 s 
  g g:7 c:6 e:7
  a1:m6 a:7 d:m7 s 
  a:m6 e:7 a:m6 s s
  g:7 s c:6 s
  g:7 s c:6 a:7
  d:m7 s a:m6 s
  b:7 s e:7 s 
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = "|AABA|"
  }
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
