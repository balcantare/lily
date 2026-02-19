\version "2.22.2"
sheetName = "Dva Dubi"
sheetComposer = "Ukrainisches Volkslied"
\include "../include/book.ily"

skipA=\repeat unfold 23 \skip 4

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = #"1. "
  Ой на го -- рі два ду -- би,
  два ду -- би.
  \set stanza = #"1. " 
  Си -- дять на них го -- лу -- би,
  го -- лу -- би.
  \set stanza = #"1. "
  А під ни -- ми два хлоп -- ці
  гей -- гой два хлоп -- ці 
  \set stanza = #"1. "
  Роз -- ка -- зу -- ють
  ді -- воч -- ці,
  ді -- воч -- ці.
  }}

lyrStropheB = {
  \lyricmode {
  \skipA
    \set stanza = #"2. "
  Ти -- ся дів -- ко від -- да -- вай,
  від -- да -- вай.
    \set stanza = #"2. " Та_й на ме -- не не че -- кай, не че -- кай.
    \set stanza = #"2. " Бо я хло -- пець мо -- ло -- дий,
  гей -- гой мо -- ло -- дий
    \set stanza = #"2. " В_ме -- не ко -- ник во -- ро -- ний,
  во -- ро -- ний.
}}


lyrStropheC = {
  \lyricmode {
    \skipA
  \set stanza = #"3. "
  Як то дів -- ча по -- чу -- ло,
  по -- чу -- ло.
  \set stanza = #"3. "
  Та_й до ба -- би при -- біг -- ло,
  при -- біг -- ло.
  \set stanza = #"3. "
  На -- ко -- па -- ло ко -- рен -- я,
  гей -- гой ко -- рен -- я.
  \set stanza = #"3. "
  З_під бі -- ло -- го ка -- мен -- я,
  ка -- мен -- я.
 }}

lyrStropheD = {
  \lyricmode {
    \skipA
    \set stanza = #"4. "
  Що тя, ми -- лий, при -- нес -- ло,
  при -- нес -- ло:
    \set stanza = #"4. " 
    Чи ко -- ле -- со, чи вес -- ло,  чи вес -- ло?
    \set stanza = #"4. " 
    При -- ніс ме -- не си -- вий кінь,
  гей -- гой си -- вий кінь,
    \set stanza = #"4. " 
    Бо ти мо -- я, а я твій,  а я твій.
 }}

strophe = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key a \minor
  e4 a a a 
  b a g2
  e4 g g f
  e2 d \break
  e4 e d e
  a, b c2
  b4 a2. 
  a1
  \bar "||" \break
  e4 e d e
  a, b c2
  b4 a2.
  a1
  e'4 a gs a 
  b a g2
  f4 e2.
  e1
  \repeat volta 2 {
    e4 a gs a
    b a g2
    e4 g g f 
    e2( d) \break
    e4 e d e 
    a, b c2
    b4 a2.
    a1
  }
}
  % \bar "|."


chrdStrophe = \chordmode {
  a1:m 
  s2 g
  c1 e2 e:7
  a1:m
  s2 f
  e1:7sus4
  a1
  a2:m 
  \set chordBassOnly = ##t
  a2:m/c
  a2:m/e
  f
  e e:/gs a:m g
  f f:/c g g:/b c c:/d c:/e e:7
  f f:/c g g:/b c c:/d e e:/gs
  a:m a:m/g a:m/fs f
  e1
  a:m
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.5))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 24)
  }
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
