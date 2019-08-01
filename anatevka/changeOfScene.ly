\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Change of Scene"
sheetNr   = #"5A"

bookTitle = \markup {
  \fontsize #3 \larger \larger
  \line { \box{ #sheetNr } #sheetName }
}
\header { title = \bookTitle  tagline = ##f }

\paper {
  #(set-paper-size "a4")
  indent = 0\mm
  between-system-space = 0.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  %page-count = #1
  markup-system-spacing = #'((basic-distance . 2)
                             (minimum-distance . 2)
                             (padding . 1))
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \line{
        \box{ #sheetNr } #sheetName \hspace #1
        - \hspace #1 \fromproperty #'page:page-number-string
      }
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

goUp = \change Staff = "up"
goDown = \change Staff = "down"

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(1 8 16 )) #f))))


BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c''' {
    \key g \minor
    c8( bf a g bf4.) g8( |
    c bf a g bf4 g) |
    \set Score.currentBarNumber = #1
    r4 <f, a> <f bf>( <f a>) |
    r <f a>( <g bf>8 <f a> <c f>4 |
    <bf ef>1) |
    \slurUp
    e8( a) a a a a a( b) |
    \slurNeutral
    fs8 g g a bf a af g
    g4( a <ef g>2 | <d fs>8) r8 <d fs>4( <e g> <fs a>) |
    %\override ParenthesesItem.font-size = #4
    \key d \major
    \repeat volta 2 {
      <g b>4-. 4-. 4-. 4-. |
      4( <a cs>8 <b d> <a cs>4 <g b>4) |
      <fs a>4-. 4-. \acciaccatura <g b>8 <fs a>( <es gs> <fs a> <g b>
      a2.) <fs a>4( |
      < e g>)-. 4-. 4-. 4-.
      <e g>( <fs a>8 <g b> <fs a>4 <e g>) |
      <d fs>1( | <ds fs>4) 4( <e g> <fs a>) |
      <g bf>4-. 4-. 4-. 4-. |
      4( <a c>8 <bf d>) <a c>4-.(  <g bf>-.) |
      <f a>4-. 4-. \acciaccatura <g bf>8 <f a>( <e gs>) <f a>-. <g bf>-. |
      <fs a>2. <fs a>4( |
      <e g>4)-. 4-. 4-. 4-. |
      <d f>4( <cs e> <b d> <d f>) |
      <e a>1( | <fs a>4) <ds fs>( <e g> <fs a>) |


    }
  }
}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \key g \minor
    \clef treble
    <bf d>2( <c e>) |
    <d f>( <e g>) |
    \clef bass
    f,,4 c'' df( c) |
    f,, c'' df8( c a4 |
    << { \voiceOne g1) }
       \new Voice { \voiceTwo bf,8( ef) ef( f) f( g) g( a) |}
    >>
    \oneVoice
    \goUp \voiceTwo b( cs) cs( ds) ds ds e( fs)
    \goDown
    fs,( g) g g bf bf  bf( df) |
    << { \voiceOne df4( a bf a | }
       \new Voice { \voiceTwo ef2 cs }
    >>
    \oneVoice
    <d c'>8) r d4 e fs
    \bar "||"
    \key d \major
    b1 | cs | d |
    \goUp \voiceTwo
    <d fs>8( <cs es> <d fs> <e g> <d fs>4) r |
    \goDown \oneVoice
    d1 cs
    r4 a,-. d-. a8-. d-. |
    ds4-. b( cs ds) |
    bf'1 ~ | 1 | a | g2 c |
    <bf d>1 | <b d>) |
    cs1 | r4 ds, e fs
  }
}

Chords = \chords {
  \set chordChanges = ##t
}

\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#f #t #t)
    \override BarNumber.Y-offset = 0
    \override BarNumber.X-offset = 0
  }
}


\score {
  \new GrandStaff <<
    \new Staff = "up" {
      \BandR
    }
    \Chords
    \new Staff = "down" {
      \clef bass
      \BandL
    }
  >>
}

