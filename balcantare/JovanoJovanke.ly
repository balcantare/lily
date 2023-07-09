\version "2.22.2"
fileName = "JovanoJovanke.ly"
sheetName = "Jovano Jovanke"
\include "book.ily"

lyrIntro = {
  \lyricmode {
    Jo -- va -- no,
    Jo -- va -- nke!
  }
}

lyrIntroAlt = {
  \lyricmode {
    Jo -- va -- no,
    Jo -- va --  nke!
  }
}


lyrStropheA = {
  \lyricmode {
    Kraj var -- da -- rot se -- diš
    mo -- ri be -- lo plat -- no be -- liš
    Be -- lo plat -- no be -- liš,
    du -- šo, Se -- na go -- re -- gle __ daš
}}

lyrStropheB = {
  \lyricmode {
    Ja šte te -- be če -- kam
    Mo -- ri do -- ma da mi doj -- deš
    A ti ne do vad -- jaš, du -- šo
    Sr -- ce mo -- je, Jo__-___va -- no
}}

lyrStropheC = {
  \lyricmode {
  Tvo _ -- ja -- ta maj -- ka
  Mo -- ri te -- be ne te puš -- ta
  Kraj mi -- ne da -- do -- ješ, du -- šo
  Sr -- ce mo -- je, Jo__-___va -- no
}}

intro = \relative c' {
  %\voiceTwo
  \time 7/8
  \set Staff.keyAlterations = #`((1 . ,SHARP)
                                 (3 . ,SHARP))
  \repeat volta 2 {
    ds4( fs8) e[( ds] c[ b]) |
    b4.~ b2 |
    fs'4( a8) g8[( fs] e[ ds16 e]) |
    fs4.~ 2 |
  }
  \break
}

introAlt = \relative c' {
  %\voiceOne
  \set Staff.keyAlterations = #`((1 . ,SHARP)
                                 (3 . ,SHARP))
  \clef bass
  \repeat volta 2 {
    r4. r2 |
    g4( fs8) e4 ds |
    ds'4. e4 c |
    b4.~ 2 |
  }
  %\break
}

introBass = \relative c {
  %\voiceOne
  \set Staff.keyAlterations = #`((1 . ,SHARP)
                                 (3 . ,SHARP))
  \clef bass
  \repeat volta 2 {
    b4. fs4 a |
    b4. fs'4 b, |
    b4. fs4 a |
    b4. fs'4 b, |
  }
}

strophe = \relative c' {
  \voiceOne
  \time 7/8
  \set Staff.keyAlterations = #`((1 . ,SHARP)
                                 (3 . ,SHARP))
  \repeat volta 2 {
    b'4 8 4 4 |
    b8[( a b]) c4 8[ b] |
    a4 8 4 4 |
    a8[( g a]) b2 |
    g4 8 4 a8[( b]) |
    c4 b8 a4 g |
    fs4 8 g[( fs]) g[( a]) |
    fs4( a8 g[ fs] e[ ds]) |
    ds4.~ 2~ |
    ds4.~ 4 s |
  }
}

stropheAlt = \relative c' {
  \voiceTwo
    g'4 8 4 4 |
    g8[( fs g]) a4 8[ g] |
    fs4 8 4 4 |
    fs8[( e fs]) g2 |
    e4 8 4 fs8[( g]) |
    a4 g8 fs4 e |
    ds4 8 e[( ds]) e[( fs]) |
    ds4( fs8 e[ ds] c[ b]) |
    b4.~ 2~ |
    b4.~ 4 r |


}

stropheBass = \relative c {
  %\accidentalStyle neo-modern-voice-cautionary
  \clef bass
  \set Staff.keyAlterations = #`((1 . ,SHARP)
                                 (3 . ,SHARP))
  e4. b4 e |
  e4. a4 e |
  d4. a'4 d, |
  d4. g,4 d' |
  e4. b4 e |
  a,4. c4 a |
 b4. fs'4 b, |
 b4. fs4 a |
 b4. fs'4 b, |
 b4. fs4 a |

% e4 ds8 d4 cs |
%   d4. 4 8[ 8] |
%   ds4 8 4 4 |
%   4. 2 |
%   c4 8 4 e |
%   4 8 ds4 e4 |
%   b4 8 4 4 |
%   c4.( 8[ b] a4) |
%   b4.~ 2 |
}

chrdIntro = \chordmode {
  b4. s2 s4. s2 s4. s2 s4. s2
}
chrdStrophe = \chordmode {
  e4.:m s2
  s4. a2:m
  d4. s2
  s4. g2
  e4.:m s2
  a4.:m s2
  b4. s2
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.35))
    ragged-right = ##f
    ragged-last-bottom = ##f
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
    <<
    \new ChordNames { \chrdIntro }
    \new ChoirStaff <<
    \new Staff <<
      \new Voice = "Intro" { \intro }
      \new Lyrics \lyricsto "Intro" \lyrIntro
      >>
    \new Staff <<
      \new Voice = "IntroAlt" { \introAlt }
      \new Lyrics \lyricsto "IntroAlt" \lyrIntroAlt
    >>
   >>
   \new Staff <<
     \new Voice = "IntroBass" { \introBass }
     >>
  >>
  }
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      %\new ChoirStaff <<
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
        \new Voice = "StropheAlt" { \stropheAlt }
        >>
      \new Lyrics \lyricsto "Strophe" \lyrStropheA
      \new Lyrics \lyricsto "Strophe" \lyrStropheB
      \new Lyrics \lyricsto "Strophe" \lyrStropheC
      \new Staff <<
        \new Voice = "Basso" { \stropheBass }
        >>
    %>>
  >>
  }
}


   %\new	Lyrics \lyricsto "Strophe" \lyrStropheA
   %\new	Lyrics \lyricsto "Strophe" \lyrStropheB
   %\new Lyrics \lyricsto "Strophe" \lyrStropheC
   %\new Lyrics \lyricsto "Strophe" \lyrStropheD


