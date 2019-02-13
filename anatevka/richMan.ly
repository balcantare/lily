\version "2.19"
%#(ly:expect-warning (_ "cannot have note heads "))
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\language "english"

title = #"Rich Man"
\include "anatevka.ily"
\include "chordbass.ily"

bookTitle = \markup {
  \fontsize #3 \larger \larger
  \line {\box{1} #title }
}
\header { title = \bookTitle tagline = ##f }

alive = { s1*40 }


Annotation= {
}
Notes = {
  \key df \major
  s1.
  \mark \markup{\left-align{\box{\fontsize #4 A}}}
  s1*9
  \relative c' {
    s4 f4_\fermata gf_\fermata af_\fermata |
    \bar "||"
    \mark \markup{ \box{\fontsize #4 B}}
    \set Score.currentBarNumber = #20
    gf1 | gf4 af8 bf af4 gf |
    af1 | r4 g16_[ af bff cf] df4 r |
    r4 ef, r ef | f f8 gf f4 ef |
    r4 f8( af) af( df) df( f) | af4 r4 r2 |
    s1*3
    r4 ef16 df cf bff af8 r r4 |
    r1 | a,1 |
    r4 <ef' af>8( <d g>8)_\markup{rall.} <ef af>8( <e bf'>4 <f b>8 |
    <gf c>4) r\fermata r\fermata r\fermata
    \bar "||"
    \mark \markup{ \box{\fontsize #4 B'}}
    s1*2
    \clef bass r8 df, f af ef' df c cf |
    bf4 \clef treble af'4 gf f |
    ef ef d df |
    c4 f8 gf f4 ef | df4 r4 r2 |
    r1 | \clef bass df,2 ef | ff ef | ef4 df bf cf |
    d \clef treble <c'gf'>( <cf f>) r4 | r df df df |
    df1 | r4 <ef af>8 <d g> <ef af> <e bf'>4 <f b>8 |
    \mark \markup{\fontsize #4 {\arrow\box{A}}}
    <gf c>2_\fermata
    r_\fermata
    \bar "||"
    \set Score.currentBarNumber = #68
    \mark \markup{ \box{\fontsize #4 B*}}
    s1*3 r4 d2( df4)
    s1*2 r4 \tuplet 3/2 {r8 df' df} \tuplet 3/2 {ef4 df ef}
    f4-> r4 r2
    s1 s2. d,4\glissando |
    af''4 r4 bf,, b |
    \slurDown
    r4 gf'( f df') |
    s1 s2. f,4 |
    \slurUp
    af c8( b c) df4 d8 |
    ef4 r4 r2
    \bar "||"
    cs,8 gs' a b cs b a g | a b cs  d e d\prall cs4 |
    a1 | fs | fs | af2 r2_\fermata |
    \time 2/4
    \override NoteHead.font-size = #-2
    \tuplet 3/2 { f'8^"boi boi boi..." d cs } \tuplet 3/2 { f8 d cs }
    \revert NoteHead.font-size
    \time 3/4
    <df, f df'>4 <ef gf df'> <f af df>
    \bar "||"
    \time 4/4
    \mark \markup{ \box{\fontsize #4 B**}}
    s1*3 r4 gf8 af bff cf df4  |
    s1*2 r4 <ef, af>8 <d g> <ef af> <e bf'>4 <f b>8 |
    <gf c>4 r4_\fermata r4_\fermata r4_\fermata |
    \mark \markup{ \box{\fontsize #4 B'*}}
    s1_\pp s1*2
    s4 <af cf> <gf bf> <f af>
    s1*4
    gf1 ~ | gf1  | af1 | cf2( df) |
    <bff df>1 | <bf df> |
    r4 <d f>( <ef gf>) <f a>( |
    <gf bf>2) r2\fermata |
    \bar "||"
    f,8\p ef f ef df4 df | r4 df8 ef f ef f ef |
    df ef f gf af gf af gf | f2 r2 |
    gf4 f ff ef | df8 c bf c df2 |
    df8 c bf c df4 bf |
    ef2\pp\glissando c'4 r
    f,8\p ef f ef df4 df | r4 df8 ef f ef f ef |
    df ef f gf af gf af gf | f4-. df8-. 8-. ef4-. f-. |
    <c ef>1( <df ff>)  <ef gf>( <df ff>) <gf bff c ef>
  }
}

ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  \time 6/4
  \repeat volta 2
  <<
    {\voiceOne r4 d'8 d'r4 d'4 r4 d'4 }
    {\voiceTwo g2 g2 g2 }
  >>
  \time 4/4
  <<
    {\voiceOne r4 d'8 d'r4 d'}
    {\voiceTwo g2 g2}
  >> \oneVoice
  s1*6
  g'4 r4 r2
  s1
  g'4 r4 r2
  s1*3 | r4 s2 r4 |
  s1*4 |
  s1*3 | r4 s2 r4 |
  s1*18
  r4 s4 r4 g' |
  g'2 r2 |
  s1*12
  \repeat unfold 2 {g'4 r4 r4 g'4}
  s1 | g'4 r4 r2 |
  s1*6 s2 s2.
  s1*15 g'4 r4 r2 |
  s1*15 s4 r4 r2 |

}

Chrds = \chordmode {
  \gotoCtx "staff"
  df1.
  \repeat volta 2 {
    \gotoCtx "staff"
    \repeat percent 4 df1
    af1:7
    df2:m \once \set chordBassOnly = ##t  df2/cf
  } \alternative {
   { bf1:dim7 af:7 }
   { bf2:dim7 af2:7 | df4 s2. }
  }
  \gotoCtx "chrds-up"
  gf1:m | b:7  | e:7+ | s4 af:5-7 df:7 s4 |
  gf1:m | af:7 | df  | s4 df2.:7 |
  \gotoCtx "staff"
  gf1:m | b:7  | e:7+ | \gotoCtx "chrds-up" s4 af:5-7 df:7 s4 |
  %\gotoCtx "staff"
  gf1:m | g:dim7 | af:7 | s1 |
  \gotoCtx "staff" gf1 | af:7 | \gotoCtx"chrds-up" df | bf:7 |
  ef:m7 | af:7 | df | df:7 |
  gf:m  | s2 b2:7 | e1:6 | af2:5-7 df:7 |
  gf1:m | g:dim7 | s4 af4:7 s2 | s1 |
  \gotoCtx "staff"
  gf1:m | b:7  | e:7+ | s4 \gotoCtx "chrds-up" af:5-7 df:7 s4 |
  \gotoCtx "staff" gf1:m | af:7 |
  \gotoCtx "chrds-up" df  | df1:7 |
  \gotoCtx "staff"
  gf1:m | b:7 | \gotoCtx "chrds-up" e:7+ | s4 af:5-7 df:7 s4 |
  \gotoCtx "staff"
  gf1:m | g:dim7 | \gotoCtx "chrds-up" af:7 | s1 |
  s1*2
  fs2.:m  \set chordBassOnly = ##t fs4:/e |
  d2. d4/cs |
  b4.:m b8:/a b4.:/gs b8:/fs |
  \set chordBassOnly = ##f
  df1:7/f
  s2 | df2.:7 |
  \gotoCtx "staff"
  gf1:m | b:7  | e:7+ | s4 \gotoCtx "chrds-up" af:5-7 df:7 s4 |
  \gotoCtx "staff" gf1:m | af:7 |
  \gotoCtx "chrds-up" df  | df1:7 |
  \gotoCtx "staff" gf1 | af:7 |
  df | bf:7 |
  ef:m7 | af:7 | df | df:7 |
  \gotoCtx"chrds-up"
  gf:m  | s2 b2:7 | e1:6 | af2:5-7 df:7 |
  gf1:m | g:dim7 | s4 af4:7 s2 | s1 |
  \repeat percent 4 df1
  af:7 | df2:m \set chordBassOnly = ##t df:/cf |
  bf:dim \parenthesize ef:7 |
  af4:7 s2.
  \repeat percent 4 df1
  af1:79- | df1:m | af1:79- | df1:m |
  gf:dim7
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
