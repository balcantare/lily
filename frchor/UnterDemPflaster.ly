\version "2.24.0"
sheetName = "Unter dem Pflaster"
sheetComposer = "Angi Domdey"
\include "../include/book.ily"

lyrA = {
  \lyricmode {
  \set stanza = "1. "
  Komm, laß dich nicht er -- wei -- chen,
  bleib' hart an dei -- nem Kern,
  \set stanza = "1. "
  rutsch' nicht in ih -- re Wei -- chen,
  treib' dich nicht selbst dir fern.
  \repeat unfold 13 \skip 8
  Un -- ter dem Pflas -- ter,
  ja da liegt der Strand,
  komm reiß auch du, 
  ein paar Stei -- ne aus dem Sand.
}}

lyrB = {
  \lyricmode {
  \set stanza = "2. "
  Komm, laß' dir nicht er -- zäh -- len,
  was du zu las -- sen hast.
  \set stanza = "2. "
  Du kannst doch sel -- ber wäh -- len,
  nur lang -- sam kei -- ne Hast.
}}

lyrC = {
  \lyricmode {
  \set stanza = "3. "
  Zieh'_die Schu -- he aus, _ _ _
  die schon so lang dich drücken.
  \set stanza = "3. "
  Lieber bar -- fuß lau -- fen,
  _ _ aber nicht auf ihren Krü -- cken.
}}

lyrD = {
  \lyricmode {
  \set stanza = "4. "
  Dreh' dich und tanz',
  _ _ _ dann könn' sie dich nicht packen,
  \set stanza = "4. "
  ver -- scheuch' sie ganz
  _ _ _ mit dei -- nem lau -- ten Lachen.
}}

lyrE = {
  \lyricmode {
    \set stanza = "5. "
  Die größ -- te Kraft 
  _ _ _ ist dei -- ne Phan -- ta -- sie,
    \set stanza = "5. "
    wirf'_die Ket -- ten weg _ _ _ und 
  schmeiß' sie ge -- gen die,
    \set stanza = "5. "
    die mit ih -- rer Macht dei -- ne 
  Kräf -- te bre -- chen wol -- len!
}}


voice = \relative c' {
  %\voiceOne
  \time 4/8
  \key g \major
  r8 b d fs
  e \noBeam
  \voiceTwo
  e e8. b16
  \oneVoice
  r8 c e g 
  fs16 e8. d4
  r8 b d fs
  e \noBeam
  \voiceTwo
  e e8. b16
  \oneVoice
  r8 c e g
  fs e16 d~ 4 \break
  \bar "|"
  \set Score.repeatCommands = #'((volta "5.") end-repeat)
  r8 d16 d b8 d
  e4 r 
  r8 e16 e c8 e
  fs8 e d c
    \set Score.repeatCommands = #'((volta #f))
  \bar "||"
  \key g \minor
  r8 d' bf d
  c16 a8.~ a8 c
  bf4 a8 f
  g4. r8
  r d' bf d
  c4 a8 c
  bf g a f
  g4. r8
  \bar "|."
}

chrd = \chordmode {
  %\set chordBassOnly = ##t
  g2 e:m c d:7
  g2 e:m c d:7
  g2 e:m c d
  g:m f g4:m f
  g2:m g:m f
  g4:m f g2:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.1))
    % ragged-last-bottom =  ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrd }
    \new Staff <<
      \new Voice = "Strophe" { \voice }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrA
    \new Lyrics \lyricsto "Strophe" \lyrB
    \new Lyrics \lyricsto "Strophe" \lyrC
    \new Lyrics \lyricsto "Strophe" \lyrD
    \new Lyrics \lyricsto "Strophe" \lyrE
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
      #(layout-set-staff-size 20)
    }
  }
}
