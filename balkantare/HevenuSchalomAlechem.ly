\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Hevenu Schalom Alechem"


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
dropLyrics = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -3)
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
  \set stanza = #"h) "
  He --  ve -- nu sha -- lom a -- le -- chem,
  He --  ve -- nu
  \set stanza = #"h) "
  sha -- lom a -- le -- chem,
  He --  ve -- nu
  \set stanza = #"h) "
  sha -- lom a -- le -- chem,
  He --  ve -- nu
  \set stanza = #"h) "
  sha -- lom,
  sha -- lom, sha -- lom,
  a -- le -- chem
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"d) "
  Wir woll -- len Frie -- den für al -- le,
  Wir woll -- len
  \set stanza = #"d) "
  Frie -- den für al -- le,
  Wir woll -- len
  \set stanza = #"d) "
  Frie -- den für al -- le,
  Wir woll -- len
  \set stanza = #"d) "
  Frie -- den, Frie -- den, Frie -- den für die Welt!
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"s) "
  Pře -- je -- my po -- koj  wšĕm lud -- źom,
  Pře -- je -- my
  \set stanza = #"s) "
  po -- koj  wšĕm lud -- źom,
  Pře -- je -- my
  \set stanza = #"s) "
  po -- koj  wšĕm lud -- źom,
  Pře -- je -- my
  \set stanza = #"s) "
  po -- koj, po -- koj, po -- koj kóž -- de -- mu!
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"su) "
    Pschee -- je -- my po -- koj schim lud -- schom,
    Pschee -- je -- my
    \set stanza = #"su) "
    po -- koj schim lud -- schom,
    Pschee -- je -- my
    \set stanza = #"su) "
    po -- koj schim lud -- schom,
    Pschee -- je -- my
    \set stanza = #"su) "
    po -- koj, po -- koj, po -- koj kujsch -- de -- mu!
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"f) "
    Nous vous an -- non -- çons la paix, ___
    Nous vous an --
    \set stanza = #"f) " non -- çons la paix, ___
    Nous vous an --
    \set stanza = #"f) "
    non -- çons la paix, ___
    Nous vous an --
    \set stanza = #"f) "
    non -- çons la paix, la paix,
    dans le monde!
}}

strophe = \transpose a d \relative c' {
  %\voiceOne
  \time 2/2
  \key a \minor
   \partial 4.
  e8 a c
  e2 c4. b8
  b8 a4. r8 a c e
  a2 f4. e8
  e8 d4. r8 d e f
  e2 d4. d8
  d8 c4. r8 c b a
  e'4 e e e
  e8 d c b
  a8
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \transpose a d \chordmode {
  s4.
  \set chordBassOnly = ##t
  a2:m a:m/e a:m/a a:m/e
  a:7 a:7/cs d:m d:m/f
  e:7 e:7/b a:m a:m/e
  e:7 e:7/b e:7/e a8:m
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
  % \new Staff <<
  %   \new Voice = "Basso" { \stropheBass }
  >>
}
