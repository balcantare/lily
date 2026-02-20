\version "2.24.2"
sheetName = "Bourrasque"
sheetComposer = "M. Peguri, J.Peyronnin"
#(define book-staff-size 20)
\include "../include/book.ily"

strophe = \relative c' {
  %\voiceOne
  \override Fingering.font-size = #-3
  \accidentalStyle modern
  \time 3/4
  \key d \major
  %\bar ".|:"
  %\set Timing.beatBase = #1/4
  %\set Timing.beatStructure = 1,1,1
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #2
  \mark\markup{ \box{\fontsize #3 A}}
  s8 a b d cs a
  b2.
  r8 a b d cs a 
  a4 fs2
  r8 a b d cs a
  d8 cs e d g fs
  b4 r4 r8 a8
  \tuplet 3/2 {a8 b a} g8 e\1 cs4
  r8 a b d cs a
  b2. 
  r8 a b d cs a
  \tuplet 3/2 {a8 b a} g2\3
  \set TabStaff.minimumFret = #0
  r4 e8 ds e fs
  g fs e fs g a
  b a b cs d e
  fs2.
  \set TabStaff.minimumFret = #2
  r8 a, b d cs a
  b2.
  r8 a b d cs a 
  a4 fs2
  \set TabStaff.minimumFret = #1
  r4 a8 b16 a gs8 a
  b2. 
  a8 b16 a g8\3 fs e fs
  g2.\3
  r4 b8\2 cs16 b\2 as8 b\2
  g' fs e2\1
  r4 a,8 b16( a) gs8 a
  fs' e\1 d2
  r4 a8 b16( a) gs8 a
  \set TabStaff.minimumFret = #0
  cs8 b a cs b a
  cs8 b a cs b a
  d2.^\markup{..Coda} \bar "||" \break
  \mark\markup{ \box{\fontsize #3 B}}
  \key g \major
  \set TabStaff.minimumFret = #12
  r4. d8 g b
  d4 r8 d, g b 
  d4 r8 d, g b 
  c4 r8 \set TabStaff.minimumFret = #10 d, fs a 
  c4 r8 d, fs a
  fs'4 r8 d, fs a
  fs'2 r4
  \set TabStaff.minimumFret = #7
  g,8 b d, g b, d
  g,4\3 r8 \set TabStaff.minimumFret = #12 d'8 g b
  d4 r8 d, g b 
  d4 r8 d, g b 
  c4 r8 d, \set TabStaff.minimumFret = #10 fs a 
  c4 r8 d, fs a
  fs'4 r8 d, fs a
  fs'2 r4
  \set TabStaff.minimumFret = #7
  g,8 b d, g b, d
  g,8\3 \bar "||" s8 s2^\markup{ \box{\fontsize #3 A}} 
  \bar "||"
  \break
  \mark\markup{ \box{\fontsize #3 C}}
  r2.
  \set TabStaff.minimumFret = #0
  g'4 fs e 
  d c b
  d8 c b d c a
  fs2.
  fs'4 e d c b fs
  a8 g fs a g e
  d2.
  g'4 fs e d c b
  d8 c b d c a 
  fs2.
  fs'4 e d c b a
  g4 <b d> <c ds>
  \set TabStaff.minimumFret = #5
  <cs e>8 \bar "||" s8 s2^\markup{ \box{\fontsize #3 A}} 
  \bar "||"
  \set TabStaff.minimumFret = #2
  d8^\markup{ \box{\fontsize #3 Coda}} e16 d cs8 d a fs
  d4\4 r2
 \bar "|."
}

chrdStrophe = \chordmode {
  s2. d2. s s s
  d:/fs d a:7/e
  a:7/cs
  a:7 e:m a:7 s
  a:7 f:5+7 d:/fs a:7/e
  d d:/fs b:m d:/fs
  ds:dim b:7 e:m s
  g:/b g:m/bf d b:7 a:7/cs a:7 d s
  g g:/b d:7/fs d:7/c d:7/fs d:7/c
  g:/b g
  g g:/b d:7 d:7/fs
  d:7/c d:7/fs g a:7
  d g g:/b d:7/fs d:9
  d:7/fs d:7/c g g:/b
  s s d:7 s d:7/fs d:7 g a:7
  d2 a4:7 d
  
}

chrdBass = \relative c {
  \set TabStaff.restrainOpenStrings = ##t
  \tabFullNotation
  s2.
  \repeat percent 4 { d4 <a' d fs>4 4}
  fs4 <a d fs>4 4
  d,4 <a' d fs>4 ds,4
  e4 <g cs e> d
  cs <e g cs > b
  a <e' g cs >4 4
  e, <g' b e g>4 4
  \set TabStaff.minimumFret = #5
  \repeat percent 3 { a, <g' cs e>4 4}
  f <a cs f>4 4
  fs4 <a d fs>4 4
  e <cs' g'>4 4
  \set TabStaff.minimumFret = #0
  d,4 <a' d fs>4 4
  fs,4 <d' a' d>4 4
  b4 <fs' b d>4 4
  fs,4 <d' a' d>4 4
  ds <a' c fs>4 4
  b,4 <ds a' b>4 fs,4
  \repeat percent 2 {e <g' b e g>4 4}
  \set TabStaff.minimumFret = #5
  b,4 <g' d'>4 4
  bf,4 <g' d'>4 4
  \set TabStaff.minimumFret = #0
  d4 <a' d fs>4 c,4
  b4 <ds a'>4 \tuplet 3/2 {a8( b c)}
  cs4 <e a cs > b
  a <e' g cs> e
  d <a' d fs>4 a,
  d <a' d fs>4 4
 
  g, <d' g b d> a\6
  \set TabStaff.minimumFret = #5
  b <g' d' g> \set TabStaff.minimumFret = #2 g,
  fs_\markup{P} <c' fs a d>4 4
  c <fs a d>4 4
  fs,_\markup{P} <c' fs a d>4 4
  c <fs a d>4 4
  \set TabStaff.minimumFret = #0
  b, <d g d'> a
  g_\markup{P} <d' g b d>4 4 
  g,_\markup{P} <d' g b d> a\5
  b <d g d'> c
  \set TabStaff.minimumFret = #2
  d <fs c' d> c
  fs,_\markup{P} <c' fs a d>4 4
  c <fs a d>4 4
  fs,_\markup{P} <c' fs a d> a\5
  g_\markup{P} <d' g b d> gs,\6
  \set TabStaff.minimumFret = #0
  a <e' g cs>4 4
  d <a' d fs>4 4
  \set TabStaff.minimumFret = #2
  g,_\markup{P} <d' g b>4 a
  \set TabStaff.minimumFret = #5
  b <g' d' g> g
  \set TabStaff.minimumFret = #2
  fs <c' e> e,
  d <fs c' e> c
  fs,_\markup{P} <c' fs a d>4 4
  c <fs a d>4 4
  g,_\markup{P} <d' g b d> a\6
  \set TabStaff.minimumFret = #5
  \repeat percent 2 {b <g' d' g>4 4}
  b, <g' d' g>4 bf,
  \set TabStaff.minimumFret = #2
  a <fs' c' d>4 4
  a, <fs' c' d> g
  fs <c' e> e,
  d <fs c' e> fs,
  g_\markup{P} <d' g b d> gs,\6
  \set TabStaff.minimumFret = #0
  a <e' g cs>4 4
  d <a' d fs>4 a,
  d <a' d fs>2
}




\bookpart {
  \paper {
    page-count = #2
    #(define fonts (book-font 1))
    % ragged-last-bottom = ##t
  }
  \bookItem 
  \score {
    <<
    
    \new Staff { \clef "G_8" \strophe }
    \new TabStaff \with {
    }{ \tabChordRepeats \strophe } 
    \new ChordNames { \chrdStrophe }
    \new TabStaff { \chrdBass }
    
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 20) 
      \omit Voice.StringNumber 
    }
  }
}
