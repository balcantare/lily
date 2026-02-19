\version "2.22.2"
sheetName = "Cine-a pus cârciuman drum"
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

skipA=\repeat unfold 49 \skip 8 
skipB=\repeat unfold 5 \skip 8 
skipC=\repeat unfold 77 \skip 8

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = #"1. "
   Ci -- ne-a pus câr -- ciu -- ma-n drum,
   Ă -- la n-a fost om ne -- bun,
   \set stanza = #"1. "
   Ci -- ne-a pus câr -- ciu -- ma-n drum,
   Ă -- la n-a fost om ne -- bun,
   \set stanza = \stanzaA
   Ă -- la n-a fost om cu min -- te,
   Ci -- ne-o in -- tră-n ea să cân -- te!
   \set stanza = \stanzaA
   Şi  ne -- ca -- zul să şi-l ui -- te,
%   \skipB
%   Ă -- la fost om cu dor gre -- u.
%   Şi-a cân -- tat cum cânt şi e -- u!
%   Şi-a cân -- tat cum cânt şi e -- u!
}}

lyrStropheAA = {
  \lyricmode {
    \skipC
 %  \set stanza = #"1a. "
   Ă -- la fost om cu dor gre -- u.
   Şi-a cân -- tat cum cânt şi e -- u!
   Şi-a cân -- tat cum cânt şi e -- u!
}}


lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = #"2. "
  Ci -- ne-a por -- nit dra -- gos -- tea
  Sla -- bă min -- te mai ave -- a,
  \set stanza = #"2. "
  Dra -- gos -- te -- a_e ma -- re foc
  Si nu scapi de ea de -- loc.
  \set stanza = \stanzaB
  Ea nu a -- re le -- gă -- mâ -- nt 
  Şi te ba -- gă în mor -- mânt _ 
  \set stanza = \stanzaB
  Şi te ba -- gă în mor -- mânt, _
  Măi, do -- ru -- lęt, măi! ru -- lęt, măi!
%  Căci do -- rul şi dra -- gos -- te -- a
%  Au în -- ne -- bu -- nit lu -- me -- a
%  Au în -- ne -- bu -- nit lu -- me -- a
%  Măi, do -- ru -- lęt, măi!
}}

lyrStropheBB = {
  \lyricmode {
    \skipC
  %\set stanza = #"2. "
  Căci do -- rul şi dra -- gos -- te -- a
  Au în -- ne -- bu -- nit lu -- me -- a
  Au în -- ne -- bu -- nit lu -- me -- a
  % Măi, do -- ru -- lęt, măi!
}}


lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = #"3. "
    La crâş -- ma din poe -- ni -- ţă,
    Vi -- nu-i bun, o -- caue -- i mică.
    \set stanza = #"3. "
    La crâş -- ma din poe -- ni -- ţă,
    Vi -- nu-i bun, o -- caue -- i mică.
    \set stanza = \stanzaC
    crâş -- mă -- ri -- ţa-i fru -- mu -- şi -- că,
    E -- nal -- tă şi o -- che -- şi -- că!
    \set stanza = \stanzaC
    Să-i dea nei -- ca o gu -- ri -- ţă,
    %\skipB
    %Gu -- ri -- ţă şi-o flo -- ri -- ci -- că,
    %Să-i toar -- ne vin în ul -- ci -- că
    %Să-i toar -- ne vin în ul -- ci -- că.

}}

lyrStropheCC = {
  \lyricmode {
    \skipC
    %\set stanza = #"3. "
    Gu -- ri -- ţă şi-o flo -- ri -- ci -- că,
    Să-i toar -- ne vin în ul -- ci -- că
    Să-i toar -- ne vin în ul -- ci -- că.
}}

strophe = \relative c' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \minor
  % \bar "|."
  %\partial 8
  % \mark \markup{ \box{\fontsize #4 AI}}
%   g16 a
%   d8 d f f a a a g16 a
%   bf16 bf8. a8. g16 f8 e4 a,16 a
%   cs8 cs e e g4 r8 f16 e
%   d8 bf' a a a4.-\trill d16 c
%   b8 c d8. c16 b8 a4 gs16 a
%   b8 c b a gs8 f4 a16 bf
%   bf8 bf c8. bf16 a8 g4. 
%   r8 f16 e f e8. d2~
%   d-\fermata \breathe d8 e f fs
%   
  %\mark \markup{ \box{\fontsize #4 A}}
  \repeat volta 2 {
    
  r16 fs g a bf a bf8 a g a g
  r16 e f g af g af8 g f g f
  c'4~ c16 af b c d c c b af g f e
  g16 f f e e d cs e d a b cs }
  \alternative {
    {d e f fs}
    {d4 }
  } \bar "||" \break
  
  %\mark \markup{ \box{\fontsize #4 B}}
  r8 a16 a d8 d f16 f8. a4
  r8 g16 a bf8 bf a g f4
  r8 a,16 a cs8 cs e16 e8. g4
  r8 f16 e d8 bf' a a a4
  \repeat volta 2 {
    r8 d16 c b8 c d8. c16 b8 a
  r8 gs16 a b8 c b a gs f
  r a16 bf bf8 bf c8. bf16 a8 g
  r f16 e }
  \alternative {
    {d8 bf' a2}
    {f8 e d8 e f fs}
  }
  \bar "|."
}

chrdStrophe = \chordmode {
  g1:m f:m s 
  a2:7 d4:m d:7
  s4
  d1:m g:m 
  a1:7 a2:7 d:m
  d1:m s
  g:m a2:7 d2:m 
  s4 d4:m d:7 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.18))
    ragged-last-bottom = ##false
  }
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 24)
  }
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheAA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheBB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheCC
    >>
  }
}
