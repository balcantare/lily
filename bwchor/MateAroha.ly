\version "2.22.2"
fileName = "MateAroha.ly"
sheetName = "Mate Aroha"
\include "book.ily"

dropLyrics = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -3)
}

lyrStropheA = {
  \lyricmode {
    \set stanza = #"1. "
    Ma te a -- ro -- ha,
    ma te a -- ro -- ha,
    ma te a -- ro -- ha,
    \dropLyrics
    ka o -- ra e!
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = #"2. "
    Ho -- mai to rin -- ga,
    ho -- mai to rin -- ga,
    ho -- mai to rin -- ga,
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Wha ka -- pi -- ri mai,
    wha ka -- pi -- ri mai,
    wha ka -- pi -- ri mai,
  }}


strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \key e \major
  \partial 2
  gs8 fs4 e8
  fs4.( e8) cs2
  r2 fs8 e4 cs8
  e4.( cs8) b2
  r2 gs'8 fs4 e8
  fs4.( e8) cs2
  r4 ds e fs
  e1~ 2
  \bar "|."
}

stropheAlt = \relative c'' {
  %\voiceTwo
  \key e \major
  r2
  r2 r8 a a gs
  fs8 fs4. r2
  r2 r8 e e b
  e8( fs) gs4 b8 b4 b8
  b2 a4.( gs8
  fs4) fs gs a
  gs1~ 2
}

chrdStrophe = \chordmode {
  s2
  a1 b:7 e cs:m7 a b:7 e
}

\bookpart {
  \paper {
    %ragged-right = ##f
    page-count = #1
    #(define fonts (book-font 1.6))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
  <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
     \new Voice = "Strophe" { \strophe }
    >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Staff <<
      \new Voice = "StropheAlt" { \stropheAlt }
    >>
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheA
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheB
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheC
    %>>
  >>
}
}

