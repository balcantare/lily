\version "2.24.2"
sheetName = "Nkosi sikelel'i Afrika"
#(define book-staff-size 16)
\include "../include/book.ily"

lyrSopran = {
  \lyricmode {
    Nko -- si si -- ke -- lel 'i
    Af -- ri -- ka
    Ma -- lu -- pha -- kan -- yis -- up
    hon -- do lwa -- yo
    Yiz -- va i -- mi -- than -- da -- zo
    ye -- thu Nko -- si
    si -- ke -- le -- la,
    Thi -- na lu -- sa -- pho
    lwa -- yo.
    % \set stanza = #"Sop "
    Si -- ke -- le -- la, Nko -- si 
    si -- ke -- le
    Si -- ke -- le -- la, Nko -- si 
    si -- ke -- le
    Wo -- za Mo -- ya
    o -- ing -- swe -- le
    Nko -- si si -- ki -- le -- la
    Thi -- na  lu -- sa -- pol 
    wa -- jo.
    
    Mo -- re -- na bo -- lo -- ke
    se -- cha -- ba sa -- ne -- so
    u -- fe -- li -- se lin -- toa 
    le mat -- soen -- ye -- ho
    ho
    U se bo -- lo -- ke
    u sel bo  -- lo -- ke.
    u se bo -- lo -- ki mo -- re -- na
    se bo -- lo -- ke,
    se cha -- ba sa he -- so, 
    se cha -- ba sa he -- so.
    so. Af -- ri -- ka.
}}

skipA = \repeat unfold 41 \skip 8
lyrAlt = {
  \lyricmode {
   \skipA 
   \set stanza = #"Alt "
   Wo -- za Mo -- ya Wo -- za Mo -- ya
}}

lyrBass = {
  \lyricmode {
    \skip 1*10
    \set stanza = #"T&B "
    \skip 2
   Wo4 -- za4 si8 -- ke8 -- le8 -- le8 Wo4 -- za4
    \skip 2
   Wo4 -- za4 si8 -- ke8 -- le8 -- le8 Wo4 -- za4
  \skip 1*11 \skip2
  u4 -- se4 
  \skip1 \skip2
  mo4 -- re4
}}


stropheSopran = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key f \major
  \voiceOne
  \bar ".|:"
  \repeat volta 2 {
  f8 f f g a4 a
  g4 g f2
  a8 a a a bf4 bf 
  a8 a a4 g2
  f8 f f g a4 a
  g bf a2
  g2 f
  e8 f g4 f2
  g2 f4. f8
  e f g4 f2
  } \break
  \repeat volta 2 {
   r2 a8 a a( g) 
   f4 f8 g a8 a a r
   r2 a8 a a( g) 
   f4 f8 g a8 a a r
   f4 g8 a d2
   bf4( g) f2
   e f
   g f
   e8 f g4 f2
   g2 f4. f8 
   e f g4 f2
  } \break
  \repeat volta 2 {
    f8 f f g a4 a8 a
    a8 a bf a g2
    f8 f f g a a bf g 
    f4 e
  } \alternative {
    { f2 }
    { f8 }
  }
  \repeat volta 2 {
    f8 f a 
    \time 2/4
    c4 a
    \time 4/4
    g2~ g8 bf a g
    f8 f f a c a c a
    g2~ g8 bf a g
    f4 \break a bf g
    f2 g4( bf)
    a4. a8 bf4 g
  } \alternative {
    {f2 e4( g)
     f8}
    {f2 e4 g f1 }
  }      
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  f8 f f e f4 f 
  e4 e c2
  f8 f f f f4 f
  f8 f f4 e2
  f8 f f e f4 f
  e g f2
  d c
  c8 c e4 d2
  d2 c4. c8
  c c c4 c2
  
  f4 e8 d c2~ c2. r4
  f4 e8 d c2~ c2. r4
  c4 e8 f  bf,2 
  d c
  c8( d e4) c2
  d c
  c8 d e4 c2
  d2 c4. c8
  c8 d e4 c2
  
  d8 d d e f4 f8 f
  f8 f g f e2
  d8 d d e f f d d
  c4 c 
  c2
  c8 r4. r2
  e2~ e8 f f e
  c4 r r2
  e2~ e8 f f e
  c4 f d d 
  c2 e
  f4. f8 f4 d
  c2 c c8
  c2 c4 c c1
}

stropheBass = \relative c {
  \key f \major
  \accidentalStyle neo-modern %-voice-cautionary
  \clef "bass"
  \voiceTwo
  d8 d d c f4 f  
  c c f2
  f8 f f f bf,4 bf
  c8 c c4 c2
  d8 d d c f4 f
  c4 cs d2
  bf2 c
  c8 c cs4 d2
  bf2 c4. c8
  c8 c c4 <f, f'>2
  %\bar "|."
  r2 f'4 c 
  f8 f c c f4 c
  r2 f4 c 
  f8 f c c f4 c
  f4 f8 f bf,2 
  bf c
  c f
  bf, c
  c8 c c4 f2
  bf,2 c4. c8
  c8 c c4 <f, f'>2

  d'8 d d c f4 f8 f
  f8 f g f c2
  d8 d d c f f bf, bf
  c4 c
  <f, f'>2
  <f f'>8 r4.
  \parenthesize f4 \parenthesize a
  c2~ c8 d c c
  f,4 r4 f a
  c2~ c8 d c c
  f,4 f' bf, bf 
  c2 c
  f4. f8 d4 bf
  c2 c f8
  c2 c4 c f1
}

stropheTenor = \relative c' {
  \voiceOne
  a8 a a bf c4 c
  c bf a2
  c8 c c c d4 d
  c8 c c4 c2
  a8 a a bf c4 c
  c cs d2
  bf a
  g8 a bf4 a2
  bf a4. a8 
  g a bf4 a2
  %
  r2 a4 a
  a8 a a f f4 c
  r2 a'4 a
  a8 a a f f4 c
  a'4 bf8 c f,2
  bf2 a
  g8( a bf4) a2
  bf2 a
  g8 a bf4 a2
  bf2 a4. a8
  g8 a bf4 a2
  
  a8 a a c c4 c8 c
  c c d c c4( bf)
  a8 a a c c c d bf
  a4 g
  a2
  a8 r4. r2
  c2~ 8 bf c bf
  a4 r4 r2
  c2~ 8 bf c bf
  a4 c bf bf
  a2 g4( c)
  c4. c8 bf4 bf
  a2 g4( bf) a8
  a2 g4 bf a1
}


chrdStrophe = \chordmode {
  
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
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Sopran" { \stropheSopran }
      \new Voice = "Alt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Sopran" \lyrSopran
    \new Lyrics \lyricsto "Alt" \lyrAlt
    \new Lyrics \lyrBass
    \new Staff <<
      \new Voice = "Tenor" { \stropheTenor }
      \new Voice = "Bass" { \stropheBass }
      >>
    >>
  }
}
