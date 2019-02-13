\version "2.19"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "anatevka.ily"
\language "english"

title = #"Tradition"
bookTitle = \markup {
  \fontsize #3 \larger \larger
  \line {\box{1} #title }
}
\header { title = \bookTitle tagline = ##f }

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

FluteMotiveI = { e8 ds e f e4 g | c g g g | g2. d4 | f f ef df  }

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
  s1\p_\adLibRep^\markup
    { \center-align\line{\bold TEVYE: ... keep our balance? } }
  s1\p_\adLibRep^\markup {\left-align {.. \bold Tradition!}}
  s1\f
  s1^\markup{\italic Refrain}
  s1*4
  s1^\markup{\italic Thema}
  s4 s2. s1*12
  % page 4
  s1_\markup{ \center-align\italic\column{\line{ad lib.}\line{ bd/vl}}}
    ^\markup{ \center-align\column{\line{...und was Gott }
                 \line{ von ihm \bold erwartet}}}
  \dynamicUp
  s2\f | s1*2
  % key d
  s4\p s2.^\markup{\italic {voc. Papas}} | s1*3
  s2 s2^"Der Papa ..."
  s1*10
  s4\p s2.^\markup{\italic {voc. Mamas}} | s1*3
  s4 s4^"lesen kann" s2 | s2. s4^"Die Mama ..."
  s1*8
  s1^\markup{\italic {bd begl weg}} s1
  s1^\markup{\italic {voc. Söhne}}
  s1*7
  s4.^\markup{\italic {bd begl spielen}}
  s8\f s4 s4 |
  s1^"Die Söhne ..."
  s1*6 s2
  s1^\markup{\italic {bd begl weg}}
  s1
  s1^\markup{\right-align\italic {voc. Töchter}}
  s1*7
  s1^"Die Töchter ..."
  s1 s1^\markup{\italic 8va}
  s1*3 s1^\markup{\italic 8va}
  s1 s2 s1^\markup{\italic Chor}
  s1*7 s1^\markup{\italic Ref}
  \dynamicUp
  s1*8 s1\pp
  s1*5 s1_\markup{\italic (vamp till cue)}^\markup{fantastisches Paar}
  s1*4 s1^\markup{...der Bettler}
  s1_\markup{\italic (vamp till cue)}^\markup{darunter leiden?}
  s1

  s1^\markup{...geliebter Rabbi}
  s1*3 s1_\markup{\italic (vamp till cue)}^\markup{was...uns vom Leib!}
  s1\ff
  s2\f s2 ^\markup{daidaidai} s1*3
  s1\mf s1*3
  s2^\markup{\italic 8va}  s2\ppp
  s1*6 s1^\markup{\italic 8va}
  s1\mf s1*4
  s2\pp_\markup{\center-align\italic (vamp till cue)} s2^\markup{Esel}
  s1*2
  s4^"Pferd - Esel" s2. s1*2 s1^\markup{\italic unisono}
}

CMotiveI = { g8( c4.) | e2 r4 e( | f1 }
MotiveII = { \repeat percent 3 { c4 c8 e df4 c }
             f8-. e-. f-. g-. e2 }
MotiveIII = { \repeat percent 3
              { r4 g8-. bf8-. af4-. g-. }
              af8-. g-. af-. bf-. g4.--}
CMotiveIV = { r4 c8( e) df4( c4) }
CMotiveIii = \relative c' {
  <d a'>2\< | <d a'>2->\fp\> r4\! \slurUp <d a'>4\<( |
  <ef bf' >1\><d a' >4\!) r4 r <a' >8->-.\f r |
  <d >8->-. r r4\mf <fs, a>8( <fs d'>4.)\< |
  <fs d'>2\fp\> r4\! <fs d'>4(\< <g ef'>1\> | <fs d'>4)-.\!
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
bddf = { <df ef>4 ~ <df ef>8 <cf df>( <df ef>)-. r8 }

Pause = { s1 s1*16 s1*16 }

Notes = {
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
  \relative c'' \MotiveII
  \relative c'' \MotiveIII r8
  \repeat volta 2 {
      \repeat percent 3 { r1 | \relative c' \CMotiveIV }
  }
  s1
  \set Score.currentBarNumber = #60
  \time 2/4
  \relative c''{
    \repeat unfold 2 { r8 c-> c-> cs->  d4-> d->}
    r8 a' g ef
  }
  \bar "||"
  \key d \major
  \rs \rs r4 \rs |
  s1*3
  \rs  r4 r2
  \dynamicUp
  r2 \relative c''{ \CMotiveIii r4 r8 d8 c bf }
  \bar "||"
  \key a \major
  s1*2
  s1*4
  \repeat unfold 2 {\rs \rs r4 \rs}
  \bar "||"
  \relative c'{ r4 \CMotiveV }
  \bar "||"
  \key df \major
  s1\mf s1
  s1*3 \rs \relative c''{\bddf}
  s1*2
  \relative c'' {\rs \repeat unfold 2 {<b e>4->} \rs}
  s1
 \relative c''{
   r4 r8 af8-> \slurDown af->( df4) af8-> |
   \slurUp af->( df) r4 r f8->( ef) |
   ef( d) d( cs) cs( b a b | af)
   r8 r4 r4 \rs |
   \rs r8 af8-> af->( f'4) af,8-> | af->( f') r4 r bf8->( af) |
   af( gf) gf( ef) ef( d) d( ef| f8)-. r r4 r8 df df d |
   \time 2/4 ef8 df df e |
   \bar "||"
   \time 2/2
   \key b \major
   \override NoteHead.style = #'slash
   gs,4 ds'8 ds gs, ds' ds4
   \revert NoteHead.style
   s1 s1
   \relative c''' {
    r8 b16( c b8)-. a-. \grace {b16( c16} b8-.) r8 r4 |  r1 |
    r8 b16( c b8)-. d-. \grace {b16( c16} b8-.) r8 r4 |
   }
   s1*3
   \rs r4 r2
   \bar "||"
   r4 ds,8-. fs-. b4-. fs8-. b-. |
   ds4-. r4 r2
   r4 c8 df e16( df c b af g f e| ds8)
   r8 r4 r4 \rs |
   \rs fs8-. b-.  ds4-. fs,8 b-. |
   ds4-. r4 r2 |
   r8 e,16( fs g fs e fs g\< as b as g as b c\! | ds8)
   r8 r4 r8 b8->\ff as-> b->
   \time 2/4
   c8-> b-> c-> df-> \bar "||"
   \key c \major \time 2/2
   \rs r4 r2 | r1 r1 |
   r2 r8 df df ef |
   \rs r4 r2 | r1 r1 r1 |
   \bar "||"
   r1
   \set Score.currentBarNumber = #145
   r1
   r4 r8 f, f af d f |
   e4 r4 r4 g |
   c g r g | c g r g |
   f f fs f af af fs f |
   e4 r4 r4 g| \pageBreak
   \bar "||"
   \set Score.currentBarNumber = #153
   \repeat unfold 2 {c,8-. g-. c-. g'-. df-. g-. c,-. g-. }
   g'-. c-. g-. c,-. af-. c-. g-. c,-.
   af'2( g4) r |
   c8-. g-. c-. g'-. df-. g-. c,-. g-. |
   f-. e-. f-. g-. e-. r r4 |
   \repeat volta 2 {
     \override NoteHead.style = #'slash
     g4 d'8 d r4 g,
     \revert NoteHead.style
   }
   \rs r4 r8 bf-> bf-> b-> |
   \set Score.currentBarNumber = #161
   s1*4
   \repeat volta 2 {
     \override NoteHead.style = #'slash
     d8 d d4 r2
     \revert NoteHead.style
   }
   \rs g16 f ef df c8
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
   \rs g16 f ef df c8
   \override NoteHead.style = #'slash
   b'8[ b b] |
   \revert NoteHead.style
  \set Score.currentBarNumber = #173
  s1*2
  r4 g af g | f8 e f g e g e g |
  s1*2
  r4 g af g | f8( e f g) e2 |
  \bar "||"
  \key f \major
  \set Score.currentBarNumber = #181
  \repeat percent 7 { f'2 f } f1
  \repeat percent 4 { f2 f } f1
  \key c \major
  s1
  \set Score.currentBarNumber = #209
  \repeat volta 2 {
    r4 r8 <af, bf df>8 ~ <af bf df> <g a c>4 <g a c>8 |
    <f g bf>8 <g a c>4 <af bf df>8 ~ <af bf df> <g a c>4 <g a c>8 |
  }
  \set Score.currentBarNumber = #213
  \repeat percent 3 { <df gf df'>4 r4 <df gf df'> r4 }
  \rs c'8 e df4 c
  \bar "||"
  \repeat percent 2 { r4 <g a c d e>4 r4 <g a c d e>4 }
  r4 <af bf df ef f>4 r4 <af bf df ef f>4
  <g a c d e>4 r4 r4 \rs
  \rs r4 r2 | r2 r8 c8 d e |
  f8 gf16 f e8 f af bf16 af g8 af |
  c4 r r8 d,8 d ds |
  \bar "||"
  \set Score.currentBarNumber = #225
  \rs g,4 c g c bf a g |
  bf c bf a |
  g2. r4 | c4 g c g | c bf af  g |
  << { \voiceOne r4 \rs \rs r4 } \new Voice { \voiceTwo af2. g4 }  >>|
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
  \gotoCtx "chrds-down"
  \repeat volta 2 { \repeat percent 2 { c  } df }
  \alternative{{ c1}{c4 s2 \parenthesize g4}}
  \repeat percent 8 {c1} |
  \repeat percent 6 {c1}
  \gotoCtx "staff"
  \repeat volta 2 {c1}
  \time 2/4
  \gotoCtx "chrds-down"
  s8 c4 cs8:dim |
  \time 2/2
  \repeat unfold 2 {d2 s8 c4 cs8:dim}
  % d major
  \repeat volta 2 { d1
    \gotoCtx "staff"
    d | ef }
  \alternative{ {d}{\gotoCtx "chrds-down" d}}
  \repeat percent 2 {d1} ef d1
  \repeat percent 2 {d1} ef d4 s2 s8 bf8
  \gotoCtx "staff"
  \repeat percent 2 a1
  \repeat volta 2 {
    \repeat percent 2 a1 bf1
  }
  \alternative { {a1}{\gotoCtx "chrds-down" a4 s2 \parenthesize e4}}
  a4 s2 \parenthesize e4
  \repeat percent 2 a1
  bf1
  a4 s2 e4:m7 |
  \repeat percent 2 a1
  bf1
  a4 s2 e4:m7 |
  \gotoCtx "staff"
  \repeat percent 2 df1
  \bar "||"
  \repeat percent 2 df1 d1
  \gotoCtx "chrds-down" df4 s2.
  \gotoCtx "staff"
  \repeat percent 2 df1
  \gotoCtx "chrds-down" d1
  \gotoCtx "staff" df1
  \bar "||"
  \gotoCtx "chrds-down"
  \repeat percent 2 df1 d1
  df4 s2 af4:7 |
  \repeat percent 2 df1 d1
  df1
  s2
  \repeat percent 2 b1
  \bar "||"
  \repeat percent 2 b1 c1
  b1 \gotoCtx "staff"
  \repeat percent 2 b1 c1
  \gotoCtx "chrds-down" b4 s2.
  \repeat percent 2 b1 c1
  b4 s2 fs4 |
  \repeat percent 2 b1 c1
  b4 s2.
  c4. df8
  c1 s1 s1 s2 g2:dim
  c1 s1 s1 s1
  \repeat percent 2 c1 df c
  \repeat percent 2 c1 df c
  c4 s2 g4:7
  \bar "||"
  \set Score.currentBarNumber = #153
  \repeat percent 3 c1 df2/c c |
  c1 df2/c c |
  c1 | c4 s4 s8 bf4/g g8:7 |

  \bar "||"
  \gotoCtx "staff"
  \set Score.currentBarNumber = #161
  \repeat percent 3 c1 df2/c c
  \gotoCtx "chrds-down"
  c4 c:6 s2 |
  c4 s4. g4:m7 c8 |

  \bar "||"
  \gotoCtx "staff"
  \set Score.currentBarNumber = #167
  \repeat percent 3 c1 df2/c c
  \gotoCtx "chrds-down"
  c4 s2 df4 |
  c4 s4. g4:m7 g8:7 |

  \bar "||"
  \gotoCtx "staff"
  \repeat percent 2 c1
  \gotoCtx "chrds-down"
  c1 df2/c c
  \gotoCtx "staff"
  \repeat percent 2 { f2:m c2 }
  \gotoCtx "chrds-down"
  \repeat percent 2 { f2:m c2 }
  f1 s1*12
  \gotoCtx "staff"
  \repeat volta 2 {
  c1 }
  \gotoCtx "chrds-down"
  c1 s1
  \repeat percent 4 { c:9-11+ }
  \repeat percent 2 c1 df c1
  \repeat percent 2 c1 df c4 s4. bf4 b8
  \repeat percent 6 c1
  s4 d:m5-7 g:7 s4 r1
  \repeat percent 2 c1 df c1
  c/e s1 df c
}

alive = { s1*208 }

\score {
  \new StaffGroup
  <<
    \new ChordNames = "chrds-up" \chordmode{\alive}
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
