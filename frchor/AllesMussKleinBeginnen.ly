\version "2.24.0"
sheetName = "Alles nuß kllein beginnen"
sheetComposer = "Gerhard Schöne"
\include "../include/book.ily"

skipA = \repeat unfold 34 { \skip 8 }

lyrA = {
  \lyricmode {
  Al -- les muss klein be -- gin -- nen, _ _
  lass et -- was Zeit ver -- rin -- nen. _ _
  Es muss nur Kraft ge -- win -- nen, _ _
  und end -- lich ist es groß. _
  \set stanza = "1. "
  Schau nur die -- ses Körn -- chen, 
  ach man sieht es kaum,
  \set stanza = "1. "
  gleicht bald ei -- nem Gras -- halm.
  Spä -- ter wird´s ein Baum.
  \set stanza = "1. "
  Und nach vie -- len Jah -- ren,
  wenn ich Rent -- ner bin,
  \set stanza = "1. "
  spen -- det er mir Schat -- ten, 
  singt die Am -- sel drin:
}}

lyrB = {
  \skipA
  \lyricmode {
  \set stanza = "2. "
  Schau die fei -- ne Quel -- le 
  zwi -- schen Moos und Stein,
  \set stanza = "2. "
  sam -- melt sich im Ta -- le, 
  um ein Bach zu sein.
  \set stanza = "2. "
  Wird zum Fluß an -- schwel -- len,
  fließt zur Ost -- see hin,
  \set stanza = "2. "
  braust dort ganz ge -- wal -- tig, 
  singt das Fisch -- lein drin.
}}

lyrC = {
  \skipA
  \lyricmode {
  \set stanza = "3. "
  Schau die leich -- te Flo -- cke, 
  wie sie tanzt und fliegt
  \set stanza = "3. "
  bis zu ei -- nem Äst -- chen, 
  das_un -- term Schnee sich biegt.
  \set stanza = "3. "
  Lan -- det da die Flo -- cke 
  und durch ihr Ge -- wicht,
  \set stanza = "3. "
  bricht der Ast he -- run -- ter 
  und der Ra -- be spricht:
 }}

lyrD = {
  \skipA
  \lyricmode {
  \set stanza = "4. "
  Manch -- mal denk ich trau -- rig: 
  Ich bin viel zu klein!
  \set stanza = "4a. "
  Kann ja doch nichts ma -- chen! 
  Und dann fällt mir ein:
  \set stanza = "4a. "
  Erst ein -- mal be -- gin -- nen. 
  Hab ich das ge -- schafft,
}}

skipB = \repeat unfold 45 { \skip 8 }

lyrE = {
  \skipB
  \lyricmode {
  \set stanza = "4b. "
  nur nicht mut -- los wer -- den, 
  dann wächst auch die Kraft.
  \set stanza = "4b. "
  Und dann seh ich stau -- nend: 
  Ich bin nicht al -- lein.
  \set stanza = "4b. "
  Vie -- le Klei -- ne, Schwa -- che 
  stim -- men mit mir ein:
  }
}



voice = \relative c' {
  %\voiceOne
  \time 4/4
  \key a \minor
    e8 f4 e8 d4 e
    a, a \override NoteHead.style = #'cross 
    e'' e \revert NoteHead.style
    g,8 a4 g8 f4 e 
    g g \override NoteHead.style = #'cross 
    e' e \revert NoteHead.style
    e,8 e4 e8 d4 e
    a, a \override NoteHead.style = #'cross 
    e'' e \revert NoteHead.style
    d,8 d4 e8 c4 b
    a4 r \override NoteHead.style = #'cross
    e'' \revert NoteHead.style \mark \markup{ \hspace #4 \box{\fontsize #1 fine}} r   
    \break
    \bar "||"
    \time 2/2
    f,4. f8 f4 g
    e2 d
    c'4. c8 c4 bf
    a2 r2
    %\repeat volta 2 {
    \mark \markup{ \hspace #-1 \box{\fontsize #1 4|:}}
    g4. a8 a4 g
    f4 g2~ g4
    f4 d cs e
    d2 r2
    f4. f8 f4 g 
    e2 d
    c'4. c8 c4 bf
    a2 
    \mark \markup{ \hspace #14 \box {\fontsize #1 4:|}}
    r2 
    e'4. e8 e4 d
    c2 b
    c4 a a gs
    a2 r2
\bar "|."
}

chrd = \chordmode {
  %\set chordBassOnly = ##t
  a2:m e
  a1:m c2 g:7 c1
  a2:m e a1:m d2:m e:7
  a1:m
  d1:m a2:7 d:m c1 f
  g:m d2:m g:m d:m a d1:m
  d:m a2:7 d:m c1 f
  e:7 a2:m d:m a:m e:7 a1:m
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom =  ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrd }
    \new Staff <<
      \new Voice = "Strophe" { \voice }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrA
    \new Lyrics \lyricsto "Strophe" \lyrB
    \new Lyrics \lyricsto "Strophe" \lyrC
    \new Lyrics \lyricsto "Strophe" \lyrD
    \new Lyrics \lyricsto "Strophe" \lyrE
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
%      #(layout-set-staff-size 20)
    }
  }
}
