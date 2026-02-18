\version "2.22.2"
sheetName = "Oi u Vyšnevomu Sadočku"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Oi u vyš -- nje -- wo -- mu
  sa -- dotč -- ku
  \set stanza = #"1. "
  tam so -- lo -- vei -- ko
  šte -- be -- tav.
  wiet, wiet,  wiet,
  tjoch, tjoch,  tjoch,
  ai -- ja -- ja,
  och, och, och,
  \set stanza = #"1. "
  tam so -- lo -- wej -- ko
  šte -- be -- tav.
}}

skipA = \repeat unfold 12 { \skip 8 }
lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Oi u ce -- le -- no -- mu
  sa -- dotč -- ku
  \set stanza = #"2. "
  Ko -- sak div -- čy -- nu u -- vi -- tčav.
  \skipA
  \set stanza = #"2. "
  Ko -- sak div -- čy -- nu u -- vi -- tčav.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Oi tyi div -- čy -- no čor -- no -- bro -- wa,
  \set stanza = #"3. "
  A čyi pid -- ješ tyi ca me -- ne?
  \skipA
  \set stanza = #"3. "
  A čyi pid -- ješ tyi ca me -- ne?
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"4. "
  Mo -- ja ma -- tu -- sja te -- be cna -- je,
  \set stanza = #"4. "
  tyi toi ko -- sak, tšo vcje gul -- jae.
  \skipA
  \set stanza = #"4. "
  tyi toi ko -- sak, tšo vcje gul -- jae.
}}
lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
  A ja ma -- tu -- si ne clja -- ka -- jus,
  \set stanza = #"5. "
  Jak -- šo s_to -- bo -- ju
  poko -- cha -- jus.
  \skipA
  \set stanza = #"5. "
  Jak -- šo s_to -- bo -- ju
  poko -- cha -- jus.
}}


strophe = \relative c' {
  %\voiceOne
  \time 3/4
  \key b \minor
  %\partial 2
  \mark \markup{\box{Zwischenspiel}}
  s2.s s s \break
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
  s2.*16
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
  b2.:m e:m b2:m a4 d2 fs4
  b2.:m e:m fs b:m
  b2.:m e:m b2:m a4 d2 fs4
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
  }
  \bookItem
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
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}
