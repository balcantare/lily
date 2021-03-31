\version "2.19.82"
#(set-global-staff-size 20)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"HK Danser Encore"


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
  between-system-space = 0.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  page-count = #2
  markup-system-spacing = #'((basic-distance . 2)
                             (minimum-distance . 2)
                             (padding . 1))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \line{
        #sheetName \hspace #1
        - \hspace #1 \fromproperty #'page:page-number-string
        \hspace #1 - \commitDate
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1  )) #f))))


lyrRefrain = {
  %\set stanza = #"Ref "
  \lyricmode {
    (non non non non non non)
    Nous on veut con -- ti -- nu -- er~à dan -- ser en -- core
    Voir nos pen -- sées en -- la -- cer nos corps
    Pas -- ser nos vies sur un -- e grille d'ac -- cords

    non non non non non non
    Nous on veut con -- ti -- nu -- er à dan -- ser en -- core
    Voir nos pen -- sées en -- la -- cer nos corps
    Pas -- ser nos vies sur un -- e grille d'ac -- cords

  }
}

lyrStropheAB = {
  \lyricmode {
    Nous sommes de -- s~oi -- seaux de pas -- sa -- ge
    Ja -- mais do -- ciles ni vrai -- ment sa -- ge
    Nous ne fai -- son pas al -- lé -- gean -- ce
    À l'au -- be~en tou -- tes cir -- con -- stan -- ces
    Nous ve -- nons bri -- ser le si -- len -- ce

    Et quand le soir à la té -- lé
    Mon -- sieur le bon roi a par -- lé
    Ve -- nu an -- non -- cer la sen -- ten -- ce
    Nous fai -- sons preuve d'ir -- ré -- ve -- ren -- ce
    Mais tou -- jours a -- vec e -- le -- gan -- ce

    Au -- to  mé -- tro  bou -- lot  con -- so
    Au -- to at -- tes -- ta -- tion qu'on sig -- ne
    Ab -- sur -- di -- té sur or -- don -- nan -- ce
    Et mal -- heur à ce -- lui qui pen -- se
    Et mal -- heur à ce -- lui qui dan -- se

    Cha -- que me -- sure au -- to -- ri -- tai -- re
    Cha -- que re -- lent sé -- cu -- ri -- tai -- re
    Voit s'en -- vo -- ler no -- tre con -- fidan -- ce
    Ils font preuve de tant d'in  -- sis -- tan -- ce
    Pour con -- fi -- ner not -- re con -- sci -- ence

    non non non non non non
}
}

lyrStropheC = {
  \lyricmode {
    Ne so -- yons pas im -- pres -- sion -- nab -- les
    Par tous ces gens dé -- rai -- son -- nab -- les
    Ven -- deurs de peur en a -- bon -- dan -- ce
    An -- gois -- sants, jus -- qu -- 'à l'in -- dé -- cen -- ce

    Sa -- chons les te -- nir à dis -- tan -- ce
    Pour not -- re san -- té men -- ta -- le
    So -- ci -- a -- le et en -- vi -- ron -- nem -- en -- ta -- le
    Nos sou -- ri -- res, no -- tre in -- tel -- li -- gen -- ce
    Ne so -- youns pas sans ré -- sis -- tan -- ce
    Les

}}

