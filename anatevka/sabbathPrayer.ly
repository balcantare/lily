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
        \hspace #1 - \commitDate
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1 5 7 23 27 31 36 38 39 )) #f))))


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
    r2 d,8( ef d c |
    << {
    bf1) |s1 |
    \break
    \set Score.barNumberFormatter = #(double-bar-number 8)
    \repeat volta 3 {
      \mark "Vers I+II"
      s1 s1*5
      r4 <c-\balloonText #'(-0.5 . -0.5) \markup {"bd"} a'>4( <df bf'> <c a'>)
    } \alternative {
      { r4_"1.git 2.vl" <ef c'>8( <d bf'> <ef c'> <d bf'> <c a'>4) }
      { r4 <c a'>4( <df bf'> <c a'>) }
    }
    \break
    \bar "||"
    \set Score.barNumberFormatter = #robust-bar-number-function
    \set Score.currentBarNumber = #23
    \mark "Ref" s1 s1*2
    s2 c'16^"bd" df c\prall bf c8 bf |
    s1*3
    s4. <ef, c'>8(^"git" <d bf'> <ef c'> <d bf'> <c a'>)
    \bar "||"
    \break
    \mark "Vers III" r4 <g' bf d> r <g c e>
    \mark "Bd/Cl ad lib" r <g bf d f> r <g c e>
    r4 <g bf d> r <g c e>
    r <g bf d f> r <g c e>
    r4 <g bf d> r <g c e>
    r <g bf d f> r <g c e>
    \set Score.currentBarNumber = #38
    <g c ef>2( <fs c' d>4)

     \breathe \override NoteHead.style = #'slash
    d4_\fermata \revert NoteHead.style |
    \bar "||"
    \break
    \set Score.currentBarNumber = #39
    \mark "Coda"
    s1 s1

      r4 <fs, a>8(^"git" <g bf>) <a cs>( <bf d>) <c ef>( <d fs>) |
      <d g>2\fermata r2
      \bar "|."
    }
     \new Staff = "staff2" \with {
            \remove "Time_signature_engraver"
            \override ChordName.Y-offset = #-1.5
            \consists Percent_repeat_engraver
            \consists Double_percent_repeat_engraver
     }
     {
         \accidentalStyle modern-voice-cautionary
          \relative c' {
          \clef bass \key g \minor
          \set fingeringOrientations = #'(right)
          g,4(-3 <d'-2 bf'-4>) g,(-3 <e'-2 c'-5>)
          g,(-3 <f'-2 d'-5>) g,(-3 <e'-2 c'-5>)
          \repeat percent 3 {
            g,4( <d' bf'>) g,( <e' c'>)
            g,( <f' d'>) g,( <e' c'>)
          }
          f, <c' a'>( <df bf'> <c a'>)
          <d c' fs>2 r8 d( e fs)
          f,4 <c' a'>( <df bf'> <c a'>)
          f,4 <c' a'>( <df bf'> <c a'>)
          f,4 <c' a'>( <df bf'>8 <c a'> f,4)
          <ef g' bf>1
          <f c' a'>2 r
          f4 <c' a'>( <df bf'> <c a'>)
          f,4 <c' a'>( <df bf'>8 <c a'> f,4)
          <ef g' bf>1
          <d' c' fs>1
          d8( g) g g g4. g8 |
          g4 g2. |
          g8( bf) bf bf bf4. 8 |
          bf1 |
          c8( bf a g bf4.) g8( |
          c8 bf a g bf4. g8) |
          c8 bf a g a4->-. \breathe d,
          g,4( <d' bf'>) g,( <e' c'>)
          g,4( <d' bf'>) g,( <e' c'>)
          g,1 ~ |  4 r\fermata 4-. r
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
  \gotoCtx "chrds-up"
  \repeat percent 3 { g2:m c2:/g | g2:m7 c2:/g | }
  \gotoCtx "chrds-up"
  a2:m5-7 d:7
  \gotoCtx "staff"
  g2:m c:/g | g:m c:/g |
  \gotoCtx "chrds-up"
  g1:m
}

\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override BarNumber.Y-offset = 0
    \override BarNumber.X-offset = 0
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
        \new Voice = "voice" \with {
          \consists "Balloon_engraver"
           \override BalloonTextItem #'annotation-balloon = ##f
        } \Notes
      >>
    \new ChordNames = "chrds-down" \with {
      \consists Percent_repeat_engraver
      \override PercentRepeat.Y-offset = #1
      \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0)
    } \chordmode{\alive}
    \context Voice = "voice" \Annotation
  >>
}
