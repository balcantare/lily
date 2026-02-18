\version "2.24.0"
sheetName = "Für alle Frauen"
sheetComposer = "Beate Tarrach"
\include "../include/book.ily"


lyrA = {
  \lyricmode {
  Ein Hoch al -- len Mäd -- chen und den Frau -- en die -- ser
  Welt.
  Ihr seid das Licht, das die Schön -- heit rings er -- hellt,
  Ihr seid die Lie -- be, den Kin -- dern ein Zu -- haus.
  Ihr seid die Kraft des Le -- bens, strahlt
  hi -- naus!
}}

strophe = \relative c' {
  \time 4/4
  \key c \major
  \partial 8
  g8
  c4 c8 c c g c d
  f e d c g2
  f'4 f8 f e4 c8 c
  f8 e d c g'2
  a4 b8 c c g4  g8
  a8 a a g d2
  c4 c8 c c d e g
  a4. g8 g4 r8
  \bar "|."
}


chrd =  \chordmode {
  s8
  f2 c d:m g f c d:m g
  f c d:m g f c d:m g4.
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.2))
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames \transpose c d \chrd 
    \new Staff <<
      \new Voice = "Strophe" \transpose c d  \strophe 
      >>
    \new Lyrics \lyricsto "Strophe" \lyrA 
    >>
    \layout {
      \context {
        \Lyrics
        % \override LyricText.font-size = #1.5
      }
    }
  }
}
