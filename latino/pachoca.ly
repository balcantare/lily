\version "2.18.2"
\language "english"


BandR = \relative c'' {
  \time 2/4
  s4 s16 c d ds |
  \repeat volta 2 {
    e c a e' d e c' b | e,4 r |
    r16 e a e cs e bf' a | g8. f16 ~ f4 |
    r16 b, d b gs b f' e |
    d8. c16 ~ c4 |
  }
  \alternative {
    { r16 a b c c b a b | a8. gs16 r c d ds | }
    { r16 a b c b a gs b | a8 e a r | }
  }
  \bar "||"
  \repeat unfold 2 {
    b16 c8 cs16 d16 e8 f16 | a g8 e16 a8 g |
    gs,16 a8 as16 b c8 d16 | f16 e8 c16 f8 e |
  }
  \alternative {
    { r16 d8 e16 f e d c | r16 c d ds e d c bf |
      r16 f'8 f16 f g f e ~ | e16 b8 e16 ~ e8 r | }
    { r16 f d a f'4 | r16 e c a e'4 |
      r16 a, b c b a gs b | a8 e' a16 c, d ds }
  }
  \key a \major
  \repeat volta 2 {
    r16 cs e a gs e fs ds |
    e d fs d e d b g |
    e' c8 a16 fs8 e |
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
    { a8 e a4 } { a8 e' a16 c, d ds }
  }
}

BandL = {
  s4 s16 r8.
  <<
    \relative c { \voiceOne
      \repeat volta 2 {
        a16  <e'c'>8 <e c'>16 b <d gs>8 <d gs>16 |
        c16  <a'e'>8 <a e'>16 r4                 |
        cs,16 <g'a e'>8 <g a e'>16 r4            |
        d16 <a'f'>8 <a f'>16 r4                  |
        gs,16 <f'b>8 <f b>16 e, <d'gs>16 fs, gs  |
        a16  <e'c'>8 <e c'>16 g,16 <e'c'>8 <e c'>16 |
      }
      \alternative { {
        fs,16 <a'ds>8<a ds>16fs,16<a'ds>8<a ds>16 |
        <d, b'>8. <d gs>16 ~ <d gs>4 | }
      { fs,16 <a'ds>8<a ds>16e,16 <d'gs>8 <d gs>16 |
        <e c'>8 <gs b> <e c'> r }
      }
    }
    \relative c \new Voice {\voiceTwo
      \repeat volta 2 {
        a4 b             |
        c g'16 f e d      |
        cs4 a16 b cs e   |
        d4 d16 c b a     |
        gs4 e8 fs16 gs   |
        a4 g             | }
      \alternative {
        { fs fs |  e2  |}
        { fs4 e | a8 e a r | }
      }
    }
  >> \oneVoice  \repeat unfold 2 {
    \relative c { g16 b d g, f b d f, |
      e c' e g f e d c |
      b c b a
    }
    << \relative c { \voiceOne
      gs16 <f'b>8 <f b>16 |
      a,16<e'c'>8<e c'>16g,16<e' c'>8<e c'>16
      d,16<f'a>8<f a>16f,<d'a'>8<d a'>16
      e,16<a'c>8<a c>16
    }
    \relative c \new Voice {\voiceTwo
      gs4 | a g | d f | e
    }
    >>
  }
  \alternative { {
    << \relative c { \voiceOne
      c16<e a>8<e a>16 |
      bf16<a'd>8<a d>16bf,<a'd>8<a d>16 |
      b,16<f' a d>8<f a d>16<e, gs' b> r r8 |
    }
    \relative c \new Voice {\voiceTwo
      c4 | bf bf |
      b e,16 f8 fs16 |
    }
    >>
  } {
    << \relative c { \voiceOne
        r4 |
        fs,16 <a'ds>8<a ds>16e,16 <d'gs>8 <d gs>16 |
        <e c'>8 <gs b> <e c'> r
      }
      \relative c \new Voice {\voiceTwo
        c16 b a g |
        fs4 e | a8 e a r
      }
    >>
  } }
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
    g4 g:7/f  | c2./e e4:9-/gs | a:m a:m/g |
    d:m d:m/f }
  \alternative{
    { a:m/e a:m/c | bf2:maj7 | b4:m7.5- e }
    { a2:m/e | fs4:dim e:7 | a8:m e a4:m }
  } % a dur
  \repeat volta 2 {
    a2 | b4:m7 e | a2  | b4:m7 e |
    a4 b4:7 | e cs:7 | fs:m b:7 | e2 |
    a2 | b4:m7 e | a2  | b4:m7 e |
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