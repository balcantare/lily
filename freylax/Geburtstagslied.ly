\version "2.22.2"
sheetName = "Geburtstagslied"
\include "../include/book.ily"

sheetTonality = f

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. " 
    Пусть бе -- гут не -- у -- клю -- же
    \set stanza = #"1. " пе -- ше -- хо -- ды по лу -- жам
    \set stanza = #"1. " А во -- да по ас -- фал -- ты ре -- кой
    \set stanza = #"1. " И не -- яс -- но про -- хо -- жим
    В‿э -- тот день не -- по -- го -- жий
    \set stanza = #"1. " По -- че -- му я ве -- сё -- лый та -- кой
   
    \set stanza = #"1+2. " Я и -- гра -- ю на гар -- мош -- ке
    У про -- хо -- жих на ви -- ду
    \set stanza = #"1+2. " К‿со -- жа -- лень -- ю день рож -- день -- я
    Толь -- ко раз в‿го -- ду
    \set stanza = #"1+2. " К‿со -- жа -- ленв -- ю денв рож -- день -- я
    Толь -- ко раз в‿го -- ду
}}

lyrStropheB = {
  \lyricmode { 
    \set stanza = #"2. "
    При  -- ле -- тит вдруг вол -- шеб -- ник
    \set stanza = #"2. "
    В‿го -- лу -- бам вер -- то -- лё -- те
    \set stanza = #"2. "
    И бе -- сплат -- но по -- ка -- жет ки -- но
    \set stanza = #"2. "
    С‿днем рож -- день -- я по -- здра -- вит
    И на -- вер -- но ос -- та -- вит
    \set stanza = #"2. "
    Мне в‿по -- да -- рок пять -- сот эс -- ки -- мо
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Wie die Fuss -- gän -- ger schim -- pfen,
  \set stanza = #"3. "   sind in klitsch -- nas -- sen Strüm -- pfen
  \set stanza = #"3. "   und der Re -- gen rinnt ü -- bern As -- phalt.
  \set stanza = #"3. "   Was für Au -- gen sie ma -- chen 
     denn sie se -- hen mich la -- chen
  \set stanza = #"3. "   an 'nem Tag, der so trü -- be und kalt.
  \set stanza = #"3+4. " Ich_bin so glück -- lich, 
    ich_spiel für al -- le
    Zie -- har -- mo -- ni -- ka, na klar!
  \set stanza = #"3+4. "  Denn Ge -- burts -- tag hat man lei -- der
    nur ein -- mal im Jahr.
  \set stanza = #"3+4. "  Denn Ge -- burts -- tag hat man lei -- der
    nur ein -- mal im Jahr.
}}


lyrStropheD = {
  \lyricmode {
    \set stanza = #"4. "
    Plötz -- lich kommt, un -- ge -- lo -- gen_'n 
    \set stanza = #"4. "
    blau -- es Flug -- zeug ge -- flo -- gen
    \set stanza = #"4. "
    und ein Zaub -- 'rer steigt aus, ganz in weiss.
    \set stanza = #"4. "
    Er will mir gra -- tu -- lie -- ren, 
    ein paar Fil -- me vor -- füh -- ren
    \set stanza = #"4. "
    und er schenkt al -- len Es -- ki -- mo -- Eis.
}}


strophe = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key d \minor
  \partial 4
  a8 bf
  a4 d,8 e f d \break a'[ bf] 
  a4 e8 f g e \break a[ bf]
  a4 e8 f g4 a8 bf 
  a2. \break d8 ef
  d4 a8 bf c a d ef 
  d4 g,8 a bf d \break c[ bf]
  d4 a8 f e4  g8 f
  d2 r4 \break d8 f
  f4 e2 e8 g
  g4 f2 f8 a 
  a4 g bf4. a8 
  c2 r4 \break a8 c
  c4 bf2 g8 bf
  bf4 a2 f8 a
  g2 a
  d,2 r4 \break a'8 c
  c4 bf2 g8 bf
  bf4 a2 f8 a g2 a d,2 r4
  \bar "|."
}

chrdStrophe = \chordmode {
  s4 d1:m a:7 s d:m d:7 g:m d2:m a:7 d1:m 
  a:7 d:m c:7 f2 d:7 g1:m  d:m a d2:m d:7
  g1:m d:m a d2:m
}

\bookpart {
  \paper {
    page-count = #1
    %#(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 20)
    } 
    <<
      \new ChordNames \doTranspose \chrdStrophe 
      \new Staff <<
        \new Voice = "Strophe" \doTranspose \strophe 
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >> 
  }
}
