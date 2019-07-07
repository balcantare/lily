\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Street Scene"
sheetNr   = #"7"

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
    '(2 10 18 32 36 )) #f))))


alive = { s1*10 }

Annotation= {
}
Notes = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \override Score.RehearsalMark.self-alignment-X = -1.5
    \override Score.RehearsalMark.Y-offset = #-1
    \mark "Bd solo"
    \bar ".|:"
    \repeat volta 2 {  c4-\mp e8 e c[ r e] r }
    g'8( f g f e4 c) |
    r4 e8( f g f g f ) |
    e( f g a bf a bf a |
    g2) r8 <e g>( <ds fs> <e g> |
    <f af>4 <e g> <ef gf> <d f>) |
    ef8( d c d ef4) r |
    ef8( d c d ef4) c-. |
    g'-. r \acciaccatura fs'8 g4-. r4 \breathe
    \bar "||" \break
    \time 2/2

    \mark "Vl solo"
    g,8 f g f e4 c |
    r4 e8 f g f g f  |
    e f g a bf a bf a |
    g4 b( c) c,( | \break
    af') g gf8 8 f4 |
    ef8 d c d ef4 r |
    ef8 d c ef d c b d |
    c4 e f g |
    \bar "||" \break
    \time 4/4
    \mark "Allegretto In4"
    a8.-\p g16( a8.) g16( fs4-.) d4 ~ |
    4\< fs8. g16( a8.) g16( a8.) g16(\! |
    fs8.)\mf g16( a8.)  b16( c8.) b16( c8.) b16( |
    a4) cs4--( d-.) d,( |
    bf'8-.) 8-. a4 af g8 8 |
    f8. e16 d8. e16 f4( d'-.) |
    \break
    %\bar "||"
    \time 2/2
    \repeat volta 2 {
      \set Score.currentBarNumber = #32
      \mark "accel.-In2"
       f,8 e d e f_"cresc." e d e
       f8 e d e f e d e
    }
    fs, g as\< b c cs d ds\! |
    \once\override Score.RehearsalMark.self-alignment-X = -2 \mark"(Applause)" \breathe
    <g, d' e>4-> <g cs e a>-> <d' fs a d>-> r
    \bar "|."
    \break
    \mark "Allegreto"
    <b d>8(\f <a c> <b d> <a c> <g b>4-.) <d g> |
    r4 <g b>8 <a c> <b d> <a c> <b d> <a c> |
    <b g> <a c> <b d> <c e> <d f> <c e> <d f> <c e> |
    <b d>2. g4 |
    \break
    <c ef>4( <b d> <bf df> <a c> |
    bf8 a-"rit.e dim." g a bf2) |
    \mark "In4"
    bf8( a g bf a g-"moto rall." fs a) |
    \once \set glissandoMap = #'((0 . 2))
    g2\> \glissando <bf d g>\!\pp \breathe
    \bar "|."
  }
}
ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  \relative a'{
  s1
  r4 s4 r4 a
  r4 a r a
  r4 a r a
  a2 ~ 8 r r4 |
  r4 s4 r4 a
  r4 s4 r4 a
  s1
  s4 r4 r2
  s1*8
  s1*3
  s2 s4 r4
  s1*2
  s4 r4 r a4 |
  s4 r4 r a4 |
  s4 r4 r2 |
  s2. r4
  }
}
Chrds = \chordmode {
  \gotoCtx "chrds-up"
  c1
  s4 c4 s2
  s1 s1 s1
  s4 g4 s2
  s4 c4:m s2
  c1:dim
  g4:7 s4 s2
  s1*8
  d1 | s1 | s1
  s4 a4:7 d4 s4
  a1:7
  d:m
  d4:dim s2.
  d4:m s2.
  e1:m
  e4:m5-7 a:7 d s4
  g1
  s1*3
  d1 g:m
  a2:7 d:7
  g:m
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
