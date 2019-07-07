\version "2.19.82"
#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "jazzextras.ily"
\include "chordbass.ily"
\include "anatevka.ily"
\language "english"

sheetName = #"Perchik and Hodel Dance"
sheetNr   = #"8"

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

#(define print-at-bars
   (lambda (x y) (not (eq? (member x
    '(17 25 )) #f))))


BandR = {
  \set Score.barNumberVisibility = #print-at-bars
  \accidentalStyle modern-voice-cautionary
  \relative c' {
    \set Score.currentBarNumber = #1
    %\override ParenthesesItem.font-size = #4
    \time 2/4
    \key f \major
    \repeat volta 2 {
    <c' f c'>8[-^ r <a c f>-. <c f a>]-. |
    f-. <c f a>-. <a c f>-. <c f a>-. |
    << { \voiceOne bf'4\trill a8 g | a4 f | }
       \new Voice {\voiceTwo r8 <c e>[ r <bf e>] |
                   r8 <c f>[ r <a c>] | \break } >>
    \oneVoice
    <c f c'>8[-^ r <a c f>-. <c f a>]-. |
    f-. <c f a>-. <a c f>-. <c f a>-. |
    << { \voiceOne bf'4\trill a8 g |  }
       \new Voice {\voiceTwo r8 <c, e>[ r <bf e>] |
                    } >>
    \oneVoice
    <a c f>8-. r r4
    }
    \break

    \key bf \major
    \set Score.currentBarNumber = #17

    \repeat unfold 2 {
    <f bf f'>8-> r <d bf'> <f d'> |
    <d bf'>[ <f d'> <d bf'> <f d'>] |
    <a ef' g>4-> <a d f>8 <a c ef> |
    } \alternative {
      { <d f>4 <bf d> \break }
      { \override Glissando.breakable = ##t
        \override Glissando.after-line-breaking = ##t
        \set glissandoMap = #'((0 . 2))
        <bf d>8-. r         f4
        \glissando\break
      }
    }
    \repeat unfold 2 {
    <f bf f'>8-> r <d bf'> <f d'> |
    <d bf'>[ <f d'> <d bf'> <f d'>] |
    } \alternative {
      {  <a c ef>4-> d8 <ef, a c>8 |

         <d bf' d>4 <d f bf>
         \glissando\break  }
      { <c' ef>8_"ritard" 8\> <bf d> <a c>\! |
        <c ef>4(\mp\> <bf d>8 <a c>\!) }
    }
    <c, ef>4( <bf d>8 <a c>)\fermata |
    <bf d>2\fermata
    \bar "|."

  }
}
BandL =  {
  \accidentalStyle modern-voice-cautionary
  \relative c, {
    \key f \major
    \bar ".|:"
    \repeat unfold 2 {
    <f c' a'>8 r c'' r
    f[ r c] r |
    g'[ r c,] r |}
    \alternative { {f[ r c] r |} {f8-.r r4} }
    \key bf \major
    \repeat unfold 2 {
    \repeat unfold 4 { f,,8 <d' bf'>}
    \repeat unfold 2 { f, <ef' a>}
    } \alternative {  \repeat unfold 2 { f,8 <d' bf'>}
                      {<f, d' bf'>8-. r8 r4}
    }
    \repeat unfold 2 {
      bf8[ c, d e] | f[ g a bf] |
    } \alternative {
      { c[ d e f] | e[ f d bf] | }
      \repeat unfold 2 {f f' gf, gf' }
    }
    f4( gf)\fermata | bf,2\fermata
  }
}

Chords = \chords {
  \set chordChanges = ##t
  f2 s2 c:7 f
  f2 s2 c:7 f
  bf:/f s f:7 bf:/f
  bf:/f s f:7 bf:/f
  bf:/f s f:7 bf:/f
  s2*2
  \repeat unfold 3 {f4:7 gf:dim}
  bf2
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

