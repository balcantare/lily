\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Ai da njä Budjitje"


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
    #:factor (/ staff-height pt 20)
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
                             (padding . 8))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      %\on-the-fly \print-page-number-check-first
     \line{
        - \hspace #1 \commitDate \hspace #1 -
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1  )) #f))))
dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -3)
}

dropLyricsB = {
\override LyricText.extra-offset = #'(0 . -1.5)
\override LyricHyphen.extra-offset = #'(0 . -1.5)
\override LyricExtender.extra-offset = #'(0 . -1.5)
\override StanzaNumber.extra-offset = #'(0 . -1.5)
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}
skipA = \repeat unfold 4 { \skip 4 }
skipB = \repeat unfold 8 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }

lyrStropheA = {
  \lyricmode {
  Ai da njä bu -- dji -- tje
  tu -- men man ma -- la -- do -- wa
  ai da po -- ka sol -- nusch -- ka
  ro -- ma -- le
  njä sai -- djot.

  e -- e -- ej e -- ej lju -- ba
  da -- nu -- li tscha -- tscho da -- le
  ai po -- ka sol -- nusch -- ka
  ro -- ma -- ___ -- le
  njä said -- jot.
}}

skipA = \repeat unfold 14 { \skip 4 }

lyrStropheB = {
  \lyricmode {
  Ai -- ___ -- den tschi den tschi
  ___ zi -- wo -- nes -- ke wol -- ja
  jo -- ___ -- we we -- li -- dja -- la
  pre ba -- ch i dol -- ja
  \skipA
  jo -- we we -- li -- dja -- la
  pre ba -- ch i dol -- ___ -- ja
}}

lyrStropheC = {
  \lyricmode {
  Ai sa -- chatsch -- ki rend -- tsches
  oi lus -- tri o jaga o__ja -- ga
  tscho ___ njä sa -- patsch -- ka -- tj
  tscha -- ves -- ke te -- ra -- cha
  \skipA
  tscho  njä sa -- patsch -- ka -- tj
  tscha -- ves -- ___ -- ke te -- ra -- cha
}}

lyrStropheD = {
  \lyricmode {
}}


strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle modern %-voice-cautionary
  \time 4/4
  \key e \minor
  b4. a8 b4 b8( c) |
  a4.( g8) g4 r8. b16 |
  b4. a8 b4 b8( c) |
  a4.( g8) g4 r4 | \break
  b4. a8 b4 b8( c) |
  a4. g8 a4 r8 b |
  a8( g) g2 fs8 e8 |
  e2 r2 | \break
  b' d |
  cs4. r8 d4 cs |
  b4 b r b8 b |
  b4. a8 c4 b8 a |
  r4 b4 b b8( c) |
  a4. g8 a4 r8 b8 |
  a4 b8( a) g4 fs8 e |
  e2 r |

  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  e2.:m s4 %a4:m
  b2:7 e:m
  e2.:m s4 %a4:m
  b2:7 e:m
  e2.:m s4 %a4:m
  a2:m b2:7
  c b:7  e1:m
  g a e:m
  a2:m b2:7
  e1:m
  a2:m b2:7
  c2 b2:7
  e1:m

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
  %\new Lyrics \lyricsto "Strophe" \lyrStropheD
  % \new Staff <<
  %   \new Voice = "Basso" { \stropheBass }
  >>
}
