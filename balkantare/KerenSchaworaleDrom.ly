\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Keren, Schaworale, Drom"


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
  Kē -- ren, scha -- wo -- ra -- le, drom,
  te kē -- lel o pu -- ro rom
  \set stanza = #"1. & 3."
  tai na na na na na da la la na na na
  \set stanza = #"1. "
  pu -- ro rom te ke -- le -- la
  Bisch -- ta -- jek djehs ma -- law -- la
  \set stanza = #"1. - 4. "
oi ne ne ne ne na na da na na na
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Ma -- lw mū -- ri tschis -- ma -- bāra
  te schu -- nēn ad -- jēs -- te -- hāra
  \set stanza = #"2. & 4. "
  oi, le le le _ ti tai na ne na na na
  \set stanza = #"2. "
  du -- i, du -- i, de -- schu -- dui
  tschu -- mi -- dau mē la -- ko mui
}}

skipA = \repeat unfold 12 { \skip 2 }

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  La -- ko mui si ru -- pu -- no
  pusch -- ke tru -- bul -- la di -- no
  \skipA
  \set stanza = #"3. "
  A -- ma -- ri si, a -- ma -- ri
  a -- ma -- ri zi -- ni bō --  ri
}}

lyrStropheD = {
  \lyricmode {
   \set stanza = #"4. "
   tai na na na_na tai na na
   tai le le ti tai  na na_na
   \skipA
   \set stanza = #"4. "
   Hoi, te -- mē -- rau, te mē -- rau
   te nā tscha -- tschi -- po pe -- nau!
}}


strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key a \minor
  c8 c c c |
  e8 e c4 |
  e8 e e c |
  a a f4 | \break
  r8 f8 f16 e f a |
  a8 a c a |
  e8 e4. |
  e4 r | \break
  c'8 c d c |
  a8 a f4 |
  a8 a b a |
  e e c4 | \break
  d4 d16 e f8 |
  g8 e  c[ r16 b] |
  a8 a4. |
  a4 r |

  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c' {
  \clef bass

}

chrdStrophe = \chordmode {
  a2:m s s s4 d:m
  d2:m s e s
  a:m s4 d:m s2 a:m
  d:m s4 e:7 a2:m s
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
