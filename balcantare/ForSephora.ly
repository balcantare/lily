\version "2.19.82"
#(set-global-staff-size 20)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"For Sephora"


bookTitle = \markup {
  \fontsize #1 %\larger
  \line { \sheetName }
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
  between-system-space = 0.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  page-count = #1
  markup-system-spacing = #'((basic-distance . 2)
                             (minimum-distance . 2)
                             (padding . 1))
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

strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle modern
  \time 4/4
  \key e \minor
   \mark \markup{ \box{\fontsize #2 In/Out}}
    \bar ".|:"
  \repeat volta 2 {
    e4-. e4~ e8 e8 r8 ds8~ |
    ds8 ds8 r8 ds8~ ds4 4-.|
    d4-. d4~ d8[ d8] r8 cs8~ |
  } \alternative {
    {cs8 8 r8 8~ 4 4-.}
    {r2 r8 b8 e8 g8 }
  } \break
  \repeat volta 2 {
    \mark \markup{ \box{\fontsize #2 A}}
    fs2~ 8 e b g
    fs2~ 8 e ds e
    b'2~ 8 a gs a~
    a4. a8 b c e fs
    ds4. a8 ds fs c' c~
    c4. ds,8 fs a c d
    b2. d16 c b a |
    fs8 ds c b a b e g
    \break
    \bar "||"
    fs2~ 8 e b g
    fs2~ 8 e ds e
    b'2~ 8 a gs a~
    a4. a8 b c e fs
    ds4. a8 ds fs c' c~
    c4. ds,8 fs a c d
    b2. d16 c b a |
    gs4. b8 c b g e
    \bar "||" \break
    \mark \markup{ \box{\fontsize #2 B}}
    d16 e d8 b8 c~ 2 |
    r4. a'8 b a fs d |
    b16 c b8 a b~ 2 |
    r4. g'8 a g fs e |
    \tuplet 3/2 {<e g>4 4 4}
    \tuplet 3/2 {<e g>4 <ds fs>4 <d f>4} |
    <ds fs>4. 8 \tuplet 3/2 {4 <e g>4 <fs a>4} |
    <g b>2 r4 d'16 c b a |
    gs4. b8 c b g e |

    \bar "||" \break
    d16 e d8 b8 c~ 2 |
    r4. a'8 b a fs d |
    b16 c b8 a b~ 2 |
    r4. g'8 a g fs e |
    g2~ g8 fs d' df |
    c8 b a g fs e ds e |
    <c a'>8 8 8 8 8 <b g'>8 <a fs'> <b g'>~ |
    2 r
  }
%\bar "|."
}

stropheBass = \relative c {
  %\voiceOne
  \clef bass
  \accidentalStyle modern
  \key e \minor
  e4. b8~ 4 e |
  ds4. b8~ 4 ds |
  d4. b8~ 4 d |
  cs4. e8~ 4 cs |
  cs4. e8~ 4 cs |

  e4. b8~ 4 e |
  b4. e8~ 4 b |
  a4. e'8~ 4 a, |
  e'4. a,8~ 4 e' |
  b4. fs'8~ 4 b, |
  fs'4. b,8~ 4 fs' |
  e4. b8~ 4 e |
  b4. fs'8~ 4 b, |

  e4. b8~ 4 e |
  b4. e8~ 4 b |
  a4. e'8~ 4 a, |
  e'4. a,8~ 4 e' |
  b4. fs'8~ 4 b, |
  fs'4. b,8~ 4 fs' |
  e4. b8~ 4 e |
  e4. gs8~ 4 e |

  a,4. e'8~ 4 a, |
  d4. a8~ 4 d |
  g,4. d'8~ 4 b |
  c4. c8~ 4 e |
  fs4. c8~ 4 4 |
  b4. b8~ 4 fs' |
  e4. 8~ 4 b |
  e4. b8~ 4 gs' |

  a4. e8~ 4 a |
  d,4. a'8~ 4 d, |
  g4. d8~ 4 g |
  c,4. g'8~ 4 c, |
  fs4. c8~ 4 fs |
  b,4. fs'8~ 4 b, |
  e4. 8~ 4 b |
  b4. 8~ 4 4 |

}

chrdStrophe = \chordmode {
 e1:m | e1:m7+ | e1:m7 |
 a1:7 | a1:7 |
 e:m s a:m s
 b:7 s e:m b:7
 e:m s a:m s
 b:7 s e:m e:7
 a:m7 d:7 g c
 fs:m5-7 b:7 e:m e:7
 a:m7 d:7 g c
 fs:m5-7 b:7 e:m b:7
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
   \new Staff <<
     \new Voice = "Strophe" { \strophe }
   >>
   \new Staff <<
     \new Voice = "Bass" { \stropheBass}
   >>
  >>
}
