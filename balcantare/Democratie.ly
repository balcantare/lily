\version "2.24.2"
sheetName = "Démocratie"
sheetComposer = "HK"
#(define book-staff-size 20)
\include "../include/book.ily"

transTo=d,
%transTo=df
% https://lyricstranslate.com/de/hk-et-les-saltimbanks-democratie-lyrics

skipA=\repeat unfold 24 \skip 8
%skipB=\repeat unfold 86 \skip 8

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

lyrStropheA = {
  \lyricmode {
  %   ‿
  \set stanza = "1. "
  Les voi -- là qui dé -- filent
  Aux por -- tes du pa -- lais
  \set stanza = "1. "
  Faudrai -- t-il qu’on se mé -- fie
  A -- lors que le peup -- le‿a par -- lé
 \set stanza = "1. "
  Les voi -- là qui s’ar -- rangent
  Se -- lon leurs con -- ve -- nances
  \set stanza = "1. "
  Voi -- là qu’on les dé -- range
  Voi -- là en -- core qu’ils ma -- ni -- gancent
 
  \set stanza = "1. "
  Car c’est un jeu de dupes
  Au -- quel ils nous con -- vient
  \set stanza = "1. "
  Tout ce qui sort de -- s‿ur -- nes
  Doit con -- venir à leurs en -- vies
  
  \set stanza = "1. "
  Si nous choi -- sis -- sons mal
  Ils chan -- ge -- ront les règles
  \set stanza = "1. "
  Pour qu’ain -- si au fi -- nal
  Leurs mains ne lâ -- chent pas les rênes
  
  %% Refrain
  No -- tre mai -- son: Dé -- mo -- cra -- tie!
  No -- tre hori -- zon: Dé -- mo -- cra -- tie!
  No -- tre rai -- son: Dé -- mo -- cra -- tie!
  On se bat pour la Dé -- mo -- cra -- tie!
  No -- tre mai -- son: Dé -- mo -- cra -- tie!
  No -- tre hori -- zon: Dé -- mo -- cra -- tie!
  No -- tre rai -- son: Dé -- mo -- cra -- tie!
  On se bat pour la Dé -- mo -- cra -- tie!
  }
}

lyrStropheB = {
  \lyricmode {
  \set stanza = "2. "
  Il s‿ont le ver -- be haut
  Et les bon -- nes ma -- nières
  \set stanza = "2. "
  Ils citent Vic -- tor Hu -- go
  Maî -- trisent la lan -- gue de Mo -- lière
 
  \set stanza = "2. "
  L’art de la rhé -- to -- rique
  Dans leurs plus beaux ha -- bits
  \set stanza = "2. "
  Par -- lent de Ré -- pu -- blique
  Et dinent a -- vec les grands lob -- bys

  \set stanza = "2. "
  De -- vant les ca -- mé -- ras
  Te -- nues par leur -- s‿a -- mis
  \set stanza = "2. "
  Ils nous poin -- tent du doigt
  Et nous re -- couv -- rent d’in -- fa -- mie
 
  \set stanza = "2. "
  Men -- son -- ges et bo -- niments
  Sont le pain quo -- ti -- dien
  \set stanza = "2. "
  Qu’il -- s‿of -- frent aux pau -- vres gens
  “A -- va -- lez, et tout‿i -- ra bien”
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = "3. "
  Et moi, je fais par -- tie
  De ce peu -- ple‿en co -- lère.
  \set stanza = "3. "
  À qui on a pro -- mis
  À peu près tou -- t‿et son con -- traire
 
  \set stanza = "3. "
  Je ne peux plus les croire
  Il -- s‿nous‿ont tan -- t‿a -- bu -- sés
  \set stanza = "3. "
  Ils ne vou -- laient pas nous voir
  Unis, mais tou -- jours di -- vi -- sés
  
  \set stanza = "3. "
  Je suis de ceux quics’op -- posent
  De ceux qui dé -- non -- cent
  \set stanza = "3. "
  De ceux qui pro -- po -- sent
  Le che -- min de la ré -- sis -- tance
 
  \set stanza = "3. "
  Dé -- mo -- cra -- tie,‿en ton nom
  Nous re -- le -- vons la tête
  \set stanza = "3. "
  Nous voi -- là des mil -- lions
  Comme un souf -- fle que rien n’ar -- rête!
  }
}

strophe = \relative c''' {
  %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key b \minor
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #2 A}}
  r4 r8 b b b b cs
  d4. cs8 d cs b a 
  g4. \break cs8 cs cs cs d
  cs cs cs d e d cs b 
  fs4. \break fs8 fs fs fs a 
  g4. a8 b a g fs
  e4. \break  b'8 b b b b
  as as as b cs b as g 
  fs4. \break  b8 b b b cs
  d4. d8 d d e d 
  cs4. \break d8 d d d d
  cs8 cs cs d e d cs b 
  a4. \break b8 b b b cs 
  d4. d8 d cs b a 
  g4. \break d'8 d d d d
  cs cs cs d e d cs b
  b1
  \bar "||"
  
 \pageBreak
  \mark \markup{ \box{\fontsize #2 B}}
  \tupletSpan 2
  \tuplet 3/2 {r4 b cs d cs b b g g~} g2
  \tuplet 3/2 {r4 a b cs b a a fs fs~} fs2
  \tuplet 3/2 {r4 g a b a g g e e~ e2
               g4 fs fs a~ a g fs g d d~} d2
  \bar "||"
  \tuplet 3/2 {r4 b' cs d e d cs b b~} b2
  \tuplet 3/2 {r4 e e e d cs d a a~} a2
  \tuplet 3/2 {r4 fs' fs fs e d cs b cs~ cs2 cs4 
               e e e~ e d cs d b b~} b2
  \bar "||"
  \break
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #2 C}}
  r8 d-\prall cs d fs d cs d
  cs4.-\prall b8 g2
  r8 cs-\prall bs cs fs cs bs cs
  d1
  r8 d cs d fs d cs d
  g1
  r8 g fs d cs b fs d
  b1 \break
  
\once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #2 In/Out}}
  \repeat volta 2 {
   b'2 d4 fs b,2 d8 cs b a 
   fs2. e4 fs2. e8 fs
   g2 a4 b fs2. e8 fs
   g2 \tuplet 3/2 { b4 a g}
  } \alternative {
    \volta 1 { fs1 } 
    \volta 2 {}
  }
  
}

chrdStrophe = \chordmode {
  \parenthesize fs1
  b:m e:m a d g cs:m5-7 fs:7 b:m
  b:m e:m a d g cs:m5-7 fs:7 b:m
  s e:m a d g cs:m5-7 fs:7 b:m
  s e:m a d g cs:m5-7 fs:7 b:m
  b:m e:m fs:7 b:m s e:m fs:7 b:m
  b1:m s fs:m s g fs g fs
  
}

\bookpart {
  \paper {
    page-count = #2
    #(define fonts (book-font 1))
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \transpose d \transTo \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \transpose d \transTo \strophe }
      >>
      \new Lyrics \lyricsto "Strophe" \lyrStropheA
      \new Lyrics \lyricsto "Strophe" \lyrStropheB
      \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
