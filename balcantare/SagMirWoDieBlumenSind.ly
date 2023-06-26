\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Sag mir wo die Blumen sind"


bookTitle = \markup {
  \fontsize #1 \larger
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
\override LyricText.extra-offset = #'(0 . -5.5)
\override LyricHyphen.extra-offset = #'(0 . -5.5)
\override LyricExtender.extra-offset = #'(0 . -5.5)
\override StanzaNumber.extra-offset = #'(0 . -5.5)
%\set stanza = \markup{ \right-brace #70 }
}

dropLyricsB = {
\override LyricText.extra-offset = #'(0 . -2.7)
\override LyricHyphen.extra-offset = #'(0 . -2.7)
\override LyricExtender.extra-offset = #'(0 . -2.7)
\override StanzaNumber.extra-offset = #'(0 . -2.7)
%\set stanza = \markup{ \right-brace #70 }
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

skipA = \repeat unfold 13 { \skip 2 }

lyrStropheA = {
  \skipA
  \lyricmode {
  %\set stanza = #"1. "
  \dropLyricsB
  Sag mir wo die
  \raiseLyrics
  Blu -- men
  \dropLyricsA
  sind,
  wo sind sie ge -- blie -- ben?
  \dropLyricsB
  Sag mir, wo die
  \raiseLyrics Blu -- men
  \dropLyricsA sind,
  \dropLyricsB
  was ist ge -- scheh'n?
  \raiseLyrics
  Sag mir, wo die
  \raiseLyrics Blu -- men
  \dropLyricsA sind?
  \raiseLyrics
  Mäd -- chen pflück -- ten sie ge -- schwind.
  Wann wird man je ver -- stehn,
  wann wird man je ver -- stehn.
}}

skipB = \repeat unfold 4 { \skip 2 }
skipC = \repeat unfold 11 { \skip 2 }
skipD = \repeat unfold 9 { \skip 2 }
skipG = \repeat unfold 1 { \skip 2 }

lyrStropheB = {
  \lyricmode {
  \skipA
  \skipB
  Mäd -- chen
  \skipC
  Mäd -- chen
  \skipD
  Mäd -- chen
  \skipG
  Män -- ner nah -- men sie ge -- schwind.
}}

lyrStropheC = {
  \lyricmode {
   \skipA
   \skipB
   Män -- ner
   \skipC
   Män -- ner
   \skipD
   Män -- ner \skipG %sind?
   Zo -- gen fort, der Krieg be -- ginnt.
}}
skipE = \repeat unfold 7 { \skip 2 }
skipF = \repeat unfold 5 { \skip 2 }
lyrStropheD = {
  \lyricmode {
  \skipA
  Sag wo die Sol -- da -- ten
  \skipE
  Sag wo die Sol -- da -- ten
  \skipF
  Sag wo die Sol -- da -- ten
  \skipG
  Ü -- ber Grä -- bern weht der Wind.
}}

lyrStropheE = {
  \lyricmode {
    \skipA
    Sag mir wo die Grä -- ber
    \skipE
    Sag mir wo die Grä -- ber
   \skipF
   Sag mir wo die Grä -- ber
   \skipG
   Blu -- men blüh'n im Som -- mer -- wind.

   \skipD

}}

strophe = \relative c'' {
  %\voiceOne
  \time 2/2
  \key c \major
  %\partial 2.
  \mark \markup{ \fontsize #4 *}
  c2~  c8 b c b
  a2~ a8 b8 c e
  d2~ 8 e f a
  g1
  \bar "||" \break
  r4 g,8 a g4. f8
  e8 d4 c8~ 2
  r4 c'8 c c4. d8
  b8( a4) g8~ g2
  r4 g8 a g4. f8
  e8 d4 c8~ 2
  r4 f f4. e8
  d1
  r4 g8 a g4. f8
  e8 d4 c8~ 2
  r4 c'8 c c4. d8
  b8 a4 g8~ g2 \break
  r4 a f d
  c4 e8 g~ 2
  r4 a f e
  d2~ d8( e) d c~
  \mark \markup{ \fontsize #4 *}
  c1
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  %\set chordBassOnly = ##t
  c1 a:m d:m g
  c a:m f g
  c a:m
  d:m g
  c a:m f g
  f c
  f g c
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
