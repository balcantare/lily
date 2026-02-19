\version "2.24.0"
sheetName = "Hell erstrahlen Tausend Sterne"
sheetComposer = "Beate Tarrach"

\include "../include/book.ily"

lyrA = {
  \lyricmode {
    \set stanza = #"1. "
    Hell er -- strah -- len tau -- send 
    Ster -- ne, leuch -- ten uns vom 
    Him -- mels -- zelt.
    \set stanza = #"1. "
    Und sie schen -- ken aus wei -- ter 
    Fer -- ne sanf -- ten Zau -- ber uns -- rer
    Welt.
    \set stanza = #"1. " 
    Und sie schen -- ken aus wei -- ter 
    Fer -- ne sanf -- ten Zau -- ber uns -- rer
    Welt.
    \set stanza = #"3. "
    Tau -- send Ster -- ne strah -- len,
    hell er -- glänzt ihr Schein.
    \set stanza = #"3. "
    Ei -- ner von al -- len kann dein Glücks -- stern sein.
}}

lyrB = {
  \lyricmode {
    \set stanza = #"2. "
    Un -- term gro -- ßen Him -- mel le -- ben
    all wir Men -- schen hier ver -- eint.
    \set stanza = #"2. "
    Wolln‘ ein -- an -- der _ Hoff -- nung ge -- ben,
    dass ein Stern für je -- den scheint. 
    \set stanza = #"2. "
    Wolln‘ ein -- an -- der _ Hoff -- nung ge -- ben,
    dass ein Stern für je -- den scheint.
}}

lyrC = {
  \lyricmode {
    \set stanza = #"3. "
    Spürt die Glut in un -- seren Her -- zen,
    fühln‘ wir uns ein -- an -- der nah!
    \set stanza = #"3. "
    Und es wärmt uns wie tau -- send Ker -- zen,
    sind wir für -- ein -- an -- der da.
    \set stanza = #"3. "
    Und es wärmt uns wie tau -- send Ker -- zen,
    sind wir für -- ein -- an -- der da.
}}

lyrD = {
  \lyricmode {
    \set stanza = #"4. "
    Hell er -- strah -- len tau -- send Ster -- ne
    leuch -- ten uns vom Him -- mels -- zelt,
    \set stanza = #"4. "
    so als wünsch -- ten sie uns von Fer -- ne:
    Frie -- de sei auf die -- ser Welt!
    \set stanza = #"4. "
    So als wünsch -- ten sie uns von Fer -- ne:
    Frie -- de sei auf die -- ser Welt!
}}

sopranA = \relative c'' {
  \voiceOne
  \override Rest.staff-position = #2
  e2 b
  cs4 b8 a 
  b2
  cs2 e 
  a4 gs fs2
  b4 gs a cs
  b4. a8 gs2
  a8 gs fs4
  gs2
  fs4 a gs2
  gs4 b a2
  cs4 b8 a gs2
  a8 gs fs4 gs2
  fs8 e ds4 e2
  \mark \markup{  Bridge, nach 3. Strophe}
  b1 e cs ds4 e fs2
  a4 gs fs2
  e1 cs fs4 e ds2
 
}

sopran = \relative c' {
  \voiceTwo
  \time 4/4
  \key e \major
  e4 gs fs fs
  e ds8( cs) b4 4
  cs4. cs8 b4 e
  e ds8( e) fs2 \break
  gs4 e a a8 gs
  fs4. fs8 e4 b
  cs4. cs8 b4 e
  e fs gs2 \break
  gs4 b b a8 gs
  fs4. fs8 e4 b
  cs4. cs8 b4 e
  e ds e2 \break
  \bar "||"
  ds4. e8 fs4 a
  gs2 e
  e4. cs8 cs4 b
  b1 \break
  cs2 ds4 fs 
  e( fs) gs2
  a4 a a cs
  b1
  \bar "|."
}


tenor = \relative c'' {
  \voiceOne
  \key e \major
  gs4 b b a 
  a b gs e
  a4. a8 gs4 gs
  a cs b2
  b4 gs cs cs8 8
  b4. a8 gs4 gs
  a4. fs8 gs4 gs
  a b b2
  b4 e cs cs8 cs
  b4. a8 gs4 gs
  a4. fs8 gs4 b 
  b a gs2
}

bass = \relative c' {
  \voiceTwo
  b4 b b b
  cs b b b
  e8( ds) cs4 b b 
  cs cs ds2
  e4 e cs e8 e
  fs4 ds e e 
  cs e b b cs b b2
  e4 e e e8 fs
  e4 ds e e
  cs e b b
  cs ds e2
}

chrdStrophe = \chordmode {
  e2 b:7 a e a e fs:m b:7
  e a b:7 e a e a4 b:7 e2
  e a b:7 e a e fs4:m b:7 e2
  b1:7 e a b:7 a2 b:7 e cs:m fs1:m b:7
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }#(define book-staff-size 20)
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "SopranA" { \sopranA }
      \new Voice = "Sopran" { \sopran }
      >>
    \new Lyrics \lyricsto "Sopran" \lyrA
    \new Lyrics \lyricsto "Sopran" \lyrB
    \new Lyrics \lyricsto "Sopran" \lyrC  
    \new Lyrics \lyricsto "Sopran" \lyrD  
    \new Staff <<
      \new Voice = "Tenor" { \tenor }
      \new Voice = "Basso" { \bass }
      >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 20)
      \context {
        %\Lyrics
        %\override LyricText.font-size = #1
      }
    }
  }
}
