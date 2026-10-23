\version "2.24.2"
sheetName = "Kopanitsa"
sheetComposer = "Ivan Milev"
\include "../include/book.ily"

sheetTonality = f
octaveBf = -1
%\setBookTranspose #'((freylax . g))

strophe = \relative c' {
  \accidentalStyle modern-voice-cautionary
  \time 11/16
  \set Timing.beatStructure = 4,3,4
  \key d\minor
  \mark \markup{ \box{\fontsize #4 A}}
  \bar ".|:"
  \repeat volta 2 {
  << { \voiceOne
       \override Rest.staff-position = #0
       a16 bf  cs d e8-\prall a,16 e'16 r a8-\mordent
       bf16 g e cs a cs e d-\prall d-\prall d8-\prall
       f16 e g f-\prall f e g-\prall f e d cs
       e16 d-\prall d cs-\prall bf a g a cs e g, \break
       a16 bf  cs d e8-\prall a,16 e'16 r a8-\mordent
       bf16 g e cs a cs e d-\prall d-\prall d8-\prall
       f16 e g f-\prall f e g-\prall f e d cs
       e16 d-\prall d cs-\prall bf a g a8 r    
     }
     \new Voice { \voiceTwo
    \override NoteHead.style = #'slash
    \override NoteHead.no-ledgers = ##t
    \override Rest.staff-position = #-10
       s16*11 s g8 r r8. g8 8    
    }
  >>
  }
  \break
  \mark \markup{ \box{\fontsize #4 B}}
  \repeat volta 2 {
  << { \voiceOne
       a''16 g bf a-\prall a g-\prall bf a g f e 
       g f-\prall f e-\prall d cs bf cs d e f
       <f a>-. <a, d> <d f>-. <a d> <f' a> <e g>-\prall <d f> 
       <e g>8-\prall <d f>16 <e g>
       e8-\mordent d16 cs bf cs d cs8 \turn r \break
       a'16 g bf a-\prall a g-\prall bf a g f e 
       g f-\prall f e-\prall d cs bf cs d e f
       g gs a bf d c bf a g-\prall f e
       g16 f-\prall f e-\prall d cs bf cs8 r
     }
   \new Voice { \voiceTwo
      f16 e g f f e g f e d cs 
      e d d cs bf a g a bf cs d
      s16*11
      cs8 bf16 a g a bf a8 s
      f'16 e g f f e g f e d cs 
      e d d cs bf a g a bf cs d
      e f fs g bf a g f e d cs 
      e d d cs bf a g a8 s
   }
  >> 
  }
  \break
  \mark \markup{ \box{\fontsize #4 C}}
  \repeat volta 2 {
  << { \voiceOne
       \key g \major
       b'16 d b d a8-\mordent fs16 g16-\prall g-\prall g d
       g fs8-\prall d16 e8 fs16 g16-\prall g-\prall g8
       \key d\minor
       bf16 d bf d a8-\prall fs16 g-\prall g-\prall g d
       g16 fs8-\prall d16 e8-\prall a16 e4-\parenthesize\prall 
     }
     \new Voice { \voiceTwo
       g16 b g b fs8 d16 b b b g
       e'16 d8 a16 cs8 c16 b16 b b8
       g'16 bf g bf fs8 d16 bf16 bf bf g
       e' d8 b16 cs8 e16 cs4
     }
  >>
  }
  \break
  s16*11^\markup{ \box{\fontsize #4 B}} \bar "||"
  \mark \markup{ \box{\fontsize #4 D} Solos}
  s s s s s s s s 
  \break
  \mark \markup{ \box{\fontsize #4 E}}
  \repeat volta 2 {
  << { \voiceOne
       g'16 gs a bf e, f fs g f-\prall f e
       e16 b d8-\prall f16 e d cs d e f
       g cs, a' g f g a g8-\prall f16 e
       g f-\prall f e d cs bf cs8 g'16 cs,
       g'16 gs a bf e, f fs g f-\prall f e
       e16 b d8-\prall f16 e d cs d e f
       a4 g8 f16 e8 d16 cs 
       cs g bf8-\mordent d16 cs bf e d cs bf
     }
     \new Voice { \voiceTwo
       e16 f fs g cs, d ds e d d cs 
       cs g bf8 d16 cs bf a bf cs d
       e a, f' e d e f e8 d16 cs
       e d d cs bf a g a8 e'16 a,
       e'16 f fs g cs, d ds e d d cs 
       cs g bf8 d16 cs bf a bf cs d
       cs4 bf8 a16 g8 f16 e
       e bf d8 f16 e d e d cs bf
     }
  >> 
  }
 
 %\bar "|."
}


chrdStrophe = \chordmode {
  \set chordBassOnly = ##t
  a16*11 a4..:7 d4:m s4.. a4 g4:m g8.:m/e a4 
  a16*11 a4..:7 d4:m s4 d8.:m/c bf4 g4:m g8.:m/e a4
  d4:m d8.:m/f d4:m/a g4:m g8.:m/e a4 d4..:m bf4 g4:m g8.:m/e a4
  d4:m d8.:m/c bf4 g4:m g8.:m/e a4 d4 d8.:/fs g4:m s gs8.:dim a4
  \set chordBassOnly = ##f
  g4 d8. g4 d4.. g4 g4:m d8.:/a g4:m/bf 
  \set chordBassOnly = ##t
  e4:7 e8.:7/gs a4
  s16*11 g c c f g c a:m a
  a g4:m g8.:m/e a4
  a8:7 d:m s8. a4
  g4:m g8.:m/e a4
  a16*11 g4:m g8.:m/e a4
  a16*11 g4:m g8.:m/f g4:m/e
  
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
    subtitle = "Kopanitsa | AA BB CC BB D EE AA BB |"
  }
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
    \new ChordNames { \doTranspose \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" \doTranspose \strophe
      >>
    >>
  }
}
