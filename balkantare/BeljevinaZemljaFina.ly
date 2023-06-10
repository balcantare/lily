\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Beljevina zemlja fina"

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
\override LyricText.extra-offset = #'(0 . -7.0)
\override LyricHyphen.extra-offset = #'(0 . -7)
\override LyricExtender.extra-offset = #'(0 . -7)
\override StanzaNumber.extra-offset = #'(0 . -6)
\set stanza = \markup{ \right-brace #90 }
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
  Bel -- je -- vi -- na
  zem -- lja zem -- lja fi -- na

   \dropLyricsA hop la -- ne mi -- lo -- la -- ne,
   \raiseLyrics
   \set stanza = #"1. " zem -- lja  zem -- lja fi -- na.
}}
skipA = \repeat unfold 7 { \skip 4 }
skipB = \repeat unfold 4 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }
skipD = \repeat unfold 5 { \skip 4 }

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   Da se da -- ješ ze -- tu ze -- to -- vi -- no,
   \skipA
   \set stanza = #"2. "
  ze -- tu ze -- to -- vi -- no.
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    I od ki -- ša i od i od sun -- ca,
    \skipA
    \set stanza = #"3. "
    i od i od sun -- ca.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Da se zem -- lja zem -- lji -- ca ras -- pu -- ca,
    \skipA
    \set stanza = #"4. "
    zem -- lji -- ca ras -- pu -- ca.
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"5. "
    Od šar -- den -- ka vo -- du vo -- du no -- si,
    \skipA
    \set stanza = #"5. "
    vo -- du vo -- du no -- si.
    }}

lyrStropheF = {
  \lyricmode {
    \set stanza = #"6. "
    Tu moj dra -- gi tra -- vu tra -- vu ko -- si,
    \skipA
    \set stanza = #"6. "
    tra -- vu tra -- vu ko -- si.
    }}

strophe = \relative c' {
  \voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \major
  \bar ".|:"
  \repeat volta 2 {
  d4 e fs4. g8
  fs8[ 8] 8[ e] fs4 8( e)
  }
  \repeat volta 2 {
   a4 e8 e d[ d] d[ d]
   cs[ e] d[ cs] b4 b
  }
%\bar "|."
}


stropheAlt = \relative c' {
  \voiceTwo
  d4 cs d4. e8
  d[ d] d[ cs] d4 d8 cs
  cs4 8 8 b[ b] b[ b] a[ a] a[ a] gs4 4
}

stropheBass = \relative c {
  \clef bass
  d4 a d a e' a, e' a,
  a'4 a8 a b b b b
  a a a a e4 e
}

chrdStrophe = \chordmode {
  d1 s
  a2 e a e
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
  \new Lyrics \lyricsto "Strophe" \lyrStropheA
  \new Lyrics \lyricsto "Strophe" \lyrStropheB
  \new Lyrics \lyricsto "Strophe" \lyrStropheC
  \new Lyrics \lyricsto "Strophe" \lyrStropheD
  \new Lyrics \lyricsto "Strophe" \lyrStropheE
  \new Lyrics \lyricsto "Strophe" \lyrStropheF
  \new Staff <<
    \new Voice = "Basso" { \stropheBass }
    >>
  >>
}
