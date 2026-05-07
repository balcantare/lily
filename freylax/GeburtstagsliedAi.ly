\version "2.24.2"

% Geburtstagslied
% From PMX source: 2005 freylax
% Key: D minor (1 flat)
% Time: 4/4

\header {
  title = "Geburtstagslied"
  composer = "Traditional / freylax"
  copyright = "2005 freylax"
}

global = {
  \time 4/4
  \key d \minor
}

% Chord progressions
chordNames = \chordmode {
  \global
  \partial 4
  % Intro (4 bars with pickup)
  d4:m | d2.:m a4.:7 | d2.:m a4.:7 | d1:m |

  % Verse 1 (8 bars)
  d2.:m a4:7 | d2.:m a4:7 |
  d4.:m a8:7 d4.:m a8:7 |
  d2.:m d4.:7 | g2.:m d4:m | a4.:7 d2.:m |

  % Verse 2 (8 bars) - same as Verse 1
  d2.:m a4:7 | d2.:m a4:7 |
  d4.:m a8:7 d4.:m a8:7 |
  d2.:m d4.:7 | g2.:m d4:m | a4.:7 d2.:m |

  % Refrain (8 bars)
  f4.:7 e4. | f4.:7 e4. |
  c4. d4.:7 |
  f4. c4.:7 f4 |
  g2.:m | d2.:m |
  a2. | d2. |
}

% Melody
melody = \relative c'' {
  \global
  \clef treble
  \partial 4

  % Intro (4 bars) - pickup
  d4 |
  c4 a8 r8 a4 | r4 d d e8 r8 | e4 g g e | r4 a4. f8 d4 |
  e4 e8 r8 e4 e4 | c4 a8 c4.~ c4 | a'4 e g f | d8 e4.~ e4 r4 |

  % Verse 1 (8 bars)
  r4 b8 a4 g8~ g4 | e4 g8 g4.~ g4 |
  e4 f8 g4 e4 | d4 e8 a4 b4 | r4 e,8 r4 e8~ e4 | g4 a8 g4 a4 |
  e4. r4 r2 | r4 g8 a4. | e4 e8~ e4 e4 | a4 a8~ a4 e4 |
  r4 f8 d4 e4 | r4 c8 e4 a4 | e4 c8 e4 a4 | r4 a8 a4 a4 |
  r4 e8 e4 b4 | r4 a8[ g] a4 | a4 e8 d4 e8~ e4 | r2 r4 e8 |

  % Verse 2 (same as Verse 1)
  a4~ a4 e4 e4 | b4 b8~ b4 a4 | g4 a4 a4 e4 | d4 e8~ e4 r4 |
  r2 r4 d'8 f8 | f4 c4 e4 b4 | e4 r4 f4 r4 | e4 g8 g4 e8 g8 |

  % Refrain ending
  a4. r4 e8~ e8 | r2. e4 | g4 a8 g4 e8 c8[ e8] | f4 r4 a4 c8[ d8] |
  e4 c8 a8~ a8 b8 | a4 e8 g4 a8 b8 | d4 f4 c8 a8~ a8[ r8 b8 e8] | e8 a8~ a8 r8 d4 |
  \bar "|."
}

% German lyrics
lyricsVerseOne = \lyricmode {
  \set stanza = "1."
  Wie die Fuss -- gän -- ger schim -- pfen,
  sind in klitsch -- nas -- sen Strüm -- pfen
  und der Re -- gen rinnt ü -- bern As -- phalt.
  Was für Au -- gen sie ma -- chen,
  denn sie se -- hen mich la -- chen
  an 'nem Tag, der so trü -- be und kalt.
}

lyricsVerseTwo = \lyricmode {
  \set stanza = "2."
  Plötz -- lich kommt, un -- ge -- lo -- gen
  'n blau -- es Flug -- zeug ge -- flo -- gen
  und ein Zaub -- 'rer steigt aus, ganz in weiss.
  Er will mir gra -- tu -- lie -- ren,
  ein paar Fil -- me vor -- füh -- ren
  und er schenkt al -- len Es -- kim -- o -- Eis.
}

lyricsRefrain = \lyricmode {
  Ich bin so glück -- lich,
  ich spiel für al -- le
  Zieh -- har -- mo -- ni -- ka, na klar!
  Denn Ge -- burts -- tag
  hat man lei -- der
  nur ein -- mal im Jahr.
  Denn Ge -- burts -- tag
  hat man lei -- der
  nur ein -- mal im Jahr.
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff {
      \new Voice = "melody" {
        \melody
      }
    }
    \new Lyrics \lyricsto "melody" \lyricsVerseOne
    \new Lyrics \lyricsto "melody" \lyricsVerseTwo
    \new Lyrics \lyricsto "melody" \lyricsRefrain
  >>
  \layout {
    indent = 0
    \context {
      \ChordNames
      \override ChordName.font-size = #0
    }
  }
  \midi {
    \tempo 4 = 100
  }
}
