\version "2.24.2"
sheetName = "Biserka"
sheetComposer = "Serbien, Aman Folk Orchestra"
\include "../include/book.ily"

strophe = \relative c'' {
  %\autoBeamOff
  \accidentalStyle modern-voice-cautionary
  \time 6/8
  \key a \minor
  \mark \markup{ \box{\fontsize #4 A}}
  \bar ".|:"
  \repeat volta 2 {
    a4-. \acciaccatura gs'8 a8 
    a,4-. \acciaccatura gs'8 a8
    e4-. e8 ds[ c b]
    a4-. \acciaccatura gs'8 a8 
    a,4-. \acciaccatura gs'8 a8
    d,8[ e f] e4.
    a,4-. \acciaccatura gs'8 a8 
    a,4-. \acciaccatura gs'8 a8
    e4-. e8 ds8.[ c16 b a]
    d8. cs16 d e c8. b16 c d
    b8. a16 b c a4.
     } \break
   \mark \markup{ \box{\fontsize #4 B}}
   \repeat volta 2 {
     << {
       \voiceOne
       e'4 e8 g4 f16 e
       d8. e16 f g e4.
       e4 e8 a8. g16 f e
       d8. e16 f g e4.
      }
      \new Voice {
        \voiceTwo
       c4 c8 e4.
       b4. c4.
       c4 c8 f4.
       b,4. c4.
      }
     >>
     e8. a,16 b c e8. a,16 b c
     e4-. e8 ds8. c16 b a
   } \alternative {
    \volta 1 {
      e'8. a,16 b c e8. a,16 b c
      b8. a16 b c a4.
    }
    \volta 2 {
      d8. cs16 d e c8. b16 c d
      b8. a16 b c a4.
    }
   }
   \break
   \mark \markup{ \box{\fontsize #4 C}}
   \repeat volta 2 {
     c'8. b16 a g f8. e16 d c
     e8. a16 gs a e4.
     c'8. b16 a g f8. e16 d c
     b8. a16 b c a4. 
   }
    %\bar "|."
}


chrdStrophe = \chordmode {
  a2.:m s s
  g4. c
  a2.:m s
  d4.:m a:m e a:m
  c2. g4. c s f g c a2.:m
  s4. b:7
  a2.:m e4.:7 a:m
  d:m a:m e:7 a:m
  a:m d:m a2.:m s4. d:m e a:m
}

\bookpart {
  \paper {
    page-count = #1
    %ragged-last-bottom = ##f
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe"  \strophe
      >>
    >>
  }
}
