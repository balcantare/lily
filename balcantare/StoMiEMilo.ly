\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Sto Mi E Milo"

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
\override LyricText.extra-offset = #'(0 . -5.5)
\override LyricHyphen.extra-offset = #'(0 . -5.5)
\override LyricExtender.extra-offset = #'(0 . -5.5)
\override StanzaNumber.extra-offset = #'(0 . -5)
\set stanza = \markup{ \right-brace #80 }
}

dropLyricsB = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -2)
\set stanza = \markup{ \right-brace #50 }
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

lyrStropheA = {
  \lyricmode {
   \set stanza = #"1. "
   Što mi e mi -- lo,
   mi -- lo i dra -- go,
   \set stanza = #"1. "
   vo Stru --  ga gra -- da,
   ma -- mo, du -- kjan da i -- mam.
   \set stanza = #"1. - 4. "
   Le le va -- rej, mo -- me,
   mo -- me Ka -- li -- no,
   \set stanza = #"1. "
   vo Stru -- ga gra -- da ma -- mo,
   du -- kjan da i -- mam.
}}
skipA = \repeat unfold 11 { \skip 4 }
skipB = \repeat unfold 4 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }
skipD = \repeat unfold 5 { \skip 4 }

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   Na ker -- pen -- ci -- te,
   ma -- mo, da se -- dam,
   \set stanza = #"2. "
   strušh -- ki -- te mo -- mi
   ma -- mo mo -- mi da gle -- dam.
  \skipA
  \set stanza = #"2. "
  strušh -- ki -- te mo -- mi
   ma -- mo mo -- mi da gle -- dam.
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Ko -- ga no vo -- da, vo -- da mi o -- dat,
   \set stanza = #"3. "
   so ti -- ja stom -- ni, ma -- mo, stom -- ni ša -- re -- ni.
   \skipA
   \set stanza = #"3. "
   so ti -- ja stom -- ni, ma -- mo, stom -- ni ša -- re -- ni.
 }}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Na o -- vaj iz -- vor,
    iz -- vor stu -- de -- ni,
    \set stanza = #"4. "
    tam da se zrduž -- ki, ma -- mo,
    zrduž -- ki so -- be -- rat.
    \skipA
    \set stanza = #"4. "
    tam da se zrduž -- ki, ma -- mo,
    zrduž -- ki so -- be -- rat.

}}

lyrStropheE = {
  \lyricmode {
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 7/8
  \key d \major
   \bar ".|:"
  \repeat volta 2 {
    d4. fs4 g
    a4. a2
    b4. a8[( g)] fs([  g)]
    a4. a2 \break
    b4. a8[( g)] fs([ e)]
    e4 d8 a'4 g
    fs4. e8[( fs]) e4
    d4. d2
  } \break
  \repeat volta 2 {
    d8[( cs) d] e4 e
    e4. e2
    fs4. fs8[( e]) d[( e])
    fs4. 2 \break
    a4. b8[( a]) g[( fs])
    e4 d8 a'4 g
    fs4. e8[( fs)] e4
    d4. d2
  }
%\bar "|."
}


stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  d4. s2 s4. s2 g4. s2 d4. s2
  g4. s2 d4. g2 a4.:7 s2 d4. s2
  d4. a2:7 s4. s2 d4. s2 s4. s2
  d4. g2 d4. g2 d4. a2:7 d4. s2
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
  %\new Lyrics \lyricsto "Strophe" \lyrStropheE
  % \new Staff <<
  %   \new Voice = "Basso" { \stropheBass }
  >>
}
