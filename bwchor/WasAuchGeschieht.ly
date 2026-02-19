\version "2.24.2"
sheetName = "Was auch geschieht"
sheetComposer = "Beate Tarrach"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Stol -- zer Baum, der Sturm kann dei -- ne
  Kro -- ne einst ver -- let -- zen.
  \set stanza = #"1. "
  Doch auf dei -- nen star -- ken Ast die Vö -- gel
  sich gern set -- zen.
  Was auch ge -- schieht, Was auch ge -- schieht,
  \set stanza = #"1. "
  Im Spiel mit dem Wind _ singt der Baum sein Lied.
  La -- la -- la -- la -- la -- la, 
  la -- la -- la -- la -- la.
  \set stanza = #"1. "
  Stark wie ein Baum
  \set stanza = #"1. "
  kön -- nen wir sein, 
  aus Mil -- liar -- den Zel -- len,
  kei -- ne ist al -- lein.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Wil -- de Wo -- gen, har -- te Fel -- sen
  wol -- len euch zer -- schla -- gen.
  \set stanza = #"2. "
  Doch im wei -- ten Meer seid ihr es,
  die die Mö -- wen tra -- gen.
  \repeat unfold 8 \skip 8
  \set stanza = #"2. "
  Im Tanz der Ge -- zei -- ten
  singt das Meer sein Lied.
  \repeat unfold 11 \skip 8
  \set stanza = #"2. "
  Stark wie das Meer  
  \set stanza = #"2. "
  kön -- nen wir sein,
  aus Mil -- liar -- den Trop -- fen,
  kei -- ner ist al -- lein.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Al -- te Frau, die wei -- ßen Haa -- re
  wehn' im Som -- mer -- wind. _
  \set stanza = #"3. "
  Fried -- lich schla -- fend liegt in ih -- rem
  Arm ein klei -- nes Kind. _
  \repeat unfold 8 \skip 8
  \set stanza = #"3. "
  (Kommt,) singen wir des Le _ -- bens _
  wunder -- bares Lied!
  \repeat unfold 11 \skip 8
  \set stanza = #"3. "
  Stark für das Leben 
  \set stanza = #"3. "
  kön -- nen wir sein,
  hal -- ten wir zu -- sam -- men,_ist
  kei _ -- ner  al -- lein.

}}

stropheSopran = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \minor
  \stopStaff
  \omit Staff.Clef
  \omit Staff.KeySignature
  \omit Staff.StaffSymbol
  \startStaff
  s1*4 
  \break

  \stopStaff
  \undo \omit Staff.Clef
  \undo \omit Staff.KeySignature
  \undo \omit Staff.StaffSymbol
  \startStaff
  \voiceOne
  d8 a' a a a g g f
  f e g e d4 d
  d8 a' a a a g g f
  f e g e d4 d
  \repeat volta 2 {
  \tuplet 3/2 {c4 e g} f2
  \tuplet 3/2 {g4 a bf} a4. \break a8
  g4 a8 g f8 f g f 
  e4 cs d2
  }
  \repeat volta 2 {
    d8. a'16 a8 a a4 g
    f8 e g e d2
  }
  \repeat volta 2 {
    \tuplet 3/2 {c4 e g} f2
    \tuplet 3/2 {g4 a bf} a2
    g8 g a g f d4. 
    e8. e16 e8 cs d2
  }
}

strophe = \relative c' {
    %\voiceTwo
  s1*4  
  \voiceTwo
  d8 f f f f e e d
  c c c c d4 d
  d8 f f f f e e d
  c c c c d4 d
  \tuplet 3/2 {c4 c c} c2
  \tuplet 3/2 {e4 e c} f4. f8
  d4 d8 d f f d bf
  a4 a d2
  d8. f16 f8 f f4 e c8 c c c d2
  \tuplet 3/2 {c4 c c} c2
  \tuplet 3/2 {e4 e c} f2
  d8 d d d f f4.
  a,8. a16 cs8 a d2
}

chrdIntro = \chordmode {
   d2:m c d:m a:7 d:m a:7 d1:m
}
chrdStrophe = \chordmode {
  s1*4
  d1:m a2:m7 d:m
  d1:m a2:m7 d:m
  c f
  g:m d:m g:m d:m
  a:7 d:m
  d1:m a:7
  c2 f
  g:m d:m g:m d:m
  a:7 d:m
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
    \new Staff \with {\accepts ChordNames}
    <<
      \new ChordNames \with {
         \override ChordName.Y-offset = #-1.5 
       } \chrdIntro 
      \context Voice = "StropheSopran" { \stropheSopran }
      \context Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheC
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
