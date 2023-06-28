\version "2.22.2"
fileName = "OiUVysnevomuSadotcku.ly"
sheetName = "Oi u Vyšnevomu Sadočku"
\include "book.ily"

dropLyricsA = {
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

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Oi u vyš -- nje -- wo -- mu
  sa -- dotč -- ku
  tam so -- lo -- vei -- ko
  šte -- be -- tav.
  wiet, wiet,  wiet,
  tjoch, tjoch,  tjoch,
  ai -- ja -- ja,
  och, och, och,
  tam so -- lo -- wej -- ko
  šte -- be -- tav.
}}

skipA = \repeat unfold 12 { \skip 8 }
lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Oi u ce -- le -- no -- mu
  sa -- dotč -- ku
  Ko -- sak div -- čy -- nu u -- vi -- tčav.
  \skipA
  Ko -- sak div -- čy -- nu u -- vi -- tčav.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Oi tyi div -- čy -- no čor -- no -- bro -- wa,
  A čyi pid -- ješ tyi ca me -- ne?
  \skipA
  A čyi pid -- ješ tyi ca me -- ne?
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"4. "
  Mo -- ja ma -- tu -- sja te -- be cna -- je,
  tyi toi ko -- sak, tšo vcje gul -- jae.
  \skipA
  tyi toi ko -- sak, tšo vcje gul -- jae.
}}
lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
  A ja ma -- tu -- si ne clja -- ka -- jus,
  Jak -- šo s_to -- bo -- ju
  poko -- cha -- jus.
  \skipA
  Jak -- šo s_to -- bo -- ju
  poko -- cha -- jus.
}}


strophe = \relative c' {
  %\voiceOne
  \time 3/4
  \key b \minor
  %\partial 2
  \mark \markup{\box{Intro}}
  s2.s s s \bar "||" \break
  b4 4 4
  e2 d8( cs)
  b2 a4
  d2 cs4 \break
  b4 4 4
  e2 d8( cs)
  b2 a4
  d2. \break
  \repeat volta 2 {
    \voiceOne
    b'4 4 4
    a4 4 4
    g4 4 4
    fs4 4 4 \break
    g4 g8( fs) g4
    a2 g4
    fs2 e4
    b'2.
  }
  \bar "|."
}

stropheAlt = \relative c'' {
  s2.*12
  \voiceTwo
  g4 4 4
  fs4 4 4
  e4 4 4
  b4 4 4
  e4 e a,
  d2 e4
  d2 cs4
  b2.
}

chrdStrophe =  \chordmode {
  b2.:m e fs b:m
  b2.:m
  e:m
  b2:m a4
  d2 fs4
  b2.:m
  e:m
  b2:m a4
  d2.
  g2. d e:m b:m e:m
  d2 e4:m b2:m fs4 b2.:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    %ragged-last-bottom = ##f
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
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
