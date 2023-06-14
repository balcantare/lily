\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Andro Verdan"


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
    #:factor (/ staff-height pt 20)
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
skipA = \repeat unfold 3 { \skip 4 }
skipB = \repeat unfold 11 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  An -- dro ver -- dan grun -- dos na -- ne
  \set stanza = #"1. "
  man pi -- ra -- no schu -- kar na -- ne ___
  \set stanza = #"1. "
  lo -- li pā -- bai pred -- schi -- na -- va
  \dropLyricsA
  Hop Hop Hop \raiseLyrics
  \set stanza = #"1. "
  je -- pasch tu -- ke je -- pasch man -- ge
  \dropLyricsA
  Hop Hop Hop \raiseLyrics
  Lei lei lei lei  lei lei lei lei
  Hop Hop Hop
  \set stanza = #"1. "
  Je -- pasch tu -- ke je -- pasch man -- ge
  \dropLyricsA
  Hop Hop Hop \raiseLyrics

}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Hab' nen Wa -- gen kun -- ter -- bunt_und schön,
  \set stanza = #"2. "
  Kei -- nen bess -- 'ren hast du je_ge -- sehn! ___
  \set stanza = #"2. "
  Lauf mein Pferd -- chen, in die Wei -- te \skipA
  \set stanza = #"2. "
  Al -- le Rä -- der drehn sich heu -- te \skipA
  \skipB
  \set stanza = #"2. "
  Al -- le Rä -- der drehn sich heu -- te
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Tief im Gras fand ich den Apfel hier.
    \set stanza = #"3. "
    Wun -- der -- schön, wie Du ich will_ihn teilen mit_Dir!
    \set stanza = #"3. "
    Fiel he -- rab zu mei -- nen Fü -- ßen \skipA
    \set stanza = #"3. "
    Soll uns nun den Tag ver -- sü -- ßen \skipA
    \skipB
    \set stanza = #"3. "
    Soll uns nun den Tag ver -- sü -- ßen
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Lauf, mein Pferd -- chen bis zum Hori -- zont!
    \set stanza = #"4. "
    Dort -- hin, wo die ro -- te Sonne wohnt. ___
    \set stanza = #"4. "
    Zu dem Land, das wir nicht ken -- nen \skipA
    \set stanza = #"4. "
    Un -- ser Feu -- er   es wird bren -- nen!\skipA
    \skipB
    \set stanza = #"4. "
    Un -- ser Feu -- er   es wird bren -- nen!
}}


strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key a \minor
  e8 e e a, |
  d e f( d) |
  e2 |  \break
  d8 d d g |
  f8 e d8( b) |
  \override ParenthesesItem.font-size = #5
  c4. \startParenthesis \parenthesize b16( c |
  \endParenthesis \parenthesize cs2) | \break
  d8 d d d |
  e8. e16  c8 a |
  \override NoteHead.style = #'cross
  b b b4  |
  \revert NoteHead.style
  gs16 a8. b8 e |
  d16 c8. b8 gs |
  \override NoteHead.style = #'cross
  a8 a a4 |
  \revert NoteHead.style
  \break

  c8. d16 e8 e |
  f8. e16 c8 a |
  \override NoteHead.style = #'cross
  b8 b b r |
  \revert NoteHead.style
  gs16 a8. b8 e  |
  d16 c8. b8 gs |
  \override NoteHead.style = #'cross
  a8 a a r
  \bar "|."
}


stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  a2:m d4:m g c2 d:m g c
  \parenthesize a
  d:m a:m e a:m e:7 a:m
  a2:m  s %d2:m %a:m
  e2 %a:m e:7
  e s
  a:m
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
  % \new Staff <<
  %   \new Voice = "Basso" { \stropheBass }
  >>
}
