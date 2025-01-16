\version "2.24.2"
sheetName = "Daumen Untersatz, Tonleiter"
#(define book-staff-size 20)
\include "../include/book.ily"
 
\bookpart {
  \paper {
    page-count = #2
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
  \pageBreak
   \score {
   <<
    \new ChordNames {\chordmode {
      df2 s2*6 d2  s2*6
      ef2 s2*6 e2  s2*6
      f2  s2*6 fs2 s2*6
      gf2 s2*6 g2  s2*6
      af2 s2*6 a2  s2*6
      bf2 s2*6 b2  
    }}
    \new Staff = "up" \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0) (minimum-distance . 0 ) (padding . -1.1) (stretchability . 0))
    %\override StaffGrouper.staffgroup-staff-spacing.basic-distance = 0
    %\override StaffGrouper.staffgroup-staff-spacing.minimum-distance = 0
    }
    {
      \new Voice = "rechts" { 
        \relative c'{
          \voiceOne
          \time 7/4
          \set Staff.printKeyCancellation = ##f
          \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
         \override Fingering.font-size = #-3
          \key df \major
          \bar ".|:"
          \repeat volta 2 {
            df8-2[ ef-\3 f-1 gf-2] af-3[ bf-\4 c-1 df-2]
            c-1[ bf-\4 af-3 gf-2] f-1[ ef-\3] 
          } 
          df1..-2
          \key d \major
          \repeat volta 2 {
            d8-1[ e-2 fs-\3 g-1] a-2[ b-3 cs-\4 d-5]
            cs-\4[ b-3 a-2 g-1] fs-\3[ e-2] 
          } 
          d1..-1 \break
          \key ef \major
          \repeat volta 2 {
            ef8[-2 f-1 g-2 af]-3 bf[-\4 c-1 d-2 ef-\3] d[-2 c-1 bf-\4 af-3] g-2 f-1 
          } ef1..-2
          \key e \major
          \repeat volta 2 {
            e8[-1 fs-2 gs-\3 a]-1 b[-2 cs-3 ds-\4 e]-5 ds[-\4 cs-3 b-2 a]-1 gs-\3 fs-2  
          } e1..-1 \break
          \key f \major
          \repeat volta 2 {
             f8[-1 g-2 a-3 bf]-\4 c[-1 d-2 e-\3 f]-4 e[-\3 d-2 c-1 bf]-\4 a-3 g-2
          } f1..-1
          \key fs \major
          \repeat volta 2 {
            fs8[-2 gs-3 as-\4 b]-1 cs[-2 ds-\3 es-1 fs]-2 es[-1 ds-\3 cs-2 b]-1 as-\4 gs-3 
          } fs1..-2 \break
          \key gf \major
          \repeat volta 2 { 
            gf,8[-2 af-3 bf-\4 cf]-1 df[-2 ef-\3 f-1 gf]-2 f[-1 ef-\3 df-2 cf]-1 cf-\4 af-3  
          } gf1..-2 
          \key g \major
          \repeat volta 2 {
            g8[-1 a-2 b-\3 c]-1 d[-2 e-3 fs-\4 g]-5 fs[-\4 e-3 d-2 c]-1 b-\3 a-2 
          } g1..-1 \break
          \key af \major
          \repeat volta 2 {
            af8[-3 bf-\4 c-1 df]-2 ef[-\3 f-1 g-2 af]-3 g[-2 f-1 ef-\3 df]-2 c-1 bf-\4
          } af1..-3
          \key a \major 
          \repeat volta 2 {
            a8[-1 b-2 cs-\3 d]-1 e[-2 fs-3 gs-\4 a]-5 gs[-\4 fs-3  e-2 d]-1 cs-\3 b-2  
          } a1..-1  \break
          \key bf \major
          \repeat volta 2 {
            bf8[-2 c-1 d-2 ef]-\3 f[-1 g-2 a-3 bf]-\4 a[-3 g-2 f-1 ef]-\3 d-2 c-1
          } bf1..-2 
          \key b \major
          \repeat volta  2 {
            b8[-1 cs-2 ds-\3 e]-1 fs[-2 gs-3 as-\4 b]-5 as[-\4 gs-3 fs-2 e]-1 ds-\3 cs-2
          } b1..-1
          
          \bar "|."
        }
      }
    }
    \new Staff = "down" 
      {
      \new Voice = "links" {
        \clef bass
        \relative c' {
          \set Staff.printKeyCancellation = ##f
          \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible

%          \override Staff.KeySignature.break-visibility = #all-invisible
          \key df \major
          \voiceTwo
          \override Fingering.font-size = #-3
          df8-2[ c-1 bf-2 af-3] gf_\4[ f-1 ef-2 df_\3]
          ef-2[ f-1 gf_\4 af-3] bf-2 c-1 
          s1..-2
          \key d \major 
          d8-1[ cs-2 b_\3 a-1] g-2[ fs-3 e_\4 d-5] 
          e_\4[ fs-3 g-2 a-] b_\3 cs-2 d1..-1 
          \key ef \major
          ef8[-2 d-1 c-2 bf]-3 af[_\4 g-1 f-2 ef]_\3 f[-2 g-1 af_\4 bf]-3 c-2 d-1 
          s1..-2
          \key e \major
          e8[-1 ds-2 cs_\3 b]-1 a[-2 gs-3 fs_\4 e]-5 fs[_\4 gs-3 a-2 b]-1 cs_\3 ds-2
          s1..-1
          \key f \major
          \crossStaff {
          f8[-1 e-2 d_\3 c]-1 bf[-2 a-3 g_\4 f]-5 g[_\4 a-3 bf-2 c]-1 d_\3 e-2 }
          s1..-1
          \key fs \major
          \crossStaff{ 
            fs8[-2 es-1 ds-2 cs]_\3 b[-1 as-2 gs-3 fs]_\4 gs[-3 as-2 b-1 cs]_\3 ds-2 es-1 
          }
          s1..-2
          \key gf \major
          \crossStaff{
            gf,8[-2 f-1 ef-2 df]_\3 cf[-1 bf-2 af-3 gf]_\4 af[-3 bf-2 cf-1 df]_\3 ef-2 f-1 
          }
          s1..-2
          \key g \major
          \crossStaff{
            g8[-1 fs-2 e_\3 d]-1 c[-2 b-3 a_\4 g]-5 a[_\4 b-3 c-2 d]-1 e_\3 fs-2
          }
          s1..-1
          \key af \major
          af8[-2 g-1 f-2 ef]-3 df[_\4 c-1 bf-2 af]_\3 bf[-2 c-1 df_\4 ef]-3 f-2 g-1 
          s1..-2
          \key a \major
          a8[-1 gs-2 fs_\3 e]-1 d[-2 cs-3 b_\4 a]-5 b[_\4 cs-3 d-2 e]-1 fs_\3 gs-2 
          s1..-1
          \key bf \major
          bf8[-2 a-1 g-2 f]-3 ef[_\4 d-1 c-2 bf]_\3 c[-2 d-1 ef_\4 f]-3 g-2 a-1 
          s1..-2
          \key b \major
          b8[-1 as-2 gs-3 fs]_\4 e[-1 ds-2 cs_\3 b]-4 cs[_\3 ds-2 e-1 fs]_\4 gs-3 as-2 
          s1..-1
        }
      }
    }	
   >>
  }  


}