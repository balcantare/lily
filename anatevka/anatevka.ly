\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Anatevka"
sheetNr   = #"31"

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
    '(1 2 6 10 14 18 34 42 49 55)) #f))))


alive = { s1*10 }

Annotation= {
}
Notes = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
  \time 2/4
  \key f\minor
  \bar ".|:"
  \repeat volta 2 { s4. \tiny c8 }
  \time 4/4
  e f g af bf4 r8 c, |
  e f g af bf4 r8 \override NoteHead.style = #'cross f8 |
  af4 r8 af8 4 r8 8 |
  4 r8 8 4 r |
  \revert NoteHead.style
  \normalsize
  c,2\ppp\< ~ c8\! e(\pp g bf) <bf df>4( <af c>2 <g bf>4 |
  <f af>8) r r4 r2 |
  r2 r4 r8 d |
  d( e fs g a4) r8 d, |
  d( e fs g a4) r4 |
  d,4 d d r |
  d df d r | \break
  \bar "||"
  \key a \minor
  c'4 a8( b c4) r |
  c( a c) r |
  c8 b c b c4 b |
  c b-"poco rall." c b |
  \set Score.barNumberFormatter = #(double-bar-number 8)
  \repeat volta 2 {
  <a c>4-._"Allargando" 4-. 4-. <gs b>-. |
  <a c>4-. 4-. 4-. <gs b>-. |
  \repeat unfold 2 {
  <a c>8-. <gs b>-. <a c>4-. }
  << { <c e>4-. 4-. 4-. <b d>-. |}
    \new Staff = "staff2" \with {
     \remove "Time_signature_engraver"
     \override ChordName.Y-offset = #-1.5
  } {
     \accidentalStyle modern-voice-cautionary
     \relative c {
     \clef bass \key a \minor
     r4 e fs gs
     }
  }
  >>
  r4 <a c>4 4 <gs b> |
  <fs a>( <a c> <gs b> <fs a> |
  } \alternative {
    { <gs b>) r r2 | r1 }
    { <gs b>4\repeatTie e(\p\< gs as\!) |
      b8( d\> b as gs4 e)\! }
  }
  \set Score.barNumberFormatter = #robust-bar-number-function
  \set Score.currentBarNumber = #34
  \clef bass
  <g, a>4 <g bf>2 <g a>4 |
  g4 2 4 |
  r4 <f a> r <g bf> |
  \clef treble
  r4 d'8( e f e f g |
  a2) r2 |  r1 |
  r4 <e gs>8 <fs a> <gs b>4 <e gs> |
  <c' e>4. 8 4( <b d>4) |
  <a c>4_"A Tempo" 4 4 <gs b> |
  <a c>4 4 4 <gs b> |
  \repeat unfold 2 {
  <a c>8( <gs b> <a c>4) }
  <c e>4 4 4 <b d> | \break
  << {
  <a c>4 2( <gs b>4) |
  <fs a>( <a c> <gs b> <fs a>) |
  f8( a b d) f( g16 f e8 b') |
  <c, e a>2_"Allargando" ~ 8 r r4 |
  <c e a>2 ~ 8 r r4 |
  <d, e>1 ~ 1 | r | r2 r4 r\fermata \breathe \bar "||" |
  \break
  <e g>4( <d g>) <d bf'>( <cs g'>) |
  4( <bf d>) 4( <a e'>) |
  r4 <f' a> r <g bf> |
  << { \voiceOne a1 }
     \new Voice {
       \voiceTwo
       r4 d,8( e f e f g )
     }
  >>
  \oneVoice
  <fs a>4( <e a>) 4( <ds a'>) |
  4( <c e>) 4( <b fs'>) |
  <e gs>4 8( <fs a> <gs b>4) e4 |
  gs4. 8 2 |
  <e a>4\fermata r r2
  \bar "|."
  } \new Staff = "staff2" \with {
     \remove "Time_signature_engraver"
     \override ChordName.Y-offset = #-1.5

  } {
     \accidentalStyle modern-voice-cautionary
     \relative c' {
     \clef bass \key a \minor
       <a, e' c'>1
       <b ds a'> |
       <d a' f'>2 <e gs d'> |
       a,4 r a r |
       a r a r |
       gs'1 ~ 1 |
       r1 r2 r4 r\fermata
       cs,4( d2 e4) |
       e4( d2 cs4) |
       d2( cs | d1) |
       ds4( e2 fs4) |
       fs4( e2 ds4) |
       r1 r1 r1
     }
  }
  >>

  }
}
ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  s2 |
  s1*2 s4 r4 r2 r1
  s1*2 s4 r4 r2 r1
  s1*2 s2. r4 s2. r4
  s1 s2. r4 r1 r1
  s1*3 r1
  \alive
}
Chrds = \chordmode {
  \gotoCtx "staff"
  c2:7
  \gotoCtx "chrds-up"
  c1:7 | s1 |
  f4:m s4 s2 | s1 |
  c1:7 | s1 |
  f4:m s4 s2 | s1 |
  d1:7 s1 g4:m d g:m s4
  e:7 e:m5-7 e:7 s |
  a1:m |
  d2.:7 s4 | s1*2
  \repeat percent 2 { a2:m e:7 | }
  a1:m | s1
  a:m | b:7
  e:7 s1 | e:7 s1
  a:7 s1 d2:m a:7.5-
  d1:m | b:7 | s1
  e1. e2:7 |
  \repeat percent 2 { a2:m e:7 | }
  a1:m | a2:m e:7 |
  a1:m b:7 |
  b2:m5-7 e:7 |
  a1:m | s1 | e:7 s1 |
  e a:m
  \repeat percent 2 { a4:7 g:m e:m5-7 a:7 | }
  d2:m a:7.9- |
  d1:m
  b4:7 a:m fs:m5-7 b:7 |
  b:7 a:m fs:m5-7 b:7 |
  e1:7 e2.:5+ e4:7 |
  a4:m



}

\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override BarNumber.Y-offset = 0
    \override BarNumber.X-offset = -0.5
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
