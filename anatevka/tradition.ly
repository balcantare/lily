\version "2.18.2"
\language "english"


ViolinMotiv = {
         g4 | c g g g | g2. g4 | f f e f   | g2. g4 |
              c g g g | g2. g4 | f f ef df
}

FluteMotive = { c4 c8 d e4 f   | g8 fs g af g4 e | f8 e f g f4 df }
FluteMotivei = { c4 c8 d e4 f   | g8 fs g af g4. e8 | f8 e f g f4 df }

FluteMotiveI = { e8 ds e f e4 g | c g g g | g2. d4 | f f ef df  }


adLibRep = \markup{\italic{ ad lib. repeat}}

Annotation = {
  s2. s4\mf^"Violine"
  s1*7 | s1_"Flöte"
  s1\mf | s1*3 | s1\p
  s1*18
  \repeat volta 2
  {s1\p_\adLibRep^\markup
    { \center-align\line{\bold TEVYE: ... keep our balance? } }
  }
  \repeat volta 2
  {s1\f_\adLibRep^\markup {\null \lower #4
              \column{\line{That I can tell you }
                      \line{in one Word: Tradition!}}}}
  \repeat volta 2 s1\p
  s1*16
  s4 s2.\p s1*5
  % page 4
  s1-\adLibRep^\markup
    { \column{\line{\bold TEVYE: ...and what }
              \line{ God expects him to do.}}}
  s2\f | s1*2
  % key d
  s1\p | s1*3
  s1*4 |
  s1\mf
}


