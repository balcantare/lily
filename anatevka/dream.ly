\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"The Dream"
sheetNr   = #"11"

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
    '(1 3 19 22 26 32 35 43 50 53 56 59 145 148 152 164 168)) #f))))


alive = { s1*10 }

Notes = {
  \set Staff.connectArpeggios = ##t
  \set Score.barNumberVisibility = #print-at-bars
  \relative c''' {
    \time 2/4
    \bar ".|:"
    \repeat volta 2 {
      \set fingeringOrientations = #'(right)
      <a-4 cs-5 ds-2 e-3>4:16_"ohne bd"
      <f-2 g-3 a-4 c-5>4:16
    }
    <<
      { \voiceOne
        \repeat volta 2 {
          <a cs ds e>4_"also hör zu":16
          <f g a c>4:16
        }
        \repeat volta 2 {
          <a cs ds e>4:16
          <f g a c>4:16
        }

      }
      \new Voice {
       \voiceTwo
       cs,8 r bf' r |
       \parenthesize c,4 c''_"chimes"
      }

      >>
      \oneVoice
     \time 4/4
      \key ef \major
      ef16(^"sie sagte"_"vl"
      df bf a)  f( ef df c) bf( af gf f) ff( ef df cf) |
      \set Score.currentBarNumber = 1
      bf8 r r4 r2 |
      r1 | \break
      \set Score.barNumberFormatter = #(double-bar-number 8)
      <<
        {
          \voiceOne
          \repeat volta 2 {
            \repeat unfold 2 {
              <bf' g'>2.\arpeggio r4
              <ef  c'>2\arpeggio <ef bf'>2\arpeggio
            }
            <bf f'>2.\arpeggio r4
            <bf ef>2.\arpeggio r4
            <af d>2.\arpeggio r4
          } \alternative {
            { \override BreathingSign.text = \markup { \musicglyph #"scripts.caesura.curved" }
              <g  ef'>4-. r2 \breathe r4-\fermata }
            { <g  ef'>2 \arpeggio \breathe r2-\fermata }
          }
        }
        \new Voice {
          \voiceTwo
          \repeat volta 2 {
            \repeat unfold 2 {
              ef2.\arpeggio r4
              g2\arpeggio g\arpeggio |
            }
            <d af'>2.\arpeggio r4
            <c g'>2.\arpeggio r4
            <bf f'>2.\arpeggio r4
          } \alternative {
            { <bf ef>4 r4 \clef bass \appoggiatura { a16 g f } ef4-^ r4
              \clef treble }
            { <bf' ef>2 \arpeggio r2 }
          }
        }
      >>
      \oneVoice
      \break
      \set Score.barNumberFormatter = #robust-bar-number-function
      \set Score.currentBarNumber = #19
      \bar "||"
      \key a \major
      s1*3
      \override NoteHead.style = #'slash
      r4 gs' r2-\fermata
      s1*2
      \revert NoteHead.style
      s2. g'8 fs
      \bar "||"
      \key g \major
      g fs g fs g
      %<< {
        %\voiceOne
       % \ottava #1 as b as] |
        %b cs d r cs d e r |
        %d e f e f e f e |
        %e d d d \acciaccatura c cs d d d |
        %cs d d cs d
        %\ottava #0 cs, ef f | g r8 r4 r2  }
        %\new Staff \with {
        %  \remove "Time_signature_engraver"
        %} {
          \clef bass
        cs,,8 cs cs |
        cs4 d2 b4 ~ |
        b g2 cs,4 ~ |
        cs d2 g4 ~ |
        g b ~ b8 cs b a |
        g8 r8 r4 r2 |
     % }
    %>>
    s1*2
    \override Glissando.style = #'trill
    r2 \clef bass  d4_"bd nicht" \glissando \clef treble fs''
    \bar "||" \key ef \major
    g8_"langsam" r bf,-. g-. c-. g-. bf-. g-. |
    ef' bf c g ef g bf g |
    ef g bf g c g bf g |
    ef' bf c g ef g bf g |
    f af c af c af f af |
    ef g bf g c bf g bf |
    d f af f c bf af f |
    ef4-. r4 \breathe r2-\fermata
    \bar "||"
    \key a \major
    s1*3
    \override NoteHead.style = #'slash
    r4 gs r2-\fermata
    s1*2
    \revert NoteHead.style
    s2. g'8 fs
    \bar "||"
    \key g \major
    g fs g fs g
    %<< {
        %\voiceOne
     %   \ottava #1 as b as] |
     %   b as b cs d r cs d |
     %   e4 \acciaccatura e fs2 \acciaccatura g f4 ~ |
     %   fs4 d2 cs4 ~ |
     %   cs8 d
     %   \ottava #0
     %   g,, a b cs ef f | g r8 r4 r2  }
     %   \new Staff \with {
     %     \remove "Time_signature_engraver"
     %   } {
          \clef bass
        cs,,8 cs cs |
        cs4 d2 b4 ~ |
        b g2 cs,4 ~ |
        cs d2 g4 ~ |
        g b ~ b8 cs b a |
        g8 r8 r4 r2 |
     % }
    %>>
    s1*2
    \clef treble
    r2 bf2_"bd nicht" \glissando
    \bar "||" \key ef \major
    \ottava #1
    \repeat percent 2 { ef''8-2 d-4 df-3 g,-2 d' df gf, c
    cf f, bf a e af g ef }
    \ottava #0
    f2 r8 d'16 c bf8 af |
    g2 r8 af16 g f8 ef |
    d2 r8 d16( ef f ef d8 |
    ef2.) r4
    %{r8 <bf d>16 <c ef> |
    <d f>2 r8 <d f>16( <ef g> <f af> <ef g> <d f>8 |
    <ef g>2.) r8 <d f>16( <ef g> |
    <f af>2) r8 <f af>16( <g bf> <af c> <g bf> <f af>8) |
    %}
    %\bar "||"
    \key g \major
    \set Score.currentBarNumber = #145
    \repeat volta 2 {
    << {
      \voiceOne
      \repeat unfold 2 { b'16( g d b) b( d g b) } \breathe
       }
    \new Voice {
      \voiceTwo
      \repeat unfold 2 { af,,16( df f af) af( f df af) }
    }
    >>
    }
    \oneVoice
    \key d \major
    r1 r1
    \set Score.barNumberFormatter = #(double-bar-number 8)
    \repeat volta 2 {
       s1*7
       d8_"mdl" e fs a b d e fs
    }
    \set Score.barNumberFormatter = #robust-bar-number-function
    \set Score.currentBarNumber = #164
    s1*7
    \repeat volta 2 { s1  \mark "Decke" }
    s1
    \bar "|."
  }
}



ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  s2*3 s1*3
  s1*9
  s1*6
  g'4 r4 r4 s4
  s1*6
  r2 r4 g'4 | g'4 r4 r2 | r2 s2
  \repeat unfold 2 { s2 r2 | r4 s4 r4 s4 | }
  \repeat unfold 4 { s2 r2 }
  s1*13
  r2 r4 g'4 | g'4 r4 r2 | r2 s2
  s1*24
  g'1 r1
  s1
  g'4-> r4 r2
}


Chrds = \chordmode {
  \gotoCtx "chrds-up"
  a4:3.5.11+ f:9
  a4:3.5.11+ f:9
  a4:3.5.11+ f:9
  s1*3
  \repeat unfold 2 { ef1 | ef2:6 ef2 |}
  bf1:7
  ef1:6
  bf1:7
  ef1
  ef1
  \gotoCtx "staff"
  \repeat percent 3 a1
  s1
  a1
  ef2:11+ d2:7 |
  g1
  s1
  \gotoCtx "chrds-up"
  g1
  s1*4
  \gotoCtx "staff"
  s2. af4:7.9.11+ |
  g4:7.9.11+ s2. |
  \gotoCtx "chrds-up"
  s2 bf:7 |
  \repeat unfold 2 { ef2 s2 | s4 ef:6 s4 ef | }
  \repeat unfold 2 { bf2:7 s2 | ef2:6 s2 | }
  \gotoCtx "staff"
  \repeat percent 3 a1
  s1
  a1
  ef2:11+ d2:7 |
  g1
  s1
  \gotoCtx "chrds-up"
  g1
  s1*4
  \gotoCtx "staff"
  s2. af4:7.9.11+ |
  g4:7.9.11+ s2. |
  \gotoCtx "chrds-up"
  s2 bf:7 |
  ef1 s1*3
  bf1:7 | ef | bf:7 | ef
  s1 d s1
  \gotoCtx "staff"
  d d:6 d d:6 a:7 d:6 a:7
  \gotoCtx "chrds-up" d
  \gotoCtx "staff" a:7 d a:7 d a:7 \repeat percent 2 { d:7+ }
  s1 d:6
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
    %\remove Score.Bar_number_engraver
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
      \consists "Span_arpeggio_engraver"
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
    %\context Voice = "voice" \Annotation
  >>
}
