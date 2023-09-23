\version "2.24.0"
fileName = "PoszlaKarolinka.ly"
sheetName = "Poszła Karolinka"
\include "../include/book.ily"

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
  a Kar -- li -- czek za nia,
  a Kar -- li -- czek
  \set stanza = #"1. "
  za nia,
  z_fla -- szecz -- ka wi -- na.
}}

lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = #"2. "
  Ka -- ro -- lin -- ka geht nach
  Go -- go -- lin al -- lein,
  \set stanza = #"2. "
  Kar -- lit -- schek folgt ei -- lig,
  Kar -- lit -- schek folgt
  \set stanza = #"2. "
  ei -- lig,
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
    nach dem hüb -- schen
    \set stanza = #"3. "
    Bur -- schen,
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
    führ mich zu dem
    \set stanza = #"4. "
    Bur -- schen,
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
    sag's dir im -- mer
    \set stanza = #"5. "
    wie -- der,
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
    bin schon auf der
    \set stanza = #"6. "
    Brü -- cke,
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
   das will ich nicht
   \set stanza = #"7. "
   sa -- gen,
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
    und dem hüb -- schen
    \set stanza = #"8. "
    Bur -- schen,
    läuft das Mäd -- chen fort.
}}


strophe = \relative c'' {
  \voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key g \major
  %\partial 8
  %g'8-\prall^\markup{Akkordeon} d b a g4 r
  \bar ".|:"
  \repeat volta 2 {
  \once\override Score.RehearsalMark.self-alignment-X = 2
  \mark \markup{ \box{\fontsize #3 A}}

  g8 g d b'
  g4 d
  g8 g fs e
  d4 r } \break
  \once\override Score.RehearsalMark.self-alignment-X = 2
  %\once\override Score.RehearsalMark.Y-offset = #0
  \mark \markup{\left-align \box{\fontsize #3 B}}
  b8 c d d
  d4 e
  c8 c c c
  c4 d
  b8 b c c
  b2
  %\bar "||"

  %\override Parentheses.font-size = #5
  %\startParenthesis \parenthesize

  %b'8^\markup{ Mandoline} b b a g4
  %\endParenthesis \parenthesize
  %g'4
  \break
  \repeat volta 2 {
  \once\override Score.RehearsalMark.self-alignment-X = 2
  \mark \markup{ \box{\fontsize #3 C}}

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
   g2^\markup{\hspace #3 \fontsize #2
              { \bold{*}Mandoline}}

   %s2 s2
   b4 g
   c8 b a g
   c4 e,
   a4 a
   b8 a g a
   b2^\markup{\hspace #3 \fontsize #2
              { \bold{*}Akkordeon}}
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

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \markup{ \vspace #0.5 \fill-line {
    \center-column {
      \line { \fontsize #2 {
        \box{A}\box{B}\box{B}*Ak
        \bold{|:} \box{A}\box{B}*Md
        \box{A}\box{B}\box{C}*Ak \bold{:|}
        \box{A}\box{B}\box{B}} \rest {4} }}}
  }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    \new Lyrics \lyricsto "Strophe" \lyrStropheG
    \new Lyrics \lyricsto "Strophe" \lyrStropheH
    >>
  }
}