Violin = {
  \relative c''' {\ViolinMotiv c1 }
  \relative c'' {\FluteMotive e8 ds e f e2}
  \relative c'' {\FluteMotive }
  \relative c'' {c1 | c4 r g' r | c r g r | df' r af r | }
  \relative c'' {\FluteMotiveI}
  \relative c'' { f f4 ef df }
}

Flute = {
  s4
  \relative c' {\FluteMotive e8 ds e f e2}
  \relative c' {\FluteMotive e8 ds e f e4 g}
  \relative c' {
    c1 | e | af | g2. df4
    c1 | e | af }
  \relative c' {\FluteMotiveI}
  \relative c' { c1 | c'4 r g r | c r g r | df' r af r }
  \relative c''{df4\staccato r af\staccato r }
}

VoiceMotiveI = { g8 | g c ~ c2. ~ | c4. c8 c c4. | r1 | r8 c c c }
VoiceMotiveIt = { g8 | g <c e> ~ <c e>2. ~ | <c e>4. <c e>8 <c e> <c e>4. |
                  r1 | r8 <c e> <c e> <c e> }
VoiceMotiveIi = { g8 | g c ~ c2. ~ | c4. c8 c2 | r1 | r8 c c c }
VoiceMotiveIti = { g8 | g <c e> ~ <c e>2. ~ | <c e>4. <c e>8 <c e>2 |
                  r1 | r8 <c e> <c e> <c e> }

VoiceMotiveII = {
  \repeat unfold 2 { a8 b cs d e fs gs a | b4 e, e r8 e |f4 bf }
  \alternative { {bf r8 c8 | bf4 a a2 } {bf8 a g f | g4 f e r }}
}
SonsMotive = {
  \repeat unfold 2 {af4 | df af df af | df cf bf af }
  \alternative{ { b cs b a | af r r }
                { a r r af | g8 f4. ~ f4 r8}}
}
VerseMotiveI = \lyricmode { Tra -- di -- tion __  tra -- di -- tion tra -- di -- tion }
VersePapas = \lyricmode {
  Who, day and night, Must scram -- ble for a liv -- ing,
  Feed a wife and chil -- dren,
  Say his dai -- ly prayers?
  And who has the right, As mas -- ter of the house, To have the fi -- nal word at home?
}
VersePapasi = \lyricmode {
  The pa -- pa, __ the pa -- pa tra -- di -- tion.
}
VerseMamas = \lyricmode {
  Who must know the way to make a pro -- per home,
  A qui -- et home, a ko -- sher home?
  Who must raise a fam -- i -- ly and run the home
  So pa -- pa's free to read the ho -- ly book?
}
VerseMamasi = \lyricmode {
  The ma -- ma, __ the ma -- ma tra -- di -- tion.
}
VerseSons = \lyricmode {
  At three I start -- ed He -- brew school, At ten
  I learned a trade. I hear they picked a bride for me.
  I hope she's pret -- ty. __
}
VerseSonsi = \lyricmode {
  The so -- ns, __ the sons tra -- di -- tion.
}
Voice = \relative c'' {
    r2 r4 r8
    \VoiceMotiveI r4 r8 \VoiceMotiveIt r2
    s1*15 s2 s1*2
    \key d \major
    \transpose c d {
      \relative c' {\FluteMotive e8 ds e f e4 g}
      \relative c' {\FluteMotivei | c4 r r r8}
      \relative c'' {\VoiceMotiveI r4 r8 }
      \relative c'' {\VoiceMotiveIt r2 }
    }
    \key a \major
    r1*2
    \relative c' \VoiceMotiveII
    \transpose c a {
      \relative c' {r2 r4 r8 \VoiceMotiveI r4 r8 }
      \relative c' {\VoiceMotiveIt r2 }
    }
    \key df \major
    r1 r2 r4
    \relative c'' \SonsMotive
    \transpose c df {
      \relative c'' {\VoiceMotiveIi r4 r8 }
      \relative c'' {\VoiceMotiveIti r2 }
    }

}
Verse = { \VerseMotiveI \VerseMotiveI
          \VersePapas \VersePapasi \VersePapasi
          \VerseMamas \VerseMamasi \VerseMamasi
          \VerseSons \VerseSonsi \VerseSonsi
}

Pause = { s1 s1*16 s1*16 }

CMotiveI = { g8( c4.) | e2 r4 e( | f1 | e8) }
CMotiveIi = { g8( e'4.) | g2 r4 e( | f1 | e8) }
CMotiveIii = \relative c' {
  <d a'>8(-> <d a' d>4.)\< | <d a' fs'>2->\fp\> r4\! <d a' fs'>4\<( |
  <ef bf' g'>1\><d a' fs'>4-.\!) r4 r\f <a' a'>8->-. r |
  <d d'>8->-. r r4\mf <fs, a>8( <fs d' fs>4.)\< |
  <fs d' a'>2\fp\> r4\! <fs d' a'>4(\< <g ef' bf'>1\> | <fs d' a'>4)-.\!
}
CMotiveIiii = \relative c' {
}

MotiveII = { \repeat unfold 3 { c4 c8 e df4 c }
             f8-. e-. f-. g-. e2 }
MotiveIII = { \repeat unfold 3
              { r4 <g c e>8-. <bf ef g>8-.
                <af df f>4-. <g c e>-. }
              <af df f>8-. e'-. f-. g-. <g, c e>4.--}
MotiveIV = { g8   | g c4. ~ c2 ~ | c2. r8
             g8-. | g <g c e>4. ~ <g c e>2 ~ | <c e>2. r8
             g8-. | g <c e g>4. ~ <c e g>2 ~ | <e g>2. r8
}
CMotiveIV = { r4 c8( e) df4( c8) }
CMotiveV = {
  r8\mp e8 e a\< a cs\! | <e, a cs>4-> r r
  <<  { \voiceOne s4 | r4 <bf' d>-> r <bf d>-> }
      \new Voice { \voiceTwo cs,(\< | d1)\! } >> \oneVoice
  <e a cs>4-> r r <d g b e> |
  <a' cs e a>4-- r8 a a cs\< cs e | <a, cs e>4->\! r r
  << { \voiceOne s4 | r4 <d f>-> r <d f>-> }
     \new Voice { \voiceTwo e,4--( | f1) } >> \oneVoice
  <e cs' e>4-> r r8\ff \repeat unfold 2 <e a cs>8-> <g c e>->
}







rqc  = \relative c' <c g' e' >4
rqai = \relative c' <cs a' e'>4
resdf = \relative c'' <ef f af>8-.
rqxdf = \relative c''' <af bf df>4-.

lqc = \relative c  <c g' e' >4
lqd = \transpose c d \lqc
lha = \relative c { a4 <e' cs'>}


bdRoc  = { r4 \rqc r \rqc }
bdRodf = \transpose c df \bdRoc
bdRoai = { r4 \rqai r4 \rqai }
bdRobfi= \transpose a bf \bdRoai
bdRoxdf= { r4 \resdf \resdf r4 \rqxdf}
bdRoxd = \transpose df d \bdRoxdf
bdLc = \relative c  { c4 < g' e' > c, < g' e' > }
bdLwc = \relative c  { c4 < g' e' > g, < g' e' > }
bdLoc = \relative c  { r4 \lqc r \lqc }
bdLodf= \transpose c df \bdLoc
bdLd  = \relative c  { d4 <a' fs'> d, <a' fs'>  }
bdLef = \transpose d ef \bdLd
bdLid = \relative c  { d4 <a' fs'> r a, }
bdLief = \transpose d ef \bdLid
bdLa = { \lha \lha }
bdLbf = \transpose a bf \bdLa
bdLxdf = \relative c { df4 <af' f'> df, <bf' f'> }
bdLdf = \relative c { df4 <af' f'> df, <af' f'> }
bdLxd = \transpose df d \bdLxdf
bddf = { <df ef f>4 ~ <df ef f>8 <cf df ef>( <df ef f>)-. r8 }

BdR = {
  \bdRoc  | \bdRoc |
  \bdRoc  | \bdRoc | \bdRodf | \bdRoc |
  r2 \relative c''\CMotiveIi r8 r4 r2 |
  \relative c''\MotiveII              |
  \relative c''\MotiveIII
  <<
    \new Voice { \voiceOne \repeat volta 2 \relative c''\MotiveIV }
    \new Voice { \voiceTwo \repeat unfold 3 {s8 | s1 | \relative c'\CMotiveIV}  }
  >> r8
  % Page 4, Takt 60
  \bdRoc
  \relative c'' {
    \repeat unfold 2 { r8 <c c'>-> <c c'>-> <cs cs'>-> }
    \alternative {
      { <a d f>-> r <a d f>-> r }
      { <d f a>-> r <d f a>-> r }
    }
    r8 a-> g-> ef-> |
  }
  \key d \major
  r1*3 \relative c'' { r2 r8 a \acciaccatura a8( bf[ a]) }
  r1*4
  r2 \CMotiveIii r4\ff r8 \relative c' {
    <a fs' d'>8-> <a fs' d'>-> <b fs' ds'>->
  }
  \key a \major
  \relative c' { <cs a' e'>8 r8 } \rqai r4 \rqai | \bdRoai |
  \repeat unfold 2 { \bdRoai \bdRoai \bdRobfi }
  \alternative { \bdRoai { r4 \relative c' <cs a' f'>4 \rqai r\f }}
  r4 \rqai r2 |
  r4 \relative c' {\CMotiveV}
  \key df \major
  \relative c'' <af df f> \resdf \resdf r4 \rqxdf
  \repeat unfold 3 \bdRoxdf \bdRoxd
  r4 \relative c'' \bddf
  \repeat unfold 2 \bdRoxdf
  \relative c'' {r4 \repeat unfold 2 {\slurUp\acciaccatura gs'8 <a e b>4->} r4}

}

BdL = {
  \bdLc   | \bdLc  |
  r2 \relative c' \CMotiveI r8 r4 r2  |
  \bdLoc  | \bdLoc | \bdLodf | \lqc r4 r g |
  \repeat unfold 4 \bdLwc
  \repeat unfold 4 \bdLwc
  \repeat unfold 6 \bdLwc
  % Page 4, Takt 60
 \set Score.currentBarNumber = #60
  \repeat volta 2 \relative c {c4 r g r }
  \relative c {
    g8->-. \repeat unfold 2 { c-> c-> cs-> | d-> r d-> r r }
    c-> c-> a-> |
  }
  \bar "||"  \key d \major
  \repeat unfold 2 {\bdLid | \bdLid | \bdLief | \bdLid }
  \repeat unfold 2 {\bdLd | \bdLd | \bdLef }
  \alternative { { \lqd r4 r  \relative c { <a a'>8 r } }
                 { \lqd r4 r8  \relative c { d-> c-> b-> } } }
  \bar "||" \key a \major
  \bdLa \bdLa
  \repeat unfold 2 { \bdLa \bdLa \bdLbf }
  \alternative { \bdLa \relative c { a4 <f' cs'> <e cs'> e, }}
  \lha \relative c { r e\mp}
  \relative c  {
    \repeat unfold 2 { \bdLa | \lha a4 r | \bdLbf }
    \alternative { { \lha r e } { a4 r4 r8 a a c } }
  }
  \bar "||" \key df \major
  \repeat unfold 4 \bdLxdf \bdLxd
  \relative c <df bf' f'>4 \relative c' \bddf
  \repeat unfold 2 \bdLxdf
  \relative c { <d a' fs'>4 <d' fs>-. <d fs>-. } r4
  \repeat unfold 3 \bdLdf \bdLd

}
Chords = \chords {
  \set chordChanges = ##t
  \Pause
  c1 | c |
  c  | c | df | c |
  c  | c | df | c |
  \repeat unfold 14 c1
  % Page 4, Takt 60
  c1 | \time 2/4 c2 | \time 2/2 d1 d1 |
  \repeat unfold 4 { d1 d1 | ef1 | d1 }
  a1 a1 |
  a1 a1 | bf1 | a1 a1 a1 | bf1 | a4 a4:aug a2 |
  a1 a1 a1 | bf1 | a2. e4:m7 | a1 a1 | bf1 | a2. c4 |
  % key df
  \repeat unfold 4 { df2 df:6 } d d:6 | df1:6 |
  \repeat unfold 2 { df2 df:6 } d1:6.9 |
  \repeat unfold 3 df1 | d1 | df2. af4:7 | df1 | df1 | d1 | df |
  % 2/4

}

\score {
  <<
    \new Staff = "voice" {
      \new Voice = "Voc" {
        \Pause s1 \Voice
      }
    }
    \new Lyrics \lyricsto "Voc" {
        \Verse
    }

    \new GrandStaff <<
      \new Staff = "up" {
        \context Voice = "A" \relative c'' {
          s2 s4
          \relative c''' {\ViolinMotiv c2. }
          <<
            \new Voice = "violin" { \voiceOne \Violin}
            \new Voice = "flute" { \voiceTwo \Flute  }
          >>
          \BdR
        }
      }
      \Chords
      \context Voice = "A" \Annotation
      \new Staff = "down" {
        \clef bass
        \Pause
        \BdL
      }
    >>
  >>
  % \midi { }
  \layout {
    \context {
      \Staff \RemoveEmptyStaves
      % To use the setting globally, uncomment the following line:
      \override VerticalAxisGroup.remove-first = ##t
    }
  }
}


%FluteMotive=
% #(define-music-function
%      (parser location dyn)
%      (ly:event?)
%   #{ c4-#dyn |
%   c8 d e4 f |
%   g8 fs g af g4 e |
%   f8 e f g f4 df |
%   e8 ds e f e2
%   #}
% )

% setDyn =
% #(define-music-function
%      (parser location)
%      ()
%    (set! mydyn #{\f#})
%    #{#})
