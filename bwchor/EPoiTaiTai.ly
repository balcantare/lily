\version "2.24.0"
sheetName = "E poi tai tai"
sheetComposer = "trad. Maori, dt. Gerhard Nath"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"ref "
  E po -- i tai tai e,
  \set stanza = #"ref "
  oh e po -- i tai tai e.
  \set stanza = #"ref "
  E po -- i tai tai,
  e po -- i tu -- ki tu -- ki,
  \set stanza = #"ref "
  e po -- i tu -- ki tu -- ki e.
}}
lyrStropheB = {
  \lyricmode {
  \set stanza = #"1. "
  Ich bin ein Salz im Meer,
  \set stanza = #"1. "
  hey, ich bin ein Salz im Meer.
  \set stanza = #"1. "
  Bin ich die Wo -- ge,
  bin ich das Wel -- len -- rei -- ten,
  \set stanza = #"1. "
  ich bin ein Salz im wil -- den Meer.
  }
}
lyrStropheC = {
  \lyricmode {
  \set stanza = #"2. "
  Bin ich der Wind im Tal,
  \set stanza = #"2. "
  hey ich bin der Wind im Tal.
  \set stanza = #"2. "
  Lass mich von Schmet -- ter -- lin -- gen
  mit Flü -- geln schla -- gen,
  \set stanza = #"2. "
  ich bin ein stil -- ler Wind
  im Tal.
  }
}
lyrStropheD = {
  \lyricmode {
  \set stanza = #"3. "
  Bin ich von Schnee ein Stern,
  \set stanza = #"3. "
  hey ich bin von Schnee ein Stern.
  \set stanza = #"3. "
  Darf ich in kal -- ten Näch -- ten
  vom Him -- mel fal -- len,
  \set stanza = #"3. "
  bin ich vom wei -- ßen Schnee ein Stern.
  }
}
lyrStropheE = {
  \lyricmode {
  \set stanza = #"4. "
  Bin ich das Kind im Mann,
  \set stanza = #"4. "
  hey ich bin das Kind im Mann.
  \set stanza = #"4. "
  Kann an den Ket -- ten von Ka -- ru -- sel -- len flie -- gen,
  \set stanza = #"4. "
  ich bin das Kind im wil -- den Mann.
  }
}
lyrStropheF = {
  \lyricmode {
  \set stanza = #"5. "
  Bin ich die Spur im Sand,
  \set stanza = #"5. "
  hey ich bin im Sand die Spur.
  \set stanza = #"5. "
  Bin ich ge -- kom -- men,
  möch -- te ich ge -- hen dür -- fen,
  \set stanza = #"5. "
  \markup{||:was} bleibt ist mei -- ne Spur im \markup{Sand.:||}
  }
}

strophe = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key e \major
  e8 e4 e8 e4 fs
  gs2. \bar ""  \break fs4
  e8 e4 fs8 e4 cs
  b1 \break
  \repeat volta 2 {
  e8 e4 e8 e4 fs
  gs8 gs4 a8 gs8 fs e gs
  fs8 fs4 gs8 fs8 e ds fs
  e1 }
  % \bar "|."
}

chrdStrophe = \chordmode {
  e1 s1 a e
  e cs:m b e
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    %ragged-last-bottom = ##f
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
    >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}
