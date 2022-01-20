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
      \on-the-fly \print-page-number-check-first
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


lyrRefrain = {
  %\set stanza = #"Ref "
  \lyricmode {
    (Ah ja ja ja ja ja)
    Jetzt ist’s Zeit,
    wir wol -- len wie -- der tan -- zen geh’n
    und uns -- re Her -- zen zu -- ein -- an -- der dreh’n.
    Wir woll’n uns wie -- der in die Ar -- me nehm’n.
    Ah ja ja ja ja ja
    Jetzt ist’s Zeit,
    wir wol -- len wie -- der tan -- zen geh’n
    und uns -- re Her -- zen zu -- ein -- an -- der dreh’n.
    Wir woll’n uns wie -- der in die Ar -- me nehm’n.

  }
}

lyrStropheA = {
  \lyricmode {
    Wir sind der „frei -- e Vo -- gel flieg“
    wir wol -- len al -- le kei -- nen Krieg
    und wol -- len al -- le nicht ge -- hor --
    \set ignoreMelismata = ##t
    sam sein,
    \unset ignoreMelismata
    wir fal -- len nicht auf eu -- re Lü --
    \set ignoreMelismata = ##t
    gen rein,
    \unset ignoreMelismata
    8uns -- re Stim -- me kriegt ihr nie --
    \set ignoreMelismata = ##t
    mals klein!
    \unset ignoreMelismata

    Wenn a -- bends in der Ta -- ges -- schau
    ver -- kün -- det wird der Su -- per -- gau,
    wollt ihr uns wei -- ter un -- ter -- drü -- cken,
    wer -- den wir uns vor euch nicht bü -- cken,
    wir ha -- ben ei -- nen gra -- den Rü -- cken.
}}

lyrStropheB = {
  \lyricmode {
    8Ar -- beit, Fern -- seh'n und Kon -- sum
    Das wollt ihr, das sol -- len wir tun
    Soll'n uns ab -- sur -- den Re -- geln fü -- gen
    Uns -- re Le -- ben -- dig -- keit ver -- bie -- gen
    Und uns -- re Fan -- ta -- sie be -- trü -- gen

    Mit je -- dem neu -- en stren -- gen Schritt
    Und je -- dem re -- pres -- si -- ven Tritt
    Wird un -- ser Den -- ken euch ent -- flie -- hen
    Auf un -- ser Herz wir uns be -- zie -- hen
    Wir las -- sen nicht mehr auf uns zie -- len.
}}

lyrStropheC = {
  \lyricmode {
    Lasst uns den Men -- schen nicht mehr glauben
    Die8 8mit Lü -- gen Frei -- heit rau -- ben
    Woll'n mit Angst nur pro -- fi -- tie -- ren
    Uns da -- mit in den Ab -- grund füh -- ren
    Lasst uns die Lie -- be nicht ver -- lie -- ren

    Wir ha -- ben ei -- nen frei -- en Geist
    Der uns auf Mensch -- lich -- keit ver -- weist
    Wir la -- chen, tan -- zen und wir gei -- gen
    Das wird euch bald die Macht ver -- lei -- den
    Wir wol -- len im -- mer fried -- lich blei -- ben.
}}

refrain = \relative c'' {
    \key g \minor
   % Refrain
   r4 \override ParenthesesItem.font-size = #5
    \startParenthesis \parenthesize
   d8 d d c bf \endParenthesis \parenthesize a |
   g4 g8 g ~ 2 |r4 g8 g g g d' c ~ |
   c4. g8 g2 | r8 c8 c c c c d c |
   bf4. g8 g2 | r8 bf bf bf bf bf c bf |
   a4. g8 a2    |
   r4 d8 d d c bf a |
   g4 bf8 g~ 2 | r4. d'8 d d d f |
   f4. ef8 c2 | r8 ef8 ef ef ef ef d c |
   g'4. d8 bf2 | r8 d d d d d c bf |
   d4. a8 a2 \bar "||" \break |
}
strophe = \relative c'' {
   % Strophe
   r8 d8 d d d c bf a |
   g4 d'16 d d8 d8 c bf a |
   bf g g g8 g g g d' |
   c4. g8 ~ g2  |
   r8 ef' ef ef ef ef d c  |
   d4. bf8 ~ bf2 |
   r8 d8 d d d d c bf |
   d4. a8 ~ a2 |

   r8 d d d d c bf a  |
   g4 d'16 d d8 d c bf a |
   g8 g g g g g g d' |
   c4. g8~ g2 |
   r8 ef' ef ef ef ef d c |
   d4. g8~ 2 |
   r8 d d d d d c bf |
   d4. a8~ 2 \bar "|."
}


chrdRefrain = \chordmode {
  s1 g1:m s c:m s g:m s d:7 s
  g1:m s c:m s g:m s d:7 s
}

chrdStrophe = \chordmode {
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
  \transpose g d {
  <<
   \new ChordNames { \chrdRefrain \chrdStrophe }
   \new Voice = "Refrain" { \refrain
     \new Voice = "Strophe" { \strophe }
  }
   \new Lyrics \lyricsto "Refrain" \lyrRefrain
   \new	Lyrics \lyricsto "Strophe" \lyrStropheA
   \new	Lyrics \lyricsto "Strophe" \lyrStropheB
   \new Lyrics \lyricsto "Strophe" \lyrStropheC
  >> }
}
