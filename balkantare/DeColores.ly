\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"De Colores"


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
    #:factor (/ staff-height pt 23)
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
  \set stanza = #"1. "
  De co -- lo -- res, de co -- lo -- res se vis -- ten
  los  cam -- pos  en la pri -- ma -- ve -- ra,
  \set stanza = #"1. "
  de co -- lo -- res, de co -- lo -- res son los
  pa -- ja -- ri -- tos que vien -- en
  d'a -- fue -- ra,
  \set stanza = #"1. "
  de co -- lo -- res, de co -- lo -- res es el ar -- co
  i -- ris que ve -- mos lu -- cir,
  y por e -- so los gran -- des a -- mo -- res
  de mu -- chos co -- lo -- res
  me gus -- tan a mi,
  y por e -- so los gran -- des a -- mo -- res
  de mu -- chos co -- lo -- res
  me gus -- tan a mi,
}}

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   Cant' el gall -- o,
   cant' el gall -- o con il,
   ci -- ri, ci -- ri, ci -- ri, ci -- ri, ci -- ri,
   \set stanza = #"2. "
   la ga -- lli -- na,
   la ga -- lli -- na con el
   ca -- ra, ca -- ra, ca -- ra, ca -- ra, ca -- ra,
   \set stanza = #"2. "
   los po -- llu -- elos,
   los po -- llu -- elos con il
   pi -- o, pi -- o, pi -- o, pi -- o, pi,

}}


lyrStropheC = {
  \lyricmode {
   \set stanza = #"3. "

}}

lyrStropheD = {
  \lyricmode {
   \set stanza = #"4. "
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
}}

lyrStropheF = {
  \lyricmode {
  }}

strophe = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \key d \major
  a4.~ 4 g8 |
  g fs4~ fs8[ fs g]
  \repeat unfold 2 {a8[ a a] a[ g fs]}
  a8 g4~ g4.
  r2.
  g4.~ 4 fs8
  fs8 e4~ 8[ g a]
  \repeat unfold 2 {b8[ 8 8] b[ a g]}
  b8 a4~ a4. |
  r2.
  a4.~ a4 g8 |
  g8 fs4~ fs8[ fs g] |
  a8[ a a] a[ g fs] |
  a8[ a a] a8 b c] |
  b4. r8 g[ a] |
  b8[ b b] b[ cs b] |
  b8[ a a] a[ b a] |
  a[ g a] b[ a g] |
  fs4. r8 g[ a] |
  b[ b b] b[ cs b]
  b8[ a a] a[ b a] |
  a[ g a] b[ a cs,] |
  d2.

\bar "|."
}

stropheSopran = \relative c'' {
  %\voiceThree
  \key d \major
  \accidentalStyle neo-modern %-voice-cautionary
  d4.~ 4 b8 |
  b a4~ a8[ a b] |
  d8[ d d] d[ b a] |
  d8[ d d] d[ cs b]|
  cs8 a4~ a4.
  r2. \break
  cs4.~ cs4 b8 |
  b8 a4~ a8[ cs d] |
  \repeat unfold 2 {e8[ 8 8] e[ d cs]}
  e8 d4~ d4. |
  r2. \break
  d4.~ d4 b8 |
  a8 a4~ a8[ a b] |
  d8[ d d] d[ b a] |
  d8[ d d] d8[ cs c] |
  b4. r8 b[ cs] |
  d8[ d d] d[ e d] |
  d8[ a a] a[ b a] |
  a[ g a] b[ a g] |
  a4. r8 b[ cs] |
  d[ d d] d[ e d]
  d8[ a a] a[ b a] |
  a[ g a] b[ a cs,] |
  d2.

\bar "|."
}

stropheAlt = \relative c'' {
  \voiceTwo
  fs,4.~ 4 e8 |
  e d4~ d8[ d e]
  \repeat unfold 2 {fs8[ fs fs] fs[ e d]}
  fs8 e4~ e4.
  r2.
  e4.~ 4 d8
  d8 cs4~ 8[ e fs]
  \repeat unfold 2 {g8[ 8 8] g[ fs e]}
  g8 fs4~ fs4. |
  r2.
  fs4.~ fs4 e8 |
  e8 d4~ d8[ d e] |
  fs8[ fs fs] fs[ e d] |
  fs8[ fs fs] fs8 g a] |
  g4. r8 e[ fs] |
  g8[ g g] g[ a g] |
  g8[ fs fs] fs[ g fs] |
  fs[ e fs] g[ fs e] |
  d4. r8 e[ fs] |
  g[ g g] g[ a g]
  g8[ fs fs] fs[ g fs] |
  fs[ e fs] g[ fs e] |
  d2.
}

stropheBass = \relative c {
  \clef bass
  \key a \minor

}

chrdStrophe = \chordmode {
   d2. s s s a s a s s s
   d s d s s s g g d a d g d a d
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
     %\new Voice = "StropheSopran" { \stropheSopran }
     \new Voice = "Strophe" { \strophe }
     \new Voice = "StropheAlt" { \stropheAlt }
   >>
  % \new Lyrics \lyricsto "Refrain" \lyrRefrain
  \new	Lyrics \lyricsto "Strophe" \lyrStropheA
  \new	Lyrics \lyricsto "Strophe" \lyrStropheB
  \new Lyrics \lyricsto "Strophe" \lyrStropheC
  \new Lyrics \lyricsto "Strophe" \lyrStropheD
  \new Lyrics \lyricsto "Strophe" \lyrStropheE
  \new Lyrics \lyricsto "Strophe" \lyrStropheF
   \new Staff <<
     \new Voice = "Tenor" { \stropheSopran }
   >>
 >>
}
