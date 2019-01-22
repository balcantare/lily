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

BandL = {}
Chords = \chords {
  \set chordChanges = ##t
  s2 |
  \repeat volta 2 {
    a4:m    e:7/b | a2:m | a:7/cs | d:m
    e4:9/gs e:7   | a:m a:m/g |
  }
  \alternative {
    { fs2:dim | e4:sus4 e:7 | }
    { fs4:dim e:7 | a8:m e a4:m | }
  }
  \repeat unfold 2 {
    g4 g:7/f  | c2./e e4:9-/gs | a:m a:m/c |
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