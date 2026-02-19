\version "2.24.0"
sheetName = "Planet des Friedens"
sheetComposer = "Reinhard Simmgen"
sheetPoet = "Beate Tarrach"
\include "../include/book.ily"


skipA = \repeat unfold 17 { \skip 8 }

lyrStropheA = {
  \lyricmode {
    \skipA
     \set stanza = #"1. "
     Soll uns -- re Welt ein Pla -- net des
     Frie -- dens sein,
     \set stanza = #"1. " 
     müs -- sen wir uns von Haß und Krieg
     be -- frein'.
     \set stanza = #"1. " 
     _ Krie -- ge ge -- win -- nen  nur die 
     mit Macht und Geld.
     Des -- halb 
     \set stanza = #"1. "
     lasst uns kei -- ne Fein -- de
     sein mehr auf die -- ser Welt!
     
     Ein Pla -- net des Frie -- dens das sei uns -- re Welt!
     Ein Pla -- net des Frie -- dens, wo je -- des Le -- ben zählt.
     Ein Pla -- net des Frie -- dens ein Ort der Mensch -- lich -- keit!
     Un -- ser Traum braucht ei -- ne Chance auf 
     Wirk -- lich -- keit,
     ge -- ben wir dem Traum die Chance auf Wirk -- lich -- keit!
}}

lyrStropheB = {
  \lyricmode {
    \skipA
    \set stanza = #"2. "
    Kann uns -- re Welt ein Pla -- net des Frie -- dens sein?
    \set stanza = #"2. "
    Kön -- nen wir Völker uns Haß und Leid ver -- zeihn'?
    \set stanza = #"2. "
    _ Men -- schen der Er -- de _ reicht euch _ die Hand,
    denn wir 
    \set stanza = #"2. "
    al -- le brau -- chen end -- lich Frie -- den,
    in je -- dem Land!
}}

lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = #"3. "
    Wird uns -- re Welt ein Pla -- net des Frie -- dens sein,
    \set stanza = #"3. "
    kann al -- les Leben und Glück auf ihr ge -- deihn'.
    \set stanza = #"3. "
    Wenn Wun -- den ver -- hei -- len, kann Neu -- es _ ent -- stehn'.
    Lasst als 
    \set stanza = #"3. "
    Mensch _ -- heits -- fa -- mi -- lie uns den_Weg 
    ge -- mein -- sam gehn'!
   
}}

lyrStropheD = {
  \lyricmode {
}}

strophe = \relative c''{
  %\voiceOne
  \time 4/4
  \key a \major
  \partial 8
  b'8 
  cs8 b a e~ e4. e8
  b'4. a8 b4. b8
  d8 cs b a a4. b8
  a2. r4  \break
  cs,4 cs8 d e4 a,8 a
  fs'8 e d e  e2
  cs8 cs4 d8 e4. e8
  e8 d d cs b4. \break fs'8
  fs4 fs8 fs gs8 e4 e8
  e d d cs cs4 cs8 b
  b a a8. d16 d8 cs b a~
  a e' e fs e4 \break 
  fs8 gs
  a4. fs8 e a,4.
  fs'8 e d8. e16 e4 \break cs8 b 
  a4. b8 cs8 cs4 cs8
  a8 a a b b4 fs'8 gs
  a4. fs8 e a,4 \break a8
  fs'8 e d e e4 cs8 b
  b8 a a8. a16 b8 b b a
  e'2. fs8 gs
  a8 e e cs d cs b a 
  a2. 
  
  
\bar "|."
}

chrdStrophe = \chordmode {
  s8
  a1 d2 e d e a1
  a1 d2 a
  a1 d2 e
  d cs:m d fs:m
  d cs:m
  e1 
  d2 a d a 
  fs1:m d2 e
  d a d fs:m
  d e a d
  a d4 e 
  a2.
  
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
    \new ChordNames { \transpose a c {\chrdStrophe }}
    \new Staff <<
      \new Voice = "Strophe" { \transpose a c {\strophe }}
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD

    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
      \context {
        \Lyrics
        %\override LyricText.font-size = #+1
      }
    }
    %\midi {}
  }
}
