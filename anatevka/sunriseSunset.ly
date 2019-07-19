\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Sunrise Sunset"
sheetNr   = #"14"

bookTitle = \markup {
  \fontsize #3 \larger \larger
  \line { \box{ #sheetNr } #sheetName }
}
\header { title = \bookTitle  tagline = ##f }

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 0.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##t
  %page-count = #1
  markup-system-spacing = #'((basic-distance . 2)
                             (minimum-distance . 2)
                             (padding . 1))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \line{
        \box{ #sheetNr } #sheetName \hspace #1
        - \hspace #1 \fromproperty #'page:page-number-string
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '( 5 13 21 29 37 45 53 61 71 79 87 95 )) #f))))


alive = { s1*30 }

Annotation= {
}
Notes = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \time 3/4
  \key f \minor
  s2.*4 | \bar "||"
  \relative c'' {
    <af c>2.(\pp | <bf df> | <af c>) |
    r4 <f af>( <g bf> | <af c>2. | <bf df>) |
    <af c>2 r8. f16 |
    << {
      <f a>4-. <e g>-. <ef f>-.
      df2.( c | df) | s2. |
      r4 f2 | r4 f2 |
      r8 c(-3 e-2 bf-3 c-2 df-4) | e(-2 af-3 df-2 e-3 af-4 df-5 |
      \bar "||" c)-4 s s2 |
      s2. s2. | r4 <af,, c>2
      s2.*3
      <f' a>4-. <e g>-. <ef f>-.
      s2.*4
      r4 <af c>--( <g bf>) |
      r4 <g bf>( <e af>) |
      r4 <e af>( <e g>) |
      c8( d e c d e)
      \bar "||"
      \repeat unfold 2 { r4 <f af>( <g bf> ~ | 4) <f af>( <e g>) |}
      r4 <f af>( <g bf> ~ | 4) <f af>( <g bf>) |
      r4 <af c>( <f af>) |
      f8( g a f g a) |

     }  \new Staff \with {
            \remove "Time_signature_engraver"
     } {
         \relative c' {
          \clef bass \key f \minor
          f,4-. g-. a-. |
          bf2.( | a2. | bf) |
          r4 a( bf) | r4 b2 | r4 b2 |
          c2. ~ 2. |
          f,2. ( ef2. f2.) | r4 g( f) |
          s2.*3 |

          f4-. g-. a-. |
          r4 <df f>8( f,) <c' ef>4-. |
          r4 <c ef>8( f,) <c' ef>4-. |
          r4 <df f>8( f,) <df' f>4-. |
          r4 <d f>8( g,) <d' f>4-. |
          r4 e2 | r4 df( c) | r4 c( bf) |
          <bf c>2.
          \repeat unfold 2 { r4 c( df ~ | 4) c( bf) |}
          r4 c( df ~ | 4) c( df) |
          r4 c2 | ef2. |

         }
       }
    >>

  }
}
ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  \alive
}
Chrds = \chordmode {
  \gotoCtx "staff"
  \repeat percent 4 f2.:m
  \gotoCtx "chrds-up"
  f2.:m | c:7.13- | \repeat percent 3 f:m |
  c:7.13- | f:m | f | bf:m | f:7 | bf:m |
  bf:m/df | g:7/d | df:7-5 | c:7.13- s |
  \gotoCtx "staff"
  s4 f2:m |c2.:7.13- | \repeat percent 3 f:m |
  c:7.13- | f:m |
  \gotoCtx "chrds-up"
  f | bf:m | f:7 | bf:m |
  g | c:7 s2.*3

}

\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override BarNumber.Y-offset = 0
    \override BarNumber.X-offset = -2
  }
}

\score {
  \new StaffGroup \with {
      \override StaffGrouper.staff-staff-spacing =
    #'((basic-distance . 4)
       (minimum-distance . 0)
       (padding . 0)
       (stretchability . 0))
  }
  <<
    \new Staff = "chrds-up" \with {
      \accepts ChordNames
      \consists Percent_repeat_engraver
      \remove Staff_symbol_engraver
      \remove Time_signature_engraver
      \remove Clef_engraver
      \override ChordName.Y-offset = #-1.5
    } \ChrdsUp
    \new Staff = "staff" \with {
      \accepts ChordNames
      \consists Percent_repeat_engraver
    }
      <<
        \new ChordNames \with {
          \override ChordName.Y-offset = #-1.5
        } \Chrds
        \context Voice = "voice" \Notes
      >>
    \new ChordNames = "chrds-down" \with {
      \consists Percent_repeat_engraver
      \override PercentRepeat.Y-offset = #1
      \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0)
    } \chordmode{\alive}
    \context Voice = "voice" \Annotation
  >>
}