refrain = \relative c'' {
    \key g \minor
   % Refrain
   \once\override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #1 Ref}}
   r4 \override ParenthesesItem.font-size = #5
    \startParenthesis \parenthesize
   d8^"nur nach Strophe" d d c bf \endParenthesis \parenthesize a |
   g4 g8 g ~ 2 |r4 g8 g g g d' c ~ |
   c4. g8 g2 | r4 c8 c c c d c |
   bf4. g8 g2 | r8 bf bf bf bf bf c bf |
   a4. g8 a2    |
   r4 d8 d d c bf a |
   g4 bf8 g~ 2 | r4 d'8 d d d d f |
   f4. ef8 c2 | r4 ef8 ef ef ef d c |
   g'4. d8 bf2 | r8 d d d d d c bf |
   d4. a8 a2 \bar "||" \break |
}
stropheAB = \relative c'' {
   % Strophe
    \once\override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #1 Str_1}}
   r8 d8 d d d c bf a |
   bf8 g d'16 d d8 d8 c bf a |
   bf g g16 g g8 g g g d' |
   c4. g8~ g2  |
   r8 ef' ef ef ef ef d c  |
   d4. bf8~ bf2 |
   r8 d d d d d c bf |
   d4. a8 ~ a2 |

   r8 d d d d c bf a  |
   g4 d'16 d d8 d c bf a |
   g8 g g g g g g d' |
   c4. g8~ g2 |
   r8 ef' ef ef ef ef d c |
   d4. g8~ 2 |
   r8 d d d d d c bf |
   d4. a8~ 2 \bar "||" |
   \once\override Score.RehearsalMark.self-alignment-X = 0
   \mark \markup{\fontsize #1 {\arrow\box{Ref}}}
   s1 \bar "||" \pageBreak |
   \once\override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #1 Str_2}}
   r4 d8 d d c bf a |
   bf8 g d'16 d d8 d8 c bf a |
   bf g g16 g g8 g g g d' |
   c4. g8~ g2 |
   r8 ef' ef ef ef ef d c  |
   d4. bf8~ bf2 |
   r8 d d d d d c bf |
   d4. a8 ~ a2 |

   r8 d d d d c bf a  |
   bf8 g d'16 d d8 d c bf a |
   bf16 g g8 g g g g g d' |
   c4. g8~ g2 |
   r8 ef' ef ef ef ef d c |
   d4. g8~ 2 |
   r8 d d d d d c bf |
   d4. a8~ 2 \bar "||" |
   \once\override Score.RehearsalMark.self-alignment-X = 0
   \mark \markup{\fontsize #1 {\arrow\box{Ref}}}
   s1 \bar "||" \break |
   \once\override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #1 Interlude}}
  r4 d8 d d c bf a |
}

interlude = \relative c'' {
 g'8 fs g4~ 8 fs g a |
 bf2~ 8 a g f  |
 g f ef4~ 8 d c d |
 ef8 d c2 bf4 |
 \tuplet 3/2 {bf8 a bf}
 \tuplet 3/2 {c bf c}
 \tuplet 3/2 {d c d}
 \tuplet 3/2 {ef d ef}
 \tuplet 3/2 {f ef f}
 \tuplet 3/2 {g f g}
 \tuplet 3/2 {a g a}
 \tuplet 3/2 {bf a bf}
 \tuplet 3/2 {c bf c}
 \tuplet 3/2 {d c d}
 ef2 | d4 c bf a |
 \tuplet 3/2 {d,8 a bf}
 \tuplet 3/2 {d a bf} d8 d4 d8
 \tuplet 3/2 {d8 a bf}
 \tuplet 3/2 {d a bf } d8 d4 d8
 \tuplet 3/2 {ef b c }
 \tuplet 3/2 {ef b c } ef8 4 8
 \tuplet 3/2 {ef b c }
 \tuplet 3/2 {ef b c } ef8 4 8
 \tuplet 3/2 {d8 a bf}
 \tuplet 3/2 {d a bf} d8 d4 d8
 \tuplet 3/2 {d8 a bf}
 \tuplet 3/2 {d a bf} d8 d4 d8
 \tuplet 3/2 {d d d}
 \tuplet 3/2 {d d d}
 \tuplet 3/2 {d d d}
 \tuplet 3/2 {d d d}
 \bar "||" \break
}

stropheC = \relative c'' {
   % Strophe
    \once\override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #1 Str_3}}
   r8 d8 d d d c bf a |
   bf8 g d'16 d d8 d8 c bf a |
   bf g g16 g g8 g g g d' |
   c4. g8~ g2 |
   r8 ef' ef ef ef ef d c  |
   d4. bf8~ bf2 |
   r8 d d d d d c bf |
   d4. a8 ~ a2 |

   r8 d d d d c bf a  |
   g4 d'16 d d8 d c bf a |
   g8 g g g g g g d' |
   c4. g8~ g2 |
   r8 ef' ef ef ef ef d c |
   d4. g8~ 2 |
   r8 d d d d d c bf |
   d4. a8~ 2 \bar "||" |
   \once\override Score.RehearsalMark.self-alignment-X = 0
   \mark \markup{\fontsize #1 {\arrow\box{Ref}}}
   s1 \bar "||" |
}

chrdRefrain = \chordmode {
  s1 g1:m s c:m s g:m s d:7 s
  g1:m s c:m s g:m s d:7 s
}

chrdStropheAB = \chordmode {
  g1:m s c:m s bf s d:7 s
  g1:m s c:m s bf s d:7 s s
  g1:m s c:m s bf s d:7 s
  g1:m s c:m s bf s d:7 s
}

chrdInterlude = \chordmode {
  s1 g1:m s c:m s bf s d:7 s
  g1:m s c:m s bf s d:7 s
}

chrdStropheC = \chordmode {
  g1:m s c:m s bf s d:7 s
  g1:m s c:m s bf s d:7 s
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
   \new ChordNames { \chrdRefrain \chrdStropheAB \chrdInterlude \chrdStropheC }
   \new Voice = "Refrain" { \refrain
     \new Voice = "StropheAB" { \stropheAB
       \new Voice = "Interlude" { \interlude
         \new Voice = "StropheC" \stropheC
   }}}
   \new Lyrics \lyricsto "Refrain" \lyrRefrain
   \new	Lyrics \lyricsto "StropheAB" \lyrStropheAB
   \new Lyrics \lyricsto "StropheC" \lyrStropheC
  >>
}
