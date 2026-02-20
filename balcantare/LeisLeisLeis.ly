\version "2.24.0"
sheetName = "Leis, leis, leis"
sheetComposer = "Beate Tarrach, Reinhard Simmgen"
#(define book-staff-size 16)
\include "../include/book.ily"

transto = e

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace75"
}
stanzaA = \markup {
  \column { \vspace #.4 "1. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaB = \markup {
  \column { \vspace #.4 "2. "}
  \column { \vspace #.2 \leftbrace }
}

lyrStropheA = {
  \lyricmode {
  \set stanza = "1&2. "
  Leis, leis, leis, wie der Schnee heut fällt.
  Weiß, weiß, weiß,
  \set stanza = "1&2. "
  liegt die gan -- ze Welt.
  \set stanza = "1. "
  Auch der Mond auf sei -- ner Bahn
  \set stanza = "1. " ist ganz
  still, schaut  sich die Welt von o -- ben an.
  \set stanza = "1. "
  Al -- le Vög -- lein schla -- fen nun,
  und für uns
  \set stanza = "1. "
  Men -- schen kommt die Zeit
  aus -- zu -- ruhn.
}}

lyrStropheAbass = {
  \lyricmode {
  \set stanza = "1&2. "
  Leis,2 leis, leis,1 wie4 der Schnee4. heut8 fällt.1
  Weiß,2 weiß, weiß,1
  \set stanza = "1&2. " liegt4 die gan -- ze Welt.1
  \set stanza = "1. " Auch2 der Mond4 auf sei -- ner Bahn1.
  \skip 2 \repeat unfold 3 {\skip 1} \skip 2.
  \set stanza = "1. " Al2. -- le2 Vög4 -- lein schla -- fen nun,1
  \repeat unfold 3 {\skip 1}
  aus2 -- zu -- ruhn.1
}}

lyrStropheB = {
  \lyricmode {
  \repeat unfold 16 { \skip 1 }
  \set stanza = #"2. "
  Siehst du dort am Fir -- ma -- ment
  \set stanza = #"2. " leuch -- tet
  hell ein Stern, den
  rings -- um nie -- mand kennt.
  \set stanza = #"2. "
  Hast in die -- ser ei -- nen Nacht
  den Men -- schen
  \set stanza = #"2. "
  Frie -- den in ihr
  Herz ge _ -- bracht.
}}

lyrStropheBbass = {
  \lyricmode {
  \repeat unfold 8 { \skip 1 }
  \set stanza = #"2. "
  Siehst2 du dort4 am Fir -- ma -- ment1.
  %leuch4 -- tet hell2 ein Stern,4 den
  %rings -- um nie -- mand kennt.
  \skip 2 \repeat unfold 3 {\skip 1} \skip 2.
  \set stanza = "2. " Hast2. in2 die4 -- ser ei -- nen Nacht1
  \repeat unfold 3 {\skip 1}
  mh2 mh mh
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = \stanzaB
}}

lyrStropheD = {
  \lyricmode {
    %\set stanza = #"4. "
}}


strophe = \relative c' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \key d \major
  fs2 a
  d,1
  g4 fs d4. e8
  e1
  fs2 e
  d1
  b4 d d e
  d1
  \bar  "||"
  d2 d'
  cs4 a a fs
  a1~
  a2 \break g4 fs
  d2 d
  d4 b' a fs
  e2. fs4
  e1
  \bar "||"
  d2 d'
  cs4 a  a fs
  a1~
  a4 d,4 d e
  fs a g fs
  d2 d4 e
  d1~
  d
  \bar "|."
}


stropheAlt = \relative c'' {
  \key d \major
  a2 g
  fs( g4 fs)
  e4 a b4. a8
  a2( g)
  a2 g
  fs4( e d cs)
  g'4 g a g
  fs1
  g2 g
  a4 g fs d
  cs2( d
  e) d4 d
  g( fs) fs( e)
  b d e d
  a'2 d
  cs4( b a \break g)
  fs2 fs
  a4 g fs d
  cs2( d
  e4) fs g g
  a a b a
  g4( a) bf g
  fs2( g
  fs1)

}

stropheBass = \relative c {
  \clef "bass"
  \key d \major
  d2 cs
  cs( b)
  d4 d e d
  d2( cs)
  d d
  b1
  g4 g a a
  a1
  a2 b
  cs4 cs b b
  b2( a)~
  a4 b b cs
  d2 g 
  g4 e d b 
  a1
  a4 b cs a4~
  a2 b
  cs4 cs b b
  b2( a)~
  a4 a b cs
  d cs b a
  g1
  a2 g
  d'1
}
chrdStrophe = \chordmode {
  d2 fs:m b1:m
  g2 e:m
  a1 d2 fs:m
  b1:m g2 a2
  d1
  d fs:m s s
  g e:m a s
  g fs:m b:m7 s
  a:6 g2 g:m d g:m6 d1
 }

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 17)
      \context {
        \Lyrics
        \override LyricText.font-size = #1.2
      }
    }
    <<
      \new ChordNames { \transpose d \transto \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \transpose d \transto \strophe }
      >>

     \new Lyrics \lyricsto "Strophe" \lyrStropheA
     \new Lyrics \lyricsto "Strophe" \lyrStropheB
     \new Staff <<
        \new Voice = "StropheAlt" { \transpose d \transto \stropheAlt }
      >>
     \new Lyrics \lyrStropheAbass
     \new Lyrics \lyrStropheBbass
     \new Staff <<
        \new Voice = "StropheBass" { \transpose d \transto \stropheBass }
     >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
