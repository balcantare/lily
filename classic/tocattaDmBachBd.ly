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

sheetName = #"Toccata D dorian BWV538/1"

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
  page-count = #5
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
  %\accidentalStyle modern-voice-cautionary
  \relative c' {
    \key c \major
  r2 d'16 cs d a d a e' a, |
  f' e f d f d <g bf,> d e d e c e c f c |
  d c d b d b e b cs b cs a d a e' a, |
  f' a, e' a, f' a, g' a, a' cs, d bf a d g, cs |
  <a, d f d'>4 r <a d a' d> r
  <<
    \relative c'' { \voiceOne
       cs16-5 b-4 cs a cs a d a e' d e cs e cs f d |
       g f g e g e a e f4
    }
    \relative c' { \new Voice {\voiceTwo
       <e-2 a-3>4 r <e a> r |
       <a cs> r <a d>
    }}
  >>
  \oneVoice
  r8 <d-2 g-3 bf-4> |
  <c-5 g'-3 bf-4>4 r8 <c-4 f a-3>8 <bf-5 f'-3 a-2>4 r8 <bf-5 e-2 g-3> |
  <a-4 e'-2 g-3>4 r8 <a-4 d-2 f-3>8 <a-4 cs-5 g'-2>4 r8 <d f a> |
  <cs e bf'>4 r8 <d f a>8 <e g>4
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
    4 r8 r16 cs-5 <a-3 d-2> d-2 c-3 bf-4 a-3 r16 r8
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

      }}

    >>
    \oneVoice
    <f, a d>8 r r4 r2 |
    d'16 cs d a d a e' a, f' cs d a ~ <a d f>8 8 |
    <g d' f>4 r16 g d' f e b c g ~ <g c e>8 8 |
    <f c' e>4 r16 f c' e d a b f ~ <f b d>8 8 |
    <e b' d>4 r16 e b' d c gs a e r4 |
    a16 gs a e a e b' e, c' b c a c a d a |
    e' d e c e c f c d c d b d b e b |
    c b c a c a d a b a b gs e c' e, gs |
    e a e gs e a e b' c b c d c e, b' d, |
    <a c a'>4 r
    <<
      \relative c'' { \voiceOne
        \autoBeamOff
        e2 ~ | e1 ~ | e2 ~  e8
      }
      \relative c'' { \new Voice {\voiceTwo
        r2 | r2 gs16 fs gs e gs e a e |
        b' a b fs gs b a gs a8
      }}
    >>
    \oneVoice
    \autoBeamOn
    <a' c e> <a d f> <d, f a> |
    <d f g> <f g d'> <e g e'> <c e g> <c e f> <e a c> <d b' d> <b-4 d-2 f-3> |
    <b-4 d e-2>4 r8 <e a c> <e gs d'>4 r8 <e a e'>8 |
    <gs b f'>4 r8 < a c e>8 <e b' d>4 r8 <gs b d> |
    <<
      \relative c'' { \voiceOne
        <b d>4 <a c>8 8 c16 b c a b fs b ~ fs |
        b8 a16 b gs8.\prall a16 a e c8
      }
      \relative c' { \new Voice {\voiceTwo
        gs'16 a b gs s4 a4 s4 |
        gs16 e fs8 e8 d c8 s8
      }}
    >>
    \oneVoice
    r4 |
    c16 b c a e' a, a' e \stemDown f ~ cs d ~ a ~ <a d f>8 r8 \stemNeutral |
    f16 e f d a' d, d' a \stemDown b ~ fs g ~ d ~ <d g b>8 r \stemNeutral |
    b'16 a b g d' g, g' d \stemDown e ~ b c ~ g ~ <g c e>8 r \stemNeutral |
    e16 d e c g' c, c' g \stemDown a-3 ~ e-2 f-4 ~ c-5 ~ <c f a>8 r \stemNeutral |
    a'16 g a f c' f, f' c \stemDown d-5 ~ a-2 b-4 ~ fs-2
    \once\set fingeringOrientations = #'(down)
    < gs-3 b d>4 ~ \stemNeutral |
    8 <e a c>8
    << { \voiceOne s8 b'-5 }
       \new Voice {\voiceTwo e,4-2}
       \new Voice {\voiceTwo s16 a8-3 gs16-4 }
    >>
    \oneVoice
    \stemDown a16-3 ~ e-2 ~ c8-5 ~ <c e a>8 r  \stemNeutral
    r16 e' f g
    <<
      \relative c''' { \voiceOne
       a8 g <d-4 f-5>4 d8 c |
       r16 d e f g8 f <c-4 e-5>4  c8 bf |
       r16 c-4 d-5 ef-4 f8 ef d2-5 ~ |
       d4 c-5 ~ c8 bf a4 |
       g16-4 fs-2 g d g d a' d, bf'2
      }
      \relative c''' { \new Voice { \voiceTwo
       a16-5 d,-3 g-4 cs,-2 r a bf c d-5 g,-3 c-4 fs,-2 |
       <g-2 bf-3>4 g'16 c, f b, r16 g a bf c f, bf e, |
       <f-3 a-2>4  f'16-5 bf, ef-4 a,
       <<
         { bf8-4 s8 \voiceOne bf a }
         \new Voice { \voiceTwo r16 f-3 g-3 a-2 bf-4 e,-2 a-3 d,-2 }
       >>
       \voiceTwo

       g4~-3 g16 fs g a fs8 g4 fs8 |
       d4-3 s4 s2 |
      }}
    >>
    \oneVoice
    a,16 g a d, a' d, bf' d, c'2 |
    bf16 a bf d a g a c bf a bf d a g a c |
    b a b d c b c ef b a b d c b c ef |
    <<
      \relative c'' { \voiceOne
         f1~ | 4 ef~ 16 d ef c d4~ |
         8 c4 b8 }
      \new Voice { \voiceThree
         \tieUp
         b1~ | 16 a b g c2 af4~ |
         8 g f4 \tieNeutral}
      \new Voice { \voiceTwo
         g1~ | 4~ 16 f g ef af4 f~ |
         16 f ef df df8. c16 }
    >>
    \oneVoice
    c'16 b c g ef' g, c g |
    a g a f c' f, a f bf a bf f d' f, bf f |
    g f g ef bf' ef, g ef a g a f c' f, a f |
    bf a bf f d' f, bf f ef' d ef bf g' bf, ef bf |
    f' a, bf c f, bf ef, a <bf, d bf'>4 r8 <c ef a>8 |
    <<
      { \voiceOne bf'16 a bf f bf f c' f, d'2 |
         c16 bf c f, c' f, d' f, ef'2 |
         d16 c d g, d' g, e' g, }
      \relative c'' {\new Voice {\voiceTwo
        d,4 r8 c f16 ef f bf, f' bf, g' bf, |
        a'2 g16 f g c, g' c, a' c, |
        bf'2 }}
    >>
    \oneVoice
    f'16 e f d g e f g |
    cs,2^\trill~ 16 b cs e, b' e, cs' e,
    d'16 cs d f cs b cs e d cs d f cs b cs e |
    c bf c d bf a bf d c bf c d bf a bf d
    << { \voiceOne <a c>1~ | 4 bf~ 16 a bf
         \override LaissezVibrerTieColumn.tie-configuration
     = #`((-4 . ,DOWN))
         g\laissezVibrer a4~ |
         a8 a d4 cs16 b cs a e' a, a' e | }
       \new Voice {
         \voiceThree s1 |
         s4 g,2 s4 | s4 f16 a bf g s2 }
       \relative c' {\new Voice {\voiceTwo
         <d fs>1~ |
         16 e fs d~ d e cs d
         e4~ <e g>16 <d f>16 <e g> <cs e>|
         <d f> <cs e> <d f> <cs e> d4 <e a>8 s8 s4
       }}
  >>
  \oneVoice
  f'16~ cs d~ a~ <a d f>8 r f16 e f d a' d, d' a |
  \stemDown b~ fs \once\tieUp g~ d~ <d g b>8 r
    \stemNeutral b'16 a b g d' g, g' d |
  e~ b c~ g~ <g c e>8 r e16 d e c g' c, c' g |
  \stemDown a~ e \once\tieUp f~ c~ <c f a>8 r
    \stemNeutral a'16 g a f c' f, f' c |
  \stemDown d~ a \once\tieUp bf~ f~ <f bf d>8 r
    \stemNeutral d16 c d bf f' bf, bf' f |
  \stemDown g~ d \once\tieUp e~ b <cs e g>4.
    \stemNeutral <a d f>8
  << { \voiceTwo s8 e' }
     \new Voice {\voiceOne a,4}
     \new Voice {\voiceOne s16 d8 cs16 }
  >>
  \oneVoice
  \stemDown d16~ a~ \stemNeutral <a d>4 r8
  r16 a'16 bf c
  << { \voiceOne d8 c |
       <g bf>4 g8 f r16 g16 a bf c8 bf |
       <f a>4 f8 ef r16 f g a bf8 a |
       <e g>4 r4 r16 e f g a8 g |
       <d f>4 r4 r16 d e f g8 f |
     }
     \relative c'' { \new Voice {\voiceTwo
       d16 g, c fs, |
       r d e f g c, f b, <c e>4 c'16 f, bf e, |
       r16 c d ef f bf, ef a, <bf d>4 bf'16 e, a d, |
       s2 s4 a'16 d, g cs, |
       s2 s4 g'16 cs, f b, |
     }}
  >>
  \oneVoice
  <cs e>4
  r16 a b cs d <cs e> <d f> <b g'> <c a'> <f a> <g b> <e cs'> |
  <f d'> <cs' e> <d f> <b g'> <cs a'> <a f'> <b g'>
  <cs e> <d f> <cs e> <d f> <b g'> <cs a'> <a f'> <b g'> <cs e> |
  << {\voiceOne f16 d e cs d e f cs d e f cs d cs d <cs e> |
      s4 a'16 f g e f8 d s4 |
     }
     \relative c'' {\new Voice {\voiceTwo
      d4 d4 d4 d8 s8  |
      <d f>16 <e g> <f a> <d g> cs8. 16 d cs d a f' a, d a}}
  >>
  \oneVoice
  bf16 a bf g d' g, bf g c bf c g e' g, c g |
  a g a f c' f, a f bf a bf f d' f, bf f |
  g f g e bf' e, g e a g a e cs' a e' b |
  cs b cs a e' cs a' cs, d cs d e cs8.^\prall d16 |
  <a, f' d'>4 r8 <a f' a d> <a e' g cs>4 r8 8 |
  <a d f d'>4 r8 <a d a' d> <bf d g e'>4 r8 <d g~ bf e> |
  << {\voiceOne <g e'>16 cs d e f d e cs d b cs d e cs d b |
      cs a b cs d b cs a <gs b> gs a b <a cs> a b gs |
     }
     \new Voice {\voiceTwo a4 r a2~ | 2 s2 }
  >>
  \oneVoice
  a8 <a, cs'>16 <cs e'> <b d'> <d f'> <cs e'> <e g'>
  <d f'>8 <fs d'>16 <a fs'> <g e'> <bf g'> <a fs'> <c a'> |
  <bf g'> <a fs'> <bf g'> <d, a''> <a' f'> <g e'> <a f'> <c, g''>
  <g' e'> <f d'> <g e'> <bf, f''> <f' d'> <e cs'> <f d'> <a, e''> |
  <e' cs'> <d b'> <e cs'> <a, e''> <f' d'> <e cs'> <f d'> <a, f''>
  <g' cs> <f b> <g cs> <bf, e'> <f' d'> <e cs'> <f d'> <a, f''> |
  << {\voiceOne <a' g'>1~ |
      8 \once\tieDown <d~ fs>16 <d e> <d fs>8 <cs e> d16 cs d a }
     \relative c'{\new Voice {\voiceTwo
      <cs e>1~ | 16 a'8. r16 a8 g16 fs4 }}
  >>
  fs'16 d a' c, |
  bf a bf g d' bf g' bf, a g a fs d' a fs' a, |
  g fs g e cs' g e' g, fs e fs d a' fs d' fs, |
  e d e d' e, d e d' e, d e d' e, d e d' |
  e, d e cs' e, d e cs' e, d e cs' e, d e cs' |
  <d a' d>1^\fermata
  }
}

BandL =  {
  %\accidentalStyle modern-voice-cautionary
  %\override Fingering.staff-padding = #'()
  \relative c' {
    \key c \major
    \override Fingering.direction = #DOWN
    % \set fingeringOrientations = #'(down)
  d16 cs d a d a e' a, f' e f d f d g d |
  a' g a f a f \parenthesize bf f g f g e g e a e
  f e f d f d g d e d e-5 cs-4 a f' a, cs |
  a d a cs a d a-2 e'-3 f e f g f d e-5 a,-4 |
  d,-3 cs-2 d a d a e' a, f' e f d  f d g d |
  a'4
  <<
    \relative c' { \voiceOne
      r8 b cs16 b cs a cs a d a |
      e' d e a, d-5 a-4 cs-5 a\laissezVibrer-4 <a d-5>4 r8 g |
      g4-5 r8 a-5 f4-4 r8 g-3 |
      e4-4 r8 f8-5 e4 r8 a8-5 |
      g4 r8 a bf16-5 a-4 bf-5 g-4 a-5 e-3 a e |
    }
    \relative c { \new Voice {\voiceTwo
      r4 a r |
      a r d16-3 cs-2 d-4 a-3 f'-4 d-3 g-5 d-3 |
      e-4 d-3 e-4 c-2 e c f-4 c-2 d-3 c d b-5 d-2 b-4 e-2 b-4 |
      cs-2 b-5 cs a-3 cs-2 a-3 d-4 a-3 e' d e a,-3 e' a, f'-4 a, |
      g'-5 f-4 g a,-3 g' a, a' a,  cs4-2 r8 cs8-2 |
    }}
  >>
  \oneVoice
  <d,-3 f-4>4 r8 <d-2 f-3> <bf-3 d-2 g-4>4 r8 <b-3 d-2 gs-4>
  <<
    \relative c
    { \voiceOne
      \set tieWaitForNote = ##t
      a'8.-5 gs16 a16 f g-4 ~ e-3 ~ <g e>8 r r16 fs-4 g-5 ~ cs,-2 |
      <d g-5>4 r16 <bf-3 e-4>
      \once\set fingeringOrientations = #'(right up) <a-2 g'-4> g-3
    }
    \relative c {
    \new Voice {\voiceTwo
      <d-2 a-2>4 r8  a8-2 d2_\markup{2-3} ~
      d16-3 a-2 bf-4 g-4 d'8-2 d,-5
    }}
  >>
  \oneVoice
  <d,-5 a'-2 d-2 f-3> r16 r8  g'16 f e |
  f e f d a' f d' a r2 |
  r4 r8 <bf d g> <bf c g'>4 r8 <a c f>8 |
  <a b f'>4 r8 <g b e>8 <g a e'>4 r8 <f a d>8 |
  <g bf d>4 r8 <a cs>8 <bf d e>4 r8 <g d' f>8 |
  <a e'>8 r cs16 b cs a d8 r f,16 e f d |
  bf'8 r gs16 fs gs e a4 ~ a16 g a a,  |
  <<
    \relative c
    { \voiceOne
      d8 r8r4 d'16 cs d a d a e' a, |
      <d, f'>4 r8 <a cs'> <d, d''>4 r16 a'' d f |
      b, a b\tieDown g ~ <g b d>8\tieNeutral 8 <g b c c,>4 r16 g c e |
      a, g a f ~ <f a c>8 8 <f a b b,>4 r16 f b d |
      gs,16 fs gs e ~ <e gs b>8 8
    }
    \relative c {
    \new Voice {\voiceTwo
      d16 cs d a d a e' a, f'4 r8 cs |
      s2 s4 r8 d8 |
      g,4 s2 r8 c |
      f,4 s2 r8 b |
      e,4 s4
    }}
  >>
  \oneVoice
  <a e' a>4 c'16 a e' gs, |
  a e c e a,8 r8 a'16 gs a e a e b' e, |
  c' b c a c a d a b a b g b g c g |
  a g a fs a fs b fs gs fs gs e a e b' e, |
  c' e, b' e, c' e, d' e, e' gs, a b e, a e gs |
  <<
    \relative c
    { \voiceOne
      e4 r4 r2 |
      gs16 fs gs e gs e a e b' a b gs b gs c a |
      d c d b d b e b c b c a c a d a |
      b a b g b g c g a g a f a fs b a |
      gs fs gs e gs e a e b' a b e, b' e, c' e, |
      d' c d e, d' e, e' a, gs fs gs e b' gs
      << {\voiceOne e' b} {\new Voice {\voiceTwo e8}} >>
      \once\set fingeringOrientations = #'(right up)
      <c-4 e-5 ~ >4 e16 d-4 << {\voiceOne e-5 c-4} {\new Voice {\voiceTwo a8-3}}>>
      <d f>4 s4 |
      s4 <e, b'>4 a8.-5 gs16
    }
    \relative c {
    \new Voice {\voiceTwo
      a16 gs a e a e b' e, c' b c a c a d a |
      e'4 r e, r |
      e' r a,8 a' d,4 |
      r8 g8 c,4 r8 f8 b,4 |
      r8 e8 e,4 r8 e'8 e,4 |
      r8 e'8 e,4 r8 e'8 e,4 |
      r8 a'8-3 a,4-2 r8 d-2 d,-4 <ds' fs b>|
      <e c'> <ds a' c> e e, <a-2 e'-3>4
    }}
  >>
  \oneVoice a16 e c e |
  a8 r c16 b c a d8 r8 f16 d a' a, |
  d8 d, f16 e f d g8 r b16 g d' d, |
  g8 g, b'16 a b g c8 r e16 c g' g, |
  c8 c, e16 d e c f8 r a16 f c' c, |
  f8 f, a'16 g a f b,8 d e16 d' e b |
  c16 gs a d, e8 e a8. gs16 a16 e c e |
  <a, a'>8 g' f e d c bf a |
  g' f e d c bf a g |
  f' ef d c bf a g f |
  <<
    \relative c' { \voiceOne
      r16 bf-4 c-5 d-4 ef4-5 r16 a,-5 bf-4 c-5 d-4 bf-3 c-4 a-3 |
      <g,-2 bf'-4>4 r4 d''16 c d g, d' g, e' g, |
      fs'2~ fs16 e fs a, e' a, fs' a, |
      g' fs g d fs e fs d g fs g d fs e fs d |
      f16 ef f g, ef' d ef c f ef f g, ef' d ef c |
      d1~ | 8 8 c4. 8. b16 c d |
      g,4 af8 g
    }
    \relative c { \new Voice {\voiceTwo
      ef4~-2 ef16 d ef c d8-3 g, d'-2 d,-5 |
      s2 g'4 r |
      d r d, r |
      g1 |
      g'~ | 16 f g d g d a' d, b'a b g b g d' f, |
      ef4. ef8 f4. f8 |
      b,8 c f, g
    }}
  >>
  \oneVoice
  <c' g'c ef>4 r8 <ef g c> |
  <f c'>4 r8 <ef f c'> <d f d'>4 r8 <d f bf>8 |
  <ef bf'>4 r8 <ef g bf>8 <ef f c'>4 r8 <ef f c'> |
  <d f bf>4 r8 <d f af> <g bf>4 r8 <g bf g'> |
  << { \voiceOne f'8. ef16 d8 c f,4 r8 f8 }
     \new Voice {\voiceThree bf4. f8 s2 }
     \new Voice {\voiceTwo d8. ef16 f8 f,
                 bf16 a bf f bf f c' f, }
  >>
  \oneVoice <d' f bf>4 r8  <f a>8 <bf, bf'>4 r4 |
  f'4 r c r | g'4 r
  << { \voiceOne a'16 g a f d f e d |
       e d e a, e' a, f' a, g'2 |
       f16 e f a, e' d e g, f' e f a, e' d e g, |
       fs' e fs d g fs g d fs e fs d g  fs g d |
       a1~ | 4 g~ 8 f e4 |
       a4~ 16 f g d a'8
     }
     \relative c {\new Voice {\voiceTwo d8 c bf4 |
       a4 r a r | d,1 | d'~ |
       16 c d a d a e' a, fs' e fs d fs d a'c, |
       bf4. g'8 cs,4. a'8 |
       d,8 f bf,4 a8 }}
  >>
  \oneVoice r8 cs16 b cs a |
  d8 r f16 d a' a, d8 d, f16 e f d |
  g8 r b16 g d' d, g8 g, b'16 a b g |
  c8 r e16 c g' g, c8 c, e16 d e c |
  f8 r a16 f c' c, f8 f, a'16 g a f |
  bf8 r d16 bf f' f, bf8 bf, d16 c d bf |
  e8 g a,16 g' a e f cs a g a8 a |
  d8. cs16 d a f a <d, d'>8 c' bf a |
  g' f e d c bf a g |
  f' ef d c bf a g f |
  << {\voiceOne
       r16 b' cs d e a, d gs, <a cs>4 s4 |
       r16 a bf c d g, c fs, <g bf>4 s4 |
       r16 e f g a f g e f s16 s8 s4 | s1 |
     }
     \relative c {\new Voice {\voiceTwo
       e8 d <cs e'> <b d'> a g f e |
       d' c <bf d'> <a c'> g f e d |
       a'1~ | 1 |

     }}
  >>
  \oneVoice
  d4~ 16 cs d a bf4~ 16 a bf g |
  a8 d, a'4 d, r8 <f' a d> |
  <g d'>4 r8 <f g d'> <e g c>4 r8 8 |
  <f c'>4 r8 <e f c'> <d f d'>4 r8 <d f bf> |
  <cs e bf'>4 r8 <d e bf'> <cs e a>4 r |
  \tieDown
  <g' a e'> r8 8 <f a~ d>8 <d a' f'> <a'~ e'> <a, a' g'>
  \tieNeutral
  d16 cs d a cs a d a e' d e a, d a e' a, |
  f' e f a, e' a, f' a, g' f g a, f' a, g' a, |
  << {\voiceOne s16 e'' f g a f g e f d e f g e f d |
      e cs d e f d e cs  d b cs d e cs d b |
      cs8 }
     \new Voice {\voiceTwo cs4 }
     \new Voice {\voiceTwo \tieDown a1~ | 1~ |
                 a16 \tieNeutral f g e }
  >>
  f d e cs d bf c a bf g a fs |
  g1 | a~ |
  << {\voiceTwo
      16 g a e a e b' e, cs' b cs a cs a e' g, |
      fs8. g16 a4 d,2~ |
      1~ 1~ 1~ 1~ 1~
     }
     \relative c' {\new Voice { \voiceOne
      a1~ | a8~ <a d>4 <a e'>8 a4 r8 <fs a d> |
      <g bf d>4 r8 <e g d'> <fs a d>4 r8 <d a' c>8 |
      <e g bf>4 r8 <cs g' bf> <d a'>4 r8 <d a' c>8 |
      <d g bf>8 r8 8 r8 8 r8 8 r8 |
      8 r8 8 r8 8 r8 8 r8 |
      <d fs a>1\fermata
     }}
  >>
  }
  \bar "|."
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
