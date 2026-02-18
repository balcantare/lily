\version "2.22.2"
fileName = "AjdeJano.ly"
sheetName = "Ajde Jano"
\include "../include/book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -3)
}

dropLyricsB = {
\override LyricText.extra-offset = #'(0 . -1.5)
\override LyricHyphen.extra-offset = #'(0 . -1.5)
\override LyricExtender.extra-offset = #'(0 . -1.5)
\override StanzaNumber.extra-offset = #'(0 . -1.5)
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}
skipA = \repeat unfold 4 { \skip 4 }
skipB = \repeat unfold 8 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }

lyrStropheA = {
  \lyricmode {
  \dropLyricsA
  Aj -- de Ja -- no
  \raiseLyrics
  ko -- lo da i -- gra -- mo,
  \dropLyricsA
  Aj -- de Ja -- no
  aj -- de du -- šo
  \raiseLyrics
  ko -- lo
  da i -- gra -- ___ -- mo.
  \dropLyricsA
  Aj -- de Ja -- no
  aj -- de du -- šo
  \raiseLyrics
  ko -- lo
  da i -- gra -- ___ -- mo.
}}

lyrStropheB = {
  \lyricmode {
  %Aj -- de Ja -- no
  \skipA
  kon -- je
  \dropLyricsB
  da pro -- da -- mo,
  \raiseLyrics
  %Aj -- de Ja -- no aj -- de du -- šo
  \skipB
  kon -- je
  \dropLyricsB
  da pro -- da -- ___ -- mo.
  %Aj -- de Ja -- no aj -- de du -- šo
  \raiseLyrics
  \skipB
  kon -- je
  \dropLyricsB
  da pro -- da -- ___ -- mo.
}}

lyrStropheC = {
  \lyricmode {
  %Aj -- de Ja -- no
  \skipA
  ku -- ču
  %da pro -- da -- mo,
  \skipA
  %Aj -- de Ja -- no aj -- de du -- šo
  \skipB
  ku -- ču
  %da pro -- da -- ___ -- mo.
  \skipC
  %Aj -- de Ja -- no aj -- de du -- šo
  \skipB
  ku -- ču
  %da pro -- da -- ___ -- mo.
  \skipC
}}

lyrStropheD = {
  \lyricmode {
    Da pro -- da -- mo, sa -- mo da i -- gra -- mo.
    Da pro -- da --  mo, Ja -- no du -- šo, sa -- mo
    da i -- gra -- ___ -- mo.
    Da pro -- da --  mo, Ja -- no du -- šo, sa -- mo
    da i -- gra -- ___ -- mo.
}}


strophe = \relative c'' {
  %\voiceOne
  \time 7/8
  \key e \minor
  g4 fs8 e[( fs]) g4 |
  g4 fs8 fs4 e |
  e8[( fs e)] d2~ |
  d4.~ d2 | \break

  g4 a8 b4 b |
  a4 g8 fs4 e |
  a4 g8 fs4 e8[( fs]) |
  g4.~ 4 \tuplet 3/2 { fs8( g fs) } |
  e4.~ 2~ |
  4.~ 4 r |\break

  g4 a8 b4 b |
  a4 g8 fs4 e |
  a4 g8 fs4 e8[( fs)] |
  g4.^\fermata~ 4 \tuplet 3/2 { fs8( g fs) } |
  e4.~ 2~ |
  4.~ 2 |
  \bar "|."

}

chrdStrophe = \chordmode {
  e4.:m s2 s4. s2
  d4. s2 s4. s2

  g4. s2
  a4.:m s2
  s4. s2
  e4.:m s2
  s4. s2 s4. s4 d

  g4. s2
  a4.:m s2
  s4. s2
  s4. s2
  e4.:m s2

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
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}