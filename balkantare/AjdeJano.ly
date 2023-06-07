\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Ajde Jano"


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
  \dropLyricsA
  Aj -- de Ja -- no
  \raiseLyrics
  ko -- lo da i -- gra -- mo,
  \dropLyricsA
  Aj -- de Ja -- no
  aj -- de du -- šo
  \raiseLyrics
  ko -- lo
  da i -- gra -- ___ -- mo.
  \dropLyricsA
  Aj -- de Ja -- no
  aj -- de du -- šo
  \raiseLyrics
  ko -- lo
  da i -- gra -- ___ -- mo.
}}

lyrStropheB = {
  \lyricmode {
  %Aj -- de Ja -- no
  \skipA
  kon -- je
  \dropLyricsB
  da pro -- da -- mo,
  \raiseLyrics
  %Aj -- de Ja -- no aj -- de du -- šo
  \skipB
  kon -- je
  \dropLyricsB
  da pro -- da -- ___ -- mo.
  %Aj -- de Ja -- no aj -- de du -- šo
  \raiseLyrics
  \skipB
  kon -- je
  \dropLyricsB
  da pro -- da -- ___ -- mo.
}}

lyrStropheC = {
  \lyricmode {
  %Aj -- de Ja -- no
  \skipA
  ku -- ču
  %da pro -- da -- mo,
  \skipA
  %Aj -- de Ja -- no aj -- de du -- šo
  \skipB
  ku -- ču
  %da pro -- da -- ___ -- mo.
  \skipC
  %Aj -- de Ja -- no aj -- de du -- šo
  \skipB
  ku -- ču
  %da pro -- da -- ___ -- mo.
  \skipC
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
  \time 7/8
  \key e \minor
  g4 fs8 e[( fs]) g4 |
  g4 fs8 fs4 e |
  e8[( fs e)] d2~ |
  d4.~ d2 | \break

  g4 a8 b4 b |
  a4 g8 fs4 e |
  a4 g8 fs4 e8[( fs]) |
  g4.~ 4 \tuplet 3/2 { fs8( g fs) } |
  e4.~ 2~ |
  4.~ 4 r |\break

  g4 a8 b4 b |
  a4 g8 fs4 e |
  a4 g8 fs4 e8[( fs)] |
  g4.^\fermata~ 4 \tuplet 3/2 { fs8( g fs) } |
  e4.~ 2~ |
  4.~ 2 |
  \bar "|."

}

stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  e4.:m s2 s4. s2
  d4. s2 s4. s2

  g4. s2
  a4.:m s2
  s4. s2
  e4.:m s2
  s4. s2 s4. s4 d

  g4. s2
  a4.:m s2
  s4. s2
  s4. s2
  e4.:m s2

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
