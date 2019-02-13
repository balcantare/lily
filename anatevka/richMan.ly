\version "2.19"
#(ly:expect-warning (_ "cannot have note heads "))
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

alive = { s1*20 }

%ignore = \override NoteColumn.ignore-collision = ##t
%#(define (empty-namer pitch lower?) (make-simple-markup ""))
%rootless = {
%  \once \set chordRootNamer = #empty-namer
%}

Annotation= {
}
Notes = {
  \relative c''{
  \key df \major
  \time 6/4
  \override NoteHead.style = #'slash
  \repeat volta 2 { gf4 df'8 df gf,4 df' gf, df'}
  \revert NoteHead.style
  } \break
  \mark \markup{ \box{\fontsize #4 A}}
  \time 4/4
  \repeat volta 2 {
    \gotoCtx "chrds-up"
    \omit Staff.ChordName
    \override NoteHead.style = #'slash
    \notemode <<
      {\voiceOne r4 df'8 df'r4 df'}
      {\voiceTwo gf2 gf2}
    >> \oneVoice
    s1*5
  } \alternative {
    { s1 gf'4 r4 r2  }
    { s1 gf'4 << {\gotoCtx "chrds-up" r4 r2}
                 {\gotoCtx "staff" f'4 gf' af'} >> }
  }
  \revert NoteHead.style
}
Chrds = \chordmode {
  \gotoCtx "chrds-down"
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
}

\score {
  \new StaffGroup
  <<
    \new ChordNames = "chrds-up" \with { \remove Collision_engraver }
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
