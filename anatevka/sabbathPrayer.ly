\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Sabbath Prayer"
sheetNr   = #"5"

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
    '(1 5 7 23 27 31 39 )) #f))))


alive = { s1*34 }

Annotation= {
}
Notes = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c'{
    \key g \minor
    a8(\p d4) d d-- r8\fermata |
    a8( d4) d d-- r8\fermata |
    r4 fs8( a) b4( a) |
    r2 d,8( ef d c | bf1) |s1 |
    \break
    \set Score.barNumberFormatter = #(double-bar-number 8)
    \repeat volta 2 {
      s1^"Vers I+II" s1*5
      r4 <c a'>4( <df bf'> <c a'>)
    } \alternative {
      { r4 <ef c'>8( <d bf'> <ef c'> <d bf'> <c a'>4) }
      { r4 <c a'>4( <df bf'> <c a'>) }
    }
    \break
    \bar "||"
    \set Score.barNumberFormatter = #robust-bar-number-function
    \set Score.currentBarNumber = #23
    s1^"Ref" s1*2
    s2 c'16 df c\prall bf c8 bf |
    s1*3
    s4. <ef, c'>8( <d bf'> <ef c'> <d bf'> <c a'>)
    \bar "||"
    \break
    s1^"Vers III" s1^"Bd/Cl ad lib" s1*4
    c'8 bf a g a4->-. \breathe \override NoteHead.style = #'slash
    d4_\fermata \revert NoteHead.style |
    \bar "||"
    \break
    \set Score.currentBarNumber = #39
    s1^"Coda" s1
    << {\voiceOne
      r4 <fs, a>8(^"git" <g bf>) <a cs>( <bf d>) <c ef>( <d fs>) |
      <d g>2\fermata r2
      } \new Voice {\voiceTwo
        \override NoteHead.style = #'slash
        d,1 ~ | 4 r\fermata \parenthesize g-. r4
      }
    >>
    \bar "|."
  }
}
ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  \alive
}

Chrds = \chordmode {
  \gotoCtx "staff"
  s1*4 g2:m c:/g | g:m7 c:/g |
  \repeat percent 3 { g2:m c2:/g | g2:m7 c2:/g | }
  \gotoCtx "chrds-up"
  f2 bf4:m/f f4 |
  d1:7
  f2 bf4:m/f f4 |
  \gotoCtx "staff"
  \repeat percent 2 {f2 bf4:m/f f4 |}
  ef1 f1
  \repeat percent 2 {f2 bf4:m/f f4 |}
  ef1 d4:7 s2.
  \repeat percent 3 { g2:m c2:/g | g2:m7 c2:/g | }
  \gotoCtx "chrds-up"
  a2:m5-7 d:7
  \gotoCtx "staff"
  g2:m c:/g | g:m7 c:/g |
  \gotoCtx "chrds-up"
  g1:m
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
      \consists Double_percent_repeat_engraver
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
