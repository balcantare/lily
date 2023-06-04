\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Jovano Jovanke"


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
    #:factor (/ staff-height pt 16)
  ))
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 3\cm
  between-system-padding = #6
  ragged-right = ##f
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  page-count = #1
  markup-system-spacing = #'((basic-distance . 3)
                             (minimum-distance . 3)
                             (padding . 2))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
 % oddFooterMarkup = \markup {
 %   \fill-line {
 %     \on-the-fly \print-page-number-check-first
 %     \line{
 %       - \hspace #1 \commitDate \hspace #1 -
 %     }
 %   }
 % }
 % evenFooterMarkup = \oddFooterMarkup
}

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1  )) #f))))
dropLyrics = {
\override LyricText.extra-offset = #'(0 . -4.5)
\override LyricHyphen.extra-offset = #'(0 . -4.5)
\override LyricExtender.extra-offset = #'(0 . -4.5)
\override StanzaNumber.extra-offset = #'(0 . -4.5)
}
raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

skipEight = \repeat unfold 24 { \skip 2 }

lyrIntro = {
  \lyricmode {
    Jo -- va -- no,
    Jo -- va -- nke!
  }
}

lyrIntroAlt = {
  \lyricmode {
    Jo -- va -- no,
    Jo -- va --  nke!
  }
}


lyrStropheA = {
  \lyricmode {
    Kraj var -- da -- rot se -- diš
    mo -- ri be -- lo plat -- no be -- liš
    Be -- lo plat -- no be -- liš,
    du -- šo, Se -- na go -- re -- gle __ daš
}}

lyrStropheB = {
  \lyricmode {
    Ja šte te -- be če -- kam
    Mo -- ri do -- ma da mi doj -- deš
    A ti ne do vad -- jaš, du -- šo
    Srce mo -- je, Jo -- va __ no
}}

lyrStropheC = {
  \lyricmode {
  Tvo _ -- ja -- ta maj -- ka
  Mo -- ri te -- be ne te puš -- ta
  Kraj mi -- ne da -- do -- ješ, du -- šo
  Srce mo -- je, Jo -- va __ no
}}



intro = \relative c' {
  %\voiceTwo
  \time 7/8
  \set Staff.keyAlterations = #`((1 . ,SHARP)
                                 (3 . ,SHARP))
  \repeat volta 2 {
    ds4( fs8) e[( ds] c[ b]) |
    b4.~ b2 |
    fs'4( a8) g8[( fs] e[ ds16 e]) |
    fs4.~ 2 |
  }
  \break
}

introAlt = \relative c' {
  %\voiceOne
  \set Staff.keyAlterations = #`((1 . ,SHARP)
                                 (3 . ,SHARP))
  \clef bass
  \repeat volta 2 {
    r4. r2 |
    g4( fs8) e4 ds |
    ds'4. e4 c |
    b4.~ 2 |
  }
  %\break
}

strophe = \relative c' {
  \voiceOne
  \time 7/8
  \set Staff.keyAlterations = #`((1 . ,SHARP)
                                 (3 . ,SHARP))
  \repeat volta 2 {
    b'4 8 4 4 |
    b8[( a b]) c4 8[ b] |
    a4 8 4 4 |
    a8[( g a]) b2 |
    g4 8 4 a8[( b]) |
    c4 b8 a4 g |
    fs4 8 g[( fs]) g[( a]) |
    fs4( a8 g[ fs] e[ ds]) |
    ds4.~ 2 |
  }
}

stropheAlt = \relative c' {
  \voiceTwo
    g'4 8 4 4 |
    g8[( fs g]) a4 8[ g] |
    fs4 8 4 4 |
    fs8[( e fs]) g2 |
    e4 8 4 fs8[( g]) |
    a4 g8 fs4 e |
    ds4 8 e[( ds]) e[( fs]) |
    ds4( fs8 e[ ds] c[ b]) |
    b4.~ 2 |

}

stropheBass = \relative c {
  \accidentalStyle neo-modern-voice-cautionary
  \clef bass
  \set Staff.keyAlterations = #`((1 . ,SHARP)
                                 (3 . ,SHARP))
  e4 ds8 d4 cs |
  d4. 4 8[ 8] |
  ds4 8 4 4 |
  4. 2 |
  c4 8 4 e |
  4 8 ds4 e4 |
  b4 8 4 4 |
  c4.( 8[ b] a4) |
  b4.~ 2 |
}

chrdIntro = \chordmode {
  b4. s2 s4. s2 s4. s2 s4. s2
}
chrdStrophe = \chordmode {
  e4.:m s2
  a4.:m s2
  d4. s2
  g4. s2
  e4.:m s2
  a4.:m s2
  b4. s2
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
   \new ChordNames { \chrdIntro }
   \new ChoirStaff <<
   \new Staff <<
     \new Voice = "Intro" { \intro }
     \new Lyrics \lyricsto "Intro" \lyrIntro
   >>
   \new Staff <<
     \new Voice = "IntroAlt" { \introAlt }
     \new Lyrics \lyricsto "IntroAlt" \lyrIntroAlt
   >>
  >>
  >>
  }
\score {
  <<
    \new ChordNames { \chrdStrophe }
    \new ChoirStaff <<
    \new Staff <<
     \new Voice = "Strophe" { \strophe }
     \new Voice = "StropheAlt" { \stropheAlt }
    >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Staff <<
      \new Voice = "Basso" { \stropheBass }
    >>
    >>
  >>
}


   %\new	Lyrics \lyricsto "Strophe" \lyrStropheA
   %\new	Lyrics \lyricsto "Strophe" \lyrStropheB
   %\new Lyrics \lyricsto "Strophe" \lyrStropheC
   %\new Lyrics \lyricsto "Strophe" \lyrStropheD


