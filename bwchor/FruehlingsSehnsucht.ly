\version "2.24.2"
sheetName = "Frühlingssehnsucht"
sheetComposer = "Beate Tarrach"
\include "../include/book.ily"
sheetTonality = e

skipA=\repeat unfold 30 \skip 8

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  \skipA
  Es ist an der Zeit,
  daß der Win -- ter ver -- geht
  und ü -- ber den Schnee ein war -- mer Wind weht.
  Es ist an der Zeit, daß Blu -- men er -- blühn
  und Vö -- gel  durchs Son -- nen -- licht
  ziehn, 
  und Vö -- gel  durchs Son -- nen -- licht
  ziehn.
  \set stanza = #"1. "
  Die Son -- ne er -- o -- bert die Her -- zen im Sturm
  von uns Men -- schen, den 
  \set stanza = #"1. " Pflan -- zen, je -- dem 
  win -- zi -- gen Wurm.
  Al -- le ha -- ben wir uns nach der 
  \set stanza = #"1. "
  Wär -- me 
  ge -- sehnt und daß uns der Früh -- ling ver -- wöhnt.
}}

skipB=\repeat unfold 47 \skip 8
lyrStropheB = {
  \lyricmode {
  \skipA
  \skipB
  \set stanza = #"2. "
  Die Wild -- gän -- se keh -- ren vom Sü -- den zu -- rück
  und _ sin -- gen ihr 
  \set stanza = #"2. " Lied -- chen, welch _ herr -- li -- ches Glück!
  Ü -- ber -- all regt sich Le -- ben und 
  \set stanza = #"2. " fröh -- li -- cher Klang
  und al -- les er -- wacht vom Ge -- sang.
}}

lyrStropheC = {
  \lyricmode {
  \skipA
  \skipB    
  \set stanza = #"3. "
  Die trau -- ri -- gen See -- len, 
  sie wer -- den be -- rührt
  vom _ gol -- de -- nem 
  \set stanza = #"3. " Zau -- ber, der die 
  Blü -- ten ver -- ziert.
  Es _ öff -- nen sich Her -- zen, es 
  \set stanza = #"3. " öff -- nen sich Tür'n.
  Kommt lasst euch vom Früh -- ling ver -- führ'n!
}}


stropheSopran = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 3/4
  \key e \major
  \partial 4
   \mark \markup{ \box{\fontsize #2 Vl}}
  gs8 a 
  b2 b4
  b2 gs4
  a4 e2 
  e2 gs4
  fs2 gs4 
  fs2 b4
  b2a4
  gs2.~ gs2 \break
  
  \mark \markup{ \box{\fontsize #2 Vk}}
  gs8 a
  b2 e4
  e2 b4
  cs4 a2 
  a2 gs4
  gs2 fs4 
  e2.~ e2 \break
  
  \voiceOne
  b4 
  e4 e fs
  gs2 b8 b
  a4 gs fs
  e2 fs4
  gs4 gs a
  b2 \break b4
  b a gs
  fs2 gs8( a)
  b4 b gs
  e2 e4 
  cs' cs b
  a2 \break  a4
  gs4 b a
  gs8 fs4. ds4
  b'2.~
  b2 b4
  b a gs 
  gs8 fs4. e4
  e2.~
  e2 \break e4
  ds ds e
  fs fs gs 
  a a gs
  fs2 gs8 a
  b4 gs e 
  cs' a a8 gs
  fs4 fs gs
  fs2 e8 e
  ds4 ds e 
  fs fs  gs
  a a gs
  fs2 b4
  b gs e 
  cs' b cs
  b2.~ 
  b2 
  \bar "|."
}

stropheAlt = \relative c' {
   \voiceTwo
   s2.*16
   b4 
   e e ds
   e2 e8 ds
   cs4 b b
   b2 ds4
   e4 e ds 
   e2 gs4
   gs e e 
   ds2 e8( fs)
   gs4 e e 
   cs2 b4 
   cs4 b cs8( ds)
   e2 e4
   e4 b b 
   b8 ds4. ds4
   e2.~ e2 e4
   e cs cs
   cs8 b4. b4
   b2.~ 2 cs4
   b b cs 
   ds ds e
   fs fs e
   ds2 e8 fs
   gs4 e e 
   a fs fs8 e
   ds4 ds cs
   b2 cs8 cs
   b4 b cs 
   ds ds e
   ds ds cs
   ds2 e4 fs e e 
   a gs fs 
   fs2.~
   fs2

}

chrdStrophe = \chordmode {  
  s4 
  e2. s a s b:7 s e s
  e2. s a s b:7 s e s
  e s b:7 e s s s b:7 e cs:m a s e b:7 e s a b:7 e
  s b:7 s s s e a b:7 s s s s s e a b:7 s2
}

\layout {
  \context {
    \Lyrics
    \override VerticalAxisGroup.staff-affinity = #UP
    \override VerticalAxisGroup.nonstaff-nonstaff-spacing.minimum-distance = #4.8
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.minimum-distance = #2
    \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing.minimum-distance = #10
  }
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
             
  \score {
    <<
    \new ChordNames \doTranspose \chrdStrophe 
    \new Staff \with {\accepts ChordNames}
    <<
      \context Voice = "StropheSopran" { \doTranspose \stropheSopran }
      \context Voice = "StropheAlt" { \doTranspose \stropheAlt }
      >>
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheC
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 20)

    }
  }
}
