\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Poszła Karolinka"


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
skipA = {} % \repeat unfold 5 { \skip 8 }
skipB = {} %\repeat unfold 6 { \skip 8 }

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = #"1. "
  Po -- szła Ka -- ro -- lin -- ka
  do Go -- go -- li -- na,
  \set stanza = #"1. "
  a Kar -- li -- czek za nią,
  a Kar -- li -- czek za nią,
  z_fla -- szecz -- ką wi -- na.
}}

lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = #"2. "
  Ka -- ro -- lin -- ka geht nach
  Go -- go -- lin al -- lein,
  \set stanza = #"2. "
  Kar -- lit -- schek folgt ei -- lig,
  Kar -- lit -- schek folgt ei -- lig,
  mit 'nem Fläsch -- chen Wein.

}}


lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = #"3. "
    Go -- go -- lin ent -- ge -- gen
    wen -- det sie den Blick.
    \set stanza = #"3. "
    Nach dem hüb -- schen Bur -- schen,
    nach dem hüb -- schen Bur -- schen,
    schaut sie nicht zu -- rück.
     \skipB
     \dropLyricsA
    Ka -- ro -- lin -- ka,
    Ka -- ro -- lin -- ka,
    \raiseLyrics
    \set stanza = #"3. "
    wa -- rum gehst do so weit fort?
  }}

lyrStropheD = {
  \lyricmode {
   \skipA
    \set stanza = #"4. "
    Lie -- bes Weg -- lein, führ mich
    in die wei -- te Welt,
    \set stanza = #"4. "
    führ mich zu dem Bur -- schen,
    führ mich zu dem Bur -- schen,
    der mir mehr ge -- fällt.
}}

skipC = \repeat unfold 8 { \skip 8 }

lyrStropheE = {
  \lyricmode {
   \skipA
    \set stanza = #"5. "
    Lau -- fe mir nicht nach, du, sag's dir je -- den
    Tag,
    \set stanza = #"5. "
    sag's dir im -- mer wie -- der,
    sag's dir im -- mer wie -- der,
    daß ich dich nicht mag.
     \skipC
    %Ka -- ro -- lin -- ka,
    %Ka -- ro -- lin -- ka,
    \set stanza = #"5. "
    was hab ich dir nur ge -- tan?
}}

lyrStropheF = {
  \lyricmode {
   \skipA
    \set stanza = #"6. "
    Komm nach Hau -- se, Mäd -- chen,
    Gäs -- te war -- ten dort!
    \set stanza = #"6. "
    Bin schon auf der Brü -- cke,
    bin schon auf der Brü -- cke,
    bin schon zu weit fort!
}}

lyrStropheG = {
  \lyricmode {
   \skipA
    \set stanza = #"7. "
   Wa -- rum gehst du von mir?
   Was hab ich ge -- tan?
   \set stanza = #"7. "
   Das will ich nicht sa -- gen,
   das will ich nicht sa -- gen,
   das geht dich nichts an.
   \skipC
   \set stanza = #"7. "
   jetz brichst du mir gar mein Herz!
}}

lyrStropheH = {
  \lyricmode {
   \skipA
    \set stanza = #"8. "
    Das ist Ka -- ro -- lin -- kas
    al -- ler -- letz -- tes Wort,
    \set stanza = #"8. "
    und dem hüb -- schen Bur -- schen,
    und dem hüb -- schen Bur -- schen,
    läuft das Mädchen fort.
}}


strophe = \relative c'' {
  \voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key g \major
  %\partial 8
  %g'8-\prall^\markup{Akkordeon} d b a g4 r
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  g8 g d b'
  g4 d
  g8 g fs e
  d4 r } \break

  \mark \markup{ \box{\fontsize #4 B}}
  b8 c d d
  d4 e
  c8 c c c
  c4 d
  b8 b c c
  b2
  \bar "||"

  %\override ParenthesesItem.font-size = #5
  %\startParenthesis \parenthesize

  %b'8^\markup{ Mandoline} b b a g4
  %\endParenthesis \parenthesize
  %g'4
  \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 C}}

  b'4 b
  c8 b a g
  a4 e
  fs fs
  g8 fs e fs g2
  }
  %\bar "|."
}


stropheAlt = \relative c'' {
  \voiceOne
  \key g \major
   %s2 s
   b8 b b b
   b4 b
   c8 c c c
   b4 r

   g8 a b b
   b4 c
   a8 a a a
   a4 b
   g8 g a a
   g2^\markup{Mandoline}

   %s2 s2
   b4 g
   c8 b a g
   c4 e,
   a4 a
   b8 a g a
   b2^\markup{Akkordeon}
}

stropheBass = \relative c' {
  %\clef bass
}

chrdStrophe = \chordmode {
 % s2 s
 g2 s
 c g
 g s4 c
 d2 s4 g
 s d:7 g2
 % s2 s2
 g2 s
 a:m d s g

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
  \new Lyrics \lyricsto "Strophe" \lyrStropheG
  \new Lyrics \lyricsto "Strophe" \lyrStropheH

  %\new Staff <<
  %   \new Voice = "StropheAlt" { \stropheAlt }
  %  >>

  %\new Lyrics \lyricsto "StropheAlt" \lyrStropheD
  >>
}
