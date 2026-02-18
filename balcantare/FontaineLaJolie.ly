\version "2.24.0"
sheetName = "Fontaine La Jolie"
\include "../include/book.ily"

% https://www.youtube.com/watch?v=DhOSJS4OcLw

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
%  Mon pè -- re‿a -- vai -- t‿un gars
%  et ma mè -- re‿u -- ne fi -- lle
%  Fon -- taine la la la la
%  fon -- taine la jo -- lie.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 3/4
  \key d \minor
  \bar ".|:"
  \repeat volta 2 {
    d8 f16 e d8 c d4
    d8 e16 f g8 e f e \break
    d8 f16 e d8 c d4
    d8 e16 f g8 e f e  \break
    d8 e16 f g8 e f d
    f8 e16 d c8 d e4  \break
    d8 e16 f g8 e f d
    d8 e16 f d8 c d4
  }
}

#(define mydrums '((tambourine default #f 0)))

tambustaff = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  }

rythm=\drummode {
  \stemUp
    tamb4 8 8 4
    4 4 4
    4 8 8 4
    4 4 4
    4 4 4
    4 8 8 4
    4 4 4 
    4 r8 tamb8 4
 }

chrdStrophe = \chordmode {
  \set chordBassOnly = ##t
  d4:m d8:m/a d8:m/c d4:m/d
  d4:m a4:m a4:m/c
  d4:m d8:m/a d8:m/c d4:m/d
  d4:m a4:m a4:m/c
  d:m c bf
  d:m a:m a:m/c
  d:m c bf
  d:m s8 a:m d4:m 
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
    \new DrumStaff {
      \tambustaff
      \set DrumStaff.drumStyleTable = #(alist->hash-table mydrums)
      \rythm}
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
