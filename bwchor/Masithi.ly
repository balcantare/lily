\version "2.24.0"
sheetName = "Masithi"
sheetComposer = "S.C. Molefe"
\include "../include/book.ily"

lyrA = {
  \lyricmode {
    A -- men si -- ya ku -- du -- mi -- sa,
    A -- men si -- ya ku -- du -- mi -- sa,
    A -- men ba -- wo,
    A -- men ba -- wo,
    A -- men si -- ya ku -- du -- mi -- sa.
}}

lyrB = {
  \lyricmode {
   Se -- gen für dich auf dei -- nem Weg,
   Se -- gen für dich auf dei -- nem Weg.
   Se -- gen bei Tag, Se -- gen bei Nacht,
   Se -- gen für dich auf dei -- nem Weg.
}}

lyrC = {
  \lyricmode {
  Ma -- si -- thi
  Ma -- si -- thi
  Ma -- si -- thi
}}

sopranA = \relative c'' {
  \voiceThree
  \override Rest.staff-position = #2
  s1 r4 r8 a8 a4 a
  s1 r4 r8 a8 a4 a
  s1*3 r4 r8 a8 a4 a
}

sopran = \relative c' {
  \voiceOne
  \time 4/4
  \key d \major
  \bar "|."
  fs8 fs4 fs8 fs8 fs e d
  e1
  g8 g4 g8 g8 g fs e
  fs1
  fs8 a4 fs8 a2
  g8 b4 g8 b2
  a8 a4 a8 a8 a g g 
  fs1
  \bar "|."
}

alt = \relative c' {
  \voiceTwo
  d8 d4 d8 d8 d e d
  cs1
  e8 e4 e8 e8 e d cs
  d1
  d8 fs4 d8 fs2
  g8 g4 g8 g2
  fs8 fs4 fs8 fs8 fs e e 
  d1
}

tenor = \relative c' {
  \voiceOne
  \key d \major
  \clef "bass"
  a8 a4 a8 a a b a 
  a1
  b8 b4 b8 b b a a
  a1
  a8 d4 a8 d2
  b8 d4 b8 d2
  d8 d4 d8 d8 d b b
  a1
}

bass = \relative c {
  \voiceTwo
  d8 d4 d8 d d cs b
  a1
  e'8 e4 e8 e e d cs
  d1
  d8 fs4 d8 fs2
  g8 g4 g8 g2
  fs8 fs4 fs8 fs fs e e
  d1
}

chrdStrophe = \chordmode {
  d1 a e:m d d g d2. e4:m d1
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "SopranA" { \sopranA }
      \new Voice = "Sopran" { \sopran }
      \new Voice = "Alt" { \alt }
      >>
    \new Lyrics \lyricsto "SopranA" \lyrC  
    \new Lyrics \lyricsto "Sopran" \lyrA
    \new Lyrics \lyricsto "Sopran" \lyrB
    \new Staff <<
      \new Voice = "Tenor" { \tenor }
      \new Voice = "Basso" { \bass }
      >>
    >>
    \layout {
      \context {
        %\Lyrics
        %\override LyricText.font-size = #1
      }
    }
  }
}
