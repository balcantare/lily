\version "2.22.2"
fileName = "ForSephora.ly"
sheetName = "For Sephora"
\include "../include/book.ily"

strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle modern
  \time 4/4
  \key e \minor
   \mark \markup{ \box{\fontsize #2 In/Out}}
    \bar ".|:"
  \repeat volta 2 {
    e4-. e4~ e8 e8 r8 ds8~ |
    ds8 ds8 r8 ds8~ ds4 4-.|
    d4-. d4~ d8[ d8] r8 cs8~ |
  } \alternative {
    {cs8 8 r8 8~ 4 4-.}
    {r2 r8 b8 e8 g8 }
  } \break
  \repeat volta 2 {
    \mark \markup{ \box{\fontsize #2 A}}
    fs2~ 8 e b g
    fs2~ 8 e ds e
    b'2~ 8 a gs a~
    a4. a8 b c e fs
    ds4. a8 ds fs c' c~
    c4. ds,8 fs a c d
    b2. d16 c b a |
    fs8 ds c b a b e g
    \break
    \bar "||"
    fs2~ 8 e b g
    fs2~ 8 e ds e
    b'2~ 8 a gs a~
    a4. a8 b c e fs
    ds4. a8 ds fs c' c~
    c4. ds,8 fs a c d
    b2. d16 c b a |
    gs4. b8 c b g e
    \bar "||" \break
    \mark \markup{ \box{\fontsize #2 B}}
    d16 e d8 b8 c~ 2 |
    r4. a'8 b a fs d |
    b16 c b8 a b~ 2 |
    r4. g'8 a g fs e |
    \tuplet 3/2 {<e g>4 4 4}
    \tuplet 3/2 {<e g>4 <ds fs>4 <d f>4} |
    <ds fs>4. 8 \tuplet 3/2 {4 <e g>4 <fs a>4} |
    <g b>2 r4 d'16 c b a |
    gs4. b8 c b g e |

    \bar "||" \break
    d16 e d8 b8 c~ 2 |
    r4. a'8 b a fs d |
    b16 c b8 a b~ 2 |
    r4. g'8 a g fs e |
    g2~ g8 fs d' df |
    c8 b a g fs e ds e |
    <c a'>8 8 8 8 8 <b g'>8 <a fs'> <b g'>~ |
    2 r
  }
%\bar "|."
}

stropheBass = \relative c {
  %\voiceOne
  \clef bass
  \accidentalStyle modern
  \key e \minor
  e4. b8~ 4 e |
  ds4. b8~ 4 ds |
  d4. b8~ 4 d |
  cs4. e8~ 4 cs |
  cs4. e8~ 4 cs |

  e4. b8~ 4 e |
  b4. e8~ 4 b |
  a4. e'8~ 4 a, |
  e'4. a,8~ 4 e' |
  b4. fs'8~ 4 b, |
  fs'4. b,8~ 4 fs' |
  e4. b8~ 4 e |
  b4. fs'8~ 4 b, |

  e4. b8~ 4 e |
  b4. e8~ 4 b |
  a4. e'8~ 4 a, |
  e'4. a,8~ 4 e' |
  b4. fs'8~ 4 b, |
  fs'4. b,8~ 4 fs' |
  e4. b8~ 4 e |
  e4. gs8~ 4 e |

  a,4. e'8~ 4 a, |
  d4. a8~ 4 d |
  g,4. d'8~ 4 b |
  c4. c8~ 4 e |
  fs4. c8~ 4 4 |
  b4. b8~ 4 fs' |
  e4. 8~ 4 b |
  e4. b8~ 4 gs' |

  a4. e8~ 4 a |
  d,4. a'8~ 4 d, |
  g4. d8~ 4 g |
  c,4. g'8~ 4 c, |
  fs4. c8~ 4 fs |
  b,4. fs'8~ 4 b, |
  e4. 8~ 4 b |
  b4. 8~ 4 4 |

}

chrdStrophe = \chordmode {
 e1:m | e1:m7+ | e1:m7 |
 a1:7 | a1:7 |
 e:m s a:m s
 b:7 s e:m b:7
 e:m s a:m s
 b:7 s e:m e:7
 a:m7 d:7 g c
 fs:m5-7 b:7 e:m e:7
 a:m7 d:7 g c
 fs:m5-7 b:7 e:m b:7
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.35))
    ragged-last-bottom = ##f
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    %\new Staff <<
    %  \new Voice = "Bass" { \stropheBass}
    %>>
    >>
  }
}
