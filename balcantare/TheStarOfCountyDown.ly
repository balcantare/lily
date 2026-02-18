\version "2.24.2"
sheetName = "The Star of County Down"
sheetComposer = "Irish Tune"
#(define book-staff-size 20)
\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Near to Ban -- bridge town, 
  in the Coun -- ty Down
  \set stanza = #"1. " o -- ne mor -- ni -- ng in Ju -- ly.
  Down_a bo -- reen green \set stanza = #"1. "
  came a sweet col -- leen, and she smi -- led
  as she pass me by,
  \set stanza = #"1. "
  Oh she locked so neat from her two white
  feet 
  \set stanza = #"1. " to the sheen of her nut -- bro -- wn 
  hair,
  Sure the coa -- xing _ elf, 
  \set stanza = #"1. " I'd to 
  shake my _ -- self to make 
  sure I was stan -- di -- ng there.
  
  Oh, from Ban -- ty Bay up to Der -- ry Quay,
  and from Gol -- way to Dub -- lin town,
  No maid I've seen like the brown col -- leen
  That I met in the Coun -- ty _ Down. 
}}

skipB = \repeat unfold 11 { \skip 4 }

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  As she on -- ward sped I _ shook my head
  \set stanza = #"2. " and I gazed with a fee -- ling quare,
  and_I said, says I, 
  \set stanza = #"2. " to a pas -- ser- by
  Who's the maid with the nut -- bro -- wn hair?
  \set stanza = #"2. " Oh, he smiled at me, and with pride says he,
  \set stanza = #"2. " That's the gem _ of Ire -- lan -- d's crown,
  She's young Ro -- sie Mc -- Cann
  \set stanza = #"2. " from the Banks of the Bann,
  She's the Star of the Coun -- ty _ Down.
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    I've _ tra -- velled_a bit, 
    but _ ne -- ver_was hit
    \set stanza = #"3. " since my ro -- ving ca -- reer be -- gann.
    But fair and square 
    \set stanza = #"3. " I sur -- ren -- derred there 
    To the charms of young Rose Mc -- _ Cann.
    \set stanza = #"3. " 
    I'd a heart to let  and no te -- nant yet
    \set stanza = #"3. "
    Did I meet with in shawl or _ gown,
    But _ in she _ went 
    \set stanza = #"3. " 
    and I asked no _ rent
    From the Star of the Coun -- ty _ Down.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    At the cross -- roads fair I'll be sure -- ly there
    \set stanza = #"4. "
    and I'll dress in my Sun -- day clothes
    and_I'll try sheep's eyes, 
    \set stanza = #"4. "
    and de -- lud -- hering lies
    On the heart of the nut -- brown _ -- Rose.
    \set stanza = #"4. "
    No _ pipe I'll smoke,
    no _ horse I'll yoke
    \set stanza = #"4. "
    Though with rust _ my plow turns _ brown,
    Till a smi -- ling _ bride 
    \set stanza = #"4. "
    by my own
    fi -- re -- side
    Sits the Star of the Coun -- ty _ Down.
}}


strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key e \minor
  \partial 4
  b8 b
  e4 e e d8 e
  g4 g a \break g8 a
  b8 a4 g8 e4 e
  d2. d4
  e4 e e \break d8 e
  g4 g a g8 a
  b8 a4 g8 e4 e8 d
  e2. \break b'8 c
  d4 b b a8 g
  a4 a a \break g8 a
  b8 a4 g8 e4 e8 d
  d2. d8 d 
  e4 e8 e e4 \break d8 e
  g4 g8 g a4 g8 a
  b8 a4 g8 e4 e8 d
  e2. \break
  \repeat volta 2 {
    b'8 c
    d4 b b a8 g
    a4 a a g8 a
    b8 a4 g8 e4 e
    d2. \break d4
    e4 e e d8 e
    g4 g a g8 a
    b8 a4 g8 e4 e8 d
    e2. 
  }
  %\bar "|."
}


chrdStrophe = \chordmode {
  s4
  e1:m g2 d
  e1:m d e:m g2 d 
  e2.:m d4
  e1:m  g d e:m d
  e:m g2 d e2.:m d4 e1:m
  g d e:m d e:m g2 d e2.:m d4
  e2.:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
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
