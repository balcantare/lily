\version "2.24.2"
sheetName = "Tschüßlied"
sheetComposer = "Beate Lambert"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    In ei -- ner Wo -- che sind wir wie -- der
    zu -- rück, und eh wir uns tren -- nen,
    wün -- schen wir uns Glück.
    So -- viel Glück wie die Ster -- ne,
    so -- viel Glück wie die Er -- de,
    so -- viel Glück wie das Meer,
    das wün -- schen wir uns sehr!
}}

strophe = \relative c'{
  \time 2/4
  \key c \major
  \partial 4
  \bar ".|:"
  \repeat volta 2 {
  r4
  c4 c8 c
  f8 f f f
  d4 d8 d
  e4. e8
  c4 c8 c
  d4 d 
  b8 b a b
  c4 
  } \break
  \repeat volta 2 {
    e8 g
    c4 c8 b
    a8 a a a
    b4 b8 a 
    g8 g g g
    a4 a8 g
    f4. f8
    g8 g g f
    e4
  }
}

chrdStrophe = \chordmode { 
  s4 
  c2 f g c a:m d:m g c
  c f g c a:m d:m g c4
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    % ragged-last-bottom = ##f
  }
  \bookItem
  \header {
    subtitle = "zweistimmiger Kanon"
  }

  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
      #(layout-set-staff-size 20)
    }
  }
}
