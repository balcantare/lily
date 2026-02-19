\version "2.24.0"
sheetName = "Was wollen wir trinken"
sheetComposer = "Bretonisches Lied, arr. Reinhard Simmgen"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1,4. "
  Was wol -- len wir trin -- ken sie -- ben
  Ta -- ge lang?
  \set stanza = #"1,4. "
  Was wol -- len wir trin -- ken,
  so ein Durst!
  \set stanza = #"1,4. "
  Es wird ge -- nug für al -- le sein.
  \set stanza = #"1,4. "
  Komm, lass \skip 8 uns trin -- ken,
  roll' das Faß he -- rein!
  \set stanza = #"1,4. "
  Komm, lass \skip 8 uns trin -- ken nicht al -- lein!
}}

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   Dann wol -- len wir schaf -- fen
   sie -- ben Ta -- ge lang,
   \set stanza = #"2. "
   dann wol -- len wir schaf -- fen
   komm faß an!
   \set stanza = #"2. "
   Und das wird kei -- ne
   Pla -- cke -- rei!
   \set stanza = #"2. "
   Wir schaf -- fen
   zu -- sam -- men,
   je -- der faßt mit an,
   \set stanza = #"2. "
   wir schaf -- fen zu -- sam -- men
   nicht al -- lein!
}}
lyrStropheC = {
  \lyricmode {
   \set stanza = #"3. "
   Dann wol -- len wir strei -- ten,
   kei -- ner weiß, wie lang,
   \set stanza = #"3. "
   ja, für \skip 8
   ein Le -- ben oh -- ne Zwang.
   \set stanza = #"3. "
   Dann kriegt der Frust uns nicht mehr klein.
   \set stanza = #"3. "
   Wir ge -- hen zu -- sam -- men,
   kei -- ner geht al -- lein,
   \set stanza = #"3. "
   wir ge -- hen
   zu -- sam -- men,
   nicht al -- lein!
}}


strophe = \relative c'' {
  \voiceTwo
  \time 2/2
  \key d \minor
  \override Rest.staff-position = #0
  \bar ".|:-|"
  \repeat volta 2 {
    r4 g4 g8 f e4
    f2 d
    d4 g g f
    e \bar "" \break g g8 f e4
    f2 d
    \time 2/4
    e4 c
    \time 2/2
    d1
  } \break
  \repeat volta 2 {
    r4 d4 f g
    a2 a
    \time 2/4
    bf4 g
    \time 2/2
    a1
    r4 g g8 f e4
    f2 d
    d4 g g f
    e \bar "" \break g g8 f e4
    f2 d
    \time 2/4
    e4 c
    \time 2/2
    d1
  }
  %\bar "|."
}

stropheSopran = \relative c'' {
  \voiceOne
  s4 a4 a8 a g4
  a2 f
  a4 c c a
  g bf bf8 a g4
  a2 f
  g4 g
  a1

  s4 g a bf
  c2 c
  d4 c
  c1
  s4 a4 a c
  d2 d
  a4 c c a
  g a a c
  d2 a
  g4 g
  a1
}

stropheBass = \relative c {
  \key d \minor
  \clef "bass"
  r4 a4 a8 a c4
  d2 a
  d4 d e d
  c c a8 a c4
  d2 a
  c4 c
  d1

  r4 c4 d e
  f2 f
  e4 e
  f1
  r4 d4 d8 d c4
  d2 a
  d4 d e d
  c4 c a8 8 c4
  d2 a
  c4 c
  d1
}

chrdStrophe = \chordmode {
  s1 d:m s c bf c2
  d1:m
  s1 f c2 f1 s2 a:7
  d1:m s c bf c2 d1:m
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "StropheSopran" { \stropheSopran }
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Staff <<
      \new Voice = "Basso" { \stropheBass }
      >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
      \context {
        %\Lyrics
        %\override LyricText.font-size = #1
      }
    }
  }
}
