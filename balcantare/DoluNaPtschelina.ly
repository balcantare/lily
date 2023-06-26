\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Dolu na ptschelina"


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
  \set stanza = #"1. "
  Kak -- wa mo -- ma wid -- jech, ma -- mo
  kak -- wa mo -- ma wid -- jech,
  \set stanza = #"1. "
  do -- lu na ptsche -- li -- na ma -- mo,
  do -- lu na ptsche -- li -- na.
  Do -- lu, do -- lu, do -- lu, do -- lu, do -- lu
  na ptsche -- li -- na.
  Hej, do -- lu, do -- lu, do -- lu, do -- lu
  na ptsche -- li -- na.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Tscher -- ni ot -- schi i -- ma, ma -- mo,
  tscher -- ni ot -- schi i -- ma,
  \set stanza = #"2. "
  ka -- to dwe tsche -- re -- schi, ma -- mo,
  ka -- to dwe tsche -- re -- schi.
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Bja -- lo li -- tze i -- ma, ma -- mo,
    bja -- lo li -- tze i -- ma,
    \set stanza = #"3. "
    ka -- to bjal tran -- da -- fil, ma -- mo,
    ka -- to bjal tran -- da -- fil.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Ru -- sa ko -- sa i -- ma, ma -- mo,
    ru -- sa ko -- sa i -- ma,
    \set stanza = #"4. "
    ka -- to tyn -- ka sli -- wa, ma -- mo,
    ka -- to tyn -- ka sli -- wa.
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"5. "
    I -- di ja po -- is -- kaj, ma -- mo,
    I -- di ja po -- is -- kaj,
    \set stanza = #"5. "
    da -- no mi ja da -- dat ma -- mo,
    da -- no mi ja da -- dat.
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle modern %-voice-cautionary
  \time 4/4
  \key d \minor
  d4 e f f
  f e e d
  d e f f
  f( e) e2
  d4 e f f
  f e e d
  g d d c
  d2 d \break
  \repeat volta 2 {
    \voiceOne
    d4 e f  f
    f g a a
    a g f g
    a2 a
    c2 g4 f
    e f g g
    g f e c
    d2 d
  }
  %\bar "|."
}


stropheAlt = \relative c' {
  s1 s s s s s s s
  \voiceTwo
  a4 c d d
  d e f f
  f e d e
  f2 f
  e2 e4 d c d e e
  e d a c d2 d
}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
 d1:m s s s2 a:m7
 d1:m s g:m d:m
 d:m s s s
 c s s2 a:7 d1:m
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
  \new Lyrics \lyricsto "Strophe" \lyrStropheE
  % \new Staff <<
  %   \new Voice = "Basso" { \stropheBass }
  >>
}
