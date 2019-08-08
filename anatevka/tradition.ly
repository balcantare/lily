\version "2.19"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Tradition"
sheetNr   = #"1"

bookTitle = \markup {
  \fontsize #3 \larger \larger
  \line { \box{ #sheetNr } #sheetName }
}

\header { title = \bookTitle tagline = ##f }

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  page-count = #3
  between-system-space = 0.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
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
    '(1 10 18 26 33 36 44 52 60 64 72 80 91 99
       101 109 118 128 132 145 153 161 167 173
       181 189 193 201 209 217 225 233 )) #f))))


ViolinMotiv = {
         g4 | c g g g | g2. g4 | f f e f   | g2. g4 |
              c g g g | g2. g4 | f f ef df
}
ViolinMotivi = {
         g4 | c g g g   | g4 r r g |
              f f e f   | g4 r r g |
              c g g g   | g2  g4 g |
              f f ef df | c
}


FluteMotive = { c4 c8 d e4 f | g8 fs g af g4 e | f8 e f g f4 df }
FluteMotivei = { c4 c8 d e4 f | g8 fs g af g4. e8 | f8 e f g f4 df }
FluteMotiveii = { c4 c8 d e4. f8 | g8 fs g af g4. e8 | f8 e f g f4 df }

FluteMotiveI = { e8 ds e f e4 g | c g g g | g2. df4 | f f ef df  }

Violin = {
  \relative c''' {\ViolinMotiv c1 }
  \relative c'' {\FluteMotive e8 ds e f e2}
  \relative c'' {\FluteMotive }
  \relative c'' {c1 | c4 r g' r | c r g r | df' r af r | }
  \relative c'' {\FluteMotiveI}
  \repeat volta 2 {\relative c'' { f f4 ef df }}
}

Flute = {
  s4
  \relative c' {\FluteMotive e8 ds e f e2}
  \relative c' {\FluteMotive e8 ds e f e4 g}
  \relative c' {
    c1 | e | af | g2. df4
    c1 | e | af }
  \relative c' {\FluteMotiveI}
  \relative c' { c1 | c'4 r g r | c r g r | df' r af r }
  \relative c''{df4\staccato r af\staccato r }
}

adLibRep = \markup{\center-align \italic{ ad lib. repeat}}

Annotation = {
  s2. s4\mf^"Violine"
  s1*7 | s1_"Flöte"
  s1\mf | s1*3 | s1\p
  s1*18
  s1\p_\markup{\halign # -2 \line\italic{ad lib rep}}
  ^\markup{\halign # 0 \line{ ... keep our balance? } }
  s1_\markup{\halign # -1 \line\italic{ ad lib rep}}
  ^\markup {\halign #-0.5 \column{\line{.. mit einem}
                                  \line{Wort gesagt:}}}
  s1\f^\markup{\halign # -0.5 Tradition}
  s1^\markup{\halign # -2 \italic Refrain}
  s1*4
  s1^\markup{\halign # -2 \italic Thema}
  s4 s2. s1*6
  s1^\markup{\italic bd begl weg} s1*5
  % page 4
  s1_\markup{ \halign #-0.5 \italic\line{ad lib. bd/vl}}
    ^\markup{ \halign #0 \line{ von ihm erwartet}}
  %\dynamicUp
  s2\f | s1*2
  % key d
  s4\p s2.^\markup{\italic {voc. Papas}} | s1*3
  s2 s2^"Der Papa ..."
  s1*10
  s4\p s2.^\markup{\italic {voc. Mamas}} | s1*3
  s4 s4^"lesen kann" s2 | s2. s4^\markup{\halign #0 \line{Die Mama ...}}
  s1*8
  s1^\markup{\italic {bd begl weg}} s1
  s1^\markup{\italic {voc. Söhne}}
  s1*7
  s4.^\markup{\italic {bd begl spielen}}
  s8\f s4 s4 |
  s1^\markup\halign #-0.5 \line{Die Söhne ...}
  s1*6 s2
  s1^\markup\halign #-1.5 \italic\line{bd begl weg}
  s1
  s1^\markup{\right-align\italic {voc. Töchter}}
  s1*7
  s1^\markup\halign #-1.5 \italic\line{bd begl sp}
  s1^\markup\halign #-1 \line{Die Töchter ...}
  s1^\markup\halign #-3 \italic\line{8va}
  s1*3 s1^\markup\halign #-3 \italic\line{8va}
  s1 s2 s1^\markup\halign #-5 \italic\line{Chor}
  s1*7 s1^\markup\halign #-2.8 \italic\line{Ref}
  s1*7 s1\pp
  s1*5 s1_\markup{\italic (vamp till cue)}
  ^\markup\halign #-1.3 \column{\line{Aussicht}
                                \line{fantastisches Paar}}
  s1*4 s1^\markup{...der Bettler}
  s1_\markup{\italic (vamp till cue)}
  ^\markup\halign #-1.3 \column{\line{hattest}
                                \line{darunter leiden?}}
  s1

  s1^\markup{...geliebter Rabbi}
  s1*3 s1_\markup{\italic (vamp till cue)}
  ^\markup\halign #-1.5 \column{\line{Zaren}
                                \line{vom Leib!}}
  s1\ff
  s2\f s2 ^\markup{daidaidai} s1*3
  s1\mf s1*3
  s2^\markup\halign #-3 \italic\line{8va}  s2\ppp
  s1*6 s1
  s1\mf s1*4 s1*14
  s2\pp_\markup{\center-align\italic (vamp till cue)}
  s2^\markup\halign #0.5 \line{Esel, Esel}
  s1*2
  s4_"Pferd - Esel" s2. s1*2 s1^\markup{\italic unisono}
}

CMotiveI = { g8( c4.) | e2 r4 \once\slurDown e( | f1 }
MotiveII = { \repeat percent 3 { c4 c8 e df4 c }
             f8-. e-. f-. g-. e2 }
MotiveIII = { \repeat percent 3
              { r4 g8-. bf8-. af4-. g-. }
              af8-. g-. af-. bf-. g4.--}
CMotiveIV = { r4 c8(-3 e)-2 df4(-4 c4)-3 }
CMotiveIii = \relative c' {
  \override Fingering.staff-padding = #'()
  <d-3 a'-4>2\< | <d a'>2->\fp\> r4\! <d a'>4\<( |
  <ef-2 bf'-5>1\><d a' >4\!) r4 r <a' >8->-.\f r |
  <d >8->-. r r4\mf <fs, a>8( <fs d'>4.)\< |
  <fs d'>2\fp\> r4\! \once\slurDown\stemDown<fs d'>4(\< <g ef'>1\> | <fs d'>4)-.\!
}
CMotiveV = {
  \dynamicDown
  r8 e8\mp e a\< a cs\! | cs4-> r r
  \slurUp cs(| d1)
  \rs r4 r4 \rs
  r4
  r8 a a cs\< cs e | e4->\! r r
  e,4--( | f1)
  \rs r4 r8\ff a a c
}
bddf = { <df-3 ef-4>4 ~ <df ef>8 <cf-2 df-3>( <df ef>)-. r8 }

Pause = { s1 s1*16 s1*16 }

Notes = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  s2 s4
  \relative c''' {\ViolinMotiv c2. }
  <<
    \new Voice = "violin" { \voiceOne \Violin}
    \new Voice = "flute" { \voiceTwo \Flute  }
  >>
  s1 | s1 |
  \relative c'' {
    \repeat volta 2 {r2 \CMotiveI }
    \alternative{ {e8) r8 r4 r2 }
                  {e8 r8 r4 r4 \rs }
    }
  }
  \set Score.currentBarNumber = #44
  \relative c'' \MotiveII
  \relative c'' \MotiveIII r8
  \repeat volta 2 {
      \repeat percent 3 { s1 | \relative c' \CMotiveIV }
  }
  \break
  \set Score.currentBarNumber = #60
  s1

  \time 2/4
  \relative c''{
    \repeat unfold 2 { r8 c-> c-> cs->  d4-> d->}
    r8 a' g ef
  }
  %\bar "||"
  \key d \major
  \rs \rs r4 \rs |
  s1*3
  s4  r4 r2
  \set Score.currentBarNumber = #72
  r2 \relative c''{ \CMotiveIii r4 r8 d8 c bf }
  \bar "||"
  \key a \major
  s1*2
  s1*4
  \repeat unfold 2 {s4 \rs r4 s4}
  \bar "||"
  \break
  \set Score.currentBarNumber = #91
  \relative c'{ r4 \CMotiveV }
  \break
  \bar "||"
  \key df \major
  s1\mf s1
  s1*3 \rs \relative c''{\bddf}
  s1*2
  \relative c'' {\rs \repeat unfold 2 {<b e>4->} \rs}
  s1
  \break
 \relative c''{
   r4 r8 af8-> \slurDown af->( df4) af8-> |
   \slurUp af->( df) r4 r f8-4->( ef)-2 |
   ef(-4 d)-3 d(-4 cs)-3 cs(-4 b-3 a-2 b-4 | af-3)
   r8 r4 r4 \rs |
   \rs r8 af8-2-> af->( f'4)-5 af,8-> | af->( f') r4 r bf8-5->( af)-4 |
   af(-4 gf)-3 gf(-4 ef)-3 ef( d) d(-3 ef-2| f8)-4-. r r4 r8 df df d |
   \time 2/4 ef8 df df e |
   \bar "||"
   \time 2/2
   \key b \major
   \override NoteHead.style = #'slash
   \repeat percent 2 {gs,4 ds'8 ds gs, ds' ds4}
   \revert NoteHead.style
   s1
   \relative c''' {
    r8 b16(-3 c-4 b8)-3-. a-2-. \grace {b16( c16} b8-.) r8 r4 |  r1 |
    r8 b16(-3 c-4 b8)-3-. d-2-. \grace {b16( c16} b8-.) r8 r4 |
   }
   s1*3
   s4 r4 r2
   \bar "||"
   r4 ds,8-. fs-. b4-. fs8-. b-. |
   ds4-. r4 r2
   r4 c8-5 df-4 e16(-3 df-4 c-5 b-4 af-3 g-2 f-4 e-3| ds8)-2
   r8 r4 r4 \rs |
  \set Score.currentBarNumber = #131
   \rs fs8-2-. b-3-.  ds4-5-. fs,8 b-. |
  \set Score.currentBarNumber = #131
   ds4-. r4 r2 |
   \set Score.currentBarNumber = #131
   r8 e,16(-2 fs-3 g-4 fs e fs g\<-2 as-3 b-4 as-3 g-2 as-3 b-4 c-5\! |
   \set Score.currentBarNumber = #131
   ds8-3)
   r8 r4 r8 b8->\ff as-> b->
   \time 2/4
   \set Score.currentBarNumber = #131
   c8-> b-> c-> df-> \bar "||"
   \key c \major \time 2/2
   \rs r4 r2 | r1 r1 |
   r2 r8 e, f fs |
   g4 r4 r2 | r1 r1 r1 |
   \bar "||"
   r1
   \set Score.currentBarNumber = #145
   r1
   r4 r8 f f af d f |
   e4 r4 r4 g |
   c g r g | c g r g |
   f8 f fs f af af fs f |
   e4 r4 r4 g|
   \bar "||"
   \set Score.currentBarNumber = #153
   \repeat unfold 2 {c,8_3-. g_2-. c_3-. g'_5-. df_3-. g-. c,-. g-. }
   g'_4-. c_5-. g-. c,_2-. af_3-. c_4-. g_3-. c,_4-.
   af'2(_3 g4)_2 r |
   c8-. g-. c-. g'-. df-. g-. c,-. g-. |
   f-. e-. f-. g-. e-. r r4 |
   \repeat volta 2 {
     \override NoteHead.style = #'slash
     g4 d'8 d r4 g,
     \revert NoteHead.style
   }
   r4 \override NoteHead.font-size = #-2
      g'16 f ef df c8
   \revert NoteHead.font-size
   bf_>[ bf_> b_>] |
   \break
   \set Score.currentBarNumber = #161
   s1*4
   \repeat volta 2 {
     \override NoteHead.style = #'slash
     d8 d d4 r2
     \revert NoteHead.style
   }
   r4 \override NoteHead.font-size = #-2
      g16 f ef df c8
   \revert NoteHead.font-size
   \override NoteHead.style = #'slash
   b8[ b b] |
   \revert NoteHead.style
   \set Score.currentBarNumber = #167
   s1*4
   \repeat volta 2 {
     \override NoteHead.style = #'slash
     g4 r d'8 d g,4
     \revert NoteHead.style
   }
   r4 \override NoteHead.font-size = #-2
   g'16 f ef df c8
   \revert NoteHead.font-size
   bf8[ bf b] |
   \set Score.currentBarNumber = #173
  s1*2
  r4 g af g | f8 e f g e g e g |
  s1*2
  r4 g af g | f8( e f g) e2 |
  \bar "||"
  \key f \major
  \set Score.currentBarNumber = #181
  \repeat percent 7 { f'1( } f1)
  \repeat percent 3 { f1( } f1)
  \key c \major
  f4-. 8-. g-. a4-. bf-. | r1 |
  c8-. b-. c-. df-. c4-. a-. | r1
  bf8-. a-. bf-. c-. bf4-. gf-. | r1
  a8-. gs-. a-. bf-. a4-. r | r1
  f,4-. 8-. g-. a4-. bf-. | r1 |
  c8-. b-. c-. df-. c4-. a-. | r1
  bf8-. a-. bf-. c-. bf4-. gf-. | r1
  a8-. gs-. a-. bf-. a4-. r |
  s1
  \set Score.currentBarNumber = #209
  \repeat volta 2 {
    <<
    {\voiceOne\override NoteHead.font-size = #-2 f'8 e g
     \revert NoteHead.font-size}
    \new Voice{\voiceTwo r4 r8 <af,-2 bf-3 df-4>8 ~ <af bf df> <g a c>4 <g a c>8 |
    <f g bf>8 <g a c>4 <af bf df>8 ~ <af bf df> <g a c>4 <g a c>8 |}
    >>\oneVoice
  }
  \break
  \set Score.currentBarNumber = #213
  \repeat percent 3 { \stemDown
                      \once\set fingeringOrientations = #'(right)
                      <df-4 gf-2 df'-5>4 r4 <df gf df'> r4 }
  \stemNeutral
  \rs c'8 e df4 c
  \bar "||"
  \repeat percent 2 { r4 <g a c e>4 r4 <g a c e>4 }
  r4 <af bf df f>4 r4 <af bf df f>4
  <g a c e>4 r4 r4 \rs
  \rs r4 r2 | r2 r8 c8 d e |
  f8 gf16 f e8 f af bf16 af g8 af |
  c4 r r8
  \override NoteHead.font-size = #-2
  d,8 d ds |
  \revert NoteHead.font-size
  \bar "||"
  \set Score.currentBarNumber = #225
  \rs g,4 c g c bf a g |
  bf c bf a |
  g2. r4 | c4 g c g | c bf af  g |
  << { \voiceOne r4 s4 s4 r4 } \new Voice { \voiceTwo af2. g4 }  >>|
  \oneVoice
  f8 e-. r4 r2 | r4 r8 d e4 f |
  g8 fs g af g4 e | f8 e f g f4 df |
  e8 ds e f g4 g |
  g4 c c c | c2. c4 | af af af af |
  g r4 \rs r4
  \bar "|."
 }
}


Chrds = \chordmode {
  s1*0
  \gotoCtx "staff"
  \Pause
  \repeat volta 2 { c1 }
  \repeat volta 2 { c1 }
  \gotoCtx "chrds-up"
  \repeat volta 2 { c  s  df }
  \alternative{{ c1}{c4 s2 \parenthesize g4}}
  c1 s1*7 |
  \gotoCtx "staff"
  c1 s1*5
  \repeat volta 2 {c1}
  \time 2/4
  \gotoCtx "chrds-up"
  s8 c4 cs8:dim |
  \time 2/2
  \repeat unfold 2 {d2 s8 c4 cs8:dim}
  % d major
  \repeat volta 2 { d1\gotoCtx "staff" d | ef }
  \alternative{ {d}{ d}}
  s1*2 | \gotoCtx "chrds-up" ef1 d1
  s1*2  ef1 d4 s2 s8 bf8
  \gotoCtx "staff"
  \repeat percent 2 a1
  \repeat volta 2 {
    \repeat percent 2 a1 bf1
  }
  \alternative { {a1}{ a4 s2 \parenthesize e4}}
  a4 s2 \parenthesize e4
  \gotoCtx "chrds-up"
  a1 s1
  bf1
  a4 s2 e4:m7 |
  a1 s1
  bf1
  a4 s2 e4:m7 |
  \gotoCtx "staff"
  \repeat percent 2 df1
  \bar "||"
  \repeat percent 2 df1 d1
  \gotoCtx "chrds-up" df4 s2.
  \gotoCtx "staff"
  \repeat percent 2 df1
  \gotoCtx "chrds-up" d1
  \gotoCtx "staff" df1
  \bar "||"
  \gotoCtx "chrds-up"
  s1*2 d1
  df4 s2 af4:7 |
  df1 s1 d1
  df1
  s2
  b1 s1
  \bar "||"
  \gotoCtx "staff"
  b1 s1
  \gotoCtx "chrds-up" c1
  b1 \gotoCtx "staff"
  \repeat percent 2 b1 c1
  b4 s2.
  \gotoCtx "chrds-up"
  b1 s1 c1
  b4 s2 fs4 |
  b1 s1 c1
  s8 b4. s2
  c4. df8
  c4 r2. s1 s1 s4. g2:dim s8
  c1 s1 s1 s1
  c1 s1 df c
  s1*2 df1
  c4 s2 g4:7
  \bar "||"
  \set Score.currentBarNumber = #153
  c1 s1*2 df2/c c |
  c1 df2/c c |
  c1 | s2 s8 bf4/g g8:7 |

  \bar "||"
  \gotoCtx "staff"
  \set Score.currentBarNumber = #161
  \repeat percent 3 c1 df2/c c
  \gotoCtx "chrds-up"
  c1 |
  s4 s4. g4:m7 c8 |

  \bar "||"
  \gotoCtx "staff"
  \set Score.currentBarNumber = #167
  \repeat percent 3 c1 df2/c c
  \break
  \gotoCtx "chrds-up"
  c4 s2 df4 |
  s4 s4. g4:m7 g8:7 |

  \bar "||"
  \gotoCtx "staff"
  \repeat percent 2 c1
  \gotoCtx "chrds-up"
  c1 df2/c c
  \gotoCtx "staff"
  \repeat percent 2 { c1:/f }
  \gotoCtx "chrds-up"
  s1 df:/f
  f1 s1*11
  c1 s1*14
  \gotoCtx "staff"
  \repeat volta 2 {
  c1 }
  \gotoCtx "chrds-up"
  s1 s1
  c:9-11+ s1*3
  c1 s1 df c1
  s1 s2. s8 df1 s8 s8 c4. s8 bf4 b8
  c1 s1*5
  s4 d:m5-7 g:7 s4 r1
  c1 s1 df c1
  c/e s1 df c
}

alive = { s1*224 }

\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override BarNumber.Y-offset = 0
    \override BarNumber.X-offset = 0
  }
}

\score {
  \new StaffGroup
  <<
    \new ChordNames = "chrds-up" \with {
      \consists Percent_repeat_engraver
      \override PercentRepeat.Y-offset = #1
    }
    \chordmode{\alive}
    \new Staff = "staff" \with { \accepts ChordNames
                                 \consists Percent_repeat_engraver  }
      <<
        \new ChordNames \with { \override ChordName.Y-offset = #-1.5 }
          \Chrds
        \context Voice = "voice" \Notes
      >>
    \new ChordNames = "chrds-down" \with {
      \consists Percent_repeat_engraver
      \override PercentRepeat.Y-offset = #1
      \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0)
      %\override ChordName.outside-staff-priority = #1
    }
     \chordmode{\alive}
    \context Voice = "voice" \Annotation
  >>
}
