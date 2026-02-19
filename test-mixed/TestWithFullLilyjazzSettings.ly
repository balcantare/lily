\version "2.24.0"
\include "../include/book.ily"

% Test: Include ALL lilyjazz settings in each \layout block

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header {
    title = "layout-set-staff-size WITH FULL lilyjazz settings"
    tagline = ##f
  }

  % Score 1: 20pt
  \bookpart {
    \paper {
      page-count = #1
    }
    \header { piece = "Score 1: 20pt" }
    \score {
      <<
      \new ChordNames \chordmode { c1 f c g c }
      \new Staff \relative c' {
        c4 d e f g a b c
      }
      \new Lyrics \lyricmode { C _ F _ C _ G _ C }
      >>
      \layout {
        % Jazz chord settings
        \context {
          \ChordNames
          chordRootNamer = #JazzChordNames
          chordNameExceptions = #JazzChords
          \override ChordName.font-name = #"lilyjazz-chord"
        }
        % Lilyjazz layout overrides (from lilyjazz.ily)
        \override Score.Hairpin.thickness = #2
        \override Score.Stem.thickness = #2
        \override Score.TupletBracket.thickness = #2
        \override Score.VoltaBracket.thickness = #2
        \override Score.SystemStartBar.thickness = #4
        \override StaffGroup.SystemStartBracket.padding = #0.25
        \override ChoirStaff.SystemStartBracket.padding = #0.25
        \override Staff.Tie.line-thickness = #2
        \override Staff.Slur.thickness = #3
        \override Staff.PhrasingSlur.thickness = #3
        \override Staff.BarLine.hair-thickness = #4
        \override Staff.BarLine.thick-thickness = #8
        \override Staff.MultiMeasureRest.hair-thickness = #3
        \override Staff.MultiMeasureRestNumber.font-size = #2
        \override LyricHyphen.thickness = #3
        \override LyricExtender.thickness = #3
        \override PianoPedalBracket.thickness = #2
        % The staff size
        #(layout-set-staff-size 20)
      }
    }
  }

  % Score 2: 16pt
  \bookpart {
    \paper {
      page-count = #1
    }
    \header { piece = "Score 2: 16pt (smaller!)" }
    \score {
      <<
      \new ChordNames \chordmode { g1 c g d g }
      \new Staff \relative c' {
        g4 a b c b a g2.
      }
      \new Lyrics \lyricmode { G _ C _ G _ D _ G }
      >>
      \layout {
        \context {
          \ChordNames
          chordRootNamer = #JazzChordNames
          chordNameExceptions = #JazzChords
          \override ChordName.font-name = #"lilyjazz-chord"
        }
        \override Score.Hairpin.thickness = #2
        \override Score.Stem.thickness = #2
        \override Score.TupletBracket.thickness = #2
        \override Score.VoltaBracket.thickness = #2
        \override Score.SystemStartBar.thickness = #4
        \override StaffGroup.SystemStartBracket.padding = #0.25
        \override ChoirStaff.SystemStartBracket.padding = #0.25
        \override Staff.Tie.line-thickness = #2
        \override Staff.Slur.thickness = #3
        \override Staff.PhrasingSlur.thickness = #3
        \override Staff.BarLine.hair-thickness = #4
        \override Staff.BarLine.thick-thickness = #8
        \override Staff.MultiMeasureRest.hair-thickness = #3
        \override Staff.MultiMeasureRestNumber.font-size = #2
        \override LyricHyphen.thickness = #3
        \override LyricExtender.thickness = #3
        \override PianoPedalBracket.thickness = #2
        #(layout-set-staff-size 16)
      }
    }
  }

  % Score 3: 24pt
  \bookpart {
    \paper {
      page-count = #1
    }
    \header { piece = "Score 3: 24pt (larger!)" }
    \score {
      <<
      \new ChordNames \chordmode { f1 c f c f }
      \new Staff \relative c' {
        f4 g a b a g f2
      }
      \new Lyrics \lyricmode { F _ C _ F _ C _ F }
      >>
      \layout {
        \context {
          \ChordNames
          chordRootNamer = #JazzChordNames
          chordNameExceptions = #JazzChords
          \override ChordName.font-name = #"lilyjazz-chord"
        }
        \override Score.Hairpin.thickness = #2
        \override Score.Stem.thickness = #2
        \override Score.TupletBracket.thickness = #2
        \override Score.VoltaBracket.thickness = #2
        \override Score.SystemStartBar.thickness = #4
        \override StaffGroup.SystemStartBracket.padding = #0.25
        \override ChoirStaff.SystemStartBracket.padding = #0.25
        \override Staff.Tie.line-thickness = #2
        \override Staff.Slur.thickness = #3
        \override Staff.PhrasingSlur.thickness = #3
        \override Staff.BarLine.hair-thickness = #4
        \override Staff.BarLine.thick-thickness = #8
        \override Staff.MultiMeasureRest.hair-thickness = #3
        \override Staff.MultiMeasureRestNumber.font-size = #2
        \override LyricHyphen.thickness = #3
        \override LyricExtender.thickness = #3
        \override PianoPedalBracket.thickness = #2
        #(layout-set-staff-size 24)
      }
    }
  }
}
