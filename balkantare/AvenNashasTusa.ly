\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Aven, nashas tusa"


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
  \set stanza = #"1. "
  Ge -- ya chai pa -- lo pa -- ny.
  A ch'a -- vo ge -- ya pa -- lai.
  \set stanza = #"1. "
  Ge -- ya chai pa -- lo pa -- ny.
  A ch'a -- vo ge -- ya pa -- lal:
  \set stanza = #"1. & 2. "
  A -- ven, na -- shas tu -- sa,
  A -- ven, na -- shas tu -- sa,
  A -- ven, na --
  \set stanza = #"1. & 2. "
  sha -- sa,
  me tu -- ke pxe -- nav!
  A -- ven, na --
  \set stanza = #"1. & 2. "
  shas tu -- sa,
  A -- ven, na -- shas tu -- sa,
  A -- ven, na --
  \set stanza = #"1. & 2. "
  sha -- sa,
  me tu -- ke pxe -- nav!
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Tu man, chá -- yo -- ri, kamé -- sa?
  Mé tut, ch'á -- vo -- ro, ka -- mám!
  \set stanza = #"2. "
  Tu man, chá -- yo -- ri, kamé -- sa?
  Mé tut, ch'á -- vo -- ro, ka -- mám!
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Syr a -- mén --  ge te na -- shás,
  Do -- gal -- yó -- na o psha -- lá!
  \set stanza = #"3. "
  Syr a -- mén --  ge te na -- shás,
  Do -- gal -- yó -- na o psha -- lá
  \set stanza = #"3. "
  Ay, tu -- ke dúkx de -- ná,
  Ay, mán -- ge dar de -- ná!
  Ay, syr a -- \set stanza = #"3. "
  mén -- ge pro své -- to te_dzhi -- vás?
  Ay, tu -- ke \set stanza = #"3. "
  dúkx de -- ná,
  Ay, mán -- ge dar de -- ná!
  Ay, syr a -- \set stanza = #"3. "
  mén -- ge pro své -- to te_dzhi -- vás?

}}

lyrStropheD = {
  \lyricmode {
    Da pro -- da -- mo, sa -- mo da i -- gra -- mo.
    Da pro -- da --  mo, Ja -- no du -- šo, sa -- mo
    da i -- gra -- ___ -- mo.
    Da pro -- da --  mo, Ja -- no du -- šo, sa -- mo
    da i -- gra -- ___ -- mo.
}}


strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key a \minor
  c4 r8 c c c b c |
  d1 |
  r8 d4 d8 d d c d |
  e1 | \break
  c4 r8 c c c b c |
  d1 |
  r8 d4 d8 d d c d |
  e8 r \bar "|" \break e4 f g |

  g4 f8 f r f f f |
  f4 e8 e r e e e |
  e4. d8 e d d cs |
  c2 r8 g' g g |
  \break
  g4 f8 f r f f f |
  f4 e8 e r e e e |
  e4. d8 e d d cs |
  c2 r8 g g16 g g8 |
  \break
  g8 f f f r8 f f16 f f8 |
  f8 e e e r e e16 e e8 |
  e8 d4 e8 d8 r d16 d d8 |
  c2. r4

  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  a1:m
  e:7  s
  a:m  s
  e s
  a4:m a b:dim a:7
  d1:m
  a:m
  e:7
  a2:m a
  d1:m
  a:m
  e
  a2:m a
 d1:m
  a:m
  e
  a:m

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
