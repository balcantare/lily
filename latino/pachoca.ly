\version "2.19"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "jazzextras.ily"

\language "english"

title = #"Paçoca"
composer = #"Celso Machado, arr Michel Caussanel"
meter = #"Larghetto"
instrument = #"for Pegueri Bandoneon"

#(define-markup-command (arrow layout props) ()
   "Draw an Arrow."
   (interpret-markup layout props
     #{\markup \overlay {
        \override #'(thickness . 3)
        \translate #'( 0 . 1.82)\draw-line #'(-1.5 . 0)
        \translate #'( 1.3 . 1.8)\arrow-head #X #RIGHT ##f
        }
     #}
    ))

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \line{
        #title \hspace #1
        - \hspace #1 \fromproperty #'page:page-number-string
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}


realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
            \override #'(offset . 7)
            \override #'(thickness . 6)
            \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}
\header {
  title = \realBookTitle
  subtitle = #instrument
  tagline = ##f
}

BandR = \relative c'' {
  %\set Score.markFormatter = #format-mark-box-alphabet
  \time 2/4
  s4 s16 c d ds |
  \mark \markup{ \box{\fontsize #4 A}}
  \repeat volta 2 {
    e c a e' d e c' b | e,4 r |
    r16 e a e cs e bf' a | g8. f16 ~ f4 |
    r16 b, d b gs b f' e |
    d8. c16 ~ c4 |
  }
  \alternative {
    { r16 a b c c b a b | a8. gs16 r c d ds | }
    { r16 a b c b a gs b | a8 e a
      \mark \markup{\fontsize #4 fine}
      r | }
  }
  \bar "||" \break
  \mark \markup{ \box{\fontsize #4 B}}
  \repeat unfold 2 {
    b16 c8 cs16 d16 e8 f16 | a g8 e16 a8 g |
    gs,16 a8 as16 b c8 d16 | f16 e8 c16 f8 e |
    \break
  }
  \alternative {
    { r16 d8 e16 f e d c | r16 c d ds e d c bf |
      r16 f'8 f16 f g f e ~ | e16 b8 e16 ~ e8 r | }
    { r16 f d a f'4 | r16 e c a e'4 |
      r16 a, b c b a gs b | a8 e' a16 c,
      \mark \markup{\fontsize #4 {
        \arrow\box{A}\arrow\box{C}
      }}
      d ds

    }
  }
  \bar "||"
  \key a \major
  \mark \markup{ \box{\fontsize #4 C}}
  \repeat volta 2 {
    r16 cs e a gs e fs ds |
    e d fs d e d b gs |
    e' cs8 a16 fs8 e |
    r16 b' d fs e4^\prall
    r16 cs e a gs e fs ds |
    e b8 gs'16 gs fs e a ~ |
    a fs8 e16 ds cs b e |
    r16 ds e fs e d cs b |
    a cs8 e16 fs8 e |
    r16 b8 d16 fs8 e |
    r16 a,8 cs16 fs8 e |
    r16 b8 d16 fs8 e |
    a16 e8 a16 g a8 g16 |
    fs16 d8 fs16 f gs8 f16 |
    e16 b8 cs16 d cs8 b16 |
  }
  \alternative {
    { a8 e a4 } { a8 e' a16 c,
    \mark \markup{\fontsize #4 {
        \arrow\box{A}
      }}
    d ds }
  }
  \bar "|."
}

BandL = {
  s4 s16 r8.
  <<
    \override Fingering.staff-padding = #'()
    \relative c { \voiceOne
      \repeat volta 2 {
        a16  <e'c'>8 <e c'>16 b <d-2 gs-4>8 <d gs>16 |
        c16  <a'-4e'-5>8 <a e'>16 r4                 |
        cs,16 <g'a e'>8 <g a e'>16 r4            |
        d16 <a'f'>8 <a f'>16 r4                  |
        gs,16 <f'b>8 <f b>16 e, <d'-2gs-4>16 fs, gs  |
        a16  <e'c'>8 <e c'>16 g,16 <e'c'>8 <e c'>16 |
      }
      \alternative { {
        fs,16 <a'-4ds-5>8<a ds>16fs,16<a'ds>8<a ds>16 |
        <d,-2 a'-4>8. <d gs>16 ~ <d gs>4 | }
      { fs,16 <a'ds>8<a ds>16e,16 <d'gs>8 <d gs>16 |
        <e-3 c'-2>8 <gs-3 b-2> <e c'> r }
      }
    }
    \relative c \new Voice {\voiceTwo
      \repeat volta 2 {
        a4 b-3             |
        c-2 g'16-4 f e d      |
        cs4-2 a16-2 b cs e   |
        d4-2 d16-3 c b a-2     |
        gs4-3 e8-5 fs16-3 gs-4   |
        a4-2 g-3             | }
      \alternative {
        { fs-2 fs |  e2-5  |}
        { fs4 e | a8-5 e-4 a  r | }
      }
    }
  >> \oneVoice  \repeat unfold 2 {
    \relative c { g16-3 b d g, f-5 b d f,-5 |
      e-4 c'-2 e g f e d c |
      b-4 c b a
    }
    << \relative c { \voiceOne
      gs16 <f'-2b-4>8 <f b>16 |
      a,16<e'c'>8<e c'>16g,16<e' c'>8<e c'>16
      d,16<f'-3a-4>8<f a>16f,<d'-2a'-4>8<d a'>16
      e,16<a'-2c-3>8<a c>16
    }
    \relative c \new Voice {\voiceTwo
      gs4-3 | a g | d-5 f-5 | e-4
    }
    >>
  }
  \alternative { {
    << \relative c { \voiceOne
      c16<e-3a-4>8<e a>16 |
      bf16<a'-4d-5>8<a d>16bf,<a'd>8<a d>16 |
      b,16<f'-2a-4d-5>8<f a d>16<e,-4 gs'-2 b-3> r r8 |
    }
    \relative c \new Voice {\voiceTwo
      c4-2 | bf-2 bf |
      b-3 e,16 f8-5 fs16-2 |
    }
    >>
  } {
    << \relative c { \voiceOne
        r4 |
        fs,16 <a'ds>8<a ds>16e,16 <d'-2gs-4>8 <d gs>16 |
        <e c'>8 <gs b> <e c'> r
      }
      \relative c \new Voice {\voiceTwo
        c16-2 b-3 a-2 g-3 |
        fs4-2 e-5 | a8 e a r
      }
    >>
  } }
  \break
  \key a \major
  << \relative c { \voiceOne
      \repeat unfold 2 {
        a16<e'cs'>8<e cs'>16 <cs b' e>8<c bf' ef> |
        b16<a' d>8<a d>16e,16<gs'b>fs,16gs
      }
      a16<e'cs'>8<e cs'>16b<a'ds>8<a ds>16
      e,16<gs'b>8<gs b>16cs,<es b'>8<es b'>16
      fs,16<cs'a'>8<cs a'>16b<a'ds>8<a ds>16
      <gs b>4 r |
      \repeat unfold 2 {
        a,16<e'cs'>8<e cs'>16 <cs b' e>8<c bf' ef> |
        b16<fs'a d>8<fs a d>16e,16<gs'b>fs,16gs
      }
      a16<e'cs'>8 <e cs'>16g,16<e'cs'>8<e cs'>16
      fs,16<a'd>8<a d>16f,16<a'd>8<a d>16
      e,16<d'a'>8<d a'>16e,16<d'gs>8<d gs>16
      <e cs'>8 <gs b> <e cs'> r
      <e cs'>8 <gs b> <e cs'> r
    }
    \relative c \new Voice {\voiceTwo
      \repeat unfold 2 {
        a4 cs8 c |
        b4 e,8 fs16 gs |
      }
      a4 b | e, cs' | fs, b | e, e16fs8gs16 |
      \repeat unfold 2 {
        a4 cs8 c |
        b4 e,8 fs16 gs |
      }
      a4 g | fs f | e e | a8 e a16 e fs gs |
      a8 e a r
    }
  >>
}
Chords = \chords {
  \set chordChanges = ##t
  s2 |
  \repeat volta 2 {
    a4:m    e:7/b | a2:m/c | a:7/cs | d:m
    e4:9/gs e:7   | a:m a:m/g |
  }
  \alternative {
    { fs2:dim | e4:sus4 e:7 | }
    { fs4:dim e:7 | a8:m e a4:m | }
  }
  \repeat unfold 2 {
    g4 g:7/f  | c2/e | e4 e:9-/gs | a:m a:m/g |
    d:m d:m/f }
  \alternative{
    { a:m/e a:m/c | bf2:maj7 | b4:m7.5- e }
    { a2:m/e | fs4:dim e:7 | a8:m e a4:m }
  } % a dur
  \repeat volta 2 {
    \repeat unfold 2 {a4 cs8:m7 c:m7 | b4:m7 e |}
    a4 b4:7 | e cs:7 | fs:m b:7 | e2 |
  \repeat unfold 2 {a4 cs8:m7 c:m7 | b4:m7 e |}
    a4 a:/g | d:/fs d:m/f | e:sus4.7 e:7 |
  }
  \alternative {
    { a8 e a4 } { a8 e a4 }
  }

%
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