\version "2.24.2"
sheetName = "Übung 1"
#(define book-staff-size 20)
\include "../include/book.ily"

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    % ragged-last-bottom = ##t
  }
  \bookItem 
    \score {
   <<
    \new Staff = "up" \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0) (padding . -0.5))
    }
    {
      \new Voice = "rechts" {
        \key c \major
        \autoChange \relative c''{
          \voiceOne
          \bar ".|:"
          \repeat volta 2 {
          \mark\markup{ \circle{\fontsize #1 A}}  
          \override Fingering.font-size = #-3
          a4-1 b c b a b c b a1 
          b4-1 c d c b c d c b1
          }
          a4-1 b c b a1
          \bar "|."
        }
      }
    }
    \new Staff = "down" 
      {
      \new Voice = "links" {
        \key c \major
        \clef bass
        \autoChange \relative {
          \voiceTwo
          \override Fingering.font-size = #-3
          a2-5 e'_1 a, e' a, e'
          a,-5 f'-1 a, f' a, f'
          a,-5 e'-1 a,1
        }
      }
    }
    >>
  }  
  
   \score {
   <<
    \new Staff = "up" \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0) (padding . -1.5))
    }
    {
      \new Voice = "rechts" {
        \key c \major
        \autoChange \relative c''{
          \voiceOne
          \time 3/2
          \mark\markup{ \circle{\fontsize #1 B}}  
          \override Fingering.font-size = #-3
          e4-1 f g f e2
          d4-1 e f e d2
          c4-1 d e d c2
          b4-1 c d c b2
          c4-1 d e d c d 
          e1. 
          \bar "|."
        }
      }
    }
    \new Staff = "down" 
      {
      \new Voice = "links" {
        \key c \major
        \clef bass
        \autoChange \relative c' {
          \voiceTwo
          \override Fingering.font-size = #-3
          c4-3 d e d c2
          b4-3 c d c b2
          a4-3 b c b a2
          g4-3 a b a g2
          a4-3 b c b a b 
          c1.
        }
      }
    }
   >>
  }  

  \score {
   <<
    \new Staff = "up" \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0) (padding . -0.5))
    }
    {
      \new Voice = "rechts" {
        \key c \major
        \autoChange \relative c''{
          \voiceOne
          \time 4/4
          \mark\markup{ \circle{\fontsize #1 C}}  
          \override Fingering.font-size = #-3
          g4-3 g-2 a-3 a-2 g2-3 e-1
          g4-3 g-2 a-3 a-2 g2-3 e-1
          g4-3 g-2 a-3 a-2 g-3 g-2 e2-1
          g4-5 f-4 e-3 d-2
          c-1 c-2 c2-1
          \bar "|."
        }
      }
    }
    \new Staff = "down" 
      {
      \new Voice = "links" {
        \key c \major
        \clef bass
        \autoChange \relative c {
          \voiceTwo
          \override Fingering.font-size = #-3
          c2-5 f-2 c-5 g'-1 c,-5 f-2 c-5 g'-1
          c,-5 f-2 c-5 g'-1 b,-5 d-3 c1-4 
        }
      }
    }
   >>
  } 

  \score {
   <<
    \new Staff = "up" \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0) (padding . -0.5))
    }
    {
      \new Voice = "rechts" {
        \key c \major
        \autoChange \relative c'{
          \voiceOne
          \time 4/4
          \mark\markup{ \circle{\fontsize #1 C}}  
          \override Fingering.font-size = #-3
          c4-1 d e-3 f-1
          g-2 g-3 g-2 g-3
          a-3 f-1 c'-5 a-3
          g1-2
          a4-3 f-1 c'-5 a-3
          g1-2
          g4-3 f-2 f-3 f-2
          f-3 e-2 e-3 e-2
          e-3 d-2 e d
          c-1 e-3 g2-5
          g4 f f f 
          f e e e 
          e d e d
          c1
          \bar "|."
        }
      }
    }
    \new Staff = "down" 
      {
      \new Voice = "links" {
        \key c \major
        \clef bass
        \autoChange \relative c {
          \voiceTwo
          \override Fingering.font-size = #-3
          c2-5 g'-1 c, g' f-3 a-1 c,-5 g'-1 f-3 a-1
          c,-5 g'-\markup { \finger "1 - 2" }
          b2-1 g-3 c-1 g g b,-5 c-4 e-2 b-5 g'-1 c, g'-1 g 
          b,-5 c1-4 
        }
      }
    }
   >>
  } 



}