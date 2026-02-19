\version "2.22.2"
sheetName = "Gamla Moder Jord"
\include "../include/book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -2.5)
\set stanza = \markup{ \right-brace #50 }
}

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Oh, du gam -- la, 
  oh du gam -- la mo _ -- der,
  oh du gam -- la mo -- der jord.
  
  Var har du va -- rit den he -- la,
  he -- la lån -- ga nat -- ten?
  Var har du va -- rit den he -- la,
  he -- la lån -- ga nat -- ten?
  Vå -- ren, _ vå -- ren ãr hãr,
  vå -- ren, _ vå -- ren ãr hãr.
  
}}

lyrStropheAltA = {
  \lyricmode {
  \set stanza = #"1. "
  Oh, du, oh, du gam -- la mo _ -- der,
  oh du gam -- la, gam -- la mo -- der jord.
  
  Var har du va -- rit den lån -- ga _ nat -- ten?
  Var har du va -- rit den lån -- ga _ nat -- ten?
  Vå -- ren, _ vå -- ren ãr hãr,
  vå -- ren, ãr hãr!
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Sag, wo schläfst du?
  Früh -- ling, komm und zei -- ge dich,
  komm und zeig uns dein Ge -- sicht.
  Lang war der Win -- ter, nun send uns
  wie -- der Son -- nen -- strah -- len.
  Nimm dei -- ne Far -- ben, um Blu -- men in 
  die Welt zu ma -- len.
  Nach lan -- ger Nacht komm zu -- rück!
  Nach lan -- ger Nacht komm zu -- rück!
  
}}

lyrStropheAltB = {
  \lyricmode {
  \set stanza = #"2. "
  Komm nun  Früh -- ling, komm und zei -- ge dich,
  komm und zeig uns zeig uns dein Ge -- sicht.
  Lang war der Win -- ter, nun send 
  Son -- nen -- strah -- len.
  Nimm dei -- ne Far -- ben, um Blu -- men zu ma -- len.
  Nach lan -- ger, nach lan -- ger Nacht komm zu _ -- rück!
  }
}


strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \minor
  \bar ".|:"
  \repeat volta 2 {
  d4. e8 f4 g
  a8. bf16 a8 g f8 e d4
  g4. f8 e8. e16 d8 c
  d1 }
  a'4 a8 g a4 a8 g 
  a8. bf16 c8 d c bf a g
  a4 a8 g a4 a8 g
  a8. bf16 c8 d c bf a g
  a4 a8 g f4 e8 c
  d2( e)
  a4 a8 g f4 e8 c
  d2. r4
  \bar "|."
}


stropheAlt = \relative c' {
  %\voiceTwo
  \key d \minor
  r2 d4 e
  f8. g16 f8 e d c d4
  e4 d c e
  f8. f16 e8 c d2
  f4 f8 e f4 f8 e
  d4 e8 f e4 e
  f4 f8 e f4 f8 e
  d4 e8 f e4 e
  d2 d4 c
  d8.( e16) f8 g a2
  d,2 d4 c
  d2. r4
}

chrdStrophe = \chordmode {
  d1:m s
  c d:m
  d:m s2 c
  d1:m s2 c
  d2:m a:m7
  d:m a:m7
  d:m a:m7
  d:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
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
    
    \new Staff <<
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheAltA
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheAltB
    
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
