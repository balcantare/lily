\version "2.24.0"
sheetName = "Sterne über stillen Straßen"
sheetComposer = "Gerhard Wohlgemuth"
sheetPoet = "Egon Günther"
\include "../include/book.ily"

\language "english"

lyrStropheA = {
  \lyricmode {
    \set stanza = "1. "
    Ster -- ne  ü -- ber stil -- len Stra -- ßen 
    und es geht ein 
    \set stanza = "1. "
    Wind so kalt,
    von den Ber -- gen leuch -- tet nie -- der,
    \set stanza = "1. "
    leuch -- tet nie -- der weiß und ein -- sam
    schon der Wald.
  
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Aus der En -- ge woll'n wir tre -- ten,
    heut ist wun -- der -- 
    \set stanza = "2. "
    ba -- re Zeit,
    Stern -- glanz fern in Him -- mels -- wei -- ten,
    \set stanza = "2. "
    Him -- mels -- wei -- ten ü -- ber -- strahlt
    Un -- end -- lich -- keit.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = "3. "
  Zün -- det Feu -- er auf den Hü -- geln,
  auf den Ber -- gen 
  \set stanza = "3. "
  tief ver -- schneit,
  daß sie weit die Welt er -- leuch -- ten,
  \set stanza = "3. "
  Welt er -- leuch -- ten wie ein Stern -- bild
  uns -- rer Zeit.
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = "4. "
  Klingt ein wun -- der -- ba -- res Sin -- gen,
  klingt von weit -- her, 
  \set stanza = "4. "
  fei -- er -- lich,
  dringt aus vie -- len tau -- send Her -- zen,
  \set stanza = "4. "
  tau -- send Her -- zen: Frie -- den wir 
  be -- %\set stanza = "4. " 
  wah -- ren dich.
}}

strophe = \relative c'' {
  \time 6/8
  \key c \major
  \accidentalStyle modern-voice-cautionary
  \voiceOne
%  \stopStaff
%  \omit Staff.Clef
%  \omit Staff.KeySignature
%  \omit Staff.StaffSymbol
%  \startStaff
%  s2.*4 \bar "||" 
%  \break
%  \stopStaff
%  \undo \omit Staff.Clef
%  \undo \omit Staff.KeySignature
%  \undo \omit Staff.StaffSymbol
%  \startStaff
  \autoBeamOff
  c4 g8 g[ a] f
  e4 d8 f4 e8 %\break
  e[ f] d g4 g8
  a4 c8 b4. %\break
  c8.[ b16] a8 g4 g8
  d'4 b8 c4 e8 %\break
  d8.[ e16] d8 e4 c8
  b4 a8 g4 c8 %\break
  d4 b8 c4.
  \bar "|."
}

alt = \relative c' {
  \voiceTwo
  \accidentalStyle modern-voice-cautionary
  e4 d8 c4 c8
  b4 a8 b4 c8
  c4 d8 e4 d8
  e4 fs8 e4.
  e4 e8 e4 e8
  d4 g8 g8 a bf
  a4 b8 a4 a8
  g4 f8 e4 e8 
  f8 a g g4.
}

bass = \relative c {
  \clef "bass"
  \accidentalStyle modern-voice-cautionary
  \voiceTwo
  c4 f8 e4 d8
  g4 f8 c4 c8 
  a4 b8 c4 b8
  a8 e' d e4.
  a4 a8 e4 e8
  f4 d8 e f g
  f4 g8 c b a
  e4 f8 g4 a8
  g4 g8 c,4.
}

tenor = \relative c' {
  \voiceOne
  \clef "bass"
  \accidentalStyle modern-voice-cautionary
  c4 b8 a4 a8
  g4 g8 a g g
  a4 g8 g a b
  c4 a8 gs4.
  a8. b16 c8 d c b
  a4 d8 c4 c8
  f4 f8 e4 e8
  d4 c8~ c8 c8 c
  b8 c d e4.
  
}

chrdStrophe = \chordmode {
  %d4. g a d
  %b:m e:m a d 
  c4 g8:7/f a4:m/e d8:m7 
  e4.:m/g g4:7/c c8
  a4:m g8:/b c4 g8:/b 
  a4:m d8:7 e4.
  a:m c4:/e e8:m
  d4:m/f g8:/d c8:/e f c:7/g
  d4:m/f g8 a4:m/c a8:m
  e4:m7 f8 c4:/g a8:m
  g4:7 g8 c4.
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames \chrdStrophe 
    \new Staff <<
      \new Voice = "Strophe" \strophe
      \new Voice = "Alt" \alt
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Staff <<
      \new Voice = "Bass" \bass
      \new Voice = "Tenor" \tenor
    >>
    >>
  }
}