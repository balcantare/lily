\version "2.18.2"
\language "english"

thema-i = {
  \repeat unfold 2 { c4 e d c | g' g g2 | g4 af g f | }
  \alternative{{ e df c2 |}{}}
}
thema-ii-o = {
   \repeat unfold 2 { c4.. g16 c4.. g16 }
    c4 bf a g
}
thema-ii = {
  \repeat unfold 2 \thema-ii-o
  \alternative{ { fs g a4.. g16 | }{fs2 }}
}

thema-ii-i = {
  g16 | \repeat unfold 2 { c4.. g16 c4.. g16 }
  c4 \tuplet 3/2 { bf8( c bf } a4) g |
  fs4 \tuplet 3/2 { ef8( fs es } d4) c
}
thema-iii = {
  b4-. fs'-. es8( fs) g-. fs-. |
  g( fs) e-. d-. cs4-- (es8 fs |
  b,4) b8-. b-. cs( b as4) |
  b8 as4 b8 d( e fs4) |
  b,8-. b-. cs-.\< d-. e8. fs16 g8. a16\! |

}
thema-iv = {
   |

}

clarinet = {
  \relative c'' {
  \thema-i e1
  g1\startTrillSpan ~ \repeat unfold 6 { g1 ~ }
  g2.\stopTrillSpan r8.
  \relative c''{g16 \bar "||" \thema-ii r4 r8. }
  \thema-ii-i
  c,8 ef d2 c4 | ef2 d2 |
  \bar "||"
  \key d \major
  d1 ~ d1
  \transpose c d {
    \relative c' { \thema-i e1 }
    \relative c''{ \thema-i e2. r8. g16 }
    \relative c'''{ \thema-ii r4 r8. g16 \thema-ii-o }
  }
  gs'4 f e d |
  \bar "||"
  \key d \minor
  bf, d a g | d' f e d | bf' d c bf ~ | bf1 |
  g'1 | a4 bf b cs |
  d\fermata\trill
  a32(^\markup{\italic{ad li. cadenza}}_\markup{\italic {(repidly)}}
  f d a f d a f a8)
  gs16( a as b c cs
  \tuplet 6/8 { d32 ds e es fs g}
  \tuplet 6/8 { gs32 a bf b c cs }
  d16 ds e f\startTrillSpan ~ f4  |
  f8\stopTrillSpan\fermata)
  e8( cs bf a bf cs e |
    es_\markup{ritard} fs g gs a\fermata \breathe g a as
  \key d \major
  \set Score.currentBarNumber = #72
  \bar "||"
  d2) r2 | r1 |
  \relative c'' \repeat unfold 2{\thema-iii as8(\f b4.\> ~ b2)\! |}
  \repeat unfold 2
  { a,8( cs,4.) gs'8( b,4.) | fs'8( a,4.) e'8( gs,4.) | }
  b'4( ds c b) | ds8 css ds e fs4->( b,4)
  e8( b'4) b8( as b8) c( b) |
  c( b) a g fs4  as8( b) |
  e,8( b'4)-. b8-. as b( c b)-. |
  c( b) a g fs4  as8( b |
  e,4) b'8 b e,8( fs g4) |
  fs4-. ds-. c8-. b-. a-. g-. |
  fs8-. r8 r4 r2 |
  r1 |
  b8^\markup{solo quasi cadenza} ds e fs g fs g fs  ~ |
  fs g fs a c b c b |
  c b fs g a b ds e | ds1\trill
  \bar "||"
  \key c \minor
  g,4 ef' d8 ef f ef | f ef d c b4 as8( b) |
  af4 af8 af b( af) g4 |
  af8 g4 af8 c( d b4) |
  c,8 c d ef f g af8. b16 |
  \bar "||"
  }
}

Annotation = {
  s1\ff s1*29 |
  s1^\markup{\bold {ad libitum}}
  s1*41 |
  s1^\markup{\bold{solo}}
  s1*11
  s1^\markup{\bold{Poco piu mosso}}
}
Chords = \chords {
  \set chordChanges = ##t
}

\score {
<<
  \new Staff {
    \context Voice = "A" {
      \clarinet
    }
  }
  \context Voice = "A" \Annotation
  \Chords

>>
}