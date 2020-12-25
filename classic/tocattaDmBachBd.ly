\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
%\include "anatevka.ily"

\include "gitlog.ily"
\paper {
  #(define fonts
    (set-global-fonts
    #:music "lilyjazz"
    #:brace "lilyjazz"
    ;;#:roman "lilyjazz-text"
    #:sans "lilyjazz-chord"
    #:factor (/ staff-height pt 20)
  ))
}

\layout {
  \override Score.Hairpin.thickness = #2
  \override Score.Stem.thickness = #2
  \override Score.TupletBracket.thickness = #2
  \override Score.VoltaBracket.thickness = #2
  \override Score.SystemStartBar.thickness = #4
  \override StaffGroup.SystemStartBracket.padding = #0.25
  \override ChoirStaff.SystemStartBracket.padding = #0.25
  %\override Staff.Tie.thickness = #3
  \override Staff.Tie.line-thickness = #2
  \override Staff.Slur.thickness = #3
  \override Staff.PhrasingSlur.thickness = #3
  \override Staff.BarLine.hair-thickness = #4
  \override Staff.BarLine.thick-thickness = #8
  \override Staff.MultiMeasureRest.hair-thickness = #3
  \override Staff.MultiMeasureRestNumber.font-size = #2
  %\override LyricHyphen.thickness = #3
  %\override LyricExtender.thickness = #3
  \override PianoPedalBracket.thickness = #2
}


\language "english"

sheetName = #"Toccata BWV538/1"

bookTitle = \markup {
  \fontsize #3 \larger \larger
  \line { #sheetName }
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
        #sheetName \hspace #1
        - \hspace #1 \fromproperty #'page:page-number-string
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}


BandR = {
  %\set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \key c \major
  r2 d'16 cs d a d a e' a, |
  f' e f d f d g d e d e c e c f c |
  d c d b d b e b cs b cs a d a e' a, |
  f' a, e' a, f' a, g' a, a' cs, d bf a d g, cs |
  <a, d f d'>4 r <a d a' d> r
  <<
    \relative c'' { \voiceOne
       cs16 b cs a cs a d a e' d e cs e cs f d |
       g f g e g e a e f4
    }
    \relative c' { \new Voice {\voiceTwo
       <e a>4 r <e a> r |
       <a cs> r <d, a' d>
    }}
  >>
  \oneVoice
  r8 <g' bf> |
  4 r8 <f a>8 4 r8 <e g> |
  4 r8 <d f>8 <cs g'>4 r8 <f a> |
  <e bf'>4 r8 <f a>8 <e g>4
  <<
    \relative c' { \voiceOne
      r8 <e g>8 |
      4 r8 f8 f16 e f d g d e d |
      f4
    }
    \relative c' { \new Voice {\voiceTwo
      r8 cs cs16 b cs a d a d a d4 r8 e8 |
      f16 cs d8
    }}
    >>
    \oneVoice
    \set tieWaitForNote = ##t
    r8 <cs e> ~ 16 cs16
    \tieUp d ~ a
    \tieNeutral <bf d>4 ~  |
    4 r8 r16 cs <a d> d c bf a r16 r8
    r2 f'16 e f d a' f d' a |
    f' e f d f d g d e d e c e c f c |
    d c d b d b e b cs b cs a cs a d a |
    e' d e a, e' a, f' a, g' f g a, g' a, a' d, |
    <<
      \relative c'' { \voiceOne
        s2 e16 d e cs s4 f16 e f d e8 <b d  e> <d e> s8 s4
      }

      \relative c'' { \new Voice {\voiceTwo
        cs16 b cs a ~ <a e' g>8 8 <a g'> r8  <a d f>8 8 |
        <g d'>8 r8 r4 bf16 a bf g ~ <g cs e>8 8 |
        <f a d>
      }}

    >>

  }
}

BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \key c \major
  d16 cs d a d a e' a, f' e f d f d g d |
  a' g a f a f <\parenthesize bf bf,> f g f g e g e a e
  f e f d f d g d e d e cs a f' a, cs |
  a d a cs a d a e' f e f g f d e a, |
  d, cs d a d a e' a, f' e f d  f d g d |
  a'4
  <<
    \relative c' { \voiceOne
      r8 b cs16 b cs a cs a d a |
      e' d e a, d a cs a( a4) r8 <g d'> |
      <g c>4 r8 <a c> <f b>4 r8 <g b> |
      <e a>4 r8 <f a>8 <e a>4 r8 <a d>8 |
      <g cs>4 r8 <a d> bf16 a bf g a e a e |
    }
    \relative c { \new Voice {\voiceTwo
      r4 a r |
      a r d16 cs d a f' d g d |
      e d e c e c f c d c d b d b e b |
      cs b cs a cs a d a e' d e a, e' a, f' a, |
      g' f g a, g' a, a' a,  cs4 r8 cs8 |
    }}
  >>
  \oneVoice
  <d, f>4 r8 8 <bf d g>4 r8 <b d gs>
  <<
    \relative c
    { \voiceOne
      \set tieWaitForNote = ##t
      a'8. gs16 a16 f g ~ e ~ <g e>8 r r16 fs g ~ cs, |
      <d g>4 r16 <bf e> <a g'> g
    }
    \relative c {
    \new Voice {\voiceTwo
      <d a>4 r8  a8 d2 ~
      d16 a bf g d'8 d,
    }}
  >>
  \oneVoice
  <d, a' d f> r16 r8  g'16 f e |
  f e f d a' f d' a r2 |
  r4 r8 <bf d g> <bf c g'>4 r8 <a c f>8 |
  <a b f'>4 r8 <g b e>8 <g a e'>4 r8 <f a d>8 |
  <g bf d>4 r8 <a cs>8 <bf d e>4 r8 <g d' f>8 |
  <a e'>8 r cs16 b cs a d8 r f,16 e f d |
  bf'8 r gs16 fs gs e a4 ~ a16 g a a,  |
  }
}

\score {
  \new GrandStaff <<
    \new Staff = "up" {
      \BandR
    }
    \new Staff = "down" {
      \clef bass
      \BandL
    }
  >>
}
