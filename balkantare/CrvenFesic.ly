\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Cerven fesić"

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
   Cr -- ven fe -- sić,
   \dropLyricsA  ma __ _ mo \raiseLyrics
   cr -- ven fe -- sić
   \set stanza = #"1. "
   cr -- ven fe -- sić
   \dropLyricsA joj ma -- mi -- ce \raiseLyrics
   \set stanza = #"1. "
   cr -- ven fe -- sić,
   \dropLyricsB u dra -- ga -- na mo -- ga,
   \dropLyricsA
   joj ma -- mo ma -- mi -- ce!
}}
skipA = \repeat unfold 3 { \skip 4 }
skipB = \repeat unfold 4 { \skip 4 }
skipC = \repeat unfold 5 { \skip 4 }
skipD = \repeat unfold 5 { \skip 4 }

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
  Cr -- ne o -- či,
  %m -- a -- mo
  \skipA
  cr -- ne o -- či
  \set stanza = #"2. "
  cr -- ne o -- či
  %joj ma -- mi -- ce,
  \skipB
  \set stanza = #"2. "
  cr -- ne o -- či,
  %u dra -- ga -- na mo -- ga,
  %\skipC
  %\skipD%joj ma -- mo ma -- mi -- ce
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
   Med -- na us -- ta, \skipA
   med -- na us -- ta
   \set stanza = #"3. "
   med -- na us -- ta
   \skipB
   \set stanza = #"3. "
   med -- na us -- ta,
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Da me ho -- če, \skipA
    da me ho -- če
    \set stanza = #"4. "
    da me ho -- če
    \skipB
    \set stanza = #"4. "
    da me ho -- če pol -- ju -- bi -- ti mo -- ga

}}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"5. "
    Da -- la bih mu, \skipA
    da -- la bih mu
    \set stanza = #"5. "
    da -- la bih mu
    \skipB
    \set stanza = #"5. "
    da -- la bih mu sve ca -- re -- vo bla -- go
}}
strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \major
  a8 d cs d e4 e8( g)
  fs2 d8 cs b a
  a8 d cs d e4 e8 g
  fs1 \break
  \repeat volta 2 {
    r8 a4 gs8 a4 fs
    g8 g fs fs e4 fs
    g4.( fs8) g8 fs e d
    e1
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
  d2 a d1 s2 a2 d1
  d1 a s  s
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
