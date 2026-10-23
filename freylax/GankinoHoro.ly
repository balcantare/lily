\version "2.24.2"
sheetName = "Gankino Horo"
\include "../include/book.ily"

sheetTonality = ef
octaveBf = -1
\setBookTranspose #'((freylax . g))

strophe = \relative c' {
  \accidentalStyle modern-voice-cautionary
  \time 11/16
  \set Timing.beatStructure = 4,3,4
  \key ef \major
  \mark \markup{ \box{\fontsize #4 A}}
  \bar ".|:"
  \repeat volta 2 {
  << { \voiceOne
   ef8 g16 af bf8 16 8 8 
    \repeat percent 2 { bf16 c c8 c-\prall bf16 bf af g ef }
    g16 af g f g8 f16 ef8 8
     }
     \new Voice { \voiceTwo
      ef8 16 f g8 16 8 8
      16 af16 8 8 g16 g f ef ef
      s16*11
      g16 af g f g8 f16 ef8 8    
     }
  >>
 
  }
  \break
  \mark \markup{ \box{\fontsize #4 B}}
  \repeat volta 2 {
   << { \voiceOne 
    af16-\prall 16 16 ef af g af bf8-\prall bf16 af
    g8-\prall g16 f g f g af8-\prall 16 g 
    f8-\prall 16 ef f ef f g8-\prall 16 f
    g16 af g f f g f ef8 ef
    }
    \new Voice { \voiceTwo
    \override NoteHead.style = #'slash
    \override NoteHead.no-ledgers = ##t
    \override Rest.staff-position = #-10
    g,8 r g8. 8 8
    g8 r g8. 8 8
    g8 r g8. 8 8
    g8 8 8. 8 8        
    }
   >>
  }
  \break
  \mark \markup{ \box{\fontsize #4 C}}
  \key af \major
  \repeat volta 2 {
  << { \voiceOne 
    c'16 bf bf af af8-\prall ef16 af bf c df
    c bf bf af af8-\prall ef16 ef' df df c
    c16 bf bf af af8-\prall ef16 af bf bf af
    af g g ef f8 c16 f8 f
     }
    \new Voice { \voiceTwo 
    ef16 df df c c8 16 c df ef f
    ef16 df df c c8 16 g' f f ef
    ef16 df df c c8 16 c df df c
    c bf bf g af8 16 8 8
    }
  >>
  } 
  \break
  \mark \markup{ \box{\fontsize #4 D}}
  \key ef \major
  \repeat volta 2 {
  << { \voiceOne 
       g'16 af bf af g8-\prall f16 g af bf af 
       g af bf af g8-\prall ef16 f8 f16 ef
       g16 af bf af g8-\prall f16 g af bf af 
       g af bf af g8-\prall ef16 f d  ef8
     }
     \new Voice { \voiceTwo 
       bf16 c df c bf8 af16 bf16 c df c
       bf16 c df c bf8 g16 a8 af
       bf16 c df c bf8 af16 bf16 c df c
       bf16 c df c bf8 g16 af8 g       
     }
  >>
  }
  \break
  \mark \markup{ \box{\fontsize #4 E}}
  \key ef \major
  \repeat volta 2 {
    << { \voiceOne
    d'16 ef f g af g f g8-\prall g16 ef
    f ef d ef f8-\prall bf,16 g'8-\prall g16 ef
    d16 ef f g af g f g8-\prall g16 ef
    f ef d ef f8-\prall bf16 f8-\prall f
    }
    \new Voice { \voiceTwo
    \override NoteHead.style = #'slash
    \override NoteHead.no-ledgers = ##t
    \override Rest.staff-position = #-10
    g,8 r g8. 8 8
    g8 r g8. 8 8
    g8 r g8. 8 8
    g8 r g8. 8 8
    }
    >>
  }
  \break
  \mark \markup{ \box{\fontsize #4 F}}
  \key bf \major
  \repeat volta 2 {
    ef'16 d d c ef d c  d c c bf
    c bf a bf c d ef d ef f8
    ef16 d d c ef d c  d c c bf
    c8 d16 ef d c d bf8 bf
  }
  \break
  \mark \markup{ \box{\fontsize #4 G}}
  \key ef \major
  \repeat volta 2 {
    \repeat percent 3 {
    g'16 af bf8 af16 g f g ef f ef }
    g8-\prall f16 g f8-\prall ef16 ef8-> ef->
  }
    %\bar "|."
}


chrdStrophe = \chordmode {
  ef16*11 af16*7 ef4 af16*7 ef4 f4 bf8. ef4
  af4.. ef4:/g c4..:m f4:m af4.. ef4 bf4.. ef4
  af4.. f4:m af4.. ef4 af4.. df4 f8:m c:m f4..:m
  bf4.. ef4 f4 bf8. ef4 bf4.. ef4 f4 bf4..
  f4.. bf4 f4.. bf4 f4.. bf4 ef4 f8. bf4
  ef4 af8. ef4 ef4 af8. ef4 ef4 af8. ef4 ef8 af8 bf8. ef4 
}

\bookpart {
  \paper {
    page-count = #1
    %system-system-spacing.padding = #8
    ragged-last-bottom = ##f
    %#(define fonts (book-font 1.4))
  }
  \bookItem
  \header {
    subtitle = "Horo |: AA BB CC DD EE FF GG :|"
  }
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 24)
  }
    <<
    \new ChordNames { \doTranspose \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" \doTranspose \strophe
      >>
    >>
  }
}
