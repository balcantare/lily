\version "2.22.2"
sheetName = "Eště si já pohár vina zaplatím"
sheetComposer = "b. Wolfgang Schwabenicky"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1,2. "
  Eš -- tě si já
  eš -- tě si já
  po -- hár
  vi -- na za -- pla -- tim
  \set stanza = #"1,2. "
  po -- rom sa já,
  po -- rom sa já
  k_mo -- jéj mi -- léj
  na -- vrá -- tím.
  \set stanza = #"1. "
  Od ve -- če -- ra do rá -- na
  mu -- zi -- ka nám vyh -- rá -- vá
  \set stanza = #"1,2. "
  pij -- me. chlap -- ci.
  pij -- me. chlap -- ci.
  do -- bré ví -- no
  z_po -- há -- rá.

  tra la -- la
  la -- la la -- la
  tra -- la -- la -- la --
  la -- la -- la -- la -- la
  -- la -- la -- la -- la -- la
  tra la -- la la -- la la -- la
  tra -- la -- la -- la --
  la -- la -- la -- la -- la
  -- la -- la -- la -- la -- la

  Od ve -- če -- ra do rá -- na
  mu -- zi -- ka nám vyh -- rá -- vá
  pij -- me. chlap -- ci.
  pij -- me. chlap -- ci.
  do -- bré ví -- no
  z_po -- há -- rá.

  dum dum dum
}}


lyrStropheB = {
  \lyricmode {
    \repeat unfold 30 \skip 8
  \set stanza = #"2. "
  Po -- tom puj -- dem
  na pá -- na.
  co sna -- ma zle na -- klá -- dá

}}

strophe = \relative c' {
  \voiceOne
  \time 2/4
  \key d \minor
  d8 d4.
  e8 e4.
  f8 f4.
  g8 g4.
  a4 g
  f e
  f8 d4. d4 s %r
  a'8 a4.
  b8 b4.
  c8 c4.
  d8 d4.
  e4 d
  c b
  c8 a4.
  a4 s %r
  \repeat volta 2 {
    d4 d
    a8 4.
    c8 bf4.
    a4. s8 %r8
    a4. bf8
    a8 g4.
    f8 f4.
    e4. s8 %r8
    d4. d8
    e8 e4.
    f4. f8
    g8 g4.
    a4 g
    f e
    f8 d4.
    d4 s %r
  }
  \break
  d8 s4 d8
  e8 s4 e8
  f8 s4 f8
  g8 s4 g8
  a8 g f a
  g f e g
  f e d cs
  d4 s
  a'8 s4 a8
  b8 s4 b8
  c8 s4 c8
  d8 s4 d8
  e8 d c e
  d c b d
  c b a gs
  a4 s4
  \repeat volta 2 {
    d4 d
    a8 a4.
    c8 bf4.
    a4. s8
    a4. bf8
    a8 g4.
    f8 f4.
    e4. s8
    d4. d8
    e8 e4.
    f4. f8
    g8 g4.
    a4 g
    f e
    f8 d4.
    d4 s
  }
  a' gs
  d s
 \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  d8 d4.
  cs8 4.
  d8 4.
  e8 4.
  f4 e
  d cs
  d8 d4. d4 r
  a'8 a4.
  gs8 4.
  a8 a4.
  b8 4.
  c4 b
  a gs
  a8 a4.
  a4 r \break
  \repeat volta 2 {
    d4 d
    f,8 4.
    e8 g4.
    f4. r8
    f4. g8
    f8 e4.
    d8 4.
    cs4. r8
    d4. d8
    cs8 4.
    d4. 8
    e8 4.
    f4 e
    d cs
    d8 4.
    4 r
  }
  d8 r4 d8
  cs8 r4 8
  d8 r4 8
  e8 r4 8
  d2( cs a
  d4) r
  a'8 r4 a8
  gs8 r4 8
  a8 r4 8
  b8 r4 b8
  a2( gs
  e cs4) r
  \repeat volta 2 {
    bf'4 4
    f8 4.
    e8 g4.
    f4. r8
    f4. g8
    f8 e4.
    d8 d4.
    cs4. r8
    d4. d8
    cs8 4.
    d4. d8
    e8 4.
    f4 e
    d cs
    d8 4.
    d4 r
  }
  f e
  d r
}

chrdStrophe =  \chordmode {
  d2:m
  a
  d:m
  g:m
  d4:m g
  d:m a
  d2:m
  s
  a:m e a:m d:m a4:m d:m a:m e a2:m s
  d2:m f c f d:m g:m d:m a
  d:m a d:m g:m d4:m g:m d:m a d2:m s
  d2:m a d:m g:m
  d2:m a d4:m a d2:m
  a2:m e
  a2:m d:m
  a:m e a4:m e a2:m
  d:m f g:m d:m s
  g:m d:m a
  d:m a d:m g:m d4:m g:m d:m a
  d2:m s
  g4:m a
  d2:m

}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
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
    >>
  }
}
