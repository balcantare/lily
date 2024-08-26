\version "2.24.0"
sheetName = "Yemaja"
\include "../include/book.ily"

lyr = {
  \lyricmode {
   Ye -- ma -- ja
   as -- se -- su, __
   as -- se -- su
   Ye -- ma -- ja, __
   Ye -- ma -- ja 
   o -- lo -- do, __
   o -- lo -- do
   Ye -- ma -- ja. __
}}

alt = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 3/4
  \key c \major
  \partial 2
  g4 g
  c g g
  a2.~ a \break
  r4 b c
  d b a
  g2.~ g \break
  r4 a a a e g
  d2.~ d~ 4 \break  r2
  e4 g e 
  c c c~
  c2.~ 4
  \bar "|."
}

sopran = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern
  \override Rest.staff-position = #0
  c4 c 
  e c c
  d2.
  c
  r4 d4 e
  f d c
  b2.~ 2.
  r4 c4 c
  c a b
  a2.~ 2.~ 4 r2
  g4 a g 
  g g g~
  g2.~ g4
}

alttwo = \relative c' {
  \accidentalStyle neo-modern
  \voiceTwo 
  e4 e
  g e e
  f2.~ 2.
  s4 g a
  b g f
  e2.~ 2.
  s4 e e 
  e  c e
  f2.~ 2.~ 4 s2
  b,4 d b 
  c c c~
  2.~ 4
}

chrd = \chordmode {
  s2
  c2. f s g
  s c:7+ s a:m d:m
  s g:7 s c s
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.6))
    ragged-last-bottom = ##f
  }
  \bookItem 
  \score {
    <<
    \new ChordNames \chrd 
    \new Staff <<
      \new Voice = "Alt" \alt 
    >>
    \new Lyrics \lyricsto "Alt" \lyr
    \new Staff <<
       \new Voice \sopran
       \new Voice \alttwo 
    >>
    >>
  }
}
