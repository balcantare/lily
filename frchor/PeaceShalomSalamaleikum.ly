\version "2.24.0"
sheetName = "Peace, Shalom, Salamaleikum"
sheetComposer = "Ofer Golany"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    Peace,
    sha -- lom, sa -- la -- ma -- lei -- kum,
    peace, sha -- lom, sa -- la -- ma -- lei -- kum,
    peace, sha -- lom, sa -- la -- ma -- lei -- kum,
    pray for peace in the mid -- dle east.
}}

skipB = \repeat unfold 24 { \skip 2 }

lyrStropheB = {
  \lyricmode {
   \skipB
    sing for peace in south a -- fri -- ca.
  }
}

lyrStropheC = {
  \lyricmode {
   \skipB
    act for peace in i -- ran, i -- raq.
  }
}

strophe = \relative c'{
  \time 4/4
  \key e \minor
  %\partial 2
  e4. b8 e2
  r8 e e fs g( fs) e4 \break
  d4. a8 d2
  r8 d d e fs( e) d4 \break
  e4. b8 e2
  r8 e e fs g( fs) e4
  g4 g fs g8 fs
  fs8 e4. e2
  \bar "|."
}

chrdStrophe = \chordmode {
  e1:m s d s e:m s g2 b:7 e1:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    % ragged-last-bottom = ##f
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
    >>
  }
}
