\version "2.24.0"
sheetName = "Batonebis Simghera - Imereti"
sheetComposer = "Georgische Heilungslied, Frank Kane"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Ba -- to -- ne bo __
  Tsqa -- lo o ble -- bo
  \set stanza = #"ref. "
  Na -- ni -- na -- na ba -- to
  ne -- i -- ebs na na na o,
  dat -- kbit' tkbi -- la -- d ba -- to -- no.
  \set stanza = #"2. "
  T'k've -- ni gza -- da, __ _
  i -- lots' -- e -- ba,  
}}

skipA = \repeat unfold 30 \skip 4

lyrStropheB = {
  \lyricmode {
    \skipA \set stanza = #"3. "
  T'k've -- nsa gza -- sa, __ _ vup' -- en vard -- sa,
  }
}
lyrStropheC = {
  \lyricmode {
    \skipA \set stanza = #"4. "
  Shvi -- di da-dz -- ma, __ _ i gav -- di -- vart',
  }
}
lyrStropheD = {
  \lyricmode {
    \skipA \set stanza = #"5. "
    Shvid -- so -- p'els mo, __ _ vep' -- i -- ne -- bit',
  }
}
lyrStropheE = {
  \lyricmode {
  \skipA \set stanza = #"6. "
  I -- se dav -- di, __ _ vart' so -- p'el -- shi, 
  }
}
lyrStropheF = {
  \lyricmode {
  \skipA \set stanza = #"7. "
  Ch'i -- t'i -- sa a -- ra, __ gvi -- p're -- ni -- a,
  }
}
lyrStropheG = {
  \lyricmode {
  \skipA \set stanza = #"8. "
  Bav -- shi -- vits ar da, __ gvits -- ve -- ni -- a,
  }
}
lyrStropheH = {
  \lyricmode {
  \skipA \set stanza = #"9. "
  }
}
lyrStropheI = {
  \lyricmode {
  \skipA \set stanza = #"10. "
  Ud -- gi -- a o, __ _ k'ros ak -- va -- ni,
  }
}
lyrStropheJ = {
  \lyricmode {
  \skipA \set stanza = #"11. "
  Shig ut -- sevs ba, __ _ to -- ni -- shvi -- li,
  }
}
lyrStropheK = {
  \lyricmode {
  \skipA \set stanza = #"12. "
  Khan da khan ga, __ _ da art -- se -- ven,
  }
}
lyrStropheL = {
  \lyricmode {
  \skipA \set stanza = #"13. "
  I a vkri -- p'e, __ _ var -- di vsha -- le,
  }
}
lyrStropheM = {
  \lyricmode {
  \skipA \set stanza = #"14. "
  Tsin ba -- to -- ne, __ _ bs-ga -- vu -- sha -- le,
  }
}

strophe = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key c \major
  \partial 2
  c4 d
  e \tuplet 3/2 {e8( d c} d2~
  d2)
  \voiceOne
  <e g>2~
  4 <d f>8( <e g>8) <c e>4. <b d>8 |
  <a c>1 \break
  \repeat volta 2 {
    \oneVoice
     <g c e>4 4 4 4
     2 <g b d>2
     <a d f>4. 8 <a e' g>4 <a d f>4
     \time 2/4 <a c e>4. <g b d>8 \break
     \time 4/4
     <f a c>1 
     <g c e>2. 4
     4 8 8 <g d' f>4 <g b d>
     <a e'>2 \break c4 d 
     e \tuplet 3/2 {e8( d c)} d2~
     2 <a d f>~
     4 <a e' g> <a c e>4.( <g b d>8)
     <f a c>1
  }
  % \bar "|."
}

stropheBass = \relative c'' {
  \voiceTwo
  s2 s1 
  s2 a2~
  4 4 4.( g4)
  f1
}

chrdStrophe = \chordmode {

}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    % ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "Basso" { \stropheBass }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    \new Lyrics \lyricsto "Strophe" \lyrStropheG
    \new Lyrics \lyricsto "Strophe" \lyrStropheH
    \new Lyrics \lyricsto "Strophe" \lyrStropheI
    \new Lyrics \lyricsto "Strophe" \lyrStropheJ
    \new Lyrics \lyricsto "Strophe" \lyrStropheK
    \new Lyrics \lyricsto "Strophe" \lyrStropheL
    \new Lyrics \lyricsto "Strophe" \lyrStropheM
    >>

  }
}
