\version "2.22.2"
sheetName = "Mate Aroha"
sheetComposer = "trad. Maori"
sheetPoet = "dt. Text Beate Tarach"
#(define book-staff-size 16)
\include "book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -2.5)
}

lyrStropheA = {
  \lyricmode {
    \set stanza = #"m1) "
    Ma te a -- ro -- ha,
    ma te a -- ro -- ha,
    \set stanza = #"m1) "
    ma te a -- ro -- ha,
    \dropLyricsA
    ka o -- ra e!
}}
lyrStropheAa = {
  \lyricmode {
    \set stanza = #"m1) "
    Ma te a -- ro -- ha,
    ma te a --
    \set stanza = #"m1) "
    ro -- ha,
    ma te a -- ro -- ha,
    \dropLyricsA
    ka o -- ra e!
}}


lyrStropheB = {
  \lyricmode {
    \set stanza = #"m2) "
    Ho -- mai to rin -- ga,
    ho -- mai to rin -- ga,
    \set stanza = #"m2) "
    ho -- mai to rin -- ga,
}}
lyrStropheBa = {
  \lyricmode {
    \set stanza = #"m2) "
    Ho -- mai to rin -- ga,
    ho -- mai to
    \set stanza = #"m2) "
    rin -- ga,
    ho -- mai to rin -- ga,
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = #"m3) "
    Wha ka -- pi -- ri mai,
    wha ka -- pi -- ri mai,
    \set stanza = #"m3) "
    wha ka -- pi -- ri mai,
  }}
lyrStropheCa = {
  \lyricmode {
    \set stanza = #"m3) "
    Wha ka -- pi -- ri mai,
    wha ka -- pi --
    \set stanza = #"m3) "
    ri mai,
    wha ka -- pi -- ri mai,
  }}

dropLyricsB = {
\override LyricText.extra-offset = #'(0 . -6)
\override LyricHyphen.extra-offset = #'(0 . -6)
\override LyricExtender.extra-offset = #'(0 . -6)
\override StanzaNumber.extra-offset = #'(0 . -6.5)
%\set stanza = \markup{ \right-brace #90 }
}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"d1) "
    Sehn wir die Son -- ne,
    sehn wir die Son -- ne,
    \set stanza = #"d1) "
    sehn wir die Son -- ne,
    \dropLyricsB
    dann le -- ben wir!
  }
}
lyrStropheDa = {
  \lyricmode {
    \set stanza = #"d1) "
    Sehn wir die Son -- ne,
    sehn wir die
    \set stanza = #"d1) "
    Son -- ne,
    sehn wir die Son -- ne,
    \dropLyricsB
    dann le -- ben wir!
  }
}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"d2) "
    Hörn wir den Re -- gen,
    hörn wir den Re -- gen,
    \set stanza = #"d2) "
    hörn wir den Re -- gen,
  }
}
lyrStropheEa = {
  \lyricmode {
    \set stanza = #"d2) "
    Hörn wir den Re -- gen,
    hörn wir den
    \set stanza = #"d2) "
    Re -- gen,
    hörn wir den Re -- gen,
  }
}

lyrStropheF = {
  \lyricmode {
    \set stanza = #"d3) "
    Spürn wir die Er -- de,
    spürn wir die Er -- de,
    \set stanza = #"d3) "
    spürn wir die Er -- de,
  }
}
lyrStropheFa = {
  \lyricmode {
    \set stanza = #"d3) "
    Spürn wir die Er -- de,
    spürn wir die
    \set stanza = #"d3) "
    Er -- de,
    spürn wir die Er -- de,
  }
}

lyrStropheG = {
  \lyricmode {
    \set stanza = #"d4) "
    Kön -- nen wir träu -- men,
    kön -- nen wir träu -- men,
    \set stanza = #"d4) "
    kön -- nen wir träu -- men,
  }
}
lyrStropheGa = {
  \lyricmode {
    \set stanza = #"d4) "
    Kön -- nen wir träu -- men,
    kön -- nen wir
    \set stanza = #"d4) "
    träu -- men,
    kön -- nen wir träu -- men,
  }
}

lyrStropheH = {
  \lyricmode {
    \set stanza = #"d5) "
    Sind wir zu -- sam -- men,
    sind wir zu -- sam -- men,
    \set stanza = #"d5) "
    sind wir zu -- sam -- men,
  }
}
lyrStropheHa = {
  \lyricmode {
    \set stanza = #"d5) "
    Sind wir zu -- sam -- men,
    sind wir zu --
    \set stanza = #"d5) "
    sam -- men,
    sind wir zu -- sam -- men,
  }
}

lyrStropheI = {
  \lyricmode {
    \set stanza = #"d6) "
    Bleib in der Lie -- be,
    bleib in der Lie -- be,
    \set stanza = #"d6) "
    bleib in der Lie -- be,
  }
}
lyrStropheIa = {
  \lyricmode {
    \set stanza = #"d6) "
    Bleib in der Lie -- be,
    bleib in der
    \set stanza = #"d6) "
    Lie -- be,
    bleib in der Lie -- be,
  }
}

strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \key e \major
  \partial 2
  gs8 fs4 e8
  fs4.( e8) cs2
  r2 fs8 e4 cs8
  e4.( cs8) b2
  r2 gs'8 fs4 e8
  fs4.( e8) cs2
  r4 ds e fs
  e1~ 2
  \bar "|."
}

stropheAlt = \relative c'' {
  %\voiceTwo
  \key e \major
  r2
  r2 r8 a a gs
  fs8 fs4. r2
  r2 r8 e e b
  e8( fs) gs4 b8 b4 b8
  b2 a4.( gs8
  fs4) fs gs a
  gs1~ 2
}

chrdStrophe = \chordmode {
  s2
  a1 b:7 e cs:m7 a b:7 e
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
  }
  \bookItem
  \score {
  <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
     \new Voice = "Strophe" { \strophe }
    >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    \new Lyrics \lyricsto "Strophe" \lyrStropheG
    \new Lyrics \lyricsto "Strophe" \lyrStropheH
    \new Lyrics \lyricsto "Strophe" \lyrStropheI

    \new Staff <<
      \new Voice = "StropheAlt" { \stropheAlt }
    >>
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheAa
    \new	 Lyrics \lyricsto "StropheAlt" \lyrStropheBa
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheCa
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheDa
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheEa
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheFa
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheGa
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheHa
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheIa
  >>
  }
}

