\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Incidental"
sheetNr   = #"28"

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
    '(1 2 )) #f))))


BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \override Score.RehearsalMark.self-alignment-X = -1
    \override Score.RehearsalMark.Y-offset = #-1
    \set Score.currentBarNumber = #1
    %\override ParenthesesItem.font-size = #4
    \key d \major
    \bar ".|:"
    \mark "Moderate 4"
    \repeat volta 2 {
    e4 g8 a b4 cs |
    cs8 d a a cs d a4 |
    e4 g8 a b4 cs |
    cs4 d a2 |
    e4 g8 a b4 cs |
    cs8 d a a cs d a4 |
    b4 cs d e |
    } \alternative {
      { fs4 d a2 }
      { fs'4 d a r8 b }
    }
    cs4 a cs e |
    ds b fs2 |
    a4 gs8 fs es fs gs4 |
    r2 r4 cs |
    cs4 a8 a cs cs e e |
    ds4 b fs2 |
    a4 gs8 fs es fs gs4 |
    fs2. fs8 fs |
    fs4 b d8 d fs4 |
    e4 cs cs4. fs,8 |
    fs4 b d8 d fs4 |
    e4 cs cs b8 cs |
    \mark "rubato"
    d4 b8 b cs4 d |
    e4 cs a2 |
    \mark "a tempo"
    b4 a b cs |
    d2. cs4 |
    d1 ~ | d4 r r2 |
    \bar "|."
  }

}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \key d \major
    \repeat unfold 3 {
      \repeat unfold 4 { a,8 <g' b d> }
      \repeat unfold 4 { d <a' b e> }
    }
    \repeat unfold 2 { a,8 <g' b d> a, <g' cs e> }
    \repeat unfold 2 { d <a' b e> a, <a' b e> }
    d, <a' b e> a, <a' b e> d, <a' b e> cs, <b' es>
    \repeat unfold 2 { fs,8 <a' cs>4 8 }
    \repeat unfold 2 { b, <fs' ds'>4 8 }
    \repeat unfold 2 { <gs, fs' bs>4 r <cs es b'> r }
    \repeat unfold 4 { fs,8 <a' cs>8 }
    \repeat unfold 4 { fs, <b' ds> }
    <gs, fs' bs>4 r <cs es b'> r
    fs,4 <b' d e> fs, <as' e'>
    b, <fs' d'> b, <g' d'>
    cs, <b' e> fs, <as' e'>
    b, <fs' d'> b, <g' d'>
    cs, <b' e> <fs, as' e'> r
    <g d' b'>1
    <a e' cs'>
    \repeat unfold 2 { a8 <g' b d> a, <g' cs e> }
    r1 r1 r1
  }
}

Chords = \chords {
  %\set chordChanges = ##t
  \repeat unfold 3 { a1:9.11 | d:6.9 }
  \repeat unfold 2 { a4:9.11 a4:7}
  d1:6.9
  d2.:6.9 cs4:7
  fs1:m
  b
  gs2:7 cs:7
  gs2:7 cs:7
  fs1:m
  b
  gs2:7 cs:7
  cs:m7/fs fs:7
  \repeat unfold 2 {
    b:m b:m6
    cs:m7 fs:7
  }
  g1 a1
  \repeat unfold 2 { a4:9.11 a4:7}



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
  \new GrandStaff <<
    \new Staff = "up" {
      \BandR
    }
    \Chords
    \new Staff = "down" {
      \clef bass
      \BandL
    }
  >>
}

