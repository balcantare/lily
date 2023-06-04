\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Aj Dewlale Koj Odi"


bookTitle = \markup {
  \fontsize #3 \larger
  \line { #sheetName }
}

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

% parentheses
startParenthesis = {
  \once \override ParenthesesItem.stencils = #(lambda (grob)
        (let ((par-list (parentheses-item::calc-parenthesis-stencils grob)))
          (list (car par-list) point-stencil )))
}

endParenthesis = {
  \once \override ParenthesesItem.stencils = #(lambda (grob)
        (let ((par-list (parentheses-item::calc-parenthesis-stencils grob)))
          (list point-stencil (cadr par-list))))
}

\header { title = \bookTitle  tagline = ##f }

\paper {
  #(define fonts
    (set-global-fonts
    #:music "lilyjazz"
    #:brace "lilyjazz"
    ;;#:roman "lilyjazz-text"
    #:sans "lilyjazz-chord"
    #:factor (/ staff-height pt 18)
  ))
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 3\cm
  between-system-padding = #2
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  page-count = #1
  markup-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 3)
                             (padding . 2))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
 % oddFooterMarkup = \markup {
 %   \fill-line {
 %     \on-the-fly \print-page-number-check-first
 %     \line{
 %       - \hspace #1 \commitDate \hspace #1 -
 %     }
 %   }
 % }
 % evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1  )) #f))))
dropLyrics = {
\override LyricText.extra-offset = #'(0 . -4.5)
\override LyricHyphen.extra-offset = #'(0 . -4.5)
\override LyricExtender.extra-offset = #'(0 . -4.5)
\override StanzaNumber.extra-offset = #'(0 . -4.5)
}
raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

skipEight = \repeat unfold 24 { \skip 2 }
lyrStropheA = {
  \lyricmode {
    Aj Dēw -- la -- le koj o -- di
    Ta -- vel man -- ge Bach -- ta -- li
    %\dropLyrics
    Oi le le le le le
    tai na na nai na na
    Oi le le le le ta -- i na na na na na
    %\raiseLyrics
    Mu -- ri zi -- ni lu -- lud -- ji
    lu -- lu djen -- gi schu -- kar raji
    %\dropLyrics
    tai na na na na le le le le na na na na na
    %\raiseLyrics
    Oi le le da -- na da da da ne ne ne
    tai na na na na tai la la la da da da de na
}}

lyrStropheB = {
  \lyricmode {
    Tschor da -- ni pe lu -- lu -- dji
    te na djal -- tar la -- ko dji
    \skipEight
    te na djal -- tar la -- ko dji
    Tsch'av -- lā me schu -- kar bōr -- ōri
}}

lyrStropheC = {
  \lyricmode {
  Usch -- ti op -- re sche -- je Hoj,
  Hū -- lav tut tai la -- schār tut
  \skipEight
  Hū -- lav tut tai la -- schār tut
  A -- ven le rom, man -- gen tut!
}}

lyrStropheD = {
  \lyricmode {
  Aj, Dēw -- la -- le Jal -- din -- la
  pe Ker -- tschi -- ma tra -- de -- la
  \skipEight
  pe Ker -- tschi -- ma, pe bā -- ri
  kaj pi -- jen e -- mol ta -- ti
}}


strophe = \relative c' {
  %\voiceOne
  \time 2/4
  \key e \minor
  \repeat volta 2 {
    \set Score.repeatCommands = #'((volta "1") end-repeat)
   e8 g g fs |
   g16 fs8. e8 r |
   e'16 d8. d8 b |
   b a g r
   \bar "||" | \break
   \set Score.repeatCommands = #'((volta "2") end-repeat)
   \bar ".|:" r8 g g fs |
   g4 fs8 e |
   r8 e' d b |
   b4 a8 g
   \bar "|" |
  \set Score.repeatCommands = #'((volta #f))
   \break
   r a a16 g a8 |
   a a16 c b8 a |
   b8 b4 b8~ |
   b8 r8 r4 |
   \break
   e,8 g g fs |
   g fs e4 |
   e'8 d d b |
   b a g r |
   \break
   fs16 e d8 d fs |
   g16 fs g8 a g16 fs |
   e8 e4 e8~ |
   e r r4  \bar ":|.|:" |
   \break
   \repeat volta 2 {
      <g b>2 |
      <a c>4. 8 |
      <g b>16 <fs a>16 <g b>8 8 8 |
      <b d>8 <a c> <g b> r |
      \break
      fs16 e d8 d fs |
      g16 fs g8 a4 |
      g16 fs e8 e4~ |
      e8 8 r4 |
   }
  }
}

stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  e2:m s g s
  e2:m s s4 g s2
  a:m s b:7 s
  e:m s g s
  d b:7 e:m s
  g d:7 g s
  d b:7 e:m s

}


\layout {
  \context {
    \Lyrics
    \override LyricText #'font-size = #+2
  }
  \context {
    \Score
%    \override BarNumber.break-visibility = ##(#f #t #t)
%%    \override BarNumber.Y-offset = 0
%    \override BarNumber.X-offset = -2
  }
}

\score {
  <<
   \new ChordNames { \chrdStrophe }
   %\new Voice = "Refrain" { \refrain
   \new Staff <<
     \new Voice = "Strophe" { \strophe }
    % \new Voice = "StropheAlt" { \stropheAlt }
   >>
  % \new Lyrics \lyricsto "Refrain" \lyrRefrain
   \new	Lyrics \lyricsto "Strophe" \lyrStropheA
   \new	Lyrics \lyricsto "Strophe" \lyrStropheB
   \new Lyrics \lyricsto "Strophe" \lyrStropheC
   \new Lyrics \lyricsto "Strophe" \lyrStropheD
  % \new Staff <<
  %   \new Voice = "Basso" { \stropheBass }
  >>
}
