\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Final Scene - Underscoring"
sheetNr   = #"32"

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
    '(1 9 17 25 )) #f))))


alive = { s1*10 }

Annotation= {
}
Notes = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c'' {
    \key g \minor
    \repeat unfold 2 { <g bf>4 4 4( <fs a>) } |
    \repeat unfold 2 { <g bf>8( <fs a> <g bf>4) } |
    <bf d>4 4 4( <a c>) \break |
    r <g bf>4 4 <fs a> |
    <e g> <g bf> <fs a> <e g> |
    <fs a>1 ~ | 2 r \break |
    \mark "Bd solo"
    bf4 4 4( a) | bf4 4 4( a) |
    bf8( a bf4) bf8( a bf4) |
    d4 d d( c) \break | r4 bf bf a |
    g bf a g | a1 ~ | a2 r \break |
    d4 c c b | b af af g |
    c2 d | ef2. r4 \break |
    e d d cs | cs bf bf a |
    << {\voiceOne d2. d,4 | d'4. d8 d4( c) |}
       \new Voice {\voiceTwo r4 <d, fs>8( <e g> <fs a>4) d |
       fs4. fs8 fs2 }
    >> \break
    \repeat unfold 2 { <g bf>4 4 4( <fs a>) } |
    \repeat unfold 2 { <g bf>8( <fs a> <g bf>4) } |
    <bf d>4 4 4( <a c>) \break |
    r <g bf>4 4 <fs a> |
    <e g> <g bf> <fs a> <e g> |

    <g c ef>2_\fermata <c, ef fs>\fermata |
    <bf d g>1\fermata \breathe
    \bar "|."
  }
}
ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  \alive
}
Chrds = \chordmode {
  \gotoCtx "chrds-up"
  \repeat unfold 2 {
  \repeat unfold 2 { g2:m d:7 }
  g1:m s2 d:7
  g2:m d:7 | a:7 \set chordBassOnly = ##t a:7/cs |
  \set chordBassOnly = ##f d:7/a \set chordBassOnly = ##t d:7/d | d:7/a d:7/d |
  \set chordBassOnly = ##f
  }
  \repeat unfold 2 { f2:m/g g:7/d | }
  \repeat unfold 2 { c:m g:7 | }
  \repeat unfold 2 { g:m/a a:7/e | }
  d1 | b2:m/d d:7 |
  \repeat unfold 2 { g2:m d:7 }
  g1:m s2 d:7
  g2:m d:7 | a:7 \set chordBassOnly = ##t a:7/cs |
  \set chordBassOnly = ##f
  c2:m6/a | d:7.9- | g1:m

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
