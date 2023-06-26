\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Nane Zocha"


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
  Na -- ne tso -- cha, na -- ne gad,
  mi ki -- nel man -- ge o dad
  sar me dža -- va pal o rom,
  mi ki -- nel man -- ge o rom ge o rom

  Naj na na na naj na na na na naj na
  na na naj na na na na na naj na
  na na naj na na na na a naj a na na na na na na naj na
  hop hop hop
}}

lyrStropheB = {
  \lyricmode {
  Da -- do ma -- mo cin če -- ňa,
  o la če -- ňa som -- na_ku -- ne
  sar tu man -- ge na ci -- ne_ha,
  na ba -- šav -- na o čha -- ja.
  o čha -- ja.
}}


lyrStropheC = {
  \lyricmode {
    Ge -- l'om me an -- dro -- da_sa -- dos,
    pri -- ker -- džo -- me
    les -- ke -- ro
    po -- ker -- džo -- me tro še -- ro,
    kaj tu ka -- mes mro ji -- lo
    mro ji -- lo

}}

lyrStropheD = {
  \lyricmode {
}}


strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key a \minor
  a4. b8 c( b) c4
  e4 d8( c) c2 \break
  r4 a'8 a a4. 8
  a8( g) g( fs) g4( a4) \break
  \repeat volta 2 {
  r8 f4 d8 g4. f8
  e8( f) e( ds) e4( c)
  r4 f8 f e4 d }
  \alternative {
    { a4 a a'( g) }
    { a,4 gs a r }
  } \bar "||" \break

\bar "|."
}


stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c {
  \clef bass
  \key a \minor
  %\fingeringOrientations
  a4 c-2 e-1 c |
  d-0 g,-2 c-2 e-1 |
  f-2 a-1 b-4 c-4 |
  g-0 e-1 a-1 e-1 |

  d-0 a-0 d f-2 |
  e-1 c-2 a-0 c-2 |
  d-0 a-0 e-0 gs-4 |
  a-0 b-1 c-2 cs-4 |

  a-0 e'-1 a,-0 e-0 |
}

chrdStrophe = \chordmode {
  a1:m g2:7 c
  f1 c2 a
  d1:m a:m7
  d2:m7 e:7 a:m7 cs:dim
  a4:m e:7 a2:m


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
%  \new Lyrics \lyricsto "Strophe" \lyrStropheD
   \new Staff <<
     \new Voice = "Basso" { \stropheBass }
   >>
 >>
}
