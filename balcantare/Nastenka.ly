\version "2.22.2"
sheetName = "Nasten'ka"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Ne, vy -- dj'a, Ne li, tu vy -- dj'a
  Na -- stin -- ke,
  Tu li vy -- dj'a, Ai, tu vy -- dj'a
  Go -- zhyn' -- ko mi -- ri.
  \once \override LyricText.self-alignment-X = #LEFT
  \set stanza = \markup { \right-align Refrain:}
  _ Ai, ne -- ne ne -- ne,
  Ai, ne -- ne ne -- ne
  Ai, ne -- ne -- ne -- ne, ne
  _ Ai, ne -- ne ne -- ne,
  Ai, ne -- ne, ne -- ne -- ne --  ne -- ne -- ne -- ne,
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"3. "
  Tu pok -- xel,
  Tu _ pok _ -- xel,
  Na -- stin -- 'ke.
  Tu pok -- xel,
  Ai, tu pok -- xel
  Tu, go -- zyhn' -- ko mi -- rí.
  \set stanza = #"2. "
  Na -- ne ko -- nes -- ke
  Na -- ne ko -- nes -- ke
  Na -- stya -- ke te -- e skxe -- lel
  Na -- ne ko -- nes -- ke
  Na -- ne ko -- nes -- ke
  Na -- stya -- ke te zba -- gal.
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    %\repeat unfold 24 { \skip 4 }
    Tu pok -- xel,
    Tu _ pok _ -- xel,
    Na -- stin -- 'ke.
    Tu pok -- xel,
    Ai, tu pok -- xel
    Tu, go -- zyhn' -- ko mi -- rí.
}}

strophe = \relative c' {
  %\voiceOne
  \time 2/4
  \key g \minor
  \mark \markup{ \box{\fontsize #4 A}}
   d8. d16 g4
   fs16 g a fs g4
   d4 e
   f2 \break
   d8. 16 g8. bf16
   8. a16 8 g
   g fs ef d
   \mark \markup{ \box{\fontsize #2 Fine}}
   d4. \break
   \repeat volta 2 {
     \mark \markup{ \box{\fontsize #4 B}}
   d8
   d8. d16 g8 16 16
   fs8. fs16 g8 16 16
   d8 8 e16 d e8
   f4. f8 \break
   d8. 16 g8 16 16
   bf8. a16 8 ef16 ef
   g8 fs ef d
   d4.
  }
}

chrdStrophe = \chordmode {
   d4:7 g:m
   d:7 g:m
   \set chordBassOnly = ##t
   g:m/g c
   f2
   d4:7 g:m
   \set chordBassOnly = ##f
   c:m c:dim/ef
   d2 s
   d4 g:m
   d:7 g:m
   \set chordBassOnly = ##t
   g:m/g c
   f2
   d4:7 g:m
   \set chordBassOnly = ##f
   c:m c:dim/ef
   d2 s4.
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.35))
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
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
  }
  \markup { \vspace #3  \hspace #6 \fontsize #2
    \column{
      \line{ \box{ A} 1. Strophe }
      \line{ \box{ B} Refrain}
      \line{ \box{ B} 2. Strophe}
      \line{ \box{ B} Refrain}
      \line{ \box{ A} 3. Strophe }
      \line{ \box{ B} Refrain}
      \line{ \box{A/B} Solo}
      \line{ \box{ A} 1. Strophe langsam}
      \line{ 2 x\box{ B} Refrain }
      \line{ \box{ A} 1. Strophe langsam .. \box{Fine}}
    }
  }
}