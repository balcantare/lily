\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Wedding Dance Two"
sheetNr   = #"17"

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
  page-count = #3
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
    '(1 7 15 23 31 40 50 58 66 75 85 91 99 105 108 116 121)) #f))))


%alive = { s1*10 }

Annotation= {
}
Notes = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c'' {
    \key d \major
    \bar ".|:"
    \repeat volta 2 { d8--(-\p e16 d cs8-.) b-. a4-. a-. |
    a-. r a2 | }
    \set Score.currentBarNumber = #5
    d8--( e16 d cs8-.) b-. a4-. gs--( |
    a8-.) b8-. cs-. d-. e-.\< fs-. g-. gs-.\!
    %\bar "||"
    \repeat volta 2 {
    \set Score.barNumberFormatter = #(double-bar-number 4)
    a8. gs16 a8 fs d e fs fs |
    g8( a16 g fs8-.) e-. <fs a,>4-_ <fs a,>-_ |
    a8. gs16 a8 fs d e fs fs |
    g8( a16 g fs8-.) e-. <d fs,>4-_ <d fs,>-_ |
    }
    \break
    \set Score.currentBarNumber = #15
    \set Score.barNumberFormatter = #robust-bar-number-function
    <g, b>8( <b d>) <b d>4-- <b d>8( <c e>16 <b d> <a c>8-.) <g b>-. |
    <a c>4-. r r2 |
    <a c>8( <c e>) <c e>-. <c e>-. <c e>( <d fs>16 <c e> <b d>8-.) <a cs>-. |
    <b d>4-. r r2 |
    \break
    <b d>8(^"Dialogue ends" <d f>) <d f>-. <d f>-. <d f> <ef g>16( <d f>) <c e>8-. <b d>-.
    <g ef'>4(\< <gs f'> <bf g'> <c a'>)\!
    <f bf>8-> <d f>-. r <d f>-. <bf ef>-. f'16-(  ef) <a, d>8-. <g c>-. |
    <f bf>8-. r8 \clef bass b,,4 c8 d16 c d8 e |
    \break
    \key f \major
    \clef treble
    \repeat volta 2 {
    \set Score.barNumberFormatter = #(double-bar-number 4)
    <a' c>8.-> <gs b>16 <a c>8 <f a> <f a,> <g c,> <f a> <f a>
    << { \voiceOne bf8 c16 bf }
       \new Voice { \voiceTwo e,4 } >>
    \oneVoice <e a>8-. <e g>-. <f a>4-> <f a>->
    <a c>8.-> <gs b>16 <a c>8 <f a> <f a,> <g c,> <f a> <f a>
    << { \voiceOne bf8 c16 bf }
       \new Voice { \voiceTwo e,4 } >>
    \oneVoice <e a>8-. <e g>-. <f c>4-> <f c>->
    }
    \set Score.currentBarNumber = #31
    \set Score.barNumberFormatter = #robust-bar-number-function
    <bf d>8(-\mf <d f>) <d f>-. <d f>-. <d f>( <ef g>16 <d f> <c ef>8 <bf d>)
   \clef bass
   f,4-\p g\< a c\!
   \clef treble
   <c' ef>8( <e g>) <e g>-. <e g>-. <e g>( <f a>16 <e g> <d f>8 <cs e>)
   bf,4(\< c d  f)\!
   f'8( af) af-. af-. af bf16 af g8 f |
   <g, ef'>4(\> <af f'> <bf g'> <c a'>-.)-\pp\!
   <f bf>8-> <d f> r <d f> <g, ef'>8 f'16 ef <d f,>8 <c ef,>
   <bf bf,>2->-\ff^"Poco piu mosso" <bf bf,>->
   \repeat unfold 4 { <bf bf,>4-> }
   \break
   \bar "||"
   \key bf \major
   <d, bf'>8-\f( <f cf'> <d bf'> <f cf'>\< <bf d>4 <c ef>\! |
   <d f>1)\>
   <d, bf'>8(\! <f cf'> <d bf'> <f cf'>\< <bf d>4 <c ef>\! |
   <d f>1)\>
   \grace {f16\! g a} <d, bf'>8->-\ff <f af> <ef gf> <d f> <c ef>4( <bf d>) |
   <c ef>8( <d f>) <c ef>8( <d f>)  <bf d>4 <bf d> |
   \grace {f'16\! g a} <d, bf'>8-> <f af> <ef gf> <d f> <c ef>4( <bf d>) |
   <c ef>8( <d f>) <c ef>8( <d f>) <bf d>8( <c ef>) <bf d>( <g b>) |
   \grace { <g, e' c'>4 } <c c'>2-> <c c'>2-> |
   \repeat unfold 4 {<c c'>4->}
   \break
\bar "||" \key c \major
   \set Score.currentBarNumber = #50
   \set Score.barNumberFormatter = #robust-bar-number-function
   << { <e c'>8( <g df'>) <e c'>-. <g df'>-. <c e>4( <d f>) |
        g2. r4 |
        <e, c'>8( <g df'>) <e c'>-. <g df'>-. <c e>4( <d f>) |
        g2. r4 |
        <e c'>8 <g bf> <f af> <e g> <d f>4( <c e>) |
        <d f>8( <e g> <d f> <e g>) <c e>4-. <c e>-.
        <e c'>8 <g bf> <f af> <e g> <d f>4( <c e>) |
        <d f>8( <e g>) <d f>( <e g>) <d e>( f) <cs e>( cs)
      }
      \new Staff \with { \remove "Time_signature_engraver"}
      { \clef bass s1 |
        c,,8( df c df e4 f | g2.) r4
        c,8( df c df e4 f |
        g4) r \repeat unfold 2 {\acciaccatura fs8 g4->}
        \acciaccatura b8 c2 \repeat unfold 2 {\acciaccatura fs,8 g4->}
        g4 r \repeat unfold 2 {\acciaccatura fs8 g4->}
        c( b) bf( a)
      }
   >>

   %\bar "||"
   \key d \major
   \set Score.barNumberFormatter = #(double-bar-number 4)
   \repeat volta 2 {
   <fs'' a>8.-> <es gs>16 <fs a>8 <d fs> <a d> <cs e> <d fs>-> <d fs>->
   <d g>8 a'16 g <cs, fs>8 <cs e> <a d fs>4-^ <a d fs>-^
   <fs' a>8.-> <es gs>16 <fs a>8 <d fs> <a d> <cs e> <d fs>-> <d fs>->
   <d g>8 a'16 g <cs, fs>8 <cs e> <fs, a d>4-^ <fs a d>-^
   }
   \key g \major
   \set Score.currentBarNumber = #66
   \set Score.barNumberFormatter = #robust-bar-number-function
   <g b>8(-\f <b d>) <b d> <b d> <b d> <c e>16( <b d> <ef, c'>8-.) <d b'>-.
   c'2-> ~ c8 r r4 |
   <a c>8( <c e>) <c e> <c e> <c e> <d fs>16( <c e> <b d>8-.) <as cs>-.
   d2 ~ d8 r8 r4 |
   <b d>8( <d f>) <d f> <d f> <d f> <e g>16( <d f> <g, e'>8-.) <f d'>-.
   <e e'>4 <fs fs'> <g g'>8 <fs a> <g b> <a c>
   <b d>8-^ <g b>4 <f b>8( <e c'>-.) d'16( c <d, b'>8)-. <c a'>-.
   \grace <d b' g'>4 <g g'>2->-\fff <g g'>-> |
   \repeat unfold 4 <g g'>4->
   \bar "||"
   \key ef \major
   <g ef'>8-.-\p <bf ff'>-.^"Lightly" <g ef'>-. <bf ff'>-.
   << { \voiceOne g'-. ef-. af-. f-.
        bf-. g-. bf-. g-. ef-. bf-. ef-. bf-.
      }
      \new Voice { \voiceTwo ef4 f
                   \slurUp
         \acciaccatura a8 <g bf>2
         \acciaccatura a8 <ef bf'>2
         \slurNeutral
      }
   >>
   <ef, ef'>2->-\f <ef ef'>2->
   \repeat unfold 4 <ef ef'>4->
   <g ef'>8-.-\p <bf ff'>-. <g ef'>-. <bf ff'>-.
   << { \voiceOne g'-. ef-. af-. f-.
        bf-. g-. bf-. g-. ef-. bf-. ef-. bf-.
      }
      \new Voice { \voiceTwo ef4 f
                   \slurUp
         \acciaccatura a8 <g bf>2
         \acciaccatura a8 <ef bf'>2
         \slurNeutral
      }
   >>
   \repeat unfold 2 {
     <g, bf ef>8[->\sfz r16 <ef g df'>] <ef g c>8 <ef g bf> <ef fs a>4 <ef g bf> |
    <ef fs a>8 <ef g bf> <ef fs a> <ef g bf> <bf ef g>4 <bf ef g> |
   }
   \break
   \bar "||"
   \key d \major
   << {
     <d d'>4-.\p <fs fs'>-. <a a'>-. <d d'>-.
     r8 <d, d'>-. <fs fs'>-. <fs fs'>-. <a a'>-. <a a'>-. <d d'>4-.
         << { \voiceOne \repeat unfold 4 <d d'>4->}
            \new Voice { \voiceTwo gs8 a gs a es fs g gs  }
         >>
         <d a' d>4-> <d a' d>2-> <d a' d>4->
         \set Score.currentBarNumber = #91
         \acciaccatura {a'16 b c} d8-> c bf a gs a gs a
         gs a gs a es fs g gs |
         a d c bf  a gs a gs | a fs ef d es fs g gs |
         a bf c bf a bf a gs |
         a fs ef d cs d cs d |
         << { \voiceOne cs'8 d c d bf d a d |
              g, fs ef d e fs g a }
            \new Voice {
              \voiceTwo <es, gs cs>8 r <e g c> r
               <d fs bf> r  <c ef a> r |
              <b d g> fs' ef d e fs g a
            }
         >>

      }
           \new Staff \with { \remove "Time_signature_engraver"}
      { \clef bass
        d,,4-. fs-. a-. d-. |
        r8 d,-. fs-. fs-. a-. a-. d4-. |
        \repeat volta 2 {
        << { \voiceOne
             \repeat unfold 2 { r8 <d f> <d f> <d f> r <a d> <a d> <a d> } }
           \new Voice { \voiceTwo
                        \repeat unfold 2 { \acciaccatura cs,8 d4-. r
                        \acciaccatura es8 fs4-. r} }
        >>
        \oneVoice
        }
        \repeat percent 6 {
          \repeat unfold 2 { \voiceTwo \slurUp
            \acciaccatura { s16 cs8 } d8-> <c' d>-. \acciaccatura es,8 fs-> <c' d>-.
          }
        }
         <d,, d'>8 r <d d'>8 r <d d'>8 r <fs fs'> r |
         <g g'> r r <d d'> <e e'> <fs fs'> <g g'> <a a'>
      }
   >>
   \break
   % 99
   \bar "||"
   \key g \major
   <g'' b>8(-\ff <b d>) <b d> <b d> <b d> <c e>16( <b d> <ef, c'>8-.) <d b'>-.
   <c' a fs>2-> ~ <c a fs>8 r r4 |
   <a c>8( <c e>) <c e> <c e> <c e> <d fs>16( <c e> <b d>8-.) <as cs>-.
   <g b d>2 ~ <g b d>8 r8 r4 |
   <b d>8( <d f>) <d f> <d f> <d f> <e g>16( <d f> <g, e'>8-.) <f d'>-.
   <g ef'>4( <af f'> <bf g'> <c a'>) |
   \bar "||"
   \key bf \major
   <d bf'>8 <d f>4 f8 ef8 f16 ef <f, d'>8 <ef c'> |
   <bf bf'>2-> <bf bf'>-> |
   r8 <bf' bf'>[-> r <bf bf'>->] r <bf bf'>[-> r <bf bf'>->]
   \set Score.barNumberFormatter = #(double-bar-number 4)
   \key ef \major
   \repeat volta 2 {
      <ef g bf>-> r16 <fs a> <g bf>8 <ef g> <bf ef> <d f> <ef g> <ef g> |
      <f af> <g bf>16 <f af> <ef g>8 <d f> <bf g'>4-^ <bf g'>4-^
      <ef g bf>8-> r16 <fs a> <g bf>8 <ef g> <bf ef> <d f> <ef g> <ef g> |
      <f af> <g bf>16 <f af> <ef g>8 <d f> <g, ef'>4-^ <g ef'>-^ |
   }
   \set Score.currentBarNumber = #116
   \set Score.barNumberFormatter = #robust-bar-number-function
   \key af \major
   <af c>8( <c ef>) <c ef> <c ef> <c ef> <d f>16( <c ef>) <ff, df'>8-. <ef c'>-. |
   <g bf df>2. ~ 8 r |
   <bf df>8( <df f>) <df f> <df f> <df f> <ef g>16( <df f> <c ef>8-.) <b d>-. |
   <af c ef>2. ~ 8 r
   <c ef>8( <a c ef gf>) <a c ef gf> <a c ef gf>
   <ef' g> <ff af>16 <ef g> <a, f'>8 <gf ef'> \breathe |
   <af ff'>4 <a gf'>\> <b af'> <df bf'>\! |
   <ds b'>8\fz-^ fs4->\p fs8 (e fs16 e ef8 df cf4-.) r r2
   \bar "|."
 }
}
ChrdsUp = \notemode {
  \override NoteHead.style = #'slash
  r1 s4 r4 g'2
  s1 s2 g'4 g'
  s1*11 s4 r4 r2
  s1*11 s2 g' | g'4 g' g' g'
  s1*9 g'4 g' g' g'
  s1*8
  \repeat unfold 2 {
    s4 r8 g' g' g' g'^^ g'^^
    s4 s8 g' s4	 g'^^ }
  s1*7 s2 g'2 g'4 g' g' g'
  s1*29 g'2 g'2 g'4 g' g' g'
  s1*10 s4 r4 r2 r1
}
Chrds = \chordmode {
  \gotoCtx "chrds-up"
  s1 a s1 a
  d1 a2:7 d s1 a2:7 d

  g1 d4:7/ef \set chordBassOnly = ##t d:/d d:/gs d:/a
  \set chordBassOnly = ##f
  d1:7 | g | g:7.9- |
  c4:m bf:7/d c:m7/ef f:7
  bf2 c4:m7 d8:m/f f:7
  bf4 s2.
  f1 c2:7 f
  s1 c2:7 f
  bf1 f4:7 \set chordBassOnly = ##t f:/g f:/a f:/c
  \set chordBassOnly = ##f
  f1:7
  bf4 \set chordBassOnly = ##t bf:/c bf:/d bf:/f
  \set chordBassOnly = ##f
  bf1 | c4:m d:dim ef:6 f:7 |
  bf1
  \set chordBassOnly = ##t bf2:/bf s2
  \set chordBassOnly = ##f
  s1
  bf1 s1*3 s2 ef:m/bf
  bf1 s2 ef:m/bf
  bf4 \set chordBassOnly = ##t bf:/a bf:/af bf:/g
  \set chordBassOnly = ##f
  c2 c:/c s1
  \repeat unfold 4 {c2. d4:m/g}
  c2 d4:m/c c
  s1 s2 d4:m/c c
  c4 e:m/b g:m/bf a:7
  \repeat unfold 2 { d4 s2.
  e4:m a8:7 s8 d4 s4 }
  g1 |
  d4:7 \set chordBassOnly = ##t d:/fs d:/a d:/c

  d1 |
  g4 \set chordBassOnly = ##t g:/b g:/d g:/f
  g1:7
  c4 d e8:m e:/ef e:/d e:/c
  g4 gs:dim a:m7 d:7
  g2 s2 s1
  ef2. bf4:7
  ef1 s1*2
  ef2. bf4:7
  ef1 s1*4
  d1 s1*3 d1:7 s1*5
  \set chordBassOnly = ##f
  d4:7.9+ c:/d d:5- fs:dim
  g1
  g1
  d4:7.9- \set chordBassOnly = ##t
  d:/fs d:/a d:/ef
  s1
  g4:7 g:/b g:/d g:/f
  s1
  c4:m d:dim ef:6 f:7
  bf1 s1*2
  ef1 f2:m ef2
  s1
  bf2:7 ef2
  af1 ef4:7 ef:/g ef:/bf ef:/df
  s1
  af4 af:/c af:/ef \set chordBassOnly = ##f af:7/gf
  s1
  df4 ef:dim df:m7/ff gf:7
  b4 s2.
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
%     \new ChordNames = "chrds-down" \with {
%       \consists Percent_repeat_engraver
%       \override PercentRepeat.Y-offset = #1
%       \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0)
%     } \chordmode{\alive}
    \context Voice = "voice" \Annotation
  >>
}
