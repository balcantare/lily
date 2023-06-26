\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Solange unsre Lieder klingen"


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
  %markup-system-spacing = #'((basic-distance . 12)
  %                           (minimum-distance . 6)
  %                           (padding . 8))
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
%\set stanza = \markup{ \right-brace #50 }
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

skipB = {} %\repeat unfold 6 { \skip 8 }

lyrStropheA = {
  \lyricmode {

  So -- lan -- ge uns -- re Lie -- der klin -- gen,
  sind wir stark. So -- lan -- ge wir zu -- sam -- men
  sin -- gen loht sich je -- der neu -- e Tag!
  So -- lan -- ge uns -- re Lie -- der klin -- gen,
  spü -- ren wir, was wirk -- lich zählt, ja
  wir stehn hier und sin -- gen
  un -- ser Lied in die bun -- te Welt.
  \set stanza = #"1. "
  Son -- nen -- hel -- le Stra -- ßen
  bun -- te Blu -- men blühn am Rand.
  uns -- re We -- ge führ -- ten uns heut quer ü -- bers Land
  Strah -- lend bun -- te Som -- mer -- grü -- ße
  brin -- gen wir euch mit.
  Und in tau -- send Far -- ben ma -- len wir da -- raus mit euch ein Lied!
}}

skipA = \repeat unfold 59 { \skip 1 }
lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = #"2. "
  Leu -- te, macht die Her -- zen auf und lasst die Son -- ne rein.
  Wär -- me gibt uns Men -- schen Kraft
  und läßt uns ver -- zeihn.
  Viel -- falt öff -- net uns -- re We -- ge,
  Ein -- falt macht sie dicht.
  Bun -- te Far -- ben sind ein Se -- gen.
  Bunt ist selbst das Son -- nen -- licht!
}}


lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = #"3. "
    Öff -- net heu -- te al -- le Stra -- ßen
    und die Tü -- ren weit.
    Lasst den fri -- schen Wind he -- rein,
    es ist an der Zeit,
    daß der Welt an al -- len Or -- ten
    bun -- te Freu -- de sprüht,
    und das Lie -- be
    wie ein Vo -- gel frei durch un -- sern Him -- mel zieht.
    }}

lyrStropheD = {
  \lyricmode {
   \skipA
    \set stanza = #"4. "
}}

skipC = \repeat unfold 8 { \skip 8 }

lyrStropheE = {
  \lyricmode {
   \skipA
    \set stanza = #"5. "
}}

strophe = \relative c' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \major
  \partial 8
  a8
  a'8[ 8 8 16 16]~ 8 g fs e
  d4 g8 fs~ fs4. fs8
  g8[ 8 8 16 16]~ 8 fs e d
  a'8 a a b a16 g8 e16~ 4
  r2 r4 r8 a,8
  a'8[ 8 8 16 16]~ 8 g fs e
  g8 8 8 8 16[ fs16~ fs8 e d]
  fs2~ 8 8 8 a
  g8 fs~ 2 g8 a
  g4 g~ 8[ 8 8 g16 fs]~
  1
  \bar "||" \break
  fs16[ fs16~ 8 fs8 a16 g16]~ 8 fs8 e d
  d8 d d b16 a~ 2
  d8[ d d e16 g]~ 8 fs e d
  e4 fs8 g e2
  fs8 8 8 a g16[ fs8 d16~ 8 b]
  d16[ 16~ 8 8b] a4 d8 e
  g8 fs~ 2 e8 d
  d4 b2 d8 8
  d2~ 8 8 fs a
  a2 r4 r8
  \bar "|."
}


stropheAlt = \relative c'' {
    %\voiceOne
  %\key g \major
   %s2 s
}

stropheBass = \relative c' {
  %\clef bass
}

chrdStrophe = \chordmode {
 % s2 s
 s8
 d1 g2 d g1
 e2:m a:7
 g4 a2.
 d1
 g1
 d b:m g d
 d2 g
 e:m d
 s b:m
 e:m a:7
 d g e:m d
 b1:m g e:m
 a4 g a
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
     %  \new Voice = "StropheAlt" { \stropheAlt }
   >>
  % \new Lyrics \lyricsto "Refrain" \lyrRefrain
  \new Lyrics \lyricsto "Strophe" \lyrStropheA
  \new Lyrics \lyricsto "Strophe" \lyrStropheB
  \new Lyrics \lyricsto "Strophe" \lyrStropheC
  %\new Staff <<
  %   \new Voice = "StropheAlt" { \stropheAlt }
  %  >>

  %\new Lyrics \lyricsto "StropheAlt" \lyrStropheD
  >>
}
