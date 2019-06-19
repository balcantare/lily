\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Wedding Dance One"
sheetNr   = #"15"

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
    '(1 17 31 33 61 72 86 92 104 109 113 129 145 161)) #f))))

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
  \thema-i e1 \break
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
  \override ParenthesesItem.font-size = #4
  \startParenthesis \parenthesize
  bf,^"geige" d a g | d' f e d | bf' d c bf ~ | bf1 |
  \endParenthesis \parenthesize g'1 | a4^"clarinet" bf b cs |
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
  d2) r2 | r1 | \break
  \relative c'' \repeat volta 2{\thema-iii as8(\f b4.\> ~ b2)\! |}

  \break
  \set Score.currentBarNumber = #86
  \repeat unfold 2
  { a,8( cs,4.) gs'8( b,4.) | fs'8( a,4.) e'8( gs,4.) | }
   \startParenthesis \parenthesize
  b'4( ds c b) | ds8 css ds e fs4->(
  \endParenthesis \parenthesize b,4)
  e8(\f b'4) b8( as b8) c( b) |
  c( b) a g fs4  as8( b) |
  e,8( b'4)-. b8-. as b( c b)-. |
  c( b) a g fs4  as8( b |
  e,4) b'8 b e,8( fs g4) |
  fs4-. ds-. c8-. b-. a-. g-. |
  fs8-. r8 r4^"clar->bd" r2 |
  r1 |

  % b8^\markup{solo quasi cadenza} ds e fs g fs g fs  ~ |
%   fs g fs a c b c b |
%   c b fs g a b ds e | ds1\trill
%   \bar "||"
%   \key c \minor
%   g,4 ef' d8 ef f ef | f ef d c b4 as8( b) |
%   af4 af8 af b( af) g4 |
%   af8 g4 af8 c( d b4) |
%   c,8 c d ef f g af8. b16 |
%   \bar "||"
   b,4(^"bandoneon" as b c)
   \repeat unfold 2 { b4( as b c) } ds'1\trill|
   \bar "||"
   \key c \minor
   <ef, c'>4-> <ef' g>-> <d fs>8 <ef g> <f af> <ef g> |
   <f af> <ef g> <d f> <c ef> <b d>4 <as fs'>8( <b g'>) |
   <ef, c'>4 8 8 <f d'>( <af c>) <g b>4 |
   <ef c'>8 <g b>4 <af c>8 <c ef>8( <d f> <b g'>4) |
   c8 c d ef f\< g af8. b16\!
   \bar "||"
   \time 2/2
   c4-^ <ef,, c'>4 4 4-^ |
   r4 <ef c'>4 4-^ r |
   <ef c'>4-^ 4 4 4-^
   r4 <ef c'>4 4-^ r |
   \break
   \bar "||"
   \key c \major
   c4 e df c | g'2. g4->( |
   g) af g f | e df c2( |
   c4) e df c | g'2. g4(-> |
   g) af g f | e1 ~ |
   e2 <df af'>4-> <c g'>-> |
   \slurDown <g' d'>2.-> 4->( ~ | 4 <af ef'> <g d'> <f c'>
   <e b'>2 <df af'>2) | <c g'>4 <e b'> <df af'> <c g'> |
   <g' d'>2 2 | <g d'>4( <af ef'> <g d'> <f c'> | <e b'>1)
   \bar "||"
   <c c'>4 <e e'> <df df'> <c c'> |
   <g' g'>4 2 4-> | 4 <af af'>
   << {\voiceOne g' f | e df c ef-> | c e-> df c |
      g'2. 4 ~ | 4 af g f-> | e2 r |
      c4 e df c-> | g'4 g2 4 ~ | 4 af g f | e-> df-> c ef-> |
      c e-> df c | g'2. g4-> ~ | 4 af g f-> | e2 r }
      \new Voice {\voiceTwo g,4 af | g g2 g4 ~ | 2 2 |r2. g4 ~ | 4 af g  bf ~ |
      bf g2-> 4 ~ | 2. 4 ~ | 4 2 4 ~ | 4 af g af | g4 g2 g4 ~ | 2 2 ~ |
      4 r2 g4 ~ | g af g bf ~ | 4 g2-> 4->}
   >>
   \oneVoice \slurNeutral
   << {
        \repeat volta 4 {
          \repeat unfold 4 <c, e g>2^^
          <c ef g>2.^^ <c ef a>4^^ ~ | 2 <c ef g>2 |
          \mark "4x"
        }
        r1 r1 g'4 ef' d c |
        <g c ef g>-^ <bf bf'> <a a'> <g c ef g>
        <c ef g>-^ 4 4 4 |
        <ef g d'>4 4 4 4 |
        \tuplet 6/4 { c8( cs d ds e f) }
        \tuplet 6/4 { fs( g gs a as b) }
        <e, g c>4 r <e g c>-^ r
      }
      \new Staff \with { \remove "Time_signature_engraver"}
      { \clef bass \accidentalStyle modern-voice-cautionary
        c,,2-^ bf-^ a-^ g-^ c2.-^ c4 ~ c2 c-^
        c4 ef d c | ef g fs ef | g ef' d c | \repeat unfold 4 <c, c'>
        \repeat unfold 8 <c g' ef'>4
        \repeat unfold 4 { <c g' e'>4 r }
      }
   >>
   \bar "|."
  }
}


alive = { s1*10 }

Annotation= {
  s1\ff^"clarinet" s1*29 |
  s1^\markup{\bold {ad libitum}}
  s1*41 |
  s1^\markup{\bold{solo}}
  s1*11
  s1^\markup{\column{\line {ad libitum}
                     \line \bold{Poco piu mosso}}}
}
Notes = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \clarinet
}
ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  s1*101
  \relative c'' {
   s4 r r g | r2 g4 r | g r r g | r2 g4 r |
   s4 r r g | r2 g4 r |
   \repeat unfold 15 { g r r g | r2 g4 r | }
  }
}
Chrds = \chordmode {
  \gotoCtx "chrds-up"
  s1*96
  c1:m g:7 af2 g:7 af2 g:7 c1:m
  c1:m
  s1*3
  c1
  s1*31
  c1 s1 c2.:m a:dim/c c2:m
  s1*4
  c1:m c1:m9
  c1
}

\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override BarNumber.Y-offset = 0
    \override BarNumber.X-offset = -2
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
        \context Voice = "voice" \Notes
      >>
    \new ChordNames = "chrds-down" \with {
      \consists Percent_repeat_engraver
      \override PercentRepeat.Y-offset = #1
      \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0)
    } \chordmode{\alive}
    \context Voice = "voice" \Annotation
  >>
}
