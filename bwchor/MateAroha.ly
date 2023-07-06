\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Mate Aroha"


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
  between-system-padding = #6
  ragged-right = ##f
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  page-count = #1
  markup-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 8)
                             (padding . 4))
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
    \set stanza = #"1. "
    Ma te a -- ro -- ha,
    ma te a -- ro -- ha,
    ma te a -- ro -- ha,
    \dropLyrics
    ka o -- ra e!
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = #"2. "
    Ho -- mai to rin -- ga,
    ho -- mai to rin -- ga,
    ho -- mai to rin -- ga,
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Wha ka -- pi -- ri mai,
    wha ka -- pi -- ri mai,
    wha ka -- pi -- ri mai,
  }}


strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \key e \major
  \partial 2
  gs8 fs4 e8
  fs4.( e8) cs2
  r2 fs8 e4 cs8
  e4.( cs8) b2
  r2 gs'8 fs4 e8
  fs4.( e8) cs2
  r4 ds e fs
  e1~ 2
  \bar "|."
}

stropheAlt = \relative c'' {
  %\voiceTwo
  \key e \major
  r2
  r2 r8 a a gs
  fs8 fs4. r2
  r2 r8 e e b
  e8( fs) gs4 b8 b4 b8
  b2 a4.( gs8
  fs4) fs gs a
  gs1~ 2

}


chrdStrophe = \chordmode {
  s2
  a1 b:7 e cs:m7 a b:7 e
}


\layout {
  \context {
    \Lyrics
    \override LyricText #'font-size = #+2
  }
  \context {
    \Score
  }
}

\score {
  <<
    \new ChordNames { \chrdStrophe }
    %\new ChoirStaff <<
    \new Staff <<
     \new Voice = "Strophe" { \strophe }
    >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Staff <<
      \new Voice = "StropheAlt" { \stropheAlt }
    >>
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheA
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheB
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheC
    %>>
  >>
}


