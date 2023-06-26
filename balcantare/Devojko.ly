\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Devojko"


bookTitle = \markup {
  \fontsize #2 \larger
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
    #:factor (/ staff-height pt 16)
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
\override LyricText.extra-offset = #'(0 . -4.5)
\override LyricHyphen.extra-offset = #'(0 . -4.5)
\override LyricExtender.extra-offset = #'(0 . -4.5)
\override StanzaNumber.extra-offset = #'(0 . -3.5)
\set stanza = \markup{ \right-brace #70 }
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
skipA = \repeat unfold 21 { \skip 4 }
skipB = \repeat unfold 11 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }

lyrStropheA = {
  \lyricmode {
  \skipA
  \set stanza = #"1. "
  De -- voj -- ko de -- voj -- ko
  mo -- me mre -- na ri -- ba.
  \set stanza = #"1. "
  Mo -- me mre -- na ri -- ba
  cr -- ve -- na ja -- bla -- ka.
}}

lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = #"2. "
  Sa te -- bje sym sle -- sal
  i_ot wrag i_ot pla -- ni -- na.
  \set stanza = #"2. "
  I_ot wrag i_ot pla -- ni -- na
  na zrs -- ta plad -- ni -- na.
}}


lyrStropheC = {
  \lyricmode {\skipA
    \set stanza = #"3. "
    To -- ku da te wid -- ja
    po -- wej -- na -- lo li si.
    \set stanza = #"3. "
    Po -- wej -- na -- lo li si
    i -- li po -- zer -- na lo.
}}

lyrStropheD = {
  \lyricmode {
    \skipA
    \set stanza = #"4. "
    De -- voj -- ko de -- voj -- ko
    kit -- ka zif -- ti na -- bra.
    \set stanza = #"4. "
    Kit -- ka zif -- ti na -- bra
    kit -- ka ras -- scha -- re -- na.
}}


strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle modern %-voice-cautionary
  \time 5/8
  \partial 4
  \key e \minor
  \bar ".|:"
  \repeat volta 4 {
     g8 a |
     b e, e a e |
     b' e, e a e |
     g fs d e fs |
  } \alternative {
     { e e e }
     { e4. }
  } \break
  \repeat volta 2 {
    \voiceOne
  g4 |
  a4. b4 |
  \appoggiatura b16 a4. a4 |
  \acciaccatura {g16 fs} e4. d4 |
  e4. fs4 |
  e4. e4 |
  e4.
  } \break
  \repeat volta 2 {
   d4 |
   e4. fs4 |
   e4. g4 |
   fs4. d4 |
   e4. fs4 |
   e4. e4 |
   e4.
  }
  %  \bar "|."
}


stropheAlt = \relative c' {
  \partial 4
  s4 |
  s8 s s s s | s8 s s s s | s8 s s s s |
  s8 s s s s | s
  \voiceTwo
  e4
  e4. e4 |
  e4. e4 |
  e4. d4 |
  d4. d4 |
  e4. e4 |
  e4.
  d4
  d4. d4 |
  d4. d4 |
  d4. d4 |
  d4. d4 |
  e4. e4 |
  e4. s4 |
}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  s4
  e4.:m s4
  s4. s4
  d4. s4
  e4.:m
  e4.:m s4
  e4.:m s4
  s4. s4 s4. s4 s4. s4 s4. s4 s4. s4
  e4.:m s4
  d4. s4 s4. s4 s4. s4
  e4.:m s4
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
     \new Voice = "StropheAlt" { \stropheAlt }
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
