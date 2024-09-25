\version "2.24.0"
sheetName = "Iavnana"
\include "../include/book.ily"

lyrA = {
  \lyricmode {
  I -- av -- na -- na
  var -- do na -- na
  I -- av na -- ni -- na -- ho.
}}


sopran = \relative c'' {
  \voiceOne
  \time 3/4
  \key b \minor
  \accidentalStyle neo-modern %-voice-cautionary
  r2. r2. b2 a4 gs4 fs2
  a2 g4 fs2 e4 fs2. fs
  \bar "|."
}

alt = \relative c' {
  \voiceTwo
  d2 e4 fs e2 fs2 fs4 e4 
  d2 \break e2 e4 d2 cs4 b2. b
}

bass = \relative c {
  \key b \minor
  \clef "bass"
  b'2 b4 b4 b2 b2 b4 b4 b2 a2 a4 a2 a4 b2. b
}

chrdStrophe = \chordmode {
  b2.:m s s s a s b:m 
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Sopran" { \sopran }
      \new Voice = "Alt" { \alt }
      >>
    \new Lyrics \lyricsto "Alt" \lyrA
    \new Staff <<
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
