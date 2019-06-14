\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Miracle"
sheetNr   = #"10"

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
  page-count = #1
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
    '(5 9 21 25 33 37 39 47 55 59 61 65  )) #f))))


%alive = { s1*10 }

%Annotation= {
%}
BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \key d \major
    \bar ".|:"
    \repeat volta 2 {
      fs4:16 b: e: a: | a: e: b: fs: |
    }
    \set Score.currentBarNumber = #5
    s1*5
    s2. a,4( |
   b4 cs d e | d1)
   \override ParenthesesItem.font-size = #4
   \repeat unfold 3 {
    e1 |

    \startParenthesis \parenthesize e4( d) e(
    \endParenthesis \parenthesize d)
   }
    e1 |
    a2 a4( b8)^\fz r8
    \repeat unfold 2 {
      <fs ~ a cs>1^( | <fs b ds>2) ~ 8 r8 r4 |
      a8 r r4 gs8 r r4
    } \alternative {
      { a'4->( gs8 fs) es( fs gs-.) r | }
      { b,2( as4.) r8 }
    }
    s1*2
    \set Score.currentBarNumber = #33
    b1--^"Rubato" cs--
    d,4(^"Tempo" cs d e)
    d'2.( cs8) r
    r8 a4.^\mf-> r8 a16-. a-. a8-. a-. |
    a2-> r8 a16-. a-. a8-. a-. |
    \repeat volta 3 { a1 ~  | a2 a16-. a-. a8-. a-. a-.
    \mark "3x" }
    \set Score.currentBarNumber = #45

 a1 ~  | a4 r4 r b8^\fz r |
    r8 a,4 a a a8 |
    r8 b4 b8 b'4 fs |
    a4-. r gs-. r
    a'8.(^\f b32 a gs8-.) fs-. es-. fs-. gs-. r |
    \slurUp a,1(  | fs2 ~ 8) r fs gs |
    \slurNeutral
    a4-. r gs-. r | b( as8 gs as4) \fermata r
    \repeat volta 2 { fs2( gs) | b( as) |}
    \set Score.currentBarNumber = #59
    <g b>1^"Rubato"(  <a cs>)
    b2(^"Tempo" a) | b( cs) |
    r8 g4.^\p ~ 2 | r8 a4. ~ 2 |
    r8 <fs a>4-- ~ 8-. r <gs b>4-- ~ 8-.
    r8 <a d>4-- ~ 8-. r <b e>4-- ~ 8-.
    r8 <d fs>4-- ~ 8-. r <e gs>4-- ~ 8-.
    \once \set glissandoMap = #'((4 . 0))
    <b d e g a >2 \glissando  d,4 r
    \bar "|."
  }
}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \key d \major
    s1*2
    g1( | a2.) fs4 |
    g1( | a2) fs4( d8 a)|
    g'1( | a2.) s4 |
    s1 r2  fs'8( d a b) |
    \repeat unfold 3 { g1 | fs | }
    g | fs2 d4( cs8) r |
    r1 | r1 |
    <gs fs' bs>8 r r4 <cs es b'>8 r r4
    r1*3
    <gs fs' bs>8 r r4 <cs es b'>8 r r4
    <cs' e fs>2 ~ 4. r8
    \repeat volta 2 {fs,2( gs) | b( as) |}
    <g, d' b'>1 | <a e' cs'>1 |
    s1
    <a e'>2. ~ 8 r
    s1*5 s2. <cs es b'>8 r
    cs2. cs4 | ds2. ds4 |
    <gs, fs' bs>4-. r <cs es b'>-. r
    r1 s1*2 \clef treble
    <c' ds fs>4-. r <b d es>-. r
    <cs e fs>2 ~ 4 r |
    <b d fs>2 ~ 2 |
    <cs ~ e ~ gs>2  <cs e fs> |
    <b d>1( <cs e>)
    s1*2 |
    r8 <b d e>4. ~ 2 | r8 <cs e gs>4. ~ 2 |
    \clef bass
    \repeat unfold 12 { <d, a' fs'>4 }
    a2 <d a' fs'>4 r
  }
}

% ChrdsUp = \notemode {
%   \override NoteHead.style = #'slash
%   \alive
% }
Chords = \chords {
  \set chordChanges = ##t
  %\chordmode {
  %\gotoCtx "chrds-up"
  d1*2:6.9
  \repeat unfold 7 { a1:sus7 d1:6.9}
  a:7 | d2.:6.9 cs4:7 |
  fs1:m | b | gs2:7.9- cs:7.9-  | gs2:7.9- cs:7.9-
  fs1:m | b | gs2:7.9- cs:7.9-  | fs:sus7 fs:7
  b:m b:m6 | cs:m fs:7
  g1 | a | a4:sus a:7 a:sus a:7 | e2.:m7 a4:7.9-
  d1:6.9 | d1:6.9
  a:sus7 d:6.9
  a1:7 | d2:6.9 cs:7 |
  fs1:m | b | gs2:7.9- cs:7.9- |gs2:7.9- cs:7.9- |
  fs1:m | b | c2:dim b:dim | s2 fs4:7 s |
  b2:m b:m6 | cs:m7 fs:7 |
  g1 | a1 |
  e2:m7 a:7 |e2:m7 a:7 |
  e1:m7 | a:7 |
  \repeat unfold 3 { d2 e2 |}
  a:sus7 d
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
  \new GrandStaff <<
    \new Staff = "up" {
      \BandR
    }
    \Chords
    \new Staff = "down" {
      \clef bass
      \BandL
    }
  >>
}

% \score {
%   \new StaffGroup \with {
%       \override StaffGrouper.staff-staff-spacing =
%     #'((basic-distance . 4)
%        (minimum-distance . 0)
%        (padding . 0)
%        (stretchability . 0))
%   }
%   <<
%     \new Staff = "chrds-up" \with {
%       \accepts ChordNames
%       \consists Percent_repeat_engraver
%       \remove Staff_symbol_engraver
%       \remove Time_signature_engraver
%       \remove Clef_engraver
%       \override ChordName.Y-offset = #-1.5
%     } \ChrdsUp
%     \new Staff = "staff" \with {
%       \accepts ChordNames
%       \consists Percent_repeat_engraver
%     }
%       <<
%         \new ChordNames \with {
%           \override ChordName.Y-offset = #-1.5
%         } \Chrds
%         \context Voice = "voice" \Notes
%       >>
%     \new ChordNames = "chrds-down" \with {
%       \consists Percent_repeat_engraver
%       \override PercentRepeat.Y-offset = #1
%       \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0)
%     } \chordmode{\alive}
%     \context Voice = "voice" \Annotation
%   >>
% }
