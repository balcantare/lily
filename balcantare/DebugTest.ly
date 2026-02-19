\version "2.24.2"
sheetName = "Debug Test NO book-staff-size define"
\include "../include/book.ily"

\bookpart {
  \paper {
    page-count = #1
  }
  \header { title = "DEBUG: WITHOUT book-staff-size 20 - should be 20pt" piece = "Test 20pt" }
  \score {
    \new Staff \relative c' {
      c4 d e f g a b c1 \bar "|."
    }
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
}
}
