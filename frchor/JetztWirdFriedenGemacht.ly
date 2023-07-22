\version "2.22.2"
sheetName = "Jetzt wird Frieden gemacht!"
#(define book-staff-size 16)
\include "book.ily"

skipA = \repeat unfold 11 { \skip 2 }

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = #"1. "
  \repeat unfold 3 { \skip 16}
  Im -- mer wenn das Blatt sich wen -- det,
  \set stanza = #"1. "
  \repeat unfold 3 { \skip 16}
  im -- mer wenn der Wind sich dreht,
  \set stanza = #"1. "
  \skip 16 im -- er wenn was Al -- tes en -- det,
  kommt die Zeit, daß et -- was neu ent -- steht.
  \set stanza = #"1. "
  Gibt's ei -- ne Chance, daß wir es mit ge -- stal -- ten?
  \set stanza = #"1. "
  Gibt's ei -- ne Chance, am Rad mit zu drehn?
  \skip 16 Woll'n wir die -- se Welt er -- hal -- ten,
  \set stanza = #"1. "
  müss -- te end -- lich das Ei -- ne ge -- schehn':
  \set stanza = "1-3."
  Wir frie -- ren  all -- le Waf -- fen ein und sa -- gen:
  Jetzt wird Frie -- den ge -- macht!
  Es ist Zeit! Zu vie -- le Men -- schen wer -- den
  grau -- sam um -- ge -- bracht!
  Wir frie -- ren al -- le Waf -- fen ein und sa -- gen:
  Kein Krieg hat mehr Sinn!
  Wir woll'n auf die -- ser Er -- de le -- ben-
  Es ist Zeit für'n Neu -- be -- ginn.
}}

lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = #"2. "
  Ich hab ge -- hofft, \skip 16 daß das Blatt sich
  jetzt_wen -- det.
  \set stanza = #"2. "
  Ich hab ge -- hofft, \skip 16 daß der Wind sich
  jetzt_dreht.
  \set stanza = #"2. "
  \skip 16 Daß, was uns ka -- putt macht en -- det,
  und ge -- mein -- sam et -- was neu ent -- steht!
  \set stanza = #"2. "
  Es ist' -- n Pul -- ver -- fass, auf dem wir Le -- ben.
  \set stanza = #"2. "
  \skip 16 \skip 16  Ein Tanz auf'm hei -- ßen Vul -- kan,
  Ne zwei -- te Er -- de wird's nicht
  ge -- ben,
  \set stanza = #"2. "
  da -- rum ist jetzt
  was An -- de -- res dran!
  \set stanza = "4."
  Dann friern wir al -- le
}}

lyrStropheC = {
  \lyricmode {
    \skipA
  \set stanza = #"3. "
  \skip 16 \skip 16 Da -- mit sich \skip 16 die Blätter mal wen -- den,
  \set stanza = #"3. "
  \skip 16 \skip 16 da -- mit sich \skip16 der Wind
  endlich dreht,
  \set stanza = #"3. "
  braucht's Men -- schen, die das Alte be -- en -- den,
  die drum käm -- pfen, daß was neu ent -- steht.
  \set stanza = #"3. "
  Was wer -- den un -- \skip 16 se -- re Kinder mal
  er -- ben,
  \set stanza = #"3. "
  \skip 16 \skip 16
  was geben_wir in ih -- \skip 16 re Hand?
  Nen Gar -- ten o -- der'n Hau -- fen Scher -- ben?
  \set stanza = #"3. "
  Wüs -- te o -- der \skip 8 blü -- hen -- des Land?
}}

lyrStropheD = {
  \lyricmode {
    \skipA
  \set stanza = #"4. "
  Ich will er -- le -- ben,
  wie das Blatt sich wen -- det,
  \set stanza = #"4. "
  Ich will  da -- bei sein, wenn der Wind sich dreht.
  \set stanza = #"4. "
  Will käm -- pfen, daß das Al -- te
  en -- det, ei -- ne bes -- sere, neu -- e Welt
  ent -- steht.
  \set stanza = #"4. "
  Das sind nur Träu -- me, hö -- re ich euch sa -- gen,
  \set stanza = #"4. "
  Doch glaubt mir, ich bin nicht \skip 16 al -- lein.
  Ge -- mein -- sam müs -- sen wir es wa -- gen,
  \set stanza = #"4. "
  und die Welt aus_ih -- ren Ket -- ten be -- frein.
}}
strophe = \relative c'{
  %\voiceOne
  \time 4/4
  \key c \major
  %\partial 4
  %\bar "|."
  \mark \markup{ \fontsize #4 *}
  r1
  e4 g2.
  a8 g~ g2.
  \tuplet 3/2 { f8 e f }
  d8 c~ c4. d8
  d2. \bar "" \break r16  c c c
  e16 e e d e8
  << { d16 e~  } \new Voice { \voiceTwo e16 d } >>
  e16
  c8. \bar "" \break r16 c c b
  c16 c c b c8
  << {b16 c~ } \new Voice { \voiceTwo c16 b  } >>
  c4.
  \bar "" \break
  r16 c
  f16 f f e f8 e16 f~ f d8. d8 e
  f8. f16 g8 a a16 g8 g16~ 4~
  \time 3/4
  g2 \bar "" \break
  r16 g g e
  \time 4/4
  g g g e g8 e16 g~ g c,8. \bar "" \break r16 c c b
  c8. b16 c8 c16 b c4. r16 c
  f16 f f e f8 e16 f~ f d8. \bar "" \break d8 e
  f8 f4 f8 \tuplet 3/2 { f4 e f }
  d2. r8
  \bar "" \break
  r16
  <<
    {
    %\voiceOne
    g16 |
    c16 c c b  c g g g  g e8. e8 g
   %<e g>16 16 16 <d f> <e g> <c e> <c e> <b d> <c e>8 8 8 <e g>8
    g4 f8. e16 c4. \bar "" \break e16 f
    d8. d16 d8 e f f g a a g g8. a16 g4. r16 g
    c16 c c b c g g g g8 e4 \bar "" \break r16 g
    g4 f8 e c4. r16 e
    d d d d d8. c16 d8 d e8 f
    %\time 3/4
    d2 r8 a8
    %\time 4/4
    d8. c16
    \mark \markup{ \fontsize #4 *} c2. r4
    }
    \new Voice {
     % \voiceTwo
     % g'16
     % e16 e e d e c c c e
    }
  >>
  \bar "|."
}

chrdStrophe = \chordmode {
  c1:7+ s s s s
  c a:m f  d2:m g2
  s2.
  c1 a:m f d:m g
  c1 a:m d:m g
  c a:m d:m g
  a:m
}

\bookpart {
  \paper {
    %ragged-right = ##f
    page-count = #1
    #(define fonts (book-font 1))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
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

    >>
     \layout {

      \context {
        \Lyrics
        \override LyricText #'font-size = #+0
      }
    }
  }
}
