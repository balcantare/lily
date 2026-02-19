\version "2.22.2"
sheetName = "Sto Mi E Milo"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
   \set stanza = #"1. "
   Što mi e mi -- lo,
   mi -- lo i dra -- go,
   \set stanza = #"1. "
   vo Stru --  ga gra -- da,
   ma -- mo, du -- kjan da i -- mam.
   \set stanza = #"1. - 4. "
   Le le va -- rej, mo -- me,
   mo -- me Ka -- li -- no,
   \set stanza = #"1. "
   vo Stru -- ga gra -- da ma -- mo,
   du -- kjan da i -- mam.
}}
skipA = \repeat unfold 11 { \skip 4 }

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   Na ker -- pen -- ci -- te,
   ma -- mo, da se -- dam,
   \set stanza = #"2. "
   strušh -- ki -- te mo -- mi
   ma -- mo mo -- mi da gle -- dam.
  \skipA
  \set stanza = #"2. "
  strušh -- ki -- te mo -- mi
   ma -- mo mo -- mi da gle -- dam.
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Ko -- ga no vo -- da, vo -- da mi o -- dat,
   \set stanza = #"3. "
   so ti -- ja stom -- ni, ma -- mo, stom -- ni ša -- re -- ni.
   \skipA
   \set stanza = #"3. "
   so ti -- ja stom -- ni, ma -- mo, stom -- ni ša -- re -- ni.
 }}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Na o -- vaj iz -- vor,
    iz -- vor stu -- de -- ni,
    \set stanza = #"4. "
    tam da se zrduž -- ki, ma -- mo,
    zrduž -- ki so -- be -- rat.
    \skipA
    \set stanza = #"4. "
    tam da se zrduž -- ki, ma -- mo,
    zrduž -- ki so -- be -- rat.
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 7/8
  \key d \major
   \bar ".|:"
  \repeat volta 2 {
    d4. fs4 g
    a4. a2
    b4. a8[( g)] fs([  g)]
    a4. a2 \break
    b4. a8[( g)] fs([ e)]
    e4 d8 a'4 g
    fs4. e8[( fs]) e4
    d4. d2
  } \break
  \repeat volta 2 {
    d8[( cs) d] e4 e
    e4. e2
    fs4. fs8[( e]) d[( e])
    fs4. 2 \break
    a4. b8[( a]) g[( fs])
    e4 d8 a'4 g
    fs4. e8[( fs)] e4
    d4. d2
  }
%\bar "|."
}

chrdStrophe = \chordmode {
  d4. s2 s4. s2 g4. s2 d4. s2
  g4. s2 d4. g2 a4.:7 s2 d4. s2
  d4. a2:7 s4. s2 d4. s2 s4. s2
  d4. g2 d4. g2 d4. a2:7 d4. s2
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##t
    ragged-bottom = ##f
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
