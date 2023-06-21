\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Od yavo' shalom aleinu"


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
                             (padding . 8))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
 %     \on-the-fly \print-page-number-check-first
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


lyrStropheA = {
  \lyricmode {
  \set stanza = #"h) "
  Od ya -- vo' sha -- lom a -- lei -- nu,
  \set stanza = #"h) "
  od ya -- vo' sha -- lom a -- lei -- nu,
  od ya -- vo' sha --
  \set stanza = #"h) "
  lom a -- lei -- nu,
  Ve al ku -- lam.
  \dropLyricsA
  Sa -- laam
  \raiseLyrics
  \set stanza = #"h) "
  A -- lei -- nu ve' al kol ha o -- lam
  Sa -- laam Sa -- la -- am.
}}

skipA = \repeat unfold 2 { \skip 8 }
lyrStropheB = {
  \lyricmode {
  \set stanza = #"d) "
  Al -- len Men -- schen die -- ser Er -- de
  \set stanza = #"d) "
  wün -- schen wir, daß Frie -- den wer -- de,
  daß die Völ -- ker
  \set stanza = #"d) "
  die -- ser Er -- de fried -- lich
  ver -- eint!
  \skipA
  %Sa -- laam!
  \set stanza = #"d) "
  Wir hal -- ten fest an un -- se -- rem
  Traum %Sa -- laam!
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"s) "

}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"su) "
}}


strophe = \relative c' {
  %\voiceOne
  \time 2/4
  \key d \major
  \partial 8
  \bar ".|:"
  \repeat volta 2 {
  r8
  r8 d16 d d8 e
  fs fs e d
  r8 g16 16 8  8
  8 8 fs e
  r8 d16 d d8 e
  fs8 fs e d
  g8. fs16~ 8 e
  d4. } \break
  \repeat volta 2 {
  a'8
  a2~ 4 r8 d,
  b' a a g
  b a a fs~
  fs4 a8 d,~ d4 fs8 e~
  e8 d4.~
  d8 r4}

  % \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe =  \chordmode {
  s8
  d2 s
  g2 s
  d2 s
  g4 a d4.
  s8
  d2 s
  g2 s
  d2 s
  g2 s4.
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
