\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Match Maker"
sheetNr   = #"3"

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
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}


#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1 3 7 11 15 33 35 39 43 47 51 55 59 63  67 71 75 79 85
       87 91 99 103 107 110 117 121 125 131 134 138 174 178 182
       186 190 194 198 202)) #f))))


alive = { s1*144 }

Annotation= {
  s2._\markup{\halign # -1 \line\italic{ ad lib rep}}

}
Notes = {
  \set Score.barNumberVisibility = #print-at-bars

  \accidentalStyle modern-voice-cautionary
  \time 3/4
  \key e \major
  \relative c {
    \clef bass
    \bar ".|:"
    \acciaccatura as8 b2. ~ | b2.
    \once\override Score.RehearsalMark.self-alignment-X = -1.8
    \once\override Score.RehearsalMark.Y-offset = #0
    \mark\markup{\left-align{\box{\fontsize #3 A}}}
    \bar ":..:"
    \set Score.barNumberFormatter = #(quadruple-bar-number 16 48 141)
    \acciaccatura as8 b2. ~ | b2. |
    \acciaccatura bs8 cs2. ~ | cs2.
    \acciaccatura cs8 ds2. ~ | ds2.
    e4 r r | \clef treble \repeat unfold 2 {<e' b'>8 <ds gs>8 r}
    \clef bass
    \acciaccatura as,8 b2. ~ | b2. | d2. |
    \acciaccatura ds8 e2. | e4 r r | b fs'2 | e4 r r
    \override NoteHead.style = #'slash
    d8 d d4 d
    \set Score.barNumberFormatter = #(double-bar-number 125)
    \set Score.currentBarNumber = #33
    r4 r d4 | d4 d r |

    \bar "||"
    \once\override Score.RehearsalMark.self-alignment-X = -1.8
    \once\override Score.RehearsalMark.Y-offset = #-0.8
    \mark\markup{\left-align{\box{\fontsize #4 B}}}
    \set Score.currentBarNumber = #35
    s2.*2
    d4 r2 r2.
    s2.*8
    d4 r r |
    d4 r r |
    \set Score.barNumberFormatter = #robust-bar-number-function
    %\once\override Score.RehearsalMark.Y-offset = #0
    %\mark\markup{\left-align{\musicglyph #"scripts.segno"}}
    r \segno d r |
    d8 d d4 d |

   \once\override Score.RehearsalMark.self-alignment-X = -2.5
    \once\override Score.RehearsalMark.Y-offset = #-6
    \mark\markup{\left-align{\box{\fontsize #4 A}}}
    s2.
    \set Score.currentBarNumber = #65

   s2.*5
    \revert NoteHead.style
    \key g \major
    \clef treble
    <<
      \relative c'' {
        \voiceOne
        <b d>2.^\markup {\halign #-1 bd Melodie, g bordun} |  <b ds>  |  <c e>  | <cs es>
        <d fs>  |  <df ef> |  <c e>  | <c ef>
      }
      \relative c' {\new Voice {
        \voiceTwo
        d4( g) g | g( a) a | a( b) b | b2. |
        a4( b) b | b2. |a4( b) b | b2. |
        \slurNeutral
        \oneVoice
        d,4( g) g | g( a) a | a( b) b | b2 c4 |
        \slurDown
        d4( c b) | g2( d4)^\fermata |
        \slurNeutral
      }
      }
    >>
    \once\override Score.RehearsalMark.self-alignment-X = -1.5
    \once\override Score.RehearsalMark.Y-offset = #-1
    \mark\markup{\left-align{\box{\fontsize #1 Vig.}}}

    \oneVoice
    \time 2/2
    \key bf \major
    \slurDown
    \repeat volta 3 {
        r4 g''2( fs4 | g1) |
        \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
        \once\override Score.RehearsalMark.self-alignment-X = 0
        \once\override Score.RehearsalMark.Y-offset = #-1
    \mark\markup{\left-align{\fontsize #1 3x}}
    }
    \slurNeutral

    r4 g,2( fs4 | g1) | r4 a2( e4 | fs2) r2 |
    \override NoteHead.style = #'slash
    r2 bf4 r4 |
    r2 bf4 r4 |
    bf4 r4 r2 |
    \revert NoteHead.style
    r4 b( c d | ef2) g4( d | ef2 g4) r |
    \override NoteHead.style = #'slash
    r2 bf,4 r4 |
    r2 bf4 r4
    \revert NoteHead.style
    r4 g2( fs4 | g1) | r4 a2( e4) | r4 fs-. fs-. d-. |
    ef4-. d-. r2
    \clef bass
    r4 d,
    \clef treble
    \acciaccatura cs' d
    \acciaccatura cs' d |
    \acciaccatura cs' d r4 r2 |
    \override NoteHead.style = #'slash
    r4 bf,4 r4 bf |
    \revert NoteHead.style
    %\bar ".|:"
    \key a \minor
    \slurDown
    \repeat volta 3 {
      r4 a'2( gs4 | a2.) r4 |
      %\once\override Score.RehearsalMark.break-visibility = #end-of-line-visible
      \once\override Score.RehearsalMark.self-alignment-X = 0.5
      \once\override Score.RehearsalMark.Y-offset = #-3
      \mark\markup{\left-align{\fontsize #1 3x}}
    }
    \slurNeutral
    r4 c,2( b4 | c1) || r4 d2( a4 | b2) r2 |
    \override NoteHead.style = #'slash
    r2 b4 r |
    \revert NoteHead.style
    r2 c4( b | a)-. r4 r2 |
    r4 cs( d e | f2)-- a4( e | f2-- a4) r4 |
    \override NoteHead.style = #'slash
    r2 b,4 r | r2 b4 r |
    \revert NoteHead.style
    r4 a2( gs4 | a1) |
    b2( fs) |
    s1 |
    \override NoteHead.style = #'slash
    b4 b r2
    \revert NoteHead.style
    r2 r4 \acciaccatura ds e4 |
    e4-. r4 r2 |
    \slurDown
    r4 a( g fs | e d cs d | e2.) d4( |
    cs4 e fs g | a2. g4 | fs )
    \override BreathingSign.text = \markup {
      \musicglyph #"scripts.caesura.curved"
    }
    \breathe  r4 r2^\fermata
    \bar "||"
    \time 3/4
    \key g \major
    \once\override Score.RehearsalMark.self-alignment-X = -1.5
    \once\override Score.RehearsalMark.Y-offset = #-1
    \mark\markup{\left-align{\box{\fontsize #1 Delib.}}}
    s2.*3
    \override NoteHead.style = #'slash
    b,4 b \breathe r4
    \repeat percent 2 { g4 b4 r4 | }
    r8 b8 b4 b |
    b4 b4 \breathe
    \revert NoteHead.style
    \tuplet 7/4 { fs'16 f e ds d cs c }
    \bar "||"
    \once\override Score.RehearsalMark.self-alignment-X = 0.2
    \once\override Score.RehearsalMark.Y-offset = #-1
    \mark\markup{\left-align{\box{\fontsize #4 A2Bs}}}
    s2.
    %\mark\markup{\left-align{\musicglyph #"scripts.segno"}}

    \bar "||"
    \key e \major
    \set Score.currentBarNumber = #174
    a2(\segno b4) |
    a8 a a4 a | c8 c c4 c | ds8 ds ds4 ds |
    \bar "||"
    s2.*8
    b,4( e) e | e( fs) fs | fs( gs) gs | gs2 \breathe a4 |
    \slurDown b4( a gs | e2. ) | b'4( a gs | e2. ) |
    b'4( a gs | e2. ) | cs'4( b a | fs2.)
    s2.*4
    b,4( e) e | e( fs) fs | fs( gs) gs | gs( as) as |
    ds,8 r ds r fs r | ds r fs r ds r | e4 r r | e4 r r
    \bar "|."
  }
}
ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  \alive
}
Chrds = \chordmode {
  \gotoCtx "chrds-up"
  \repeat volta 2 {
  e2. s
  e:6  | e:7+9 | \repeat percent 2 e:6 |
  \repeat percent 2 e:7+ | e:7+9 | s
  e:6  | e:7+ | \repeat percent 2 e:7
  s4 a2:7+ | b2:sus4.7.9 b4:7 |
  } \alternative {
  { e2. | b:7 | }
  { b:m7 | e:7.13- }}
  \gotoCtx "staff"
  \repeat percent 2 a2.:m7
  \gotoCtx "chrds-up"
  d:7 s
  \gotoCtx "staff" \repeat percent 2 g:7+
  \repeat percent 2 g:6
  \repeat percent 2 fs:m7
  \repeat percent 2 b:7.13-
  \gotoCtx "chrds-up" e:m e:7 | s4 a:m s | b2.:7 \bar "||"

  s2.
  \set Score.repeatCommands = #'((volta "3."))
  \gotoCtx "staff" b2.:7
  \set Score.repeatCommands = #'((volta #f))
  \set Score.currentBarNumber = #67
  e
  bf:7.5- a:7+ d:7.9
  \bar "||"
  s2.*6
  \gotoCtx "chrds-up"
  s4 g2 | s2. |
  g | g/fs | g/f | e:7 | a:m | d:7 |
  % 4/4
  g2:m d2:7 | g1:m |
  g2:m d2:7 | g1:m |
  a:m | d:7 | s2 a:m7 | s2 d:7 | g1:7
  s1*3
  s2 d:7 | s2 g:m |
  g:m d:7 | g1:m | a:m7 | d:7 |
  ef4:7 d:7 s2 |
  s1*2 |
  s4 g:m s e:7/bf
  a2:m e2:7 |a2:m e2:7 |
  a2:m e2:7 | a1:m | b:m7 | e:7 |
  s2 b:m7 | s2 e:7.9- | a1:7
  s1*3
  s2 e:7 | s2 a:m |
  a:m e:7 | a1:m | b:m | e:7 | e4:sus e:7 s2 |
  s1 | e:7 | a:7sus4 | s1*2 | a1:7 | d:sus | d:7
  % 3/4
  \gotoCtx "staff"
  \repeat percent 2 {cs2.:m5-7/g }
  cs2.:m5-7/e  | s2. |
  \gotoCtx "chrds-up"
  a:7.9.11+ s2. |
  d:7.13 |
  b4:m5-7 b:7 s
  s2. |
  s4 a:m e4:7 | a2.:dim7 | fs:dim7 | b:7.9-
  \gotoCtx "staff"
  \repeat percent 2 { e:/b }
  \repeat percent 2 { e:6/b }
  \repeat percent 2 { e:7+/b }
  \repeat percent 2 { e:6 }
  \gotoCtx "chrds-up"
  e2. | e:6 | e:7 |s |
  a | s | a:m | s | e:/gs | s  | fs:7 | s
  \gotoCtx "staff"
  b:sus7 | r | b:sus | b:7 |
  \gotoCtx "chrds-up"
  e | e:/b | e | e:5- | b:7 s | e | s
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
    %\remove Score.Bar_number_engraver
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
