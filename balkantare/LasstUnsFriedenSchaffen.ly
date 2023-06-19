\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Lasst uns Frieden schaffen"


bookTitle = \markup {
  \fontsize #1 % \larger
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
  %annotate-spacing = ##t
  indent = 0\mm
  %between-system-space = 1\cm
  %between-system-padding = #1
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  page-count = #1
  %markup-system-spacing = #'((basic-distance . 12)
  %                           (minimum-distance . 3)
  %                           (padding . 8))

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

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -4.5)
\override LyricHyphen.extra-offset = #'(0 . -4.5)
\override LyricExtender.extra-offset = #'(0 . -4.5)
\override StanzaNumber.extra-offset = #'(0 . -3.5)
\set stanza = \markup{ \right-brace #70 }
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

skipA = \repeat unfold 18 { \skip 2 }
skipB = \repeat unfold 5 { \skip 2 }
lyrStropheA = {

  \lyricmode {
  \set stanza = #"1. "
  Ach, ich wünscht', ich könn -- te flie -- gen,
  \set stanza = #"1. "
  fort von all dem Hass, de Krie -- gen,
  \set stanza = #"1. "
  fort von all dem Wahn -- sin,
  der uns in die En -- ge
  treibt.

  \set stanza = #"1. "
  in den Näch -- ten, die ich wa -- che,
  weil ich mir nur
  \set stanza = #"1. "
  Sor -- gen ma -- che,
  wird mir klar das
  \set stanza = #"1. "
  für uns
  Men -- schen doch nur ei -- nes
  bleibt:

  Lasst uns Frie -- den schaf -- fen,
  Lasst uns Frie -- den schaf -- fen,
  Lasst uns Frie -- den schaf -- fen,
  oh -- ne Waf -- fen!
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Stoppt die Macht der Rüs -- tungs -- bos -- se
  \set stanza = #"2. "
  und die We -- ge der Ge -- schos -- se,
  \set stanza = #"2. "
  die sie oh -- ne Skru -- pel
  über -- all -- hin ex -- por -- tie -- rn'!
  \set stanza = #"2. "
  Und Mil -- liar -- den Gel -- der flie -- ßen,
  da -- mit Men -- schen
  \set stanza = #"2. "
  sich er -- schie -- ßen
  und im Kampf der
  \set stanza = #"2. "
  Mäch -- ti -- gen doch im -- mer
  nur ver -- liern'.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Völ -- ker, lasst Euch nicht ver -- blen -- den,
  \set stanza = #"3. "
  Men -- schen nehmt Euch bei den Hän -- den!
  \set stanza = #"3. "
  Lasst nicht zu, dass sie uns auf -- ein -- an -- der
  het -- zen wolln'!
  \set stanza = #"3. "
  Denn in al -- len ih -- ren Krie -- gen
  wer -- den stets die
  \set stanza = #"3. "  Rei -- chen sie -- gen.
  Müt -- ter, leis -- tet
  \set stanza = #"3. "  Wi -- der -- stand,
  bevor_sie Eu -- re Söh -- ne holn'!
}}

lyrStropheD = {
  \lyricmode {

}}

lyrStropheE = {
  \lyricmode {
}}

strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \key d \minor
  %\partial 4
  a4 a8 a8~ a4 bf
  a4 bf8 a8~ a4 f
  g4 8 8~ 4 a
  g4 a8 g~ 4 e
  bf'4 bf8 8~ 4 4
  bf4 bf8 a8~ a4 g4
  e4 e8 e~ e4 f
  e1 \break
  d4 d8 d8~ d4 e
  d4 e8 f~ 4 g
  f4 f8 f~ 4 g
  f4 g8 a~ 4 a
  g4 g8 g~ 4 g
  g4 g8 a~ 4 g
  e4 e8 e~ 4 f
  e1
  r2 \break
  \repeat volta 2 {
    f4 e
  d2 d
  d4 d d e
  f2 f
  f4 f g f
  e2 e
  e4 e d c
  d4 d2. ~
  4 r }

  %\bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  d1:m s
  c s
  g:m s
  a:7 s
  d:m s
  f s
  g:m s
  a:7 s
  s
  d:m s
  f s
  c s
  d:m
  \parenthesize a2:7
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
  % \new Staff <<
  %   \new Voice = "Basso" { \stropheBass }
  >>
}
