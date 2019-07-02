\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Chavale"
sheetNr   = #"30"

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
    '(1 4 6 14 22 26 32 36 45 46 48 53 58 66 )) #f))))


alive = { s1*10 }

Annotation= {
}
Notes = \relative c' {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \key f \major
  \time 4/4
  << { \voiceOne c'8(-> b8 ~ b2.) }
     \new Voice { \voiceTwo <bf, ef g>1 }
  >>
  \time 3/4
  \oneVoice
  s4 s2
  s2.
  \bar "||"
  %\repeat volta 2 {
  s4 s2 s2 s8 \tiny f'16 g |
  a2 r8 a16 bf |
  c bf a8 ~ 2 |
  bf16 a g bf a a bf a g bf a8 |
  r4 bf16 a g bf a8 f |
  c2 r4 | %\normalsize
  ef8-> ef16 ef ef8-> ef16 f ef d c8 ~ |
  c8. ef16-> ef8 ef16 f ef d  c8 |
  ef16-> d c8 r4 ef16 d c8 |
  r2. |r4 r4 r8 f16 g |
  a2 r8 a16 bf |
  c bf a8 ~ 2 |
  bf16 a g bf a a bf a g bf a8 |
  r4 bf16 a g bf a8 f |
  c2 r4 |
  \normalsize
  r2.
  ef8-> ef16 ef ef8-> ef16 f ef d c8 ~ |
  c8. ef16-> ef8 ef16 f ef d  c8 |
  ef16-> d c8 r4 ef16 d c8 |
  << { \voiceOne s2 r8 \tiny f'16 g |
  a2 r8 a16 bf |
  c bf a8 ~ 2 |
  bf16 a g bf a a bf a g bf a8 ~ |
  4 bf16 a g bf a8 f |
  c2. ~ 2. }
    \new Voice { \voiceTwo
    r4 ef16-> d c8 ~ 4 s2.*4
    \repeat unfold 2 {\tuplet 3/2 {c8 a f} \tuplet 3/2 {bf g e} \tuplet 3/2 {a f d} }}
  >>
  \oneVoice \normalsize
  ef8-> ef16 ef ef8-> ef16 f ef d c8 ~ |
  c8. ef16-> ef8 ef16 f ef d  c8 |
  ef16-> d c8 ~ c4 ef16 d c8 ~ |
  c4 ef16 d c8 ~ \tuplet 3/2 {c8 ef8 f8 }
  \break
  \bar "||"
  \key ef \major
  g'2 ~ g8 g16 af |
  bf af g8 ~ g2 |
  af16->( g f af g8) af16->( g f af g8 ~ |
  4) af16->( g f af g8 ef | bf2. ~ 2.) |
  df8( df16 df df8 16 ef df c bf8 ~ |
  8[) r16 df]( 8 16 ef df c bf8) |
  df16( c bf8 ~ bf4) df16( c bf8 ~ |
  \bar "||"
\time 4/4
  bf4) df16( c bf8 ~ bf4)\fermata \tuplet 8/4 { ef,16 fs g bf df ef fs g }
  \bar "||"
  \key c \major
  << {\voiceOne a1\fermata | a1\fermata \breathe }
     \new Voice {\voiceTwo e8 ds ~ ds2.\fermata | e8 ds ~ 2.\fermata }
  >>
  \break
  \bar "||"
  \mark "Bd In 3"
  %\time 4/4
  \repeat unfold 4 { c4--( e-. df-.) }
  c4--( e-- df-- c--)
  \bar "||"
  \time 2/4
  \set Score.currentBarNumber = 53
  r4 c8 e | df4 c |
  r4 c8 e | df4 c ~ |
  c4 ~ 8 r |
  \break
  \bar "||"
  \time 4/4
  r4 c8 e  df4 c |
  e df c->( e8-.) r |
  r2 r8 df8-> 8-> 8-> |
  c8-> df16 c b8 c g df'8-> df-> df-> |
  c8-> df16 c b8 c e f-> f-> f-> |
  e8 f16 e ds8 e g af-> af-> af-> |
  g8 af16 g fs8 g af8->( g) bf->( a) |
  c2-^ \glissando c,,8-^ r8 r4
  \bar "|."

 %}
}
ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  \alive
}
Chrds = \chordmode {
  \gotoCtx "chrds-up"
  bf1
  \gotoCtx "staff"
  \repeat percent 2 { f4 f:sus2 f}
  \gotoCtx "chrds-up"
  \repeat percent 4 { f4 f:sus2 f}
  f2 bf4/f
  f4 bf/f f
  \repeat percent 8 { f4 f:sus2 f}
  f2 bf4/f
  f4 bf/f f
  \repeat percent 8 { f4 f:sus2 f}
  f2 bf4/f
  f4 bf/f f
  \repeat percent 6 { f4 f:sus2 f}
  \repeat percent 2 { ef2. }
  ef2 f4:m/ef
  f2:m/ef ef4 |
  \repeat percent 5 { ef2. } |
  s1*3
  \repeat percent 4 { c2 c:/g }
  c2 g:m5-7
  c2 g:m5-7
  c2
  \repeat percent 7 { c2 g:m5-7 }
  c1
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
