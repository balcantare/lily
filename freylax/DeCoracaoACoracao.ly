\version "2.24.2"
sheetName = "De Coração a Coração"
sheetComposer = "Jacob do Bandolim"
\include "../include/book.ily"


sheetTonality = g
octaveBf = 0

BandR = \relative c'' {
  \key e \minor
  \time 3/4
  \relative c'' {
    s2.
    r8 as8 b b' g e  | c b g e b e |
    as,2. | a2. |
    r8 ds e fs g a |
    as b ds e fs g |
    b2. | a2 r8 c |
    c4. b8 cs, d |
    ds e f fs gs, a |
    as c b ds, e fs |
    g4. a8 as b |
    d4. c8 b c |
    ds4. cs8 bs cs |
    e4.  d8 cs d  |
    f4. ef8 d ef  |
    fs4. e8 d b |
    fs'8 e d b fs' e |
    d as fs' e d as  |
    fs'4. e8 d as  |
    fs'4. e8 d b |
    a'4.  g8 d cs |
    c2. |
    b2. |
    a4. b8 d c  |
    b2 a4 |
    g4. a8 c b |
    a2 g4 |
    fs4.  g8 a as  |
    b4. c8 cs ds |
    e2 b4 |
    e,4 r4 r4 \bar "||" |
    e'4. d8 c e,  |
    f4. fs8 b fs  |
    fs4. g8 b d  |
    f,4. e8 fs gs |
    b8 a d c fs e |
    b'2 a4 |
    a,8 g c b e d |
    a'2 g4 |
    g4.  fs8 ds b |
    as4. a8 g fs |
    fs e a g c b |
    fs'2 e4 |
    d4. es,8 fs d' |
    cs4. ds,8 e cs' |
    b4.  cs,8 d b' |
    a b, c fs e d |
    e'4.  d8 c e, |
    f4.  fs8 b fs |
    fs4.  g8 b d  |
    f,4.  e8 fs gs  |
    b4.  a8 gs a |
    c b as b c b |
    fs'2. |
    e2. |
    a4. g8 ef c |
    a8 g ef c e a,  |
    b c cs d a' af  |
    g a as b fs' f  |
    e4. ds8 e f  |
    fs4. es8 f b  |
    g2 d4 |
    \partial 8 g8
  }
  \bar "|."
}

BandL = {
  \key e \minor
  \relative c'' {
   r8 c8 fs, a ds, fs |
   e2. | d  | cs | f | e
   s2.*2 |
   c''8 b a g fs e |
   ds2. |
   s2.*21
   g,4 b e |
   g8 fs e d c b |
   s2.*7
   g'8 b a g f e  | ds2.
   s2.*5
   b4. b8 c cs |
   e d c a f d | c2.
   s2.*6

   b'8 a g gf f e |
  ef2.
  s2.*6 |
  s8
  }
}
Chords = \chords {
  \set chordChanges = ##t
  \set chordBassOnly = ##t
  s2. |
  e2.:m | e:m/d |
  fs | f |
  e:m | e:m/d |
  \set chordBassOnly = ##f
  a:m/c | a:m |
  b:7/ds | b:7 |
  e:m  | s
  c:7  | cs:7 |
  d:7  | ef:7 |
  g:7+ | s |
  g:m7+ | s
  g:7+  | d:/fs
  d:m/f | e:7
  a:m | b:7
  e:m | e:m/d | fs:7/cs
  b:7/ds | e:m | s
  d:7/fs |
  d:7/a |
  g:/b |
  bf:dim7 |
  a:m7 |
  d:7 |
  g | s
  b:7/ds |
  b:7 |
  e:m |
  fs:7 |
  b:m |
  fs:7 |
  b:m |
  a:m |
  d:7/fs |
  d:7/a |
  g:/b |
  bf:dim7 |
  a:m7 |
  b:7 |
  e:m |
  e:m/b |
  c:m
  c:m6/a |
  g |
  e:m |
  a:m7 |
  d:7 |
  g |

}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Walz}
  }
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 18)
    }    
  \new GrandStaff <<
    \Chords
    \new Staff = "up" {
      \BandR
    }

    \new Staff = "down" {
      %\clef bass
      \BandL
    }
  >>
   
  }
}
