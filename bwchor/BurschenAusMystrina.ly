\version "2.24.0"
sheetName = "Burschen aus Mystrina"
sheetComposer = "Slowakisches Volkslied, arr. Reinhard Simmgen"
sheetPoet = "dt. Beate Tarrach"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Singt das Lied,
  singt  das Lied wun -- der -- bar,
  Bur -- schen aus Mys -- tri -- na
  tol -- le Schar!
  Ja das klingt vom Wald he -- rü -- ber
  und das singt,
  wenn sie la -- chen und ihr Lied den Mäd -- chen
  winkt.
  A -- ber ich
  ra -- te dir,
  rat' dir sie nicht zu sehn,
  wenn sie zum Tanz durch die Wie -- sen gehn.

}}

lyrStropheB = {
  \lyricmode {
   \set stanza = #"2. "
   Bur -- schen, die stark sind wie Pils -- ner
   Bier,
   zit -- tern vor kei -- nem, auch nicht vor dir.
   Prahlt ein Prahl -- hans, schla -- gen sie ihn
   win -- del -- weich,
   wer -- fen ihn in ho -- hem Bo -- gen in den Teich,
   la -- chen und weg sind sie,
   wün -- schen ihm recht viel Glück,
   lau -- fen die Wie -- sen zum Dorf
   zu -- rück.
}}
lyrStropheC = {
  \lyricmode {
   \set stanza = #"3. "
   Änn -- chen mein, hal -- te ein, hus -- te nicht!
   Reg' dich nicht, bit -- te dich, tu es nicht!
   Fin -- den uns die Bur -- schen hier nicht,
   dich und mich,
   hab' ich dich und küß' ich dich und sin -- ge ich,
   sing ich und tan -- ze ich. Al -- le im
   Dorf -- krug sehn Mäd -- chen dich,
   Lieb -- ste dich, klug und schön.
}}

intro = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key f \major
  \override Rest.staff-position = #0
  <f a>8 <a c>8 8. 16
  <bf d>8 <g bf> <e g>8. <d f>16
  <c e>8 c d e
  f4 r
  \bar "||"
}

strophe = \relative c' {
  \voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key f \major
  \override Rest.staff-position = #0
  \bar ".|:-|"
  \repeat volta 2 {
  f8 f f4 g8 g g4
  a8 f4.
  c2
  d8 d d4
  e8 e e4
  g8 f4.
  f2
  }
  \repeat volta 2 {
    a8 c a c a c a c
    d8 bf4.
    g2
    g8 bf g bf g bf g bf
    c8 a4.
    f4 \tuplet 3/2 { c8 d e }
    f8 f f4 g8 g g4
    a8 f4.
    c2
    d8 d d4 e8 e e4
    g8 f4. f2
  }
  %\bar "|."
}

stropheSopran = \relative c'' {
  \voiceOne
  a8 a a4 bf8 8 4
  c8 4. 2
  bf8 8 4 c8 8 4 bf8 a4. a2
  c2~^\markup{Ja} 2
  d4 c8 bf~ 4 a4
  g4^\markup{wenn} bf^\markup{ihr}
  bf^\markup{Lied} bf^\markup{den}
  c^\markup{Mädchen} bf8
  a~^\markup{winkt.}
  a4 g^\markup{Ich}
  a8 a a4 bf8 8 4
  c8 4. 2
  bf8 8 4 c8 8 4 bf8 a4. a2
}

stropheBass = \relative c {
  \key f \major
  \clef "bass"
  \accidentalStyle neo-modern %-voice-cautionary
  c8 c c4
  e8 e e4
  f8 c4.
  a2
  bf8 8 4
  c8 8 4
  c8 f,4. 2
  f'8 f e e d d  c c
  bf4 c d2
  e8 e d d c c bf bf a4 bf
  c \tuplet 3/2 {c8 c bf}
  c8 c8 4
  e8 e8 e4
  f8 c4.
  a2
  bf8 bf bf4
  c8 c c4 8 f,4.
  f2
}

chrdIntro = \chordmode {
  f2 bf c f
}
chrdStrophe = \chordmode {
  f2 c f s bf c f s
  f d:7 g:m s
  c s f s4 c
  f2 c f s bf c f
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-right = ##f
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdIntro }
      \new Staff <<
        \new Voice = "Intro" { \intro }
      >>
    >>
  }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "StropheSopran" { \stropheSopran }
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Staff <<
      \new Voice = "Basso" { \stropheBass }
      >>
    >>
    \layout {
      \context {
        \Lyrics
        \override LyricText.font-size = #1
      }
    }

  }
}
