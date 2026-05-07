you are really fast, but we should clarify first some points. the notation languages are the english pitches. I would like to
utilize the existing function \transpose which is used like \new ChordNames \transpose d \tran \chrdStrophe
    \new Staff \with {\accepts ChordNames}
    <<
      \context Voice = "StropheSopran" { \transpose d \tran \stropheSopran }
      \context Voice = "StropheAlt" { \transpose d \tran \stropheAlt }
      thus ideally I would define sheetTonality=d and then write \doTranspose arg which expands to \transpose \sheetTonality
\transposedSheetTonality arg. what do you think
