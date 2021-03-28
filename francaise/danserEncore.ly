\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Danser Encore"


bookTitle = \markup {
  \fontsize #3 \larger
  \line { #sheetName }
}
\header { title = \bookTitle  tagline = ##f }

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 0.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  %page-count = #1
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
  \set stanza = #"Ref "
  \lyricmode {
    Nous on veut con -- ti -- nu -- er~à dan -- ser en -- core
    Voir nos pen -- sées en -- la -- cer nos corps
    Pas -- ser nos vies sur un -- e grille d'ac -- cords

    non non non non non non
    Nous on veut con -- ti -- nu -- er à dan -- ser en -- core
    Voir nos pen -- sées en -- la -- cer nos corps
    Pas -- ser nos vies sur un -- e grille d'ac -- cords

  }
}

lyrStropheA = {
  \set stanza = #"2. "
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

  }
}

refrain = \relative c'' {
    \key g \minor
   % Refrain
   g4 g8 g ~ 2 |r4 g8 g g g d' c ~ |
   c4. g8 g2 | r4 c8 c c c d c |
   bf4. g8 g2 | r8 bf bf bf bf bf c bf |
   a4. g8 a2    |
   r4 d8 d d c bf a |
   g4 bf8 g~ 2 | r4 d'8 d d d d f |
   f4. ef8 c2 | r4 ef8 ef ef ef d c |
   g'4. d8 bf2 | r8 d d d d d c bf |
   d4. a8 a2 |
}
strophe = \relative c'' {
   % Strophe
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
   d4. a8~ 2 |

}

chrdRefrain = \chordmode {
  g1:m |
}

chrdStrophe = \chordmode {
  g1:m |
}

\layout {
  \context {
    \Score
%    \override BarNumber.break-visibility = ##(#f #t #t)
%%    \override BarNumber.Y-offset = 0
%    \override BarNumber.X-offset = -2
  }
}

\score {
  <<
   \new ChordNames { \chrdRefrain \chrdStrophe }
   \new Voice = "Refrain" { \refrain
     \new Voice = "Strophe"  \strophe }
   \new Lyrics \lyricsto "Refrain" \lyrRefrain
   \new	Lyrics \lyricsto "Strophe" \lyrStropheA
  >>
}
