\version "2.24.2"
sheetName = "Djelem Djelem"
sheetComposer = "Zarko Jovanovic, 1969"
\include "../include/book.ily"

transposeTo = f,

lyrStropheA = {
  \lyricmode {
    \set stanza = #"1. "
    Dje -- lem dje -- lem
    lun -- go -- ne dro -- men -- sa
    \set stanza = #"1. "
    Ma -- la -- dji -- lem bach -- ta -- le
    Ro -- men -- sa.
    Ay __ Ro -- ma -- le __
    Ay __ Cha -- va -- le
   Ay __ Ro -- ma -- le __
    Ay __ Cha -- va -- le
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = #"2. "
    Ay Ro -- ma -- le,
    ka -- tar tu -- men a -- ven
    \set stanza = #"2. "
    e ka -- ren -- sa bach -- ta -- le 
    dro -- men -- sa?
  }}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Sas a -- men -- ge jek ba -- ri fa -- mi -- lia
    \set stanza = #"3. "
    mu -- dar -- da -- men e ka -- le le -- gi -- ja.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
   A -- ven men -- sa sa lu -- ma -- ke
   Ro -- ma 
   \set stanza = #"4. "
   kai pu -- traj _ le Ro -- ma -- ne dro -- ma!
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "  
  A -- ke vja -- ma usch -- ti Rom a -- ka -- na
  \set stanza = #"5. "
  Men po -- chtras -- sa maj misch -- to ke -- ras -- sa!
}}

strophe = \relative c'' {
  %\voiceOne
  \time 2/2
  \key a \minor
  %\partial 4
  \bar "|:"
  \repeat volta 2 {
  r8 a4 b8 c4 d4 
  r8 c4 b8 a4 b
  a1 gs1
  r8 b4 c8 d4 e4
  r8 e4 d8 b4 c4
  b1 a1
  } 
  \break
  <c e>1(
  \grace { <b d>16 <c e>16 }
  <d f>2.)
  d8 8 
  d1( b1)
  
  <d f>1( 
  <c e>2)~ 8 8 <b d>4
  <a c >1
  
 <c e>1(
  <d f>2.)
  d8 8 
  d1( b1)
 
  d1(
  e4) r4 c b a1~ 1
  \bar "|."
}

chrdStrophe = \chordmode {
  a1:m s e1:sus e:7
  d:m e:7 a:m s
  c d:m e:7 s
  e:7 s a:m
  c d:m e:7 s
  s s a:m
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##t
  }
  \bookItem
  
  \score {
    <<
    \new ChordNames { \transpose c \transposeTo \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose c \transposeTo \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
