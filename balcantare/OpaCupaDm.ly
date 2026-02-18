\version "2.24.0"
sheetName = "Opa Cupa (Dm)"
#(define book-staff-size 20)
\include "../include/book.ily"

skipA = \repeat unfold 87 \skip 8

leftbrace = \markup {
  \column { \vspace #.2
  \override #'(font-encoding . fetaBraces)
  \lookup "brace70"}
}
stanzaA = \markup {
  \column { \vspace #.4 "2. "}
  \leftbrace
}

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = #"1. "
  Me sem cho -- ra cha -- va -- ro,
  che -- lav rom maj -- la _ -- cho,
  \set stanza = #"1. "
  da -- le man -- da -- le  e cho -- ra man as -- ta -- ren.
  \set stanza = #"1. "
  Kas me as -- ta -- rav, me man -- de a -- sav.
  \set stanza = #"1. "
  Sa -- mo jekh chaj ni man -- gel,
  voj man -- da na -- shel.
  
  O __ o -- pa cu -- pa so te man -- da cha -- je mu -- ka,
  Sho tav ka -- me -- rel a -- ko ni -- che -- le.
  
  Lum -- baj, lum -- baj,
  lum -- ba -- laj aj -- de aj -- de aj -- de.
  Lum -- baj, lum -- baj,
  lum -- ba -- laj aj -- de aj -- de aj -- de.
}}


lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = \stanzaA
  Es i_r -- ja -- cha kha -- che -- m,
  voj ni man -- dzehl te she -- lel,
  \set stanza = \stanzaA
  da -- le man -- da -- le, 
  mu -- da -- rel a o de -- vel.
}} 


lyrStropheC = {
  \lyricmode {
    \skipA
  %\set stanza = #"2. "
  A -- va Ru -- zha a -- va khel pa i ti -- ro mek a -- vel,
  da -- le man -- da -- le, 
  e svi -- ra -- cha ba -- sha -- lesh.
}}

lyrStropheD = {
  \lyricmode {
    \skipA
  \set stanza = "3."
  Sa o cha -- ja ke -- le -- nav, 
  a Rui -- zha -- va ro -- me -- la,
  \set stanza = "3."
  da -- le man -- da -- le, 
  a bo -- bo ki as -- ta -- rel.
  
}}


strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle modern %neo-modern-voice-cautionary
  \time 4/4
  \key c \minor
  \bar ".|:"
  \repeat volta 2 {
  f16 f f8 c f16 f f c f c f ef d c
  ef16 16 8 c ef16 16 16 c16 ef c ef d c b
  b c d  ef f ef d c b c b af g af g f 
  g g g8 d' g~ 16 f e df c bf af g } \break
  \repeat volta 2 {
  af16-. 16-. 8-. f8-- af16-. 16-. 16( f) af( f) bf( af g f)
  bf16-. 16-. 8-. g8-- bf16-. 16-. bf( g) bf( g) bf bf( af g)
  af16-. 16-. 8-. f8-- g16-. 16-. af( f g af) \acciaccatura af8 b8 r8
  e,16( f g b) e,( f g b) af( f g8) \acciaccatura af8 g r }
  \break
  \repeat volta 2 {
  ef'8 d ef d ef d16 c~ c8 r
  c b c b c8 b16 af( af8) r
  r4 af8 af bf af16 16~ 8 r 
  g8 g g f g g g r }
  \break
  f8 f g af bf( af4.)
  f8 f g af bf( af4.)
  f'8. ef16 d8 c c b af r
  g8 g g8. f16 g4 r \break
  \repeat volta 2 {
    bf2 c8 af g f 
    r8 af16 16 8 8 bf af g f
    f f' ef d ef16( d c b af8) r
    g8 g g f g2 } \break
  \repeat volta 2 {
    f8 c'  c c c  c c( b)
    r b16 16 8 8 c( b) af( g)
    f af8 8 8 8 8 bf( af)
    g g g f  g g r4  
  }
  %   \bar "|."  
}


chrdStrophe = \chordmode {
  f1:m s1 s2 s4 df
  g2:7 c2
  f1:m c:7 f2.:m df4:7 g2:7 c
  f1:m c:7 f:m g2:7 c
  f1:m s s g2 c2
  c1:7 f:m s g2 c
  f1:m g2: c f1:m g2 c
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
      \new ChordNames { \transpose f d \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \transpose f d \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
    \layout {
      \context {
        \Lyrics
        \override LyricText.font-size = #3
      }
    } 
  }
}
