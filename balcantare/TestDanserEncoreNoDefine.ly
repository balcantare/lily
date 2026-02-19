\version "2.24.2"
sheetName = "Test Danser Encore"
% NOTE: NO book-staff-size defined - should use layout-set-staff-size-with-jazz 24
\include "../include/book.ily"

\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \score {
  \transpose g g {
    <<
      \new ChordNames { \chrdRefrain \chrdStrophe }
       \new Voice = "Refrain" { \refrain
         \new Voice = "Strophe" { \strophe }
       }
   \new Lyrics \lyricsto "Refrain" \lyrRefrain
   \new	Lyrics \lyricsto "Strophe" \lyrStropheA
   \new	Lyrics \lyricsto "Strophe" \lyrStropheB
   \new Lyrics \lyricsto "Strophe" \lyrStropheC
      >>
  }
  \layout {
    #(layout-set-staff-size-with-jazz 24)
  }
}
}
