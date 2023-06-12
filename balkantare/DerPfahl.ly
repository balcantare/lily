\version "2.19.82"
#(set-global-staff-size 24)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "gitlog.ily"
\language "english"

sheetName = #"Der Pfahl"


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
  markup-system-spacing = #'((basic-distance . 8)
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
    Son -- nig be -- gann es zu ta -- gen,
    ich stand ganz früh vor dem Tor,
    sah nach dem fah -- ren -- den Wa -- gen,
    da sprach Alt Si -- set zu mir:

   Ich drü -- cke hier und du ziehst weg,
   so krie -- gen wir den Pfahl vom Fleck,
   wer -- den ihn fäl -- len, fäl -- len, fäl -- len
   wer -- fen ihn faul und morsch zu Dreck.
}}

lyrStropheB = {
  \lyricmode {
    'Siehst du den brü -- chi -- gen Pfahl dort,
    mit unse -- ren Fes -- seln um -- schnürt?
    Schaf -- fen wir doch die -- se Qual fort,
    ran an ihn, daß er sich rührt!'

  Erst wenn die Ein -- tracht uns be -- wegt,
  ha -- ben wir ihn bald um -- ge -- legt,
  und er wird fal -- len, fal -- len, fal -- len,
  wenn sich ein je -- der von uns regt.
}}


lyrStropheC = {
  \lyricmode {
 Ach, Si -- set, noch ist es nicht_ge -- schafft,
 an mei -- ner Hand platzt die Haut,
 lang ___ -- sam schwin -- det auch meine Kraft,
 er ist zu mäch -- tig ge -- baut.
}}

lyrStropheD = {
  \lyricmode {
    Wird es uns je -- mals ge -- lin -- gen?
    Si -- set, es fällt mir so schwer!
    Wenn wir das Lied noch mal sin -- gen geht es viel
    bes -- ser komm her!
}}

lyrStropheE = {
  \lyricmode {
  Der al -- te Si __  _ set sagt_nichts mehr,
  bö -- ser Wind hat ihn ver -- weht,
  kei -- ner weiß von sei -- ner Heim -- kehr,
  od -- er gar wie es ihm geht.

}}

lyrStropheF = {
  \lyricmode {
  Alt Si -- set sa __ gt uns al -- len,
  hör auch du krie__ -- g es mit:
  'Der mor -- sche Pfahl wird schon fal -- len,
  wie es ge -- schie __ ht  im Lied!
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \partial 4.
  \key e \minor
  \bar ".|:"
  \repeat volta 2 {
  r4. |
  e8[ 8 8] fs[ 8 8]
  g4. e4.
  g8[ 8 8] 8[ fs e]
  fs4. r4.
  e8[ 8 8] fs[ 8 8]
  g4.~8 e4
  e8[ 8 8] ds[ cs ds] |
  e4.
  } \break
  \repeat volta 2 {
    g8 fs e |
    b4 ds8 fs4 ds8
    e4. g8 fs e
    b4 ds8 fs4 ds8
    e4. e8 fs g
    a4 fs8 a4 fs8
    b4 g8 g fs e
    b4 ds8 fs4 ds8
    e4.
  }
%\bar "|."
}


stropheAlt = \relative c' {
  \voiceTwo

}

stropheBass = \relative c {
  \clef bass
  \key a \minor

}

chrdStrophe = \chordmode {
  s4. e4.:m b:7 e2.:m e2.:m b2.:7
  a:m b4.:7 e:m s b:7 e:m
  s b2.:7  e:m   b2.:7  e:m
  a:m e:m b:7 e:m
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
  \new Lyrics \lyricsto "Strophe" \lyrStropheF
   %\new Staff <<
   %  \new Voice = "Basso" { \stropheBass }
   %>>
 >>
}
