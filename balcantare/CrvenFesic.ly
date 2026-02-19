\version "2.22.2"
fileName = "CrvenFesic.ly"
sheetName = "Crven fesić"
\include "../include/book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -5.5)
\override LyricHyphen.extra-offset = #'(0 . -5.5)
\override LyricExtender.extra-offset = #'(0 . -5.5)
\override StanzaNumber.extra-offset = #'(0 . -5)
\set stanza = \markup{ \right-brace #80 }
}

dropLyricsB = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -2)
\set stanza = \markup{ \right-brace #50 }
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
   Cr -- ven fe -- sić,
   \dropLyricsA  ma __ _ mo \raiseLyrics
   cr -- ven fe -- sić
   \set stanza = #"1. "
   cr -- ven fe -- sić
   \dropLyricsA joj ma -- mi -- ce \raiseLyrics
   \set stanza = #"1. "
   cr -- ven fe -- sić,
   \dropLyricsB u dra -- ga -- na mo -- ga,
   \dropLyricsA
   joj ma -- mo ma -- mi -- ce!
}}
skipA = \repeat unfold 3 { \skip 4 }
skipB = \repeat unfold 4 { \skip 4 }
%skipC = \repeat unfold 5 { \skip 4 }
%skipD = \repeat unfold 5 { \skip 4 }

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
  Cr -- ne o -- či,
  %m -- a -- mo
  \skipA
  cr -- ne o -- či
  \set stanza = #"2. "
  cr -- ne o -- či
  %joj ma -- mi -- ce,
  \skipB
  \set stanza = #"2. "
  cr -- ne o -- či,
  %u dra -- ga -- na mo -- ga,
  %\skipC
  %\skipD%joj ma -- mo ma -- mi -- ce
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
   Med -- na us -- ta, \skipA
   med -- na us -- ta
   \set stanza = #"3. "
   med -- na us -- ta
   \skipB
   \set stanza = #"3. "
   med -- na us -- ta,
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Da me ho -- če, \skipA
    da me ho -- če
    \set stanza = #"4. "
    da me ho -- če
    \skipB
    \set stanza = #"4. "
    da me ho -- če pol __ _ ju __ _ bi -- ti

}}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"5. "
    Da -- la bih mu, \skipA
    da -- la bih mu
    \set stanza = #"5. "
    da -- la bih mu
    \skipB
    \set stanza = #"5. "
    da -- la bih mu sve ca -- re -- vo bla -- go
}}
strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \major
  a8 d cs d e4 e8( g)
  fs2 d8 cs b a
  a8 d cs d e4 e8 g
  fs1 \break
  \repeat volta 2 {
    r8 <a fs>4 <gs e>8 <a fs>4 <fs d>
    <g e>8 <g e> <fs d> <fs d> <e cs>4 <fs d>
    <g e>4.( <fs d>8) <g e>8 <fs d> <e cs> <d b>
    <e a,>1
  }
%\bar "|."
}

chrdStrophe = \chordmode {
  d2 a d1 s2 a2 d1
  d1 a s  s
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
    #(layout-set-staff-size-with-jazz 24)
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
