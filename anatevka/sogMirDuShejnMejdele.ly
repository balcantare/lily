\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Sog mir, du shejn Mejdele"
sheetNr   = #"25"

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
        \hspace #1 - \commitDate
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1  )) #f))))


alive = { s1*10 }

Annotation= {
}
stropheA = {
  \set stanza = #"1. "
  \lyricmode {
    Sog mir, du shejn Mej -- de -- le, her nor,
    du fajn mej -- de -- le
    wi west du gejn in a -- sa   wa -- j -- tn   weg?
    wi west du gejn in a -- sa   wa -- j -- tn   weg?

    Ich wel gejn mit -- n schwer -- n pe -- kl, on a shich un on a
    se -- kl,
    a -- bi mit dir tsu -- sam -- men  sajn,
    a -- bi mit dir tsu -- sam -- men  sajn.
  }
}

stropheB = {
  \set stanza = #"2. "
  \lyricmode {
    Wos west du ton in a -- sa waj -- tn land?
  }
}

Notes = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
   \key f \minor
   c4 f f f | g8 af f2. |
   \bar "||" \break
  <<
   {
   c4 f f f | g8 af f2. |
   c4 f f f | g8 af f2. | \break

   c'2 bf4 af |  c2( f,) |
   af8 8 4 bf8 af bf4 |
   c2. r4 | \break
   c2 bf4 af |
   c2( f,) |
   af8 8 4 bf8 af g4 |
   f2 \breathe af4 bf | \break
   c4 c8 8 4 4 | bf4 g r af8 bf |
   c4 c c c | bf4 g r r8 g | \break
   af4 af bf4. f8 |
   af4 g f r8 g |
   af4 af c4. bf8 |
   af4 g f2 |
   }
   \new Lyrics \lyricsto "voice" \stropheA

  >>
   \bar "||"
   \break
   \once\override Score.RehearsalMark.self-alignment-X = -0.5
    \once\override Score.RehearsalMark.Y-offset = #0
    \mark\markup{\left-align{\box{\fontsize #2 Nachspiel}}}

   af4 bf c4. bf8 |
   af4 bf c c, |
   \time 2/4
   f4 g |
   \time 4/4
   af8 g f c' g4 e |
   f1
   \bar "|."
  }
}
ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  \alive
}
Chrds = \chordmode {
  \gotoCtx "chrds-up"
  f1:m | c2 f:m |
  f1:m | c2 f:m |
  s1 | c2 f:m |
  af2 bf:m | f1:m |
  af2 bf:m | c1 |
  f2:m bf:m | f:m d:dim |
  f:m c:7 | f1:m |
  af | bf4:m ef2. |
  af1 | bf4:m c2. |
  f2:m bf:m |
  c2 f2:m |
  af c |
  df4 c f2:m |
  af2 c2 |
  df c |
  s2 |
  f2:m c |
  f1:m
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
  >>
}
