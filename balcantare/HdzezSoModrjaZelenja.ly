\version "2.24.2"
sheetName = "Hdźež so módrja, zelenja"
sheetComposer = "Handrij Zejler (1804–1872)"
\include "../include/book.ily"



leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace60"
}
stanzaA = \markup {
  \column {\vspace #.40 "1. "}
  \column {\vspace #.10 \leftbrace}
}
stanzaB = \markup {
  \column {\vspace #.40 "2. "}
  \column {\vspace #.10 \leftbrace}
}
stanzaC = \markup {
  \column {\vspace #.40 "3. "}
  \column {\vspace #.10 \leftbrace}
}
stanzaD = \markup {
  \column {\vspace #.40 "4. "}
  \column {\vspace #.10 \leftbrace}
}

lyrStropheA = {
  \lyricmode {
  \set stanza = \stanzaA
  Hdźež so mó -- drja, ze -- len -- ja 
  \set stanza = \stanzaA
  na -- še ho -- ry, haj -- ni -- šća,
  \set stanza = "ref: "
  Tam su mo -- je wje -- se -- _ la, 
  tam mje ćeh -- _ nje, tam chcu ja.     
}}

lyrStropheAA = {
  \lyricmode {
  hdźež mje strow -- ja zet -- ku -- jo
  w‿zna -- tym słow -- je kra -- jen -- jo:
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = \stanzaB
  Hdźež te zwo -- ny na cyr -- kwi
  \set stanza = \stanzaB
  lub -- je rě -- ča k‿wut -- ro -- bi,
  }}
lyrStropheBB = {
  \lyricmode {
  do wsy hla -- da z‿wje -- čor -- ka
  poz -- ło -- ća -- na cyr -- kwič -- ka:
  }}

lyrStropheC = {
  \lyricmode {
    \set stanza = \stanzaC
    Hdźež tam rě -- ka plus -- ko -- ce
    \set stanza = \stanzaC
    přez te ho -- na do -- mow -- ne,
}}
lyrStropheCC = {
  \lyricmode {
  hdźež do hat -- ka, do rě -- ki
  swě -- ća jas -- ne hwěz -- dźič -- ki:
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = \stanzaD
  Hdźež tam kwět -- ki pi -- sa -- ne
  \set stanza = \stanzaD
  py -- ša łu -- ki dom -- ja -- ce,
}}
lyrStropheDD = {
  \lyricmode {
  hdźež tam na -- še po -- lo je
  ži -- to so tam zma -- wu -- je:
}}

strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \key g \major
  \bar "|:"
  \repeat volta 2 {
   g4 d b' g
   g4. fs8 fs2
   e4 e g e 
   e4. d8 d4 r4 } \break
  \repeat volta 2 {
   d4 g fs g
   a b8 c b4 r \break
   b4 g d'8 c b4
   a4. b8 g4 r	
  }
   
%\bar "|."
}

chrdStrophe = \chordmode {
  g1 d c d
  g d2 g4 g:7
  e2:m g4 d
  c4:6 d:7 g2
}


\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##t
  }

  \bookItem

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
    \new Lyrics \lyricsto "Strophe" \lyrStropheAA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheBB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheCC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheDD
    >>
  }
}
