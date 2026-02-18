\version "2.22.2"
fileName = "BeljevinaZemljaFina.ly"
sheetName = "Beljevina zemlja fina"
\include "../include/book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -7.0)
\override LyricHyphen.extra-offset = #'(0 . -7)
\override LyricExtender.extra-offset = #'(0 . -7)
\override StanzaNumber.extra-offset = #'(0 . -6)
\set stanza = \markup{ \right-brace #90 }
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

lyrStropheA = {
  \lyricmode {
    \set stanza = #"1. "
    Bel -- je -- vi -- na
    zem -- lja zem -- lja fi -- na
    \dropLyricsA hop la -- ne mi -- lo -- la -- ne,
    \raiseLyrics
    \set stanza = #"1. " zem -- lja  zem -- lja fi -- na.
}}
skipA = \repeat unfold 7 { \skip 4 }

lyrStropheB = {
  \lyricmode {
    \set stanza = #"2. "
    Da se da -- ješ ze -- tu ze -- to -- vi -- no,
    \skipA
    \set stanza = #"2. "
    ze -- tu ze -- to -- vi -- no.
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    I od ki -- ša i od i od sun -- ca,
    \skipA
    \set stanza = #"3. "
    i od i od sun -- ca.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Da se zem -- lja zem -- lji -- ca ras -- pu -- ca,
    \skipA
    \set stanza = #"4. "
    zem -- lji -- ca ras -- pu -- ca.
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"5. "
    Od šar -- den -- ka vo -- du vo -- du no -- si,
    \skipA
    \set stanza = #"5. "
    vo -- du vo -- du no -- si.
    }}

lyrStropheF = {
  \lyricmode {
    \set stanza = #"6. "
    Tu moj dra -- gi tra -- vu tra -- vu ko -- si,
    \skipA
    \set stanza = #"6. "
    tra -- vu tra -- vu ko -- si.
    }}

strophe = \relative c' {
  \voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \major
  \bar ".|:"
  \repeat volta 2 {
  d4 e fs4. g8
  fs8[ 8] 8[ e] fs4 8( e)
  }
  \repeat volta 2 {
   a4 e8 e d[ d] d[ d]
   cs[ e] d[ cs] b4 b
  }
%\bar "|."
}


stropheAlt = \relative c' {
  \voiceTwo
  d4 cs d4. e8
  d[ d] d[ cs] d4 d8 cs
  cs4 8 8 b[ b] b[ b] a[ a] a[ a] gs4 4
}

stropheBass = \relative c {
  \clef bass
  d4 a d a e' a, e' a,
  a'4 a8 a b b b b
  a a a a e4 e
}

chrdStrophe = \chordmode {
  d1 s
  a2 e a e
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    \new Staff <<
      \new Voice = "Basso" { \stropheBass }
      >>
    >>
  }
}
