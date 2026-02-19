\version "2.24.4"
sheetName = "Frieden wie das eigne Leben"
sheetComposer = "Klaus Schneider"
sheetPoet = "Giesela Steineckert"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    \set stanza = "1. "
    Soll der Mensch den Men -- schen nie mehr 
    nach der Schlacht be -- trau -- ern,
    \set stanza = "1. "
    muß auf die -- ser Er -- de e -- ben
    Frie -- den wie das eig -- ne Le -- ben
    kost -- bar sein _ _ _ und 
    \set stanza = "1. " dau -- ern.
    Daß die Bäu -- me und die Leu -- te ganz 
    nor -- ma -- le Jahr -- zeit ha -- ben,
    \set stanza = "1. "
    daß sie üp -- pig um -- gehn kön -- nen
    mit den schö -- nen Ga -- ben, 
    \set stanza = "1. " daß uns 
    Fel -- der, Wald und Wie -- sen nicht an Gif -- ten
    ster -- ben.
    \set stanza = "1. " 
    Grü -- ne Wäl -- der, sat -- te Er -- de
    wolln wir ver -- er -- ben.
}}
lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Soll der Mensch den Men -- schen nie mehr sei -- nen
    Tod be -- rei -- ten,
    \set stanza = "2. "
    muß auf die -- ser Er -- de e -- ben
    Frie -- de wie das eig -- ne Le -- ben blei _ -- ben _ _
    durch die 
    \set stanza = "2. " Zei -- ten.
    Städ -- te, um da -- rin zu woh -- nen,
    schö -- ner _ als _ man's kann -- te,
    \set stanza = "2. " oh -- ne Angst soll Lie -- be auf -- blühn
    und das ihr Ver -- wand -- te.
    \set stanza = "2. " Uns -- re Ar -- beit reiht dies Land hier
    zu den schöns -- ten Län -- dern.
    \set stanza = "2. " Was uns noch nicht gut ge -- diehn ist,
    laßt uns ver -- än -- dern!
}}
lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
    Soll der Mensch den Men -- schen lie -- ben
    und ihn glück -- lich ma -- chen,
    \set stanza = "3. "
    müs -- sen wir auf Er -- den e -- ben
    Frie -- den wie das eig -- ne Le -- ben
    hü -- ten und _ _ _  be-
    \repeat unfold 59 \skip 8
    \set stanza = "3. " -wa -- chen, be -- wa _ -- chen.
  }}

strophe = \relative c'{
  \time 4/4
  \key b \minor
  \bar ".|:"
  \set melismaBusyProperties = #'(melismaBusy tieMelismaBusy)
  fs8 fs d' cs b b b b
  b4 b b8 a g fs
  e e e fs g b a g
  g fs r fs16 fs fs8 e e e 
  \slurDashed e8( d) d4.( e16 d) \slurSolid cs8 d
  \mark \markup { \box ..Coda }
  fs4 e2.~ e8 r r4 r2 
  a,8 a a a fs' fs fs fs 
  \slurDashed 
  fs e( e) e( e) e e e
  a, a a a g' g g g
  
  g8 fs4 fs8~ fs fs fs fs
  d d d d a' a a a
  a8 g4 g8~ g fs e d
  fs a, g' fs e a, fs' e
  d d d d~ d d4 r8
  \bar ":|."
  \slurSolid
  \mark \markup { \box Coda }
  fs4 e2 r8 e
  e( fs) fs2.
  \bar "|."
}
chrdStrophe = \chordmode {
  b2:m b:7 g e:m
  a:sus4 a:7
  d fs:7 b:m e
  a1:sus4 a
  d a a:7 d d:7 g
  d2 a g d
  e1:sus4 d
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \transpose d c \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose d c \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
      \context {
        \Lyrics
        \override LyricText.font-size = #+1.8
      }
    }
  }
}
