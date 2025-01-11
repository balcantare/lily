\version "2.24.2"
sheetName = "Daumen Untersatz, Tonleiter"
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
      #'((basic-distance . 0) (padding . -1.2))
    }
    {
      \new Voice = "rechts" {
        \key c \major
        \autoChange \relative c'{
          \voiceOne
          \override Fingering.font-size = #-3
          \time 3/4
          \bar ".|:"
          \mark\markup{ \circle{\fontsize #1 a}}
          \repeat volta 2 {
            c4-1 d-2 e-\3 f-1 e-\3 d-2 
          } c2.-1
          \mark\markup{ \circle{\fontsize #1 b}}
          \time 4/4
          \repeat volta 2 {
            c4-1 d-2 e-\3 f-1 g-2 f-1 e-\3 d-2 
          } c1-1
          \break
          \mark\markup{ \circle{\fontsize #1 c}}
          \time 3/4
          \repeat volta 2 {
            c4-1 d-2 e-\3 f-1 g-2 a-3 b-\4 
            a-3 g-2 f-1 e-\3 d-2 
          } c2.-1 
          \break
          \mark\markup{ \circle{\fontsize #1 d}}
          \time 6/8
          \repeat volta 2 {
            \repeat unfold 3 {
            c8-1 d-2 e-\3 f-1 g-2 a-3 b-\4 c-5
            b-\4 a-3 g-2 f-1 e-\3 d-2 
            }
          } c2.-1
          \break
          \mark\markup{ \circle{\fontsize #1 e}}
          \time 2/4 
          \repeat volta 2 {
            c8-1[ d-2 e-\3 f-1] g-2[ a-3 b-\4 c-5]
            b-\4[ a-3 g-2 f-1] 
            e-\3[ d-2 c-1 d-2] e-\3[ f-1 g-2 a-3]
            b-\4[ c-5 b-\4 a-3] g-2[ f-1 e-\3 d-2] 
          } c2-1
          \mark\markup{ \circle{\fontsize #1 f}}
          \time 7/8 
          \repeat volta 2 {
            c8-1[ d-2 e-\3] f-1[ g-2 a-3 b-\4]
            c-5[ b-\4 a-3] g-2[ f-1 e-\3 d-2]
          } c2..-1
          \mark\markup{ \circle{\fontsize #1 g}}
          \repeat volta 2 {
            c8-1[ d-2 e-\3 f-1] g-2[ a-3 b-\4]
            c-5[ b-\4 a-3 g-2] f-1[ e-\3 d-2]
          } c2..-1
          \break
          \mark\markup{ \circle{\fontsize #1 h}}
          \time 4/4
            c8-1 d-2 e-\3 f-1  g-2 a-3 b-\4 c-1
            d-2 c-1 b-\4 a-3   g-2 f-1 e-\3 d-2
            e-\3 f-1 g-2 a-3   b-\4 c-1 d-2 e-\3 
            f-1 e-\3 d-2 c-1   b-\4 a-3 g-2 f-1
            g-2 a-3 b-\4 c-1   d-2 e-\3 f-1 g-2 
            a-3 g-2 f-1 e-\3   d-2 c-1 b-\4 a-3
            b-\4 c-1 d-2 e-\3  f-1 g-2 a-3 b-\4
            c-1 b-\4 a-3 g-2   f-1 e-\3 d-2 c-1
            b-\4 c-1 d-2 e-\3  f-1 g-2 a-3 b-\4
            s1-\markup{\draw-squiggle-line #0.5 #'(3 . 0) ##t
            \hspace #-0.5 \arrow-head #X #RIGHT ##t}
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
          c4-1 b-2 a_\3 g-1 a_\3 b-2
          c2.-1
          c4-1 b-2 a_\3 g-1 f-2 g-1 a_\3 b-2
          c1-1
          c4-1 b-2 a_\3 g-1 f-2 e-3 d_\4 e-3 
          f-2 g-1 a_\3 b-2
          c2.-1
          \repeat unfold 3 {
          c8-1 b-2 a_\3 g-1 f-2 e-3 d_\4 c-5
          d_\4 e-3 f-2 g-1 a_\3 b-2
          }
          c2.-1
          c8-1[ b-2 a_\3 g-1] f-2[ e-3 d_\4 c-5]
          d_\4[ e-3 f-2 g-1] a_\3[ b-2 c-1 b-2]
          a_\3[ g-1 f-2 e-3] d_\4[ c-5 d_\4 e-3]
          f-2[ g-1 a_\3 b-2]
          c2-1
          c8-1[ b-2 a_\3] g-1[ f-2 e-3 d_\4]
          c-5[ d_\4 e-3] f-2[ g-1 a_\3 b-2]
          c2..-1
          c8-1[ b-2 a_\3 g-1] f-2[ e-3 d_\4]
          c-5[ d_\4 e-3 f-2] g-1[ a_\3 b-2]
          c2..-1
          c8-1 b-2 a_\3 g-1 f-2 e-3 d_\4 c-1
          b-2 c-1 d_\4 e-3 f-2 g-1 a_\3 b-2
          a_\3 g-1 f-2 e-3 d_\4 c-1 b-2 a_\3 
          g-1 a_\3 b-2 c-1 d_\4 e-3 f-2 g-1
          f-2 e-3 d_\4 c-1 b-2 a_\3 g-1 f-2 
          e-3 f-2 g-1 a_\3 b-2 c-1 d_\4 e-3
          d_\4 c-1 b-2 a_\3 g-1 f-2 e-3 d_\4 
          c-1 d_\4 e-3 f-2 g-1 a_\3 b-2 c-1
          d_\4 c-1 b-2 a_\3 g-1 f-2 e-3 d_\4
          s1-\markup{\draw-squiggle-line #0.5 #'(3 . 0) ##t
            \hspace #-0.5 \arrow-head #X #RIGHT ##t}
        }
      }
    }
    >>
  }  
  
   \score {
   <<
    \new ChordNames {\chordmode {df2 s2*6 d2 s2*6}}
    \new Staff = "up" \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0) (padding . -1.1))
    }
    {
      \new Voice = "rechts" { 
        \relative c'{
          \voiceOne
          \time 7/4
          \override Fingering.font-size = #-3
          \key df \major
          \bar ".|:"
          \repeat volta 2 {
          df8-2[ ef-\3 f-1 gf-2] af-3[ bf-\4 c-1 df-2]
          c-1[ bf-\4 af-3 gf-2] f-1[ ef-\3] } 
          df1..-2
          \key d \major
          \repeat volta 2 {
          d8-1[ e-2 fs-\3 g-1] a-2[ b-3 cs-\4 d-5]
          cs-\4[ b-3 a-2 g-1] fs-\3[ e-2] } 
          d1..-1

          \bar "|."
        }
      }
    }
    \new Staff = "down" 
      {
      \new Voice = "links" {
        \clef bass
        \relative c' {
          \key df \major
          \voiceTwo
          \override Fingering.font-size = #-3
          df8-2 c-1 bf-2 af-3 gf_\4 f-1 ef-2 df_\3
          ef-2 f-1 gf_\4 af-3 bf-2 c-1 
          df1..-2
        }
      }
    }
   >>
  }  


}