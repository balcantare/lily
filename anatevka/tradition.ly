\version "2.18.2"
\language "english"


ViolinMotiv = {
         g4 | c g g g | g2. g4 | f f e f   | g2. g4 |
              c g g g | g2. g4 | f f ef df
}

FluteMotive = { c4 c8 d e4 f   | g8 fs g af g4 e | f8 e f g f4 df }

FluteMotiveI = { e8 ds e f e4 g | c g g g | g2. d4 | f f ef df  }


adLibRep = \markup{\italic{ ad lib. repeat}}

Annotation = {
  s2. s4\mf^"Violine"
  s1*7 | s1_"Flöte"
  s1\mf | s1*3 | s1\p
  s1*18
  \repeat volta 2
  {s1_\adLibRep^\markup { \center-align\line{\bold TEVYE: ... keep our balance? } }}
  \repeat volta 2
  {s1_\adLibRep^\markup {\null \lower #4
              \column{\line{That I can tell you }
                      \line{in one Word: Tradition!}}}}
  \repeat volta 2 s1

}


Violin = {
  \relative c''' {\ViolinMotiv c1 }
  \relative c'' {\FluteMotive e8 ds e f e2}
  \relative c'' {\FluteMotive }
  \relative c'' {c1 | c4 r g' r | c r g r | df' r af r | }
  \relative c'' {\FluteMotiveI}
  \relative c'' { f f4 ef df }
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

VoiceMotiveI = { g8 | g c ~ c2. ~ | c4. c8 c c4. | r1 | r8 c c c r4 r8 }
VoiceMotiveIt = { g8 | g <c e> ~ <c e>2. ~ | <c e>4. <c e>8 <c e> <c e>4. |
                  r1 | r8 <c e> <c e> <c e> r4 r8 }
VerseMotiveI = \lyricmode { Tra -- di -- tion __  tra -- di -- tion tra -- di -- tion }

Voice = \relative c'' {
    r2 r4 r8
    \VoiceMotiveI \VoiceMotiveIt
}
Verse = { \VerseMotiveI \VerseMotiveI}

Pause = { s1 s1*16 s1*16 }

bdRC = \relative c' { r4 < c g' e' > r < c g' e'> }
bdLC = \relative c  { c4 < g' e' > c, < g' e' > }

BdR = {
   \bdRC | \bdRC
}
BdL = {
  \bdLC  | \bdLC
}
Chords = {
  c1 | c1
}

\score {
  <<
    \new Staff = "voice" {
      \new Voice = "Voc" {
        \Pause s1 \Voice
      }
    }
    \new Lyrics \lyricsto "Voc" {
        \Verse
    }

    \new GrandStaff <<
      \new Staff = "up" {
        \context Voice = "A" \relative c'' {
          s2 s4
          \relative c''' {\ViolinMotiv c2. }
          <<
            \new Voice = "violin" { \voiceOne \Violin}
            \new Voice = "flute" { \voiceTwo \Flute  }
          >>
          \BdR
        }
      }
      \chords { \Pause \Chords }
      \context Voice = "A" \Annotation
      \new Staff = "down" {
        \clef bass
        \Pause
        \BdL
      }
    >>
  >>
  \midi { }
  \layout {
    \context {
      \Staff \RemoveEmptyStaves
      % To use the setting globally, uncomment the following line:
      \override VerticalAxisGroup.remove-first = ##t
    }
  }
}


%FluteMotive=
% #(define-music-function
%      (parser location dyn)
%      (ly:event?)
%   #{ c4-#dyn |
%   c8 d e4 f |
%   g8 fs g af g4 e |
%   f8 e f g f4 df |
%   e8 ds e f e2
%   #}
% )

% setDyn =
% #(define-music-function
%      (parser location)
%      ()
%    (set! mydyn #{\f#})
%    #{#})
