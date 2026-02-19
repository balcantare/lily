\version "2.22.2"
fileName = "CuecaBoliviana.ly"
sheetName = "Cueca Boliviana"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  U -- nos quie -- ren con el al -- ma,
  o -- tros con el co -- ra --
  \set stanza = #"1. "
  zoń ___
  Yo so -- li -- to te -- he que -- ri -- do al -- ma,
  \set stanza = #"1. "
  vi -- da y co -- ra -- zoń ___
  Yo so -- li -- to te -- he que --
  \set stanza = #"1. "
  ri -- do al -- ma,
  vi -- da y co -- ra -- zoń ___
}}

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   Wohnt die Lie -- be in der See -- le
   o -- der tief im Her -- zen
   \set stanza = #"2. " drin?
   Lass von der See -- le es dir er --  zäh -- len
   und hör
   \set stanza = #"2. " mit dem ___ Her -- zen hin.
   Lass von der See -- le es dir er --
   \set stanza = #"2. " zäh -- len
   und hör mit dem ___ Her -- zen hin.
}}


lyrStropheC = {
  \lyricmode {
   \set stanza = #"3. "
  Sagt die See -- le: 'Ich kann flie -- gen,
  wie ein Vo -- gel hoch und
   \set stanza = #"3. " weit! ___
  Spür ich tief ___ in mir die Lie -- be,
  schweb ich
   \set stanza = #"3. " ü -- ber ___ Raum und Zeit.
  ___ Spür ich tief ___ in mir die
   \set stanza = #"3. " Lie -- be,
  schweb ich ü -- ber ___ Raum und Zeit.'
}}

lyrStropheD = {
  \lyricmode {
   \set stanza = #"4. "
   Fragt das Herz: 'Hörst du mein Sin -- gen,
   mei -- nen wil -- den Trom -- mel --
   \set stanza = #"4. " schlag? ___
   Könnt vor Lie -- ___ -- be fast zer -- sprin -- gen,
   wenn ich
   \set stanza = #"4. "  je -- man -- den ger -- ne mag. ____
   Könnt vor Lie -- ___ -- be fast zer --
   \set stanza = #"4. " sprin -- gen,
   wenn ich je -- man -- den ger -- ne mag.' ____

}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
  'Lass uns doch zu -- sam -- men tan -- zen!'
  Sagt die See -- le, 'denn ich
  \set stanza = #"5. " spür:
   ___ Lie -- ben, das ___ geht nur im Gan -- zen!
   Komm mein
   \set stanza = #"5. " Herz, da -- rum tanz mit mir!
   ___ Lie -- ben, das ___ geht nur im
   \set stanza = #"5. " Gan -- zen!
   Komm mein Herz, da -- rum tanz mit mir!'

}}

lyrStropheF = {
  \lyricmode {
  }}

strophe = \transpose ef f \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \key c \minor
  g8[ 8 8] 8[ 8 f]
  c4. c
  c'8[ 8 8] ef[ c bf]
  g4. ef8 ef f |
  g4 bf8 bf[ g f]
  ef4 c8~ c[ ef f]
  g4 f8 g[ g ef]
  c4. ef8 ef f
  g4 bf8 bf[ g f]
  ef4 c8~ c[ ef f]
  g4 f8 g[ f ef]
  c4. r4.
\bar "|."
}

stropheAlt = \transpose ef f \relative c'' {
  \voiceTwo
  g8[ 8 8] 8[ 8 f]
  c4. c
  g'8[ g g] ef[ ef ef]
  ef4. ef8[ 8 d]
  ef4 g8 g[ ef d]
  ef4 c8~ c[ ef ef]
  d4 d8 d[ ef d]
  c4.
   ef8[ 8 d]
  ef4 g8 g[ ef d]
  ef4 c8~ c[ ef ef]
  d4 d8 d[ ef d]
  c4.
}

chrdStrophe = \transpose ef f
 \chordmode {
  c2:m g4 c2.:m s c:m
  ef c:m g c:m ef c:m g c:m
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.15))
    ragged-last-bottom = ##f
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
   >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
