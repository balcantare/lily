\version "2.22.2"
sheetName = "Les Champs Elysées"
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace60"
}
stanzaA = \markup {
  \column {\vspace #.40 "1. "}
  \column {\vspace #.10 \leftbrace}
}
stanzaB = \markup {
  \column {\vspace #.40 "2. "}
  \column {\vspace #.10 \leftbrace}
}
stanzaC = \markup {
  \column {\vspace #.40 "3. "}
  \column {\vspace #.10 \leftbrace} 
}

skipA=\repeat unfold 16 \skip 8 
skipB=\repeat unfold 5 \skip 8 
skipC=\repeat unfold 77 \skip 8

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = \stanzaA
  Je m'bal -- a -- dais sur l'a -- ve -- nue,
  Le coeur ou -- vert 
  \set stanza = \stanzaA
  
  à l'in -- con -- nu
  J'a -- vai -- s‿en -- vie de 
  dire Bon -- jour 
  \set stanza = \stanzaA
  à n'im -- por -- te qui
  \skipB
}}

lyrStropheAA = {
  \lyricmode {
    \skipA
    N'im -- por -- te qui et ce fut toi
    et je t'ai dit n'im -- por -- te quoi
    Il suf -- fi -- sait 
    de te par -- ler   
     \skipB pour
    t'ap -- pri -- voi -- ser  
}}


lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = #"r. "
  _ Au so -- leil, 
  _ sous la pluie, 
  _ à mi -- di \set stanza = #"r. "
  ou à mi -- nuit
  Il y a tout‿c' -- que vous vou -- lez 
  \set stanza = #"r. " \skipB aux 
  Champs -- Él -- y -- sées. 
  \set stanza = #"r. "
  Aux Champs -- É -- ly -- sées
  aux Champs -- É -- ly -- sées
}}

lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = \stanzaB
    _ Tu m'as dit J'ai rend -- ez -- vous
    dans un sous -- sol \set stanza = \stanzaB 
    a -- vec des fous
    qui vivent la gui -- ta -- re‿à la main, 
    \set stanza = \stanzaB
    du soir au ma -- tin
}}

lyrStropheCC = {
  \lyricmode {
    \skipA
    A -- lors, je t'ai ac -- comp -- agn -- ée
    on a chan -- té, on a dan -- sé
    Et l'on n'a mê -- me pas pen -- sé  
    \skipB _ à -- s'em -- bras -- ser.
    %\set stanza = #"3. "
}}

lyrStropheD = {
  \lyricmode {
    \skipA
  \set stanza = \stanzaC
  Hi -- er au soir deux‿ in -- con -- nus et ce ma -- tin,
  \set stanza = \stanzaC
  sur l'av -- e -- nue deux‿ a -- mou -- reux, tou -- t‿é -- tour -- dis 
  \set stanza = \stanzaC
  par la lon -- gue nuit
}}

lyrStropheDD = {
  \lyricmode {
    \skipA
  %\set stanza = #"2. "
  Et de l'É -- toile à la Con -- corde, 
  _ un or -- ches -- tre_à mil -- le cordes
  Tous les oi -- seaux du point du jour _ 
  \skipB chan -- tent l'a -- mour.

}}

strophe = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key g \major
  \mark \markup{ \box{\fontsize #2 A}}
  c4 c8. c16 b8 a4.
  b8. d16 b8. g16~ 4 r
  c4 c8. c16 b8. g16 a8. g16~
  2 r4.. \break
  \mark \markup{ \box{\fontsize #2 B}}
  \repeat volta 2 {
     d16
     \tuplet 3/2 { b'8 d b~ } b8. b16
     \tuplet 3/2 { a8 b a~ } a8. a16
     \tuplet 3/2 { g8 b g~ } g8. \break g16\noBeam
     \tuplet 3/2 { f8 b f~ } f8. f16
     e8. g16 a8. g16
     b8. g16 g8. 
  } \alternative {
    { \break g16 a8. a16 b8 a~
      a4 r8 r16 }
    { g16 g8. g16 a8 g~
      g4 r }
  } \break
  \mark \markup{ \box{\fontsize #2 C}}
  b2 a8. g16 a8. g16~ 2~ 2
  c2 b8. g16 b8 a~ a2~ a2
  \mark \markup{ \box{\fontsize #2 ..B2}}
  \bar "|."
}

chrdStrophe = \chordmode {
  a2:m7 d:7 g e:m a:m7 d:7 g s
  g b:7 e:m g:7 c
  g a:7 d4 s8. s16 c4 d8:7 g s2
  g b:7 e4:m g:7 s2 c2 g a4:7 d:7 s2
 }

%% Implement an alternate lyric context
\layout {
  \context {
    \Lyrics
    \name AltLyrics
    \alias Lyrics
    \override StanzaNumber.font-series = #'medium
    \override LyricText.font-shape = #'italic
    %\override LyricText.color = #(x11-color 'grey20)
  }
  \context {
    \StaffGroup
    \accepts AltLyrics
  }
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##false
  }
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
      \new ChordNames { \transpose g c \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \transpose g c \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheAA
    \new AltLyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheCC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheDD
    >>
  }
}
