\version "2.24.2"
sheetName = "Le Jeune Homme de Nantes"
\include "../include/book.ily"
\language "english"

sheetTonality = d

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  L’é tai -- t‿un jeune homme de Nan -- tes qui 
  vou -- lait se ma -- ri -- er
  \set stanza = #"1. "
  A la plus bel -- le des fil -- les, qu’e tait
  cel -- le du meu -- nier
  Don -- nez -- moi sa main, 
  je sau -- rez la pren -- dre
}}

lyrStropheB = {
  \lyricmode { 
    \set stanza = #"2. "
    A la plus bel -- le des fil -- les, 
    qu’e tait cel -- le du meu -- nier
    \set stanza = #"2. "
    Au pre -- mier jour du de -- cem -- bre
    l'es -- t‿al -- le la de -- man -- der
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Au pre -- mier jour de de -- cem -- bre
  l’es -- t‿al -- le la de -- man -- der
  \set stanza = #"3. "
  Vo -- tre fil -- le‿es -- t‿el -- le‿ai -- man -- te, 
  j’ai -- me -- rais bien l’é -- pou -- ser
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Vo -- tre fil -- le‿es -- t‿el -- le‿ai -- man -- te, 
   j’ai -- me -- rais bien l’é -- pou -- ser
   \set stanza = #"4. "
   J’ai a moi u -- ne de -- meu -- re un 
   jar -- din et un ver -- ger  
}}

lyrStropheE = {
  \lyricmode {
   \set stanza = #"5. "
   J’ai a moi u -- ne de -- meu -- re un 
   jar -- din et un ver -- ger
   \set stanza = #"5. "
   Don -- nez donc la moi sur l’heu -- re,
   nous pour -- rons les cul -- ti -- ver
}}

lyrStropheF = {
  \lyricmode {
  \set stanza = #"6. "
  Ces -- sez la de vous me prend -- re,
  car el -- le pas a don -- ner
  \set stanza = #"6. "
  Ma fil -- le‿est bel -- le‿et char -- man -- te, 
  el -- le‿est bon -- ne a‿e -- tre‿ai -- mée
}}

lyrStropheG = {
  \lyricmode {
  \set stanza = #"7. "
  Ma fil -- le‿est bel -- le‿et char -- man -- te, 
  el -- le‿est bon -- ne a‿e -- tre‿ai -- mée
  \set stanza = #"7. "
  Par un a -- mant re -- spec -- tab -- le, 
  ce -- lui qu’el -- le‿a de ci -- de
}}

lyrStropheH = {
  \lyricmode {
  \set stanza = #"8. "
  Par un a -- mant re -- spec -- tab -- le, 
  ce -- lui qu’el -- le‿a de ci -- de
  \set stanza = #"8. "
  Mon -- sieur vous ve -- nez de Nan -- tes,
  vous pou -- vez y re -- tour -- ner
 \set stanza = #"fine:"
  Ou -- bli -- ez sa main, elle n’est pas à ven -- dre
}}

strophe = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key d \major
  \bar ".|:"
  \repeat volta 2 {
    b8 d fs g \noBreak
    e d fs fs \noBreak
    b, d fs g \noBreak
    e d fs4
  }  \break
  fs8 fs fs e
  fs g e e 
  cs8 d e fs 
  e d cs4 \break
  \repeat volta 2 {
    b8 d fs4
    e g
    fs8 e d cs
    d4 b
  }
  \bar ":|."
}

chrdStrophe = \chordmode {
  b2:m s s s
  \set chordBassOnly = ##t
  b2:m b:/g fs:m7
  s4 b:m
  b2:m b:/g fs:m7
  b:m
  
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
    %system-system-spacing.padding = #6
  }
  \header {
    subtitle = "Rond d'Argenton"
  }
  \bookItem
  %\markup \vspace #2
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 22)
    } 
    << 
      \new ChordNames \doTranspose \chrdStrophe 
      \new Staff <<
        \new Voice = "Strophe" \doTranspose \strophe 
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    \new Lyrics \lyricsto "Strophe" \lyrStropheG
    \new Lyrics \lyricsto "Strophe" \lyrStropheH
    >>
  }

}
