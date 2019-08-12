\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Exit"
sheetNr   = #"35"

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
        \hspace #1 - \commitDate
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1 8 29 31 39 55 60 64 )) #f))))


alive = { s1*10 }

Annotation= {
}
Notes = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \key c \minor
  \relative c'' {
    \partial 4 g4(^"bd" |
    \once\override Score.RehearsalMark.self-alignment-X = -1.8
    \once\override Score.RehearsalMark.Y-offset = #0
    \mark\markup{\left-align{\box{\fontsize #3 A}}}
    \set Score.repeatCommands = #'(start-repeat)
    \set Score.barNumberFormatter = #(triple-bar-number 14 46)
    ef'4->) r r d( | c->) r r b( | c-^) g r \voiceTwo f |
    ef4 4 \oneVoice r4 g( | c df2 ) c4( | bf af2) g4 |
    af1 ~ | 4 f4-> e-> ef-> |
    d4( bf'2) af4 |
    g fs g2 |
    c,4( af'2) g4 |
    f4 e f2 |
    r4 df'2 4( |
    \set Score.repeatCommands = #'((volta "1.+4."))
    d cs2) d4\laissezVibrer
    \bar ":|."
    \set Score.barNumberFormatter = #robust-bar-number-function
    \set Score.currentBarNumber = #28
    \set Score.repeatCommands = #'((volta "2.+5."))
    d\repeatTie( cs2) d4 |
  << {
    e1\repeatTie ~ | 2 r2 \bar "||" |
    \set Score.repeatCommands = #'((volta #f))
%    \break

    \once\override Score.RehearsalMark.self-alignment-X = -1.8
    \once\override Score.RehearsalMark.Y-offset = #0
    \mark\markup{\left-align{\box{\fontsize #3 B}}}
    c2 c | b4( c bf af) |
    g2 g | fs4( g f ef) |
    d2 d | d4( e f fs) |
    g1 ~ | 1 |
    c2 c | b4( c bf af) |
    g2 g | fs4( g f ef) |
    d2 d | ef4( d cs d) |
    g1 ~ | 2 r4 g\laissezVibrer \bar "||" |
    \once\override Score.RehearsalMark.self-alignment-X = -1.5
    \once\override Score.RehearsalMark.Y-offset = #0
    \mark\markup{\left-align{\box{\fontsize #3 A}}}
    s1 |
    \set Score.currentBarNumber = #60

    \set Score.repeatCommands = #'((volta "3."))
    d'4\repeatTie( cs2) d4 |
    c4 g8-. 8-. 4-. 4-. |
    g8( af g fs g4->) g\laissezVibrer
    \set Score.repeatCommands = #'((volta #f))
     \newSpacingSection
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
    \once\override Score.RehearsalMark.self-alignment-X = -1
    \once\override Score.RehearsalMark.Y-offset = #0
    \mark\markup{\left-align{\box{\fontsize #3 AABA}}}
    s1 |
    \newSpacingSection
    \revert Score.SpacingSpanner.base-shortest-duration
    \set Score.repeatCommands = #'((volta "6."))
    \set Score.currentBarNumber = #64

    b4 <f b ef>2. ~ | 1 ~ | 2 <f b d g>2 |
    <ef g c>4-^ r4 r2 | r2 <c' ef g c>4-^ r4
    \set Score.repeatCommands = #'((volta #f))
    \bar "|."
  }
  \new Staff = "bass" \with {
            \remove "Time_signature_engraver"
            \override ChordName.Y-offset = #-1.5
            %\consists Percent_repeat_engraver
            %\consists Double_percent_repeat_engraver
     }
     {
       \accidentalStyle modern-voice-cautionary
       \relative c {
         \clef bass \key c \minor
         c4 c2-> d4 | e c d e |
          <f af>1 ~ | 1 |
          <ef g>1 ~ | 1 |
          <d fs>1( | <f g>) |
          r4 c d ef | e c d e |
          <f af>1 ~ | 1 |
          <ef g>1 ~ | 1 |
          <d fs>1 ~ | 1 |
          r4 g,2-> a4 | b g a b |
          s1
          g2 4 r |
          c4 g8-. 8-. 4-. 4-. |
          g'8( af g fs g4->) r |
          s1
          g,4 g-. r fs( | g->) d'( ef->) fs( | g->) r g,2 |
          c4 r g'8-^ f-^ ef-^ d-^ |
          c4-^ r <c g' ef'>-^ r
        }
     }

  >>

}}

Violin = {
  \relative c'' {
      \accidentalStyle modern-voice-cautionary
      \clef treble
      \key c \minor
      s4^"vl"
      fs8(-> g fs ef fs4) r |
      f8( g f d f4) r |
      ef8 d d c b af af g |
      g2. g4( |
      e1 ~ | 1 | f4) r  c''8( cs d  e | f4) r r2 |
      r4 bf,2. ~ | 4 a4( bf) ef,4-> | r4 af2.~ |
      4 g( af) df,-> |
      r1 r1
      s1
      e4 e,2 f4 | g4 e f g | s1*6 |
      r4 <c, ef>4 <d f> <ds fs> |
      <e g> <c e> <d f> <e g> s1*6
      r4 b'8( c d ef f fs | g4-.) r4 r2
      s1
      s1*3
      s1
      r2 r4 fs4( | g) d'( ef) fs( | g2) g2\glissando |
      c,4-^ s2. s1
  }
}

ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  s4
  s1*15
  s4 s2.
  s1*7
  r4 s2.
  s1*7
  r4 s2.
}
Chrds = \chordmode {
  s4
  \gotoCtx "chrds-up"
  d1:7
  d2:m7 g:7 |
  c:m g:7 | c:m g:7 |
  c1:7 s1 | f1:m s1 | bf1:7 | ef |
  af | df2 f:m/c |
  bf2:m \set chordBassOnly = ##t bf2:m/af \set chordBassOnly = ##f|
  g1:7 | g1:7 |
  c1:7 s1 |
  f1:m s1 | c:m s |
  d:7 |g:7 | s4 c2.:m | c1 |
  f1:m s1 | c:m s |
  d:7 s1 | s4 g2.:7 s1 |
  s1
  g:7 | c:m
  s1 s1
  g:7.9-
  s1 s1 c2:m g:7 c:m
}

\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override BarNumber.Y-offset = 0
    \override BarNumber.X-offset = 0
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
    \new Staff = "violin" \with {
      %\remove "Time_signature_engraver"
      %\set Staff.Clef #'break-visibility = #center-visible
      %\hide Clef
    } \Violin % { \stopStaff s1*64 }
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
   % \new Staff = "bass" \with {
   %   \remove "Time_signature_engraver"
   %   \hide Clef
   % } { \stopStaff s1*64 }
    \context Voice = "voice" \Annotation
  >>
}
