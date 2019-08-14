\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"To Life"
sheetNr   = #"6"

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
  page-count = #2
#(define page-breaking ly:optimal-breaking)
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
    '(1 9 29 31 37 43 61 63 75  142 158 173 181 189 197
       205 209 213 220 228 229 233 237 245 253 257 261
       277 285 293 301 309 316)) #f))))


alive = { s1*72 }

Annotation= {
}
Notes = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \override BreathingSign.text = \markup {
      \musicglyph #"scripts.caesura.curved"
    }
  \relative c'' {
    \time 2/2
    s4 \breathe s4 \breathe s4 \breathe s4 \breathe
    \key c \minor
    \repeat volta 2 {
      \set Score.currentBarNumber = #1
      \set Score.barNumberFormatter = #(sixtuple-bar-number 14 46 79 93 125)
      \once\override Score.RehearsalMark.self-alignment-X = -6 % -1.8
      \once\override Score.RehearsalMark.Y-offset = #0
      \mark\markup{\left-align{\box{\fontsize #4 A}}}
      \override NoteHead.style = #'slash
      \override ParenthesesItem.font-size = #3
      \startParenthesis \parenthesize
      d,2\rest_"5.& 6." f4 f4\rest
      d2\rest f4
      \endParenthesis \parenthesize f4\rest
      \revert NoteHead.style
      s1*4
      r2 << { \voiceTwo c'8-2 cs-3 d-4 e-3 }
         \new Voice {
           \set fingeringOrientations = #'(right)
           \voiceOne <c'-5-\balloonText #'(-1 . -1) \markup {"2."}>8 <bf-4> <af-3> <g-2> } >>
      \oneVoice
      f4 r r2 \break
      s1*5
      \once\override Score.RehearsalMark.self-alignment-X = -1
      \mark \markup{\fontsize #4 {\arrow\box{C}}}
      s1

    }
    r4 c,2 d4 |
    e \override ParenthesesItem.font-size = #5
    \startParenthesis \parenthesize c^"1st only" d
    \endParenthesis \parenthesize e

    %\break
    \set Score.currentBarNumber = #31
    \set Score.barNumberFormatter = #(quadruple-bar-number 8 79 87)
    \once\override Score.RehearsalMark.self-alignment-X = -5
    \mark\markup{\left-align{\box{\fontsize #4 B}}}
    \repeat volta 2 { s1*4
                      \set Score.barNumberFormatter = #(double-bar-number 79) }

    \alternative {
      {
       \once \override Score.VoltaBracket #'extra-offset = #'(0 . -0.5)
       s1*2
       \override Score.BarNumber.X-offset = -2
       \override Fingering.direction = #DOWN
       r4 c-4 d-3 ef-2 | e-3 \startParenthesis
       \parenthesize c-4^"1st only" d-2
       \endParenthesis \parenthesize e-3 }
      { \once \override Score.VoltaBracket #'extra-offset = #'(0 . -0.5)
        \override Score.BarNumber.X-offset = 6
        \set Score.currentBarNumber = #43
        s1*2 }
    }
    r4 g2 a4 | b g a b
    \bar "||"
    \newSpacingSection
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)
    \once\override Score.RehearsalMark.self-alignment-X = -0.2
    \once\override Score.RehearsalMark.Y-offset = #-2
    \mark \markup{\fontsize #4 {\arrow\box{AC}}}
    s1
    \newSpacingSection
    \revert Score.SpacingSpanner.base-shortest-duration

    \bar "||"
   % \break
   \once\override Score.RehearsalMark.self-alignment-X = -4.5
   \once\override Score.RehearsalMark.Y-offset = #-2
    \mark \markup{\fontsize #4 {\box{C}}}
    %\set Score.barNumberFormatter = #robust-bar-number-function
    \override Score.BarNumber.X-offset = -0.1
    \set Score.currentBarNumber = #61
    \override NoteHead.style = #'slash
    b4 b2
    \revert NoteHead.style
    d,4-3 | ef-2 fs-3 g-4 as-2
    \once\override Score.RehearsalMark.self-alignment-X = -1.8
    \once\override Score.RehearsalMark.Y-offset = #-2
    \mark \markup{\fontsize #4 {
        \arrow\box{D}
      }}
    | b-3 d-4 ef-2 g-4
    \break
    %\bar "||"
    \set Score.currentBarNumber = #63
    \set Score.barNumberFormatter = #(double-bar-number 8)
    \repeat volta 2 {
      e2-3 e | f-4 f | e-3 e4-.-4 f-5-. | e-4-. df-3-. c2-2 |
    } \alternative { {
      \once \override Score.VoltaBracket #'extra-offset = #'(0 . -1.5)
      e2 e | f f | e4 \breathe af4-4 g-2 f-4 | e-3 c-2 e-3 f-4 |
    } {  \once \override Score.VoltaBracket #'extra-offset = #'(0 . -1.5)


    \set Score.currentBarNumber = #75
    \set Score.barNumberFormatter = #robust-bar-number-function
    c'2-5 g-2 |}
    } af4-4 g-3 f2-2 | ef2-2 df-3 | c4-2 e-4 df-3 c-2 |
    \set Score.currentBarNumber = #79
    s1
    \once\override NoteHead.style = #'slash
    g4 r4 r2
    \bar "||"
    \newSpacingSection
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)
    \once\override Score.RehearsalMark.self-alignment-X = 0.1
    \once\override Score.RehearsalMark.Y-offset = #0
    \mark \markup{\fontsize #2 {\arrow\box{ABACD}}}
    s1
    \newSpacingSection
    \revert Score.SpacingSpanner.base-shortest-duration

    %\bar "||"
  %  \break
    \once\override Score.RehearsalMark.self-alignment-X = -5.5
    \mark \markup{\fontsize #4 {\box{D}}}
    \repeat volta 2 {
      \set Score.currentBarNumber = #142
      \set Score.barNumberFormatter = #(double-bar-number 8)
      \once\override Score.BarNumber.Y-offset = 1

       c4(_"clarinet" e) e f | \acciaccatura fs8 g2 \acciaccatura fs8 g2
       bf4( af16 bf af8 g4) f |
       e2 e |
       bf'4( af16 bf af8 g4) f |
       e4 f e16( f e8 df4) |
    } \alternative {
      {
        \once \override Score.VoltaBracket #'extra-offset = #'(0 . -3)
        e1( | e1 ) }
      { \once \override Score.VoltaBracket #'extra-offset = #'(0 . -3)
        c4 e2( f4) | g ef d df | }
    } %\break
    \repeat volta 2 {
      \override Score.BarNumber.X-offset = 1.5
      \set Score.currentBarNumber = #158
      r4 c \acciaccatura e8 f4^"cl ad lib" g | af bf c d |
      ef f, fs g | ef c' af g |}
    \alternative { {
      \once \override Score.VoltaBracket #'extra-offset = #'(0 . -2)
      fs ef' d c | b c cs d |
      r4 c2 g4 | bf bf bf bf |
    } {
      \once \override Score.VoltaBracket #'extra-offset = #'(0 . -2)
      fs4  c' bf a |
    } }
     af a bf a | g4 r4 r2 \fermata
    \bar "||"
   \break
    \time 4/4
    \set Score.currentBarNumber = #173
    \set Score.barNumberFormatter = #robust-bar-number-function
    \set fingeringOrientations = #'(right)
    <b,,-3>4(_"bd" <d-2> <f-3> <af-4>)
    g2-3 r |
    c2-4 r |
    fs,-2 a-3 |
    f2-2 f4( af)-3
    g2-2 r |
    c2-3 c-2 |
    r4 g'8-4 fs-2 f-5 d-4 b-3 af-2 |
 %   \break
    \override Score.BarNumber.X-offset = -2
     r2 d,2(-3 | ef-2 g)-3 | af2(-4 c4-2 d)-4 | ef2(-2 d4-4 c)-2 |
    d2(-4 f,-3 | ef-2 g)-4 | f(-3 fs)-2 | r2 <g b d g>4 r4 |
    \time 2/2
    \repeat volta 2 {
      \override Score.BarNumber.X-offset = 0
      g2(-5 af4-4 g)-3 | f2(-2 g4-3 f)-2 | c'2(-2 d4-3 c)-2 |
      r2 <g b d g>4 r4 |
    }
  \break
    \set Score.currentBarNumber = #197
    %\override Fingering.staff-padding = #'()
    %\override Fingering.direction = #UP
    <g'-23>1 ~ \startTrillSpan g1\stopTrillSpan
    <af-23>1\trill |
    <fs-23>2\trill <a-23>\trill
    <g-23>1(\startTrillSpan g1)\stopTrillSpan
    <af-23>2\trill \grace { <g-2>16( <af-3> } <a-2>4)-. r4 r2 g4-^ r4
    %\revert Fingering.staff-padding
    %\mark \markup{\fontsize #4 {\box{6A Dance}}}
      \bar "||"
    << {\voiceOne c1\startTrillSpan ~ | c1\stopTrillSpan |
        r8 c( b c d ef f ef | d) r r4 b,8(\fp\< d f b)\! |
        c1\startTrillSpan ~ | c1\stopTrillSpan |
        r8 c( d c a fs ef c | b4)  }
       \new Voice {
         \override Score.BarNumber.X-offset = -2
         \voiceTwo g'4-2\ff g af-3 g-2 f-3 f g-4 f |
         ef-2 f-4 ef-2 d-4 | g,-2 r <g b d g>2-> |
         g'4-2 g af-3 g-2 f-3 f g-4 f-3 |
         ef-2 f-4 ef-2 d-4 | g,-2

       }
    >>
    \clef bass
    \oneVoice
    cs,,4-2^"bd left" e-3 d-2 |
    \set Score.currentBarNumber = #213
    \set Score.barNumberFormatter = #(double-bar-number 8)

    \repeat volta 2 {
    g,2-3 b-4 | c-2 ef-3 | r4 f2(-3 af4-4-.) |
    g-3 d-2 b-3 af-4 |
    g2-3 b-4 | c-2 ef-3 | r4 fs4(_2 g_3-.) fs_2( | }
    \alternative {
      { \once \override Score.VoltaBracket #'extra-offset = #'(0 . -3)
        \set Score.barNumberFormatter = #robust-bar-number-function
        \set Score.currentBarNumber = #220
        g4_4-.) d-2 b-3 af-4 |}
      { \once \override Score.VoltaBracket #'extra-offset = #'(0 . -3)
        \override Score.BarNumber.X-offset = 0
        \override Score.BarNumber.Y-offset = -2
        \set Score.currentBarNumber = #228
        g'4-.\repeatTie fs,\fermata g\fermata af\fermata
        \breathe}
    }
    \bar "||"
    \key d \minor
    \clef treble
    \time 4/4
    a''4-._"git"^"slow 4" cs-. e4. a8 |
    g8-. f-. e-. d-. f4( d-.) |
    a4-. cs-. e4. a8 |
    g8-. f-. e-. f-. d r r4 |
    cs4-. a-. e'4. a8 |
    g8-. f-. e-. d-. f4( d-.) |
    a4-. cs-. e4. a8 |
    g8-. f-. e-. f-. d r r4 |
    \pageBreak
    \set fingeringOrientations = #'(down)

    <g,-2-\balloonText #'(-1 . -1) \markup {"bd"} d'>4( <bf-3 g'>) <d-4 bf'>4.--( <f-5 d'>8-.) |
    <e-4 c'>8( <d-3 bf'> <c-2 a'> <bf-3 g'> <c-4 a'>4 <a-2 f'>4-.) |
    <g d'>4--( <bf g'>-.) <d bf'>4.--( <f d'>8-.) |
    <e c'>8( <d bf'> <c a'> <bf g'> <a f'>8-.) 8 <af e'>  <g d'> |
    <g d'>4 <a fs'>8( <bf g'>8) 4.->( <bf'-4 d>8) |
    <a-5 c>8-. <g-4 bf>->( <f-3 a> <e-2 g>) <e-2 gs>-. <f-4 a>( <d-3 f> <c-2 e>) |
    <bf-3 d>4-^ <cs-2 e>8( <d-3 f> <e-2 g> <f-3 a> <g-4 bf> <bf-5 d>) |
    <c-5 e>->( <bf-4 d> <a-2 c> <g-4 bf> <f-3 a>-.)
    \break
    << { r8 r4
         \override Score.BarNumber.X-offset = 0
         \override Score.BarNumber.Y-offset = -5

         cs1->^"vl" | a-> | d-> ~ | 2 d4-> r |
         e,2 cs | a' g | r4 f e d | r d e f |
         \override Score.BarNumber.X-offset = -1
         \override Score.BarNumber.Y-offset = -1

         e1 | cs'-^ ~ | 4 cs-^ d-^ r |
         r cs-^ d-^ r |
         \override Score.BarNumber.X-offset = -2
         \override Score.BarNumber.Y-offset = -1

          r <bf d>( <a c> <g bf>) | r <f a>( <g bf> <f a>) |
          r4 <e g>( <d f> <cs e>) |
          r4 a' bf a |
       }
    \new Staff \with {
          \remove "Time_signature_engraver"
        } {
          \clef bass
          \key d \minor
        f,8-3^"bd" e-2 d-3 |
        \time 2/2 \bar "||"
        a'2-5 e-4 | cs-2 a-3 | d4-2 r g,-3 r | d'-2 r g,-3 r |
        cs2-2 a-3 | f'-4 e-3 | d4-2 r e-3 r | f-4 r e-2 d-3 |
        cs2-2 a-3 | g'-4 e-3 ~ | 4 a,-2 d-3 r | r a d r |
        <g, d' bf'>4 r r2 |
        <d' a' f'>4 r r2 |
        <a e' cs'>4 r r2 |
        <d a' f'>4 a bf a |
     }
    >>
  %  \bar "||"
    \key d \major
    \set Score.barNumberFormatter = #(double-bar-number 8)
    \repeat volta 2 {
      \set fingeringOrientations = #'(right)
    <fs''-2-\balloonText #'(-1 . -0.5) \markup {"2."}
    d'-2-\balloonText #'(-1 . 1) \markup {"1."} >4
    <a-3 fs'-4> <d-4 fs-2> <e-3 g-3> |
    \acciaccatura gs8 <fs-2 a-4>2 4 <bf-3 d-2> |
    \acciaccatura {c16 d} <a-2 c-5>4 <g-4 bf-4> <fs-3 a-2> <ef-2 g-3> |
    \acciaccatura gs8 <fs a-4>2 \acciaccatura gs8 <fs a>2 \noBreak|
    <a-5 c-5>4 <g-4 bf-4> <fs-3 a-2> <ef-2 g-4> |
    <d-4 fs-3> <ef-2 g-4> <d-4 fs-3> <c-3 ef-2> | }
    \alternative {
      {
        \once \override Score.VoltaBracket #'extra-offset = #'(0 . 0)
        << {\voiceTwo s4 ef-2 d-3 cs-2 | d1-3 }
       \new Voice {\voiceOne fs1_4 | }
      >> \break}

    %{ <fs, d'>4 <a fs'> <d fs> <e g> |
    \acciaccatura gs8 <fs a>2 4 <bf d> |
    \acciaccatura {c16 d} <a c>4 <g bf> <fs a> <ef g> |
    \acciaccatura gs8 <fs a>2 \acciaccatura gs8 <fs a>2 |
    <a c>4 <g bf> <fs a> <ef g> |
    <d fs> <ef g> <d fs> <c ef> |
    %}
     {\once \override Score.VoltaBracket #'extra-offset = #'(0 . -3)
       a,4-2
    << {\voiceOne a( bf a) | b->( a) c->( a) |}
        %\new Voice {\voiceTwo r4 r d, | r d( ef d) |}
     >> }
    }
    %\bar "||"
    \set Score.barNumberFormatter = #robust-bar-number-function
    \set Score.currentBarNumber = #277
    \key c \major
    \override Fingering.direction = #DOWN
    \repeat volta 2 {
      \override Score.BarNumber.X-offset = 0
      \override Score.BarNumber.Y-offset = -3
      d,4-2 g-3 bf-4 c-2
      << {\voiceOne \tiny r4 bf8( d) d( g) g( af) |
          af2. r4 | r c,8( f) f( af) af( bf) |
          bf2. r4 | r ef,8( gf) gf( bf) bf( c) |
          <d a fs>2. <a fs d>4 ~| 2 <d a fs>4-. r }
         \new Voice
         {\voiceTwo \normalsize d,2-4 <g, bf d>2 |
          \set fingeringOrientations = #'(right)
          <c,-4>4 <f-2> <af-3> <bf-4> | <c-2>2 <f,-2 af-3 c-4>2 |
          <bf,-5>4 <ef-2> <gf-3> <af-4> | <bf-3>2 <ef,-2 gf-3 bf-4>2 |
          \set fingeringOrientations = #'(left)
          <d-3 fs-2 a-4>1 ~ | 2 4-> r }
      >>
    }
    \normalsize
    \key d \major
    \set fingeringOrientations = #'(down)
    <fs-2-\balloonText #'(-1 . -1) \markup {"bd"}
    d'-\balloonText #'(-0.25 . 1) \markup {"vl"}>4
    <a-3 fs'> <d-4 fs> <e-3 g> |
    \acciaccatura gs8 <fs-2 a>2 4 <bf-4 d> |
    \acciaccatura {c16 d } <a-2 c>4 <g-4 bf> <fs-3 a> <ef-2 g> |
    <fs-5 a>2 <ef-2 g>4 <d-5 fs>4 |
    <cs-4 e> <bf-3 d> <a-2 cs> <g-3 bf> |
    <fs-2 a> <g-3 bf> <a-2 cs> <cs-4 e> |
    \override ParenthesesItem.font-size = #-2
    <a-2 \parenthesize d f>2.-> 4-> ~ |
    \set fingeringOrientations = #'(right)
    2 <a-2 d-3 fs-4>2-> |
    \bar "||"
    \key g \major
    << {\voiceOne \tiny
        \ottava #1 \acciaccatura fs''8 g2 \acciaccatura fs8 g2
        fs4 g f ef
        \ottava #0
        \acciaccatura cs8 d2 \acciaccatura cs8 d2
        cs4 d c bf
        \acciaccatura gs8 a2 \acciaccatura gs8 a2
        bf4 a gs a
        d1\startTrillSpan ~ | 1\stopTrillSpan
       }
       \new Voice { \voiceTwo \normalsize
         g,4\fff b b c |
         d2 d4 g | f, ef d c | b2 c4 d | e cs cs d |
         ds4( e2) 4 |
         r fs es fs
         g fs g a
       }
    >>
    \oneVoice
    \bar "||"
    %\mark "Vivo"
    \normalsize
    << {
        bf2 \acciaccatura {c16 bf} a2 |
        \acciaccatura {bf16 a} g2 \acciaccatura {a16 g} fs2 |
        g4 d2. ~ | 4 ef f fs |
        g af g f | ef d cs d |
        ef1 ~ | 8 r c4-> b-> bf->
        a4( f' ef2) |
        d4( cs2 d4)-. |
        g,4( ef'4 df2) |
        c4( b2 c4) |
        r4 af'2->( g4) |
        fs4-. bf2-> <af, d fs bf>4-. |
        \repeat unfold 4 { 4-. 2-> 4-. | }
        <c fs bf>4-^ r r2 | r2 r4 <b d e g>8-^ 8-^ | 4-^ r r2 |
       }
       \new Staff \with {
          \remove "Time_signature_engraver"
        } {
          \clef bass
          \key g \major
          <ef,, df' g>2-> r4 4 ~ |
          2 <d c' fs>2 | <g, d' bf'>2.-> 4-> ~ | 2 <d' c' fs>2 |
          <g, d' b'>2.-> 4-> ~ | 2 2-> |
          <c g' ef'>2.-> 4-> ~ | 8 r c4-2 d-3 e-4 |
          f2.-3 a4-4 ~ | 2 bf2-3 |
          c2.-5 bf4-4 ~ | 2 af4-3 g-2 |
          f2-3 ef-2 | d-3 r4 e4-3 |
          fs4-4 gs-3 bf-4 c-5 |
          d-4 c-2 d-3 e-4 d-3 c-2 bf-4 af-3 |
          fs-2 gs-4 fs-2 e-3
          d-2 r4 r2 | r2 r4  <g, d' b'>8-^ 8-^ | 4-^ r4 r2
        }
    >>
    \bar "|."
  }

}
ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  s1
  \alive
}
Chrds = \chordmode {
  \gotoCtx "staff"
  g4 d:m/a g:/b g:7
  d1:7 | g:7 |
  \repeat percent 2 { c1:m }
  \repeat percent 2 { c1:7 }
  \gotoCtx "chrds-up"
  f2:m c:7/g | f1:m
  \gotoCtx "staff"
  bf1:7 | ef | af:6 |
  df2 \set chordBassOnly = ##t df2:/c
  bf:m bf:m/af g1:7
  \gotoCtx "chrds-up"
  c1:7 | s1 |
  \gotoCtx "staff"
  \repeat percent 2 { f:m }
  \repeat percent 2 { c:m }
  d:7 g:7
  \gotoCtx "chrds-up"
  c:m c:7
  \gotoCtx "staff"
  \repeat percent 2 { d:7 }
  \gotoCtx "chrds-up"
  g:7 s1
  s1
  g:7 s1*2
  c1 | f:m  |  c | s |
  s1 | f:m  |  c | s |
  s | f:m | df | c |
  \gotoCtx "staff" c:m
  s1
  \gotoCtx "chrds-up"
  s1 c | s1*7
  s1 s1 %c1 | c:7 |
  s4 f2.:m | s1 | s4 c2.:m | s1 | d:7 | g:7 | c | c:7 |
  d:7 | s | g:7 |
  \set chordBassOnly = ##t
  g2:7 g:7/b | c:m c:m/ef | f:m f:m/af | a:dim fs:dim | g:7 g:7/b |
  c:m c:m/ef | f:m d:7  | s1
  g2:7 g:7/b | c:m c:m/ef | f:m f:m/af | a:dim fs:dim | g:7 g:7/b |
  c:m c:m/ef | f:m d:7  | s2 g:7
  c1:7 | f:m | fs:dim | s2 g:7
  g2:7 g:7/b | c:m c:m/ef | f:m f:m/af | a:dim fs:dim | g:7 g:7/b |
  c:m c:m/ef | f:m d:7  | s2 g:7
  % dance
  c1:7 | f:m | fs:dim | g2 g:7 |
  c1:7 | f:m | fs:dim | g1 |
  g:7 | c:m | f:m | g:7 | s | c:m | s4 d4:7 g d:7 |
  g1:7 | g4:7 s2. |
  \repeat unfold 4 { a1:7 | d:m | }
  \repeat unfold 4 { g1:m | c2:7 f | }
  \repeat percent 2 a1:7 |\repeat percent 2 { d2:m g:m | }
  \repeat percent 2 a1:7 |\repeat percent 2 d1:m
  \repeat percent 2 a1:7 |\repeat percent 2 { a2:7 d:m | }
  g1:m d:m a:7 d:m |
  \break
   d1:11 s1*5 s1*4
  g1:m s1 | f:m s
  ef:m s |  d s
  d s1*3 | a1 s
  d1:m s2 d2
  g1 s1*3 | a1 s1 d1:7 s1
  ef1:7 | s2 d:7 | g1:m | s2 d2:7 |
  g1 s1 |
  c1:m s2 c2:7 |
  f2 c:m | bf1 | c2:m bf2:m | af1 | f2:m c:m | d:7 d:5-7 |
  s1*4 |
  d4:5-7 s2. s2. g2:6



}


\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override BarNumber.Y-offset = 0
    \override BarNumber.X-offset = 0
    \override NonMusicalPaperColumn.page-break-permission = ##f
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
        \new Voice = "voice" \with {
          \consists "Balloon_engraver"
           \override BalloonTextItem #'annotation-balloon = ##f
        } \Notes
      >>
    \new ChordNames = "chrds-down" \with {
      \consists Percent_repeat_engraver
      \override PercentRepeat.Y-offset = #1
      \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0)
    } \chordmode{\alive}
    \context Voice = "voice" \Annotation
  >>
}
