\version "2.24.0"
sheetName = "Bracia, patrzcie jeno"
sheetComposer = "trad Polen"
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace75"
}
stanzaA = \markup {
  \column { \vspace #.4 "1. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaB = \markup {
  \column { \vspace #.4 "2. "}
  \column { \vspace #.2 \leftbrace }
}

lyrStropheAA = {
  \lyricmode {
  \set stanza = \stanzaA
  Bra -- cia, patrz -- cie je -- no,
  jak nie -- bo go -- re -- je!
  }}

lyrStropheAB = {
  \lyricmode {
  Znać, że coś dzi -- wne -- go
  w_Be -- tle -- jem się dzie -- je.
}}

lyrStropheAC = {
  \lyricmode {
    \set stanza = \stanzaB
    Pat -- rzcie, jak tam gwia -- zda
    swiat -- łem swo -- im mi -- ga,
}}
lyrStropheAD = {
  \lyricmode {
    pew -- nie dla ucz -- cze -- nia
    Pa -- na swe -- go ści -- ga.
}}
lyrStropheAE = {
  \lyricmode {
    \set stanza = "3. "
    Freun -- de, kommt und se -- het,
    was am Him -- mel ste -- het!
}}

lyrStropheAF = {
  \lyricmode {
    \set stanza = "4. "
    Freun -- de, kommt und hö -- ret,
    was der Herr be -- sche -- ret!
}}

lyrStropheBA = {
  \lyricmode {
  \set stanza = "1. "
  Rzuć -- my bu -- dy,
  war -- ty, sta -- da;
  \set stanza = "1. "
  nie -- chaj ni -- mi
  Pan Bóg wła -- da,
  A __ _ my
  \set stanza = "1. "
  do Be -- tle -- jem,
  a my do Be -- tle -- jem,
  do Be -- tle -- jem.
}}

lyrStropheBB = {
  \lyricmode {
    \set stanza = "2. "
    Kro -- kiem śmia -- łym
    i we -- so -- łym
    \set stanza = "2. "
    śpie -- szmy
    i u -- derz -- my czo -- łem
    Przed __ _ Pa --
    \set stanza = "2. "
    nem w_Be -- tle -- jem,

    przed Pa -- nem w_Be -- tle -- jem,
    w_Be _ -- tle -- jem.
}}

rightbrace = \markup {
  \rotate #180 {
    \override #'(font-encoding . fetaBraces)
    \lookup "brace75"
  }
}

stanzaR = \markup { \column { \vspace #-.2 \rightbrace} }
dropLyrics = {
\override LyricText.extra-offset = #'(0 . -1.4)
\override LyricHyphen.extra-offset = #'(0 . -1.4)
\override LyricExtender.extra-offset = #'(0 . -1.4)
\override StanzaNumber.extra-offset = #'(0 . -1.4)
}
raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

lyrStropheBC = {
  \lyricmode {
    \set stanza = "3. "
    Gol -- dener Stern mit
    leuch -- tenden Strah -- len,
    \set stanza = "3. "
    will ver -- kün -- den Freu --
    de_uns al -- len!
    \dropLyrics
    \set stanza = \stanzaR

    Je -- sus ist_uns \raiseLyrics
    \set stanza = "3&4. " heut ge -- bo -- ren,
    Je -- sus ist ge -- bo -- ren,
    in Beth -- le -- hem!
}}

lyrStropheBD = {
  \lyricmode {
    \set stanza = "4. "
    Himm -- lische Scha -- ren
    lieb -- lich_er -- klin -- gen,
    \set stanza = "4. "
    wol -- len_uns von dem Kind -- lein
    sin -- gen!

}}

stropheSopranA = \relative c'' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 3/4
  \key bf \major
  \voiceOne
  \override Rest.staff-position = #0
  \bar ".|:"
  \repeat volta 2 {
  bf4. f8 d f
  bf4 bf, r
  d'4. c8 bf c
  d4 bf r
  }
  %bf4. f8 d f
  %bf4 bf, r
  %d'4. c8 bf c
  %d4 bf r
  %\bar "||"
}

stropheAltA = \relative c'' {
  \voiceTwo
  s2. s2.
  bf4. f8d f
  bf4 d, s4
  %s2. s2.
  %bf'4. f8d f
  %bf4 d, s4
}

stropheSopranB = \relative c'' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 3/4
  \key bf \major
  \voiceOne
  \override Rest.staff-position = #0
  \bar ".|:"
  \repeat volta 2 {
  c4. d16( c) bf8 g
  a4. g16( a) bf8 g
  c4. d16( c) bf8 g
  a4. g16( a) bf8 g-\fermata
  r2. r2.
  bf4.d8 c bf
  f'2.
  d2 r4
  d4 c d
  bf2.
  }
  %\bar "|."
}

stropheAltB = \relative c'' {
  \voiceTwo
  a4. bf16( a) g8 e
  f4. e16( f) g8 e
  a4. bf16( a) g8 e
  f4. f8 c8[ c]
  s2. s2.
  f4. bf8  a bf
  a4 bf c
  bf2 s4
  bf4 a a
  f2.
}

stropheTenorB = \relative c {
  \key bf \major
  \voiceOne
  s2.*5
  f4. g8 f[ ef]
  d4. f8 ef[ d]
  f4( g a)
  f2 s4
  f4 ef ef
  d2.
}

stropheBassB = \relative c {
  \clef "bass"
  \key bf \major
  \voiceTwo
  \override Rest.staff-position = #0
  f4. f8 c[ c]
  c4. c8 c[ c]
  f4. f8 c[ c]
  c4. d16( c) bf8 a
  f'4. g8 f[( ef])
  d4. ef8 d[ c]
  bf4. bf8 bf[ bf]
  f4( bf2)
  bf2 r4
  f'4 f, f
  bf2.
}

chrdStropheA = \chordmode { bf2. s2.*3 }

chrdStropheB = \chordmode {
  f2 c4
  f2 c4
  f2 c4
  f2 c8 f8
  bf2 f4
  bf2 f4
  bf2.
  f
  bf
  bf4 f s
  bf2.
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStropheA }
      \new Staff <<
        \new Voice = "StropheSopran" { \stropheSopranA }
        \new Voice = "StropheAlt" {  \stropheAltA }
      >>
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheAA
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheAB
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheAC
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheAD
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheAE
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheAF
    >>
  }
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
      \new ChordNames { \chrdStropheB }
      \new Staff <<
        \new Voice = "StropheSopran" { \stropheSopranB }
        \new Voice = "StropheAlt" {  \stropheAltB }
      >>
      \new Lyrics = "StropheBassA"
      \new Lyrics = "StropheBassB"
      \new Lyrics = "StropheBassC"
      \new Lyrics = "StropheBassD"
      \new Staff <<
        \new Voice = "StropheTenor" { \stropheTenorB }
        \new Voice = "StropheBass" { \stropheBassB }
      >>
      \context Lyrics = "StropheBassA" {
        \lyricsto "StropheBass" \lyrStropheBA
      }
      \context Lyrics = "StropheBassB" {
        \lyricsto "StropheBass" \lyrStropheBB
      }
      \context Lyrics = "StropheBassC" {
        \lyricsto "StropheBass" \lyrStropheBC
      }
      \context Lyrics = "StropheBassD" {
        \lyricsto "StropheBass" \lyrStropheBD
      }
    >>
  }

}
