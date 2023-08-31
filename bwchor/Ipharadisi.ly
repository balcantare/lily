\version "2.24.0"
sheetName = "Ipharadisi"
sheetComposer = "trad. Südafrika, arr. Anders Nyberg"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  %\set stanza = #"1. "
  I -- pha -- ra -- di -- si,
  i -- kha -- ya la -- ba -- fi -- le,
  I -- pha -- ra -- di -- si,
  i -- kha -- ya la -- ba -- fi -- le,
  I -- pha -- ra -- di -- si,
  i -- kha -- ya la -- ba -- fi -- le,
  Ku -- la -- pho so -- phum -- la
  kho -- na, I -- pha -- ra -- di -- si.
}}

strophe = \relative c' {
  \voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key f \major
  \partial 8
  \override Rest.staff-position = #-2
     c8
     f4. 8 c8 8 r8 8
     d8 8 8 8 8 8 r8 8
     f4. 8 c8 8 r8 8
     f8 8 e8 d8 e8 8 r8 c8
     f4. 8 c8 8 r8 8
     d8 8 8 8 8 8 r8 8
     \tuplet 3/2 { f4 e4 d4 } d8 e8 r8 c8
   8c 8f 8f 8 8[ 8] r8
   \bar "|."
}

stropheSopran = \relative c' {
  \voiceOne
      f8
     a4. 8 f8 8 s8 8
     g8 f8 8 d8 f8 8 s8 \break 8
     a4. 8 f8 8 s8 8
     a8 8 g8 f8 g8 8 s8 f8
     a4. 8 f8 8 s8 \break f8
     g8 f8 f8 d8 f8 8 s8 8
     \tuplet 3/2 { a4 g4 f4 } f8 g8 s8 f8
   f8 8 8 8 8[ 8] s8
  
}

stropheBass = \relative c {
  \key f \major
  \clef "bass"
  \accidentalStyle neo-modern %-voice-cautionary
  \partial 8
  \voiceTwo
   \override Rest.staff-position = #1
       f8
     4. 8 8 8 r8 8
     bf,8 8 8 8 8 8 r8 8
     f'4. 8 8 8 r8 8
     8 8 e8 d8 c8 8 r8 8
     f4. 8 8 8 r8 8
     bf,8 8 8 8 8 8 r8 8
     \tuplet 3/2 { f'4 e4 d4 } 8 c8 r8 8
   f8 8 8 8 8[ 8] r8
  
}

stropheTenor = \relative c' {
   \voiceOne
      a8
     c4. c8 a8 8 s8 8
     bf8 8 8 8 8 8 s8 8
     c4. 8 a8 8 s8 8
     c8 8 8 a8 c8 8 s8 a8
     c4. 8 a8 8 s8 8
     bf8 8 8 8 8 8 s8 8
     \tuplet 3/2 { c4 4 a4 } 8 g8 s8 f8
   8 8 8 8 8[ 8] s
  
}
chrdStrophe = \chordmode { 
   s8
   f1 bf f s2 c 
   f1 bf f2 c f4 bf f 
  
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    %ragged-last-bottom = ##f
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
    \new Staff <<
      \new Voice = "Tenor" { \stropheTenor }
      \new Voice = "Basso" { \stropheBass }
      >>
    >>

  }
  \markup { \vspace #5  \hspace #6 \fontsize #2
    \column{
      \line{ Im Paradies, wo alle Ahnen lebendig sind, }
      \line{ werden wir uns eines Tages alle wiedersehn.}
     }
  }
}
