\version "2.24.2"
sheetName = "Danser Encore"
sheetComposer = "HK"
#(define book-staff-size 20)
\include "../include/book.ily"
% original g minor
transTo=g
%transTo=df

skipA=\repeat unfold 21 \skip 8
skipB=\repeat unfold 86 \skip 8

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

lyrRefrain = {
  %\set stanza = #"Ref "
  \lyricmode {
    (non non non non non non)
    Nous on veut con -- ti -- nu -- er‿à dan -- ser en -- core
    Voir nos pen -- sées en -- la -- cer nos corps
    Pas -- ser nos vies sur un -- e grille d'ac -- cords

    non non non non non non
    Nous on veut con -- ti -- nu -- er à dan -- ser en -- core
    Voir nos pen -- sées en -- la -- cer nos corps
    Pas -- ser nos vies sur un -- e grille d'ac -- cords

  }
}

lyrStropheA = {
  \lyricmode {
    \set stanza = "1. "
    Nous sommes de -- s‿oi -- seaux de pas -- sa -- ge
    Ja -- mais do -- ciles ni vrai -- ment sa -- ge
    \set stanza = "1. "
    Nous ne fai -- sons pas al -- lé -- gean -- ce
    À l'au -- be‿en tou -- tes cir -- con -- stan -- ces
    \set stanza = "1. "
    Nous ve -- nons bri -- ser le si -- len -- ce

    Et quand le soir à la té -- lé
    \set stanza = "1. "
    Mon -- sieur le bon roi a par -- lé
    Ve -- nu an -- non -- cer la sen -- ten -- ce
    \set stanza = "1. "
    Nous fai -- sons preuve d'ir -- ré -- ve -- ren -- ce
    Mais tou -- jours a -- vec e -- le -- gan -- ce
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Au -- to  mé -- tro  bou -- lot  con -- so _
    Au -- to at -- tes -- ta -- tion qu'on sig -- ne
    \set stanza = "2. "
    Ab -- sur -- di -- té sur or -- don -- nan -- ce
    Et mal -- heur à ce -- lui qui pen -- se
    \set stanza = "2. "
    Et mal -- heur à ce -- lui qui dan -- se

    Cha -- que me -- sure au -- to -- ri -- taire
    \set stanza = "2. "
    Cha -- que re -- lent sé -- cu -- ri -- taire
    Voit s'en -- vo -- ler no -- tre con -- fian -- ce
    \set stanza = "2. "
    Ils font preuve de tant d'in  -- sis -- tan -- ce
    Pour con -- fi -- ner not -- re con -- sci -- ence
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
    Ne so -- yons pas im -- pres -- sion -- nab -- les
    Par tous ces gens dé -- rai -- son -- nab -- les
    \set stanza = "3. "
    Ven -- deurs de peur en a -- bon -- dan -- ce
    Sa -- chons les te -- nir à dis -- tan -- ce

    \set stanza = "3. "
    An -- gois -- sants, jus -- qu'à -- l'in -- dé -- cen -- ce
    _ Pour no -- tre san -- té men  -- tale
    \set stanza = "3. "
    So -- cia -- le‿et en -- vi -- ron -- ne -- men -- tale
    Nos sourires, no -- tre‿in -- tel -- li -- gen -- ce
    \set stanza = "3. "
    Ne so -- yons pas sans ré -- sis -- tan -- ce
    Les ins -- tru -- ments de leur dé -- men -- ce

}}

refrain = \relative c'' {
    \key g \minor
   % Refrain
   r4 %\override ParenthesesItem.font-size = #5
    \startParenthesis \parenthesize
   d8 d d c bf \endParenthesis \parenthesize a |
   g4 g8 g ~ 2 |r4 g8 g g g d' c ~ |
   c4. g8 g2 | r4 c8 c c c d c |
   bf4. g8 g2 | r8 bf bf bf bf bf c bf |
   a4. g8 a2    |
   r4 d8 d d c bf a |
   g4 bf8 g~ 2 | r4 d'8 d d d d f |
   f4. ef8 c2 | r4 ef8 ef ef ef d c |
   g'4. d8 bf2 | r8 d d d d d c bf |
   d4. a8 a2 \bar "||" \break |
}
strophe = \relative c'' {
   % Strophe
   r8 d8 d d d c bf a |
   bf8 g d'16 d d8 d8 c bf a |
   bf g \break g16 g g8 g g g d' |
   c4. g8~ g2  |
   r8 ef' ef ef ef ef d c  |
   d4. bf8~ bf2 |
   r8 d d d d d c bf |
   d4. a8 ~ a2 |

   r8 d d d d c bf a  |
   g4 \break d'16 d d8 d c bf a |
   g8 g g g g g g d' |
   c4. g8~ g2 |
   r8 ef' ef ef ef ef d c |
   d4. g8~ 2 |
   r8 d d d d d c bf |
   d4. a8~ 2 \bar "||" |
}


chrdRefrain = \chordmode {
  s1 g1:m s c:m s g:m s d:7 s
  g1:m s c:m s g:m s d:7 s
}

chrdStrophe = \chordmode {
  g1:m s c:m s bf s d:7 s
  g1:m s c:m s bf s d:7 s
 }


\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
  \transpose g \transTo {
    <<
      \new ChordNames {  \chrdRefrain \chrdStrophe }
       \new Voice = "Refrain" { \refrain 
         \new Voice = "Strophe" { \strophe }
       }  
   \new Lyrics \lyricsto "Refrain" \lyrRefrain
   \new	Lyrics \lyricsto "Strophe" \lyrStropheA
   \new	Lyrics \lyricsto "Strophe" \lyrStropheB
   \new Lyrics \lyricsto "Strophe" \lyrStropheC
      >>
  } }
}
