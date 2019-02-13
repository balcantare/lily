%%%% The stylesheet for LILYJAZZ music font and LILYJAZZ-TEXT font
%%%%
%%%% In order for this to work, this file's directory needs to
%%%% be placed in LilyPond's path
%%%%
%%%% NOTE: If a change in the staff-size is needed, include
%%%% this file after it, like:
%%%%
%%%% #(set-global-staff-size 17)
%%%% \include "lilyjazz.ily"
%%%%
%%%% Copyright (C) 2014-2016 Abraham Lee (tisimst.lilypond@gmail.com)

\version "2.19.12"

\paper {
  #(define fonts
    (set-global-fonts
    #:music "lilyjazz"
    #:brace "lilyjazz"
    ;;#:roman "lilyjazz-text"
    #:sans "lilyjazz-chord"
    #:factor (/ staff-height pt 20)
  ))
}

\layout {
  \override Score.Hairpin.thickness = #2
  \override Score.Stem.thickness = #2
  \override Score.TupletBracket.thickness = #2
  \override Score.VoltaBracket.thickness = #2
  \override Score.SystemStartBar.thickness = #4
  \override StaffGroup.SystemStartBracket.padding = #0.25
  \override ChoirStaff.SystemStartBracket.padding = #0.25
  %\override Staff.Tie.thickness = #3
  \override Staff.Tie.line-thickness = #2
  \override Staff.Slur.thickness = #3
  \override Staff.PhrasingSlur.thickness = #3
  \override Staff.BarLine.hair-thickness = #4
  \override Staff.BarLine.thick-thickness = #8
  \override Staff.MultiMeasureRest.hair-thickness = #3
  \override Staff.MultiMeasureRestNumber.font-size = #2
  %\override LyricHyphen.thickness = #3
  %\override LyricExtender.thickness = #3
  \override PianoPedalBracket.thickness = #2
}

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

#(define-markup-command (arrow layout props) ()
   "Draw an Arrow."
   (interpret-markup layout props
     #{\markup \overlay {
        \override #'(thickness . 3)
        \translate #'( 0 . 1.82)\draw-line #'(-1.5 . 0)
        \translate #'( 1.3 . 1.8)\arrow-head #X #RIGHT ##f
        }
     #}
    ))


\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 0.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
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
        #title \hspace #1
        - \hspace #1 \fromproperty #'page:page-number-string
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

