\version "2.24.2"
sheetName = "Landlied"
sheetComposer = "Reinhard Simmgen"
sheetPoet = "Beate Tarrach"
\include "../include/book.ily"

skipA=\repeat unfold 15 \skip 8

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Hab ich Heim -- weh an den Soh -- len, 
  komm ich her,
  \set stanza = #"1. " wo's nach Flie -- der riecht und nach 
  Ho -- lun -- der -- beer'.
  \set stanza = #"1. " Und Freund Frit -- ze, der im Dorf die 
  Gän -- se hüt',
  \set stanza = #"1. " schnitzt aus Schilf 'ne Flö -- te für 'n 
  Um -- welt -- lied.
  
  Ach, wie gut ist's auf 'm Land da ist nischt los.
  Ach, wie gut ist's auf 'm Land da ist nischt
  la la la la la
  la la la la la la la la 
  la la la la la la la la 
  la
  Ach, wie gut ist's auf 'm Land da ist nischt los.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Ich sah O -- ma ges -- tern steh'n hin -- ter
  den Stores.
  \set stanza = #"2. " Es gibt wirk -- lich nichts, was ihr ent -- geht 
  im Dorf.
  \set stanza = #"2. " Und sie sagt mir, es wird bes -- ser mit den
  Jahrn'.
  \set stanza = #"2. " Schon_als ich klein war, nahm sie mich gern auf 'n
  Arm.
}}


lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "  
  Hab ich Heim -- weh an den Soh -- len, 
  komm ich her,
  \set stanza = #"3. " wo die Knei -- pen zu sind und die Stra -- ßen
  leer.
  \set stanza = #"3. " O -- pa war -- tet wie -- der auf der Bank im Hof.
   \set stanza = #"3. " Auf sein Rheu -- ma und die nächs -- te
  Ka -- tas -- troph'.
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"4. "
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
}}

strophe = \relative c' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key d \major
  \partial 2
  \bar ".|:"
  \repeat volta 2 {
  fs4 g
  a a a b
  a fs e fs 
  d1~ 
  d4 r \break b d
  e e e fs 
  e d b d 
  e1~
  e4 r \break fs g
  a a a  b 
  a fs e fs 
  d1~
  d4 r \break b d
  e e e fs 
  e d b d 
  d1~
  d4 r4
  } \break
  fs4 a
  b b b b
  b a a g
  a1~
  a4 r4 \break b, d
  e4. e8 e4 fs 
  e4. d8 b4 d 
  \break a'4. g8 fs g4.
  a1
  b8 a g a b a g a
  b4. b8 d4 b4
  a4. g8 fs e4.
  d2 \break b4 d
  e4. e8 e4 fs 
  e4. d8 b4 fs' 
  d1~
  d4 r
 \bar "|."
}


chrdStrophe = \chordmode {
  s2
  d1 s g s 
  e:m s a s
  d1 s g s 
  e:m a d s
  g a d s
  e:m a d
  s g s d b:m
  e:m a d
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
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
      #(layout-set-staff-size 20)
    }
  }
}
