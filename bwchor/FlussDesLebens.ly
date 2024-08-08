\version "2.22.2"
sheetName = "Fluß des Lebens"
sheetComposer = "Beate Tarrach"
#(define book-staff-size 20)
\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
   Ge -- bo -- ren sind wir,
   um Men -- schen zu sein.
   Mut -- ter Er -- de, wir dan -- ken dir!
   Doch ge -- hört die -- se Welt nicht uns
   Men -- schen al -- lein.
   Zu -- sam -- men sind wir al -- le hier.
   Mit den Tie -- ren und den Pflan -- zen un -- term
   glei -- chen Him -- mels -- zelt sind 
   wir Teil vom gro -- ßen
   gan -- zen Fluss des Le -- bens, der al -- les
   zu -- sam -- men hält.
   Siehst du dort, am Wal -- des -- saum,
   je -- nen gro -- ßen, star -- ken, al -- ten Baum?
   Reckt schon vie -- le Hun -- dert Jah -- re
   sei -- ne Äs -- te hoch zum Licht.
   Und so soll er noch recht lan -- ge le -- ben.
   Men -- schen fällt ihn nicht!
 }}

skipA = \repeat unfold 72 {\skip 8}

lyrStropheB = {
  \lyricmode {
  \skipA
  Siehst du dort, im wei -- ten Meer,
  schwimmt ein stol -- zer, schwar -- zer Wal da -- her.
  Rie -- sen -- groß, doch vol -- ler
  Sanft -- mut ist sein lä -- cheln -- des Ge -- sicht.
  Fried -- lich glei -- tet er da -- hin, oh Men -- schen,
  tö -- tet ihn _ nicht.
  }
}

lyrStropheC = {
  \lyricmode {
  \skipA
  Siehst du, hier und ü -- ber -- all
  regt sich Le -- ben auf dem Wel -- ten -- ball!
  All die Wun -- der, die -- ser Er -- de,
  in Mil -- liar -- den Jahrn voll -- bracht,
  Men -- schen, lasst sie nicht zu -- grun -- de 
  ge -- hen. Hü -- tet die -- se Pracht!
  }
}
strophe = \relative c'' {
  \partial 8
  \voiceOne
  \override Rest.staff-position = #0
  \time 4/4
  \key d \major
  a8
  d8. a16~ a8 a a4. a8
  b8. a16~ a8 g a4 d8 e
  f8 e4 d8 a4 b 
  a2. \break 
  a8 a
  b8 4 8 4 b8 cs
  d8 a4 g8 fs4. 8
  g8. g16~ 8 8 8. fs16~ 8 g 
  e2. %\break 
  \oneVoice
  a8 g
  fs8 8 8 e16 fs~ fs8 8 8 a
  a g g fs16 d~ 4 8 8 
  e8 e e fs16 g~ 8 8 a8 b
  b4 a2 r8
  \voiceOne
  a8
  g8 g4 g8 4 fs
  fs2.
  \voiceTwo
  \break 
  fs8. e16
  fs2~ 8 a g fs
  d2. d8 d
  g8. fs16 e8 d e4 fs8 e~
  e2. fs8 a
  d8 d d cs16 d~ 8 a a a
  g g g fs16 e~ e4 e8 d
  e8 e e fs16 g~ g8 g g fs
  e4 e2 e8 d
  d2.
%\bar ".|:"
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  fs8
  fs8. d16~ 8 8 4. 8
  g8. fs16~ 8 e d4 a'8 a
  a g4 fs8 fs4 g
  e2. d8 d
  g8 g4 g8 g4 fs8 e
  fs8 d4 d8 d4. d8
  b8. d16~ d8 d8 d8. 16~ 8 b
  a2. s4
  s1*3 
  s2. s8 a8 
  b d4 8 4 cs
  d2. 
  \voiceOne
  r4
  a'1
  fs
  e2. fs4
  a1
  a
  b
  g2 g
  g a
  a2.
  
}

stropheBass = \relative c' {
%  \clef "bass"
%  \key d \major
  \voiceFour
  e8
  fs8. fs16~ 8 e fs4. a8
  g8. fs16~ 8 e fs4 fs8 e
  d8 d4 d8 4 4
  e2. d8 d
  d8 4 fs8 g4 8 8
  fs8 d4 cs8 d4. d8
  b8. 16~ 8 d e8. d16~ 8 b a2. r4
  r1
  r2. cs8 b
  a8 a cs d16 e~ 8 8 fs g
  e4 e2 r8 a,8
  b b4 b8 4 a
  a2. r4
  d1
  b
  a2. b4
  cs1
  fs
  d
  a2 cs4 b
  cs2 e
  fs2.
  
}

chrdStrophe =  \chordmode {
  s8
  d1 g2 d s1 a
  g d e:m a
  d g e:m
  a g d s
  b:m e:m a d
  g e:m a d2.
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \transpose d c \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose d c \strophe }
      \new Voice = "StropheAlt" { \transpose d c \stropheAlt }
      %\new Voice = "StropheBass" { \transpose d c \stropheBass }
    >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    %\new Staff <<
    %  \new Voice = "StropheBass" { \transpose d c \stropheBass }
    %  >>

    >>
    \layout {
      \context {
        \Lyrics
        %\override LyricText.font-size = #2.5
      }
    }
  }
}
