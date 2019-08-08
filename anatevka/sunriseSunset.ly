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
  ragged-bottom = ##f
  page-count = #1
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
        \hspace #1 - \commitDate
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '( 5 13 21 29 37 45 53 61 71 79 87 95 103 111)) #f))))


alive = { s2.*119 }

goUp = \change Staff = "staff"
goDown = \change Staff = "staff2"


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
    <af c>2 r8. f16 | \break
    << {
      <f a>4-. <e g>-. <ef f>-.
      \slurUp df2.( c | df) | \slurNeutral s2. |
      r4 f2 | r4 f2 |
      r8 c(-3 e-2 bf-3 c-2 df-4) | e(-2 af-3 df-2 e-3 af-4 df-5 |
      \bar "||" c)-4 s s2 |
      s2. s2. | r4 c,,2
      s2.*3
      <f a>4-. <e g>-. <ef f>-.
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
      \slurDown <bf df>2.( | <df f>) |\slurNeutral
      <c ef>( | f,) |
      bf( | <bf df>) |
      r4 f8( af) af( c) |
      c( f) f( af) af( c) |
      \repeat unfold 2 { r4 <f,, af>( <g bf> ~ | 4) <f af>( <e g>) |}
      r4 <f af>( <g bf> ~ | 4) <f af>( <g bf>) |
      r4 <af c>( <f af>) |
      ef4 f8 f( g a) |
      <bf df>2.( | <g bf>) |
      <af c>( | <f af>) |
      <df f>( | <c e>) |
      r4 <f af>2 |
      r4 <af c>2 |
      r4 <c f>2 |
      r4 <f af>2 |
      \bar "||"
      af,2. | bf2. |
      r4 af2 | r4 c2 |
      c2.( | <bf d>2. | c2) r8. f,16|
      <f a>4-. <e g>-. <ef f>-.
      df2.( | ef) | df( | f) | f( | g) |
      af2. | s2.*4 | r4 c2 |
      <af c>4( <c f> <f af> |
      <g bf>2 <e g>4 | <f af>2) r8. f,16
      <f a>4-. <e g>-. <ef f>-. |
      f4\p( bf df) | c8( bf a4 c) |
      bf2.( | b) |
      r4 e,2 | r4 g( e) | r4 e2 |
      c8( df e c df e) |
      \bar "||"
      \repeat unfold 2 { r4 <f af>( <g bf> ~ | 4) <f af>( <e g>) |}
      r4 <f af>( <g bf> ~ | 4) <f af>( <g bf>) |
      f2. | <ef f>2. |
      df'4( bf) g8( f |
      e2.) |
      c'4( af) f8( ef |
      d4.) f8( af b |
      bf4 f) ef8( df |
      c4 df) \breathe r4 |

     }  \new Staff = "staff2" \with {
            \remove "Time_signature_engraver"
            \override ChordName.Y-offset = #-1.5

     } {
         \accidentalStyle modern-voice-cautionary
          \relative c' {
          \clef bass \key f \minor
          f,4-. g-. a-. |
          \slurDown bf2.( | a2. | bf) | \slurNeutral
          r4 a( bf) | r4 b2 | r4 b2 |
          \tieDown c2.  ~ 2. | \tieNeutral
          f,2. ( c2. f2.) | r4 g( f) |
          s2.*3 |

          f4-. g-. a-. |
          \stemDown
          \goUp r4 <df f>8( \goDown f,) \goUp <c' ef>4-. |
          r4 <c ef>8( \goDown f,) \goUp <c' ef>4-. |
          r4 <df f>8( \goDown f,) \goUp <df' f>4-. |
          r4 <d f>8( \goDown g,) \goUp <d' f>4-. |
          s4 \voiceTwo e2 \oneVoice | \goDown r4 df( c) | r4 c( bf) |
          <bf c>2.\stemNeutral
          \repeat unfold 2 { r4 c( df ~ | 4) c( bf) |}
          r4 c( df ~ | 4) c( df) |
          r4 c2 | \goUp \voiceTwo ef2. \oneVoice \goDown  |
          af,2.( | g) |
          g( | f)
          f( | e)
          f4 \slurDown f( af | c
          \goUp \voiceTwo f af) | \slurNeutral \goDown \oneVoice
          \repeat unfold 2 { r4 c,( df ~ | 4) c( bf) |}
          r4 c( df ~ | 4) c( df) |
          r4 c2
          c4. r8 r4
          f,2. | e | e | d |
          df | c |
          r4 b( c) |
          r e( f) |
          r g( af) |
          r b( c) |
          \goUp \voiceTwo f2.( | g) |
          \goDown \oneVoice
          r4 df( c) |
          r g( f) |
          s2. | s | s |
          f4-. g-.  a-. |
          \slurUp
          f( bf df) | c8( bf a4 c) |
          \slurNeutral
          bf2.( | f) | g2. ~ | g |
          \goUp \voiceTwo e'2. ~ | e |\oneVoice \goDown
          af,2( c4) | r4 df( bf) |
          af( c \goUp \voiceTwo af') | s4 g( f) |
          \goDown \oneVoice
          s2. | s | s |
          f,4-. g-. a-. |
          s2. | s | s | s |
          c,2 r4 | c2 r4 | c2 r4 | c2 r4 |
          \repeat unfold 2 { r4 c'( df ~ | 4) c( bf) |}
          r4 c( df ~ | 4) c( df) |
          \repeat unfold 8 s2. |
          <f,, c' af'>2. ~ | 2. ~ | 2. ~| 4 r4 r \breathe
          \bar "|."



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
  f2.:m | c:7.13- | f:m s s |
  c:7.13- | f:m | f | bf:m | f:7 | bf:m |
  bf:m/df | g:7/d | df:7-5 | c:7.13- s |
  \gotoCtx "staff"
  s4 f2:m |c2.:7.13- | f:m s f:m |
  c:7.13- | f:m |
  \gotoCtx "chrds-up"
  f | %\gotoCtx "staff"
  bf:m | f:7 | bf:m |
  g | \gotoCtx "chrds-up" c:7 s2.*3
  \repeat unfold 2 { f2:m g2:m5-7 f4:m c:7 }
  f2:m g2:m5-7 f4:m g4:m5-7 | f2.:m | s2.
  bf2.:m | ef | af | df:7+ |
  g:m5-7 | c:7 | f:m | s |
  \repeat unfold 2 { f2:m g2:m5-7 f4:m c:7 }
  f2:m g2:m5-7 f4:m g4:m5-7 | f2.:m | s2.
  g:m5-7 | c:7 | f:m7 | bf:7 | g:m5-7 | c:7 |
  f:m | s2.*3
  f2.:m | c:7.13- | f:m s s |
  \gotoCtx "staff2" c:7.13- | f:m |\gotoCtx "chrds-up" f | bf:m | f:7 | bf:m |
  bf:m/af | g:7 | s |  c:7.13- s |
  f2.:m | c:7.13- | f:m s s |
  \gotoCtx "staff2" c:7.13- | f:m |\gotoCtx "chrds-up" f |
  \gotoCtx "staff2" bf:m | f:7 | bf:m |
  g:7 | \gotoCtx "chrds-up" c:7 |s2.*3
  \repeat unfold 2 { f2:m g2:m5-7 f4:m c:7 }
  f2:m g2:m5-7 f4:m g4:m5-7 |
  \gotoCtx "staff2" f2.:m | f:7 |
  g:m5-7 | c:7.9- | f:m | bf:7.9 | g:m5-7| c:7.9- |
  \gotoCtx "staff" f:m | s s s


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
