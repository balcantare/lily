\version "2.24.0"
sheetName = "Stadt der Musik"
sheetComposer = "Reinhard Simmgen"
sheetPoet = "Beate Tarrach"
#(define book-staff-size 20)
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace65"
}
stanzaA = \markup {
  \column { \vspace #.33 "1. "}
  \column { \vspace #.18 \leftbrace}
}
stanzaB = \markup {
  \column { \vspace #.33 "2. "}
  \column { \vspace #.18 \leftbrace}
}
stanzaC = \markup {
  \column { \vspace #.33 "3. "}
  \column { \vspace #.18 \leftbrace}
}


skipB = \repeat unfold 48 \skip 8 
skipA = \repeat unfold 8 \skip 8
lyrStropheA = {
  \lyricmode {
    In der Stadt, auf al -- len Stra -- ßen klingt Mu -- sik
    je -- den Tag, je -- den Tag! 
    Tan -- zen Men -- schen, denn zu le -- ben ist ein Glück
    und es ist Som -- mer, wie ihn je -- der mag,
    und es ist Som -- mer, wie ihn je -- der mag!
   \set stanza = "1a. "
   Ba -- bies wip -- pen mit, auf al -- len 
   \set stanza = "  1b."
    La -- chen -- de Ge -- sich -- ter, al -- le
   \set stanza = \stanzaA
   Vie -- ren,
   al -- te Män -- ner dre -- hen sich am Stock,
   \set stanza = \stanzaA
   Paa -- re, die im Tanz sich ganz ver -- lie -- ren,
   \set stanza = \stanzaA
   ir -- gend -- wo schwingt froh ein bun -- ter Rock. 
}}

lyrStropheB = {
  \lyricmode {
    \skipB
    \skipA \skipA
    Far -- ben!
    Die -- se Stadt ver -- eint in Freud und Leid
    Men -- schen vol -- ler See -- le, und die ha -- ben
    Lie -- der auf den Lip -- pen al -- le -- zeit!
  }}

lyrStropheC = {
  \lyricmode {
    \skipB
    \set stanza = "2a. "
    Wild, wie die -- ses wun -- der -- ba -- re
    \set stanza = "  2b. "
    Mam -- bo mit den Hin -- ter -- hof -- ka
    \set stanza = \stanzaB 
    Le -- ben
    ziehn die Trom -- meln dich in ih -- ren Bann.
    \set stanza = \stanzaB
    Rhyth -- men, die durch Stra -- ßen -- zü -- ge
    schwe -- ben, 
    \set stanza = \stanzaB
    kei -- ner der sich dem ent -- zie -- hen
    kann.
}}

lyrStropheD = {
  \lyricmode {
   \skipB \skipA \skipA 
   pel -- len
   Lass dich trei -- ben, ma -- gisch ist die Nacht.
   Und sie kann Ge -- schich -- ten dir er -- zäh -- len,
   was die Men -- schen hier so glück -- lich macht.´

}}


lyrStropheE = {
  \lyricmode {
    \skipB
    \set stanza = "3a. "
    Kör -- per, die beim Tan -- zen sich be 
    \set stanza = "3b. "
    Au -- gen -- paa -- re vol -- ler Lust und     
    \set stanza = \stanzaC 
    -- rüh -- ren,
    Schwin -- gen wie in ei -- ner eig -- nen Welt,
    \set stanza = \stanzaC
    Wenn sie Hand in Hand ein -- an -- der füh -- ren,
    \set stanza = \stanzaC
    von den Lich -- tern rings -- um -- her er -- hellt.

}}

lyrStropheF = {
  \lyricmode {
    \skipB \skipA \skipA 
    Freu -- de,
    Leich -- tig -- keit in je -- dem Au -- gen -- blick.
    Zählt nur die -- ser Tanz im Hier und Heu -- te,
    le -- ben im Mo -- ment be -- deu -- tet Glück!
}}

strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \key c \major
  \stopStaff
  \omit Staff.Clef
  \omit Staff.KeySignature
  \omit Staff.StaffSymbol
  \startStaff
  s1*4 
  \break

  \stopStaff
  \undo \omit Staff.Clef
  \undo \omit Staff.KeySignature
  \undo \omit Staff.StaffSymbol
  \startStaff
  r8 g16 g g8 g g f e d 
  e4 c8 g~ g2
  c4 a'8 g~ g2
  c,4 f8 e~ e2 %\break
  r8 g16 g g8 g g f e d
  e4 c8 g~ g g c e 
  f16 e8. d8 c d4 c8 g'~
  g2 r8 c,8 c e
  f16 e8. d8 c d4 c8 c~
   \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
 c2 r
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  \break
  \repeat volta 2 {
    \bar "||"
   \set Score.repeatCommands = #'((volta "1") end-repeat)
   c'8 c c c c g e c
   \bar ".|:"
   \set Score.repeatCommands = #'((volta "2") end-repeat)
   b'8 g g e e c c a \break
   \set Score.repeatCommands = #'((volta #f))
    \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
 e'4 d2.
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
   d8 d d e f e f a
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
   g1
    \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
 
   e8 e e e e d c a
    \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
 e'4 d2.
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
   a'8 a a a a g a g 
    \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
 g2 r2
  }
  

%\partial 4.
%\bar "|."
}

chrdIntro = \chordmode {
  c1 bf:dim/cs fs:dim/d g:7
}

chrdStrophe = \chordmode 
{
  s1*4
  c1 s
  f2 c
  f c
  c1 s
  f2 g2 
  c1
  f2 g2
  c1
  c:7+
  c:7+
  d:m
  d:m7
  c:7+
  a2:m7 a:m6
  d1:m7
  f2:7+
  fs:dim
  g g:7
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
      \new ChordNames \with {
         \override ChordName.Y-offset = #-1.5 
       } \chrdIntro
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    >>
  }
}
