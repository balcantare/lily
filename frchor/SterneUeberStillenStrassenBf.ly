\version "2.24.0"
sheetName = "Sterne über stillen Straßen (Bf)"
sheetComposer = "Gerhard Wohlgemuth"
sheetPoet = "Egon Günther"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
    \set stanza = "1. "
    Ster -- ne  ü -- ber stil -- len Stra -- ßen 
    \set stanza = "1. " 
    und das Jahr ist end -- lich alt,
    \set stanza = "1. "
    von den Ber -- gen leuch -- tet nie -- der,
    \set stanza = "1. "
    leuch -- tet nie -- der weiß und ein -- sam
    \set stanza = "1. "
    schon der Wald.
  
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Aus der En -- ge woll'n wir tre -- ten,
    \set stanza = "2. "
    heut ist wun -- der -- ba -- re Zeit,
    \set stanza = "2. "
    Stern -- glanz fern in Him -- mels -- wei -- ten,
    \set stanza = "2. "
    Him -- mels -- wei -- ten ü -- ber -- strahlt
    Un -- \set stanza = "2. " end -- lich -- keit.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = "3. "
  Zün -- det Feu -- er auf den Hü -- geln,
  \set stanza = "3. "
  auf den Ber -- gen tief ver -- schneit,
  \set stanza = "3. "
  daß sie weit die Welt er -- leuch -- ten,
  \set stanza = "3. "
  Welt er -- leuch -- ten wie ein Stern -- bild
  \set stanza = "3. "
  uns -- rer Zeit.
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = "4. "
  Klingt ein wun -- der -- ba -- res Sin -- gen,
  \set stanza = "4. "
  klingt von weit -- her, fei -- er -- lich,
  \set stanza = "4. "
  dringt aus vie -- len tau -- send Her -- zen,
  \set stanza = "4. "
  tau -- send Her -- zen: Frie -- den wir 
  be -- \set stanza = "4. " wah -- ren dich.
}}

strophe = \relative c'' {
  \time 6/8
  \key d \major
  \stopStaff
  \omit Staff.Clef
  \omit Staff.KeySignature
  \omit Staff.StaffSymbol
  \startStaff
  s2.*4 \bar "||" 
  \break
  \stopStaff
  \undo \omit Staff.Clef
  \undo \omit Staff.KeySignature
  \undo \omit Staff.StaffSymbol
  \startStaff
  \autoBeamOff
  d4 a8 a[ b] g
  fs4 e8 g4 fs8 \break
  fs[ g] e a4 a8
  b4 d8 cs4. \break
  d8.[ cs16] b8 a4 a8
  e'4 cs8 d4 fs8 \break
  e8.[ fs16] e8 fs4 d8
  cs4 b8 a4 d8 \break
  e4 cs8 d4.
  \bar "|."
}

chrdStrophe = \chordmode {
  d4. g a d b:m e:m a d 
d4. g a d a d e:m a g d a d a b:m g d e4:m a8 d4. 

}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames \transpose d bf, \chrdStrophe 
    \new Staff <<
      \new Voice = "Strophe" \transpose d bf, \strophe
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}