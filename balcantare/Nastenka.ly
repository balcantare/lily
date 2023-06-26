\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Nasten'ka"


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
  \set stanza = #"1. "
  Ne, vy -- dj'a, Ne li, tu vy -- dj'a
  Na -- stin -- ke,
  Tu li vy -- dj'a, Ai, tu vy -- dj'a
  Go -- zhyn' -- ko mi -- ri.
  \once \override LyricText.self-alignment-X = #LEFT
  \set stanza = \markup { \right-align Refrain:}
  _ Ai, ne -- ne ne -- ne,
  Ai, ne -- ne ne -- ne
  Ai, ne -- ne -- ne -- ne, ne
  _ Ai, ne -- ne ne -- ne,
  Ai, ne -- ne, ne -- ne -- ne --  ne -- ne -- ne -- ne,
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"3. "
  %Ai, ne -- ne, ai ne -- ne -- ne -- ne,
  %Ai, ne -- ne
  %Ai, ne -- ne -- ne,
  %Ai, ne -- ne -- ne,
  %Ai, ne -- ne -- ne -- ne,
  Tu pok -- xel,
  Tu _ pok _ -- xel,
  Na -- stin -- 'ke.
  Tu pok -- xel,
  Ai, tu pok -- xel
  Tu, go -- zyhn' -- ko mi -- rí.
  \set stanza = #"2. "
  Na -- ne ko -- nes -- ke
  Na -- ne ko -- nes -- ke
  Na -- stya -- ke te -- e skxe -- lel
  Na -- ne ko -- nes -- ke
  Na -- ne ko -- nes -- ke
  Na -- stya -- ke te zba -- gal.
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    %\repeat unfold 24 { \skip 4 }
    Tu pok -- xel,
    Tu _ pok _ -- xel,
    Na -- stin -- 'ke.
    Tu pok -- xel,
    Ai, tu pok -- xel
    Tu, go -- zyhn' -- ko mi -- rí.
}}

lyrStropheD = {
  \lyricmode {
}}


strophe = \relative c' {
  %\voiceOne
  \time 2/4
  \key g \minor
  \mark \markup{ \box{\fontsize #4 A}}
   d8. d16 g4
   fs16 g a fs g4
   d4 e
   f2 \break
   d8. 16 g8. bf16
   8. a16 8 g
   g fs ef d
   \mark \markup{ \box{\fontsize #2 Fine}}
   d4. \break
   \repeat volta 2 {
     \mark \markup{ \box{\fontsize #4 B}}
   d8
   d8. d16 g8 16 16
   fs8. fs16 g8 16 16
   d8 8 e16 d e8
   f4. f8 \break
   d8. 16 g8 16 16
   bf8. a16 8 ef16 ef
   g8 fs ef d
   d4.

  }
}

stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
   d4:7 g:m
   d:7 g:m
   \set chordBassOnly = ##t
   g:m/g c
   f2
   d4:7 g:m
   \set chordBassOnly = ##f
   c:m c:dim/ef
   d2 s
   d4 g:m
   d:7 g:m
   \set chordBassOnly = ##t
   g:m/g c
   f2
   d4:7 g:m
   \set chordBassOnly = ##f
   c:m c:dim/ef
   d2 s4.

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
  % \new Lyrics \lyricsto "Strophe" \lyrStropheC
  % \new Lyrics \lyricsto "Strophe" \lyrStropheD
  % \new Staff <<
  %   \new Voice = "Basso" { \stropheBass }
  >>
}
\markup { \vspace #3  \hspace #6 \fontsize #2
  \column{
    \line{ \box{ A} 1. Strophe }
    \line{ \box{ B} Refrain}
    \line{ \box{ B} 2. Strophe}
    \line{ \box{ B} Refrain}
    \line{ \box{ A} 3. Strophe }
    \line{ \box{ B} Refrain}
    \line{ \box{A/B} Solo}
    \line{ \box{ A} 1. Strophe langsam}
    \line{ 2 x\box{ B} Refrain }
    \line{ \box{ A} 1. Strophe langsam .. \box{Fine}}


  }
}