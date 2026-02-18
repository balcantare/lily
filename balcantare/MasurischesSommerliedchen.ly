\version "2.22.2"
sheetName = "Masurisches Sommerliedchen"
sheetComposer = "Beate Tarrach & Reinhard Simmgen"
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace70"
}
stanzaA = \markup {
  \column { \vspace #.33 "1. "}
  \leftbrace
}

stanzaB = \markup {
  \column { \vspace #.33 "2. "}
  \leftbrace
}
skipA=\repeat unfold 34\skip 4

lyrStropheA = {
  \lyricmode {
   \skipA
     \set stanza =     \stanzaA
     Durch glit -- zern -- de Wel -- len ziehn Schwä -- ne da -- hin und
     Fisch -- lein spie -- len am Grund.   
     Und rings an den  grü -- nen -- den U -- fern da
     blühn die Blu -- men, leuch  _ -- tend bunt.  
     Der Som -- mer zieht ü -- ber die Lan -- de, durch Was -- ser, 
     Wie -- sen und Feld.  Und ich lieg mit dir zwi -- schen 
     Him -- mel und Gras, im Blü -- ten -- staub die -- ser Welt.   
     
 }}

lyrStropheB = {
  \lyricmode {
 \skipA
  %\set stanza = #"2. "
  _
  fun -- keln die Trop -- fen auf sam -- te -- ner
  Haut, der Wind spielt in dei -- nem Haar.
  Aus Träu -- men sind un -- se -- re Se -- gel ge -- baut.
  Kein Sturm bringt uns in Ge -- fahr.
  
 }}

lyrStropheC = {
  \lyricmode {
      \skipA
    \set stanza = \stanzaB
    Es paarn sich Li -- bel -- len in schil -- lern -- dem 
    Flug, beim Schilf, und drü -- ben im Moor
    sind Un _ -- ken -- pär -- chen sich selbst _  ge -- nug.
    Ein Reih -- er schwingt sich em -- por.
    
}}

lyrStropheD = {
  \lyricmode {
      \skipA
    %\set stanza = #"4. "
    Zum See -- ro -- sen -- gar _  -- ten will ich dich führn.
    Komm Liebster, ich zeig dir das Glück.
    In tau -- sen -- den Blü -- ten uns zu _ ver -- liern
    das Morgen -- licht spült uns zu -- rück.
    
   
}}

lyrStropheE = {
  \lyricmode {
      \skipA
    \set stanza = #"3. "
    Das Mor -- gen -- rot führt uns nun bei -- de an 
    Land. Lebt wohl, ihr_Ma -- su -- ri -- schen 
    seen. Zum Ab -- schied, mein Lieb _ -- ster, 
    reich mir die Hand,  be -- vor wir Heim -- wärts uns drehn. 
   
}}

strophe = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 3/4
  \key d \major
  \partial 4
  a4 
  a g fs
  g2 g4
  fs e d
  e2 a,4
  d2 d4
 d e fs
 e2.~ 2 a4
 a4 g fs
 g2 g4
 fs e d
 e2 a,4
 d2 d4
 cs d e
 d2.~ d2
 \break
  \repeat volta2 {
 a4
 fs'4. fs8 fs4
 e e e
 d cs b
 a2 a4
 d4~ d d
 d e fs
 e2.~ e2 a4
 a g fs
 g fs e
 fs e d 
 e2 a,4
 d2 d4
 cs d e
 d2.~d2
  }
  \break a4
  a b cs
  d e fs
  g2.
  fs2 e4
  d2 d4
  d e fs
  e2.~e2 \break
   \repeat volta2 {
 a4
 a g fs
 g fs e 
 fs e d
 e2 a,4
 d2 d4
 cs d e
 d2.~d2
 
  
   }
  % \bar "|."
}

chrdStrophe = \chordmode {
  s4 d2. g d a d  b:m  e:m
  a d g d a d a d s
  d a g d 
  d b:m e:m a 
  d g d a d a d s
  d d g d b:m s e:m a
  d g d a d a d
  
 
  
  
  
 
 }

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1))
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
