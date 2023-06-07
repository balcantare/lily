\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Romano Drom"


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
  Šu -- nas ti -- ro lav tu de -- ha
  aj -- so šaj
  tu šaj ti -- ro lav me tut mi -- ri
  la -- či oj ba -- re ver -- da  -- ne -- ha
  na do -- tra den te len šu -- nav i -- vi  i -- ti

  aj ne aj ne ne aj ne ne aj ne ne
  te len šu -- nav aj me i -- vi  i -- ti
}}

lyrStropheB = {
  \lyricmode {
}}

lyrStropheC = {
  \lyricmode {
}}

lyrStropheD = {
  \lyricmode {
}}


strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key a \minor
  \partial 2
  a2 |
  e1~ |
  e2 g |
  fs2 fs~ |
  fs e4.( fs8) |
  e2 c~ |
  c d4. e8 |
  d2( a)~ |
  a2. b4 |\break
  c1~ |
  c2 d |
  b2 b~ |
  b2. a4 |
  a1 |
  r4 e a gs |
  b1~ |
  b2^\fermata
  a2 |
  e'1~ |
  e2( g) |
  fs1~ |
  fs2 e4. d8 |
  e2 c~ |
  c d4. e8 |
  d2.( a4) |
  a2. g'4 |
  fs2.( g4)( |
  fs2) g2 |
  fs2. g4 |
  fs( e) g( fs) |
  e1~ |
  e~ | e
  r2 \break \repeat volta 2 {
    e2 |
    a1~ |
    a2 b4. a8 |
    g2.( e4)( |
    g1) |
    r2 f4. g8  |
    a2. g8 f |
    e2.( c4)( |
    e2.) g4 |\break
    fs2. fs4 |
    f2 f |
    d2. c4 |
    d4( c) d( e) |
    c1~ |
    c1~ |
    c1~ |
    c2 }

  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  \set chordBassOnly = ##t
  s2
  a1:m
  c  d b:m a:m a:m/g
  \set chordBassOnly = ##f
  d:/fs f a:m s2 g
  d1:m6 e a:m s1 e1 s
  a:m c d b:m a:m
  \set chordBassOnly = ##t
  a:m/g

  d d:/a fs s b s e e:/d e:/c e:/b
  f d2:m g c1 a2:m a d1:m d:m7 a:m
  a:m/g \set chordBassOnly = ##f
  d:/fs f d:m e a:m
  \set chordBassOnly = ##t
   \startParenthesis \parenthesize
   a:m/b  \endParenthesis \parenthesize a:m/c

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
%  \new	Lyrics \lyricsto "Strophe" \lyrStropheB
%  \new Lyrics \lyricsto "Strophe" \lyrStropheC
  %\new Lyrics \lyricsto "Strophe" \lyrStropheD
  % \new Staff <<
  %   \new Voice = "Basso" { \stropheBass }
  >>
}
