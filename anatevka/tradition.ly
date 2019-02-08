\version "2.19"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "anatevka.ily"
%\include "lilyjazz.ily"
\include "jazzextras.ily"
\language "english"

%{#(define-markup-command (barnum layout props bar) (markup?)
   "Print Bar number"
   (interpret-markup layout props
     #{\markup \box{ #text}#}
     ))
%}
gotoCtx =
#(define-music-function (strg)(string?)
#{
  \change Staff = #strg
  #(if (string=? strg "staff") ;; Staff needs to be named equal to this
       #{ \override ChordName.Y-offset = #-1.5 #}
       #{ \revert ChordName.Y-offset #})
#})

% Macro to print single slash
rs = {
  \once \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
  \once \override Rest.thickness = #0.48
  \once \override Rest.slope = #1.7
  r4
}

rsa = {
  \once \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
  \once \override Rest.thickness = #0.48
  \once \override Rest.slope = #1.7
  r4->
}

% Function to print a specified number of slashes
comp = #(define-music-function (count) (integer?)
  #{
    \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
    \override Rest.thickness = #0.48
    \override Rest.slope = #1.7
    \repeat unfold $count { r4 }
    \revert Rest.stencil
  #}
)

title = #"Tradition"
\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \line{
        #title \hspace #1
        - \hspace #1 \fromproperty #'page:page-number-string
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}
bookTitle = \markup {
  \fill-line {
    \fontsize #3
    \override #'(offset . 7)
    \override #'(thickness . 6)
    \underline \larger \larger #title
  }
}

\header {
  title = \bookTitle
  tagline = ##f
}

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
  \repeat volta 2 \relative c'' { f f4 ef df }
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
   \repeat volta 2 { \rs r4 r2 | r1 r1 }
   \alternative { {r2 r8 df df ef} {
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
  \repeat percent 2 {d1} ef d1
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
  c1
}

alive = { s1*120 }

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
