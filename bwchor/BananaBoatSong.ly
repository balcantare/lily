\version "2.24.2"
sheetName = "Banana Boat Song"
sheetComposer = "Jamaika"
\include "../include/book.ily"


leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace70"
}
stanzaA = \markup {
  \column { \vspace #.33 "1a. "}
  \leftbrace
}
stanzaB = \markup {
  \column { \vspace #.33 "2a. "}
  \leftbrace
}

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1-4. "
  Day O,
  day __ _ _ O
  Day, me say day, me say day, me say day, me say day, me say day, _
  O _ 
  \skip 8
  \set stanza = \stanzaA
  Work all night on a drink of rum
  \set stanza = #"1b,3. "
  Come, mis -- ter Tal -- ly Man,
  tal -- ly me ba -- na -- na 
  Day -- light come and me wan' go home
  Day -- light come and me wan' go home
  
}}

skipA = \repeat unfold 25 {\skip 8}

lyrStropheB = {
  \lyricmode {
    \skipA
  %\set stanza = #"2. "
  _ Stack ba -- nana till the mor -- nin' come
  
}}


lyrStropheC = {
  \lyricmode { \skipA
  \set stanza = #"1c,2b. "
  Lift six foot, seven foot, _ eight foot bunch
}}

lyrStropheD = {
  \lyricmode {
    \skipA
  \set stanza = \stanzaB
  A beauti -- ful bunch o' _ ripe ba -- nana
}}

lyrStropheE = {
  \lyricmode {
    \skipA
  %\set stanza = \stanzaB
  _ Hide the dead -- ly _ black taran -- tula
}}



strophe = \relative c'' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key f \major
  f4. c8~ c2
  e8 d c a~ a2
  %\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup {\fontsize #2 \box ..A }
  \bar "||"
  f'4 r2 c8 f 
  \tuplet 3/2 {e4 c e}
  \tuplet 3/2 {d4 bf d}
  \tuplet 3/2 {c a c}
  \tuplet 3/2 {bf g bf}
  a8 f d c~ c2
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup {\fontsize #2 \box ..B }
  \bar "||" \break
  \override Staff.TimeSignature.break-visibility = ##(#f #f #f)
  \time 1/4
   c'4
  \time 4/4
  \repeat volta 2 {
    a4 c a c8 c
    a8 c4 f8~ f2
  }
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup {\fontsize #2 \box ..A,B }
  \repeat volta 2 {
    a,4 c8 c a a c4
    bf8 bf bf g e4 c
  }
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup {\fontsize #2 \box ..A,B } \break
  
  \time 1/4
  s4  
  \time 4/4
  \bar "||"
  \mark \markup {\fontsize #2 \box A }
  f8 f4 a8~ a8 a4 f8
  g4 f a8( c4.)
  \bar "||"
  \mark \markup {\fontsize #2 \box B }
  f,8 f4 a8~ a8 a4 f8
  g4 g f s
  
  
  \bar "|."
}

chrdStrophe = \chordmode {
  f1 c2 f2
  f1 c2 bf f c:7 s1
  s4
  f1 s 
  f1 c1:7 s4
  f1 c2:7 f
  f1 c2:7 f
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    %ragged-last-bottom = ##f
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
