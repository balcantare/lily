\version "2.19.82"
#(set-global-staff-size 22)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Xekinai - Samiotissa"

bookTitle = \markup {
  \fontsize #2 %\larger
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
  between-system-space = 0.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  page-count = #1
  markup-system-spacing = #'((basic-distance . 2)
                             (minimum-distance . 2)
                             (padding . 1))
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
\override LyricText.extra-offset = #'(0 . -1.5)
\override LyricHyphen.extra-offset = #'(0 . -1.5)
\override LyricExtender.extra-offset = #'(0 . -1.5)
\override StanzaNumber.extra-offset = #'(0 . -1)
%\set stanza = \markup{ \right-brace #30 }
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
   Xe -- ki -- nai mja psa -- ro -- pu la
   \dropLyricsA
   ap' to ja -- lo,
   ap' to ja -- lo,
   \raiseLyrics
   \set stanza = #"1. "
   Xe -- ki -- nai mja psa -- ro -- pu la,
   ap' tin Id -- hra tin mi -- kru la.
   Kie pi -- je -- ni la sfu -- gar -- js,
   o -- lo jia -- lo, o __ _ lo ji -- a -- lo.
   \set stanza = #"1. "
   Sa -- mio -- tis -- sa,  Sa -- mio -- tis -- sa,
   po -- te tha pas sti Sa -- mo?
   Ro -- dha tha ri -- xo sto ja -- lo,
   Sa -- mio -- tis -- sa,
   trian -- ta -- fil -- la stin am -- mo.
   }}
skipA = \repeat unfold 4 { \skip 4. \skip 2 }
skipC = \repeat unfold 5 { \skip 4 }
skipD = \repeat unfold 5 { \skip 4 }

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   E -- chi me -- sa pal -- li -- kar -- ja
   \skipA
   \set stanza = #"2. "
   E -- chi me -- sa pal -- li -- kar -- ja
   pu vu -- ta -- ne ja sfu -- gar -- ja,
   ju -- ses ke mar -- ga -- ri -- tari -- a
   \dropLyricsA
   ap' to ja -- lo, a __ _ p'_to ja __ _ lo.
   \raiseLyrics
  \set stanza = #"2. "
  Me ti var -- ku -- la pu tha pas
  chri -- sa pa -- nia tha va -- lo,
  ma -- la ma -- te -- nia ta ku -- pia,
  Sa -- mio -- tis -- sa,
  tha sti -- lo na se pa -- ro.
}}
skipB = \repeat unfold 5 { \skip 4. \skip 2 }
lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Jia cha -- ra sa pa -- li -- kari -- a,
    kie sto ka -- lo, kie sto ka -- lo.
   \set stanza = #"3. "
    Jia cha -- ra sa pa -- li -- kari -- a,
    na mas fe -- re te sfu -- gari -- a,
    ju -- ses ki' o -- mor -- fa kora -- lia
    \skipB
    \set stanza = #"3. "
    Ke me ta mav -- ra s'a -- ga -- po
    ke me ta le -- ro -- me -- na,
    ke me ta ru -- cha tis dhu -- lias,
    Sa -- mio -- tis -- sa,
    tre -- le -- nu -- me ja se -- na.
 }}
skipC = \repeat unfold 25 { \skip 4. \skip 2 }
lyrStropheD = {
  \lyricmode {
    \skipC
    \set stanza = #"4. "
    Sa -- mio -- tis -- sa me tis e -- lies
    ke me ta mav -- ra mati -- a
    mu' -- ka -- nes tin kard -- hu -- la mu,
    Sa -- mio -- tis -- sa,
    sa -- ran -- ta dhi -- o komma -- tia.
}}

lyrStropheE = {
  \lyricmode {
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 7/8
  \key d \major
%   \bar ".|:"
%\mark \markup{Xekinai}
    d4 d8 d4 e4      |
    fs g8 fs[( e]) d4 |
    e4. cs8[( b]) a4 |
    d4.~ 4 r4       |
    e4. cs8[( b]) a4 |
    d4.~ d4 \break
  \repeat volta 2 {
    r4 |
    g4 8 4 4
    g a8 g[( fs]) e4
    fs4 8 4 4
    4 g8 fs[( e])  d4
    e4 8 4 4 \break
    e fs8 e[( d]) cs4
    a'4 g8 fs4 e
    d4 e8( fs[ g] a[ g])
    fs4. e8[( d]) e[( fs])
    d4.~ 4
  } \break
  \key g \major
  \repeat volta 2 {
   % \mark \markup{Samiotissa}
    d4 |
    g4 fs8 g4 a |
    b a8 g2 |
    c8[ c c] c[ b] a[( g]) |
    b4.~ b4
  } \break
  \repeat volta 2 {
     r4 |
     d8[ d d] e[ d] c[ b] |
     a4 c8 b[ a] g[ d] |
     b'4 b8 a8[ g] a[( b])
     g4.~ g4
  } \break
  \repeat volta 2 {
    r4 |
    b4. a8[ g] fs[ e] |
    d4.~ 4 d |
    d'4. c8[ b] c[ d] |
    b4.~ 4
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
  d4. s2 s4. s2 a4.:7 s2 d4. s2 a4.:7 s2 d4. s2
  g4. s2 s4. s2 d4.   s2 s4. s2 a4.:7 s2 s4. s2
  s4. s2 d4. s2 a4.:7 s2 d4. s2
  g4. s2 s4. s2 c4. s2 g4. s2
  g4. s2 d4.:7 s2 g4. d2:7 g4. s2
  g4. s2 d4. s2 d4.:7 s2  g4. s4
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
