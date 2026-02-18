\version "2.24.0"
sheetName = "Kamper Trinklied"
sheetComposer = "Wenzel"
#(define book-staff-size 20)
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace75"
}
stanzaA = \markup {
  \column { \vspace #.4 "1. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaB = \markup {
  \column { \vspace #.4 "2. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaC = \markup {
  \column { \vspace #.4 "3. "}
  \column { \vspace #.2 \leftbrace }
}

skipA = \repeat unfold 39 \skip 8
lyrA = {
  \lyricmode {
  \skipA
  \set stanza = #"1&3. "
  Ach wie ist das Le -- ben, 
  ach wie ist das Le -- ben
   _ _ un -- ge -- sund.
  \set stanza = #"1&3. " Im -- er ei -- nen he -- ben, 
  im -- mer ei -- nen he -- ben
  \set stanza = #"1&3. " im -- mer gibt's 'nen Grund.
  
  Im -- mer sich ver -- ge -- ben, 
  \set stanza = #"1. " aus den Hän -- den le -- gen
  im -- mer mit dem Mund.
  
  Glä -- ser trin -- ken müs -- sen, 
  \set stanza = #"1. "
  Kuss und Kuss zu küs -- sen
  auf dem Er -- den -- grund.
  \set stanza = #"ref. "
  Und wenn wir uns ver -- lo -- ren geh'n
  Und wenn wir uns wied -- er ent -- fer -- nen
  \set stanza = #"ref. "
  Dann bleibt viel -- leicht das Bild be -- steh'n,
  Wie wir hier am Ha -- fen steh'n
  \set stanza = #"ref. "
  Un -- ter all den Ster -- nen
  Hier im küh -- len A -- bend -- wind
  \set stanza = #"ref. "
  Froh, dass wir am Le -- ben sind,
  Froh, dass wir am Le -- ben sind
 
}}
lyrB = {
  \lyricmode {
    \skipA
  \set stanza = #"2. "
  Reich sind nicht die Rei -- chen, 
  die der Welt aus -- wei -- chen
  
  ach die ha -- ben's schwer
  \set stanza = #"2. "
  Kön -- nen sich nicht's den -- ken, 
  
  kön -- nen nicht's ver -- schen -- ken
  \set stanza = #"2. "
  was nicht käuf -- lich wär
    Je -- de Nacht ohn' Freu -- den, 
  \set stanza = #"2. "
  wo wir uns ver -- geu -- den
  _ _  un -- ge -- sund
  Sich ein Herz zu fas -- sen, 
  \set stanza = #"2. "
  noch -- mal hoch die Tas -- sen
  im -- mer gibt's nen Grund
}}
lyrC = {
  \lyricmode {
  }}
lyrD = {
  \lyricmode {
}}

strophe = \relative c'' {
  \time 2/2
  \key c \major
  \mark \markup{ \fontsize #4 *}
  g8. 16~ 8 8 8 f e16 d8.
  e8. 16~ 8 8 e8. f16~ 8 c 
  e2 r8 d8 e f 
  g2 r8 d e f 
  g8. 16~ 8 8 8 f e16 d8.
  e8. 16~ 8 8 e8. f16~ 8 d
  e2 r8 d e d
  c2. r4 
  \bar "||" \break
  g'8 g g g g f 
  r4
  e8 e e e e d r4
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  e2 
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  r8 d e8 f
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  g2 r2 \break
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  g8 g g g g f r4
  e8 e e e e f r4
  r4 e8 e r4 f8 d 
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  c2 r2 
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  %\break
  g'8 g g g g f r4
  e8 e e e e f r4
  r4 e8 d r4 e8 f
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  g2 r2
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  
  %\break
  g8 g g g g f r4
  e8 e e e e f r4
  r8 e4 d8~ d8 4 c8 
  c2 r4. \break c8
  \bar "||"
  a'4 c b4. a8
  g4 f e4. e8
  f8 e f4r8 e8 f e
  f( e) f2  r8 \break g
  a4 c d b8( a)
  g4. f8 e2
  f8 e f2 r8 e8 
  f e f2 r4
  g8  f g2 r8 g8
  a8( g) a4~ 8 a4 b8 
  c b a2 g8( f)
  e2 r2
  c8 d e f e4 d g2 r2
  c,8 d e f e4 d 
  \mark \markup{ \fontsize #4 *}
  c2 r2
 
}


chrd =  \chordmode {
  c2 g a:m f c g c g
  c2 g a:m f c g c1
  \repeat unfold 4 {
  c2 g a:m f c g c1 }
  f2 g c a:m f1 g f2 g c a:m
  f1 g c f g c s2 g c1 s2 g c1 
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1))
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames \chrd 
    \new Staff <<
      \new Voice = "Strophe"  \strophe 
      >>
    \new Lyrics \lyricsto "Strophe" \lyrA
    \new Lyrics \lyricsto "Strophe" \lyrB
    \new Lyrics \lyricsto "Strophe" \lyrC
    \new Lyrics \lyricsto "Strophe" \lyrD
 
    >>
    \layout {
      \context {
        \Lyrics
        %\override LyricText.font-size = #1.5
      }
    }
  }
}
