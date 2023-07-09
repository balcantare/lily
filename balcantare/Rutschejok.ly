\version "2.22.2"
sheetName = "Rutschejok"
\include "book.ily"

dropLyrics = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -3)
}
raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

skipEight = \repeat unfold 24 { \skip 2 }
lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Ai Ru -- tsche -- jo -- tschik Ru -- tsche -- jok
  \set stanza = #"1. "
  Ai praw ja wo -- du ma -- te jom
  \dropLyrics
  Ro --
  \raiseLyrics ma -- le -- le i te scha -- wa -- le -- le
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Ai Retsch -- ka pa -- nu -- ti -- las -- ja
  \set stanza = #"2. "
  Ai s_mi -- loy Ras -- lu -- tschil -- sja ja
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Ai tscha -- jo -- ri, tu tscha -- jo -- ri
  \set stanza = #"3. "
  sow -- na -- ku -- mi tscher -- ge -- no -- ri
}}

strophe = \relative c' {
  %\voiceOne
  \time 2/4
  \key a \minor
   %\partial 4.
   r8 e8 d e |
   f4 4 |
   g g |
   \appoggiatura g16
   e4. r8 | \break
   r8 g g g |
   a4 a |
   g a |
   f e | \break
   d e |
   g8 f e d |
   e4 a, |
   a4. r8
    \bar "|."
}

chrdStrophe = \chordmode {
  a2:m
  d:m
  g
  c
  s
  a:m
  a:7
  d:m
  s
  e:7
  a:m
  s
}


\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.6))
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
