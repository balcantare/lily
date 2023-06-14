\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Utca Utca"


bookTitle = \markup {
  \fontsize #2 \larger
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
    #:factor (/ staff-height pt 22)
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
\override LyricText.extra-offset = #'(0 . -4.5)
\override LyricHyphen.extra-offset = #'(0 . -4.5)
\override LyricExtender.extra-offset = #'(0 . -4.5)
\override StanzaNumber.extra-offset = #'(0 . -3.5)
\set stanza = \markup{ \right-brace #70 }
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
skipA = \repeat unfold 21 { \skip 4 }
skipB = \repeat unfold 11 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Ut -- ca, ut -- ca ég az ut -- ca,
  mesz -- sze vi -- rít
  a láng -- ja,
  \set stanza = #"1. "
  De csak pi -- ros
  de csak pi -- ros
  a két or -- cád,
  le -- ány -- ka;
  \set stanza = #"1. "
  Nem ti -- tok,
  ki -- mon -- dom
  Ös -- sze -- ö -- lelt,
  ös -- sze -- csó -- kolt
  \set stanza = #"1. "
  az én
  ked -- ves ga -- lam -- bom.
  ked -- ves ga -- lam -- bom.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Az ö -- le -- lés meg az a csók,
  ki -- csi lány, még
  ko -- rán van.
  \set stanza = #"2. "
  Kárt te -- het án kárt te -- het ám
  a sok cupp, cupp a lány -- ban.
  \set stanza = #"2. "
  De -- hogy van,
  de -- hogy tesz.
  Ez a so -- ra a vi -- lá -- gon
  \set stanza = #"2. "
  va -- la -- míg egy le -- ány lesz.
  -- míg egy le -- ány lesz.

}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Brennt hier ei -- ne gan -- ze Gas -- se,
    Ist's ein Feu -- er, das hier flammt?
    \set stanza = #"3. "
    Nein, es sind nur
    dei -- ne Wan -- gen, Mäd -- chen, die in
    Glut ent -- brannt.
    \set stanza = #"3. "
    Sag' es mir, was es ist!
    Kein Ge -- heim -- nis, mein Ge -- lieb -- ter
    \set stanza = #"3. "
    Ist's, der im -- mer mich so küsst!
    im -- mer mich so küsst!
}}

lyrStropheD = {
  \lyricmode {
}}


strophe = \relative c' {
  %\voiceOne
  \accidentalStyle modern %-voice-cautionary
  \time 2/4
  \key d \minor
  d8 f d f d f d f
  g4 f a a
  d,8 d4 d8 \break
  a'8 c a c a c a c
  d4 c  e e a,8 a4 a8 \break
  \repeat volta 2 {
    d4 d c r
    bf bf a r
    d,8 f d f d f d f \break
    g4 f
  } \alternative {
    { a4 a d,8 d4 d8 }
    { a'4 cs d8 d4 d8 }
  }
  \bar "|."
}


stropheAlt = \relative c' {

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  d2:m s g:m a d:m a:m s
  d:m e a:m
  d:m c g:m a
  d:m s g:m
  a d:m
  a d:m
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
     \new Voice = "StropheAlt" { \stropheAlt }
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
