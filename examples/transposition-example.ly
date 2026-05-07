\version "2.24.0"
\language "english"

%% Transposition Macro Example using Quint (Fifth) Space
%%
%% The transposition uses quint space (circle of fifths) for calculation:
%% -6  -5  -4  -3  -2  -1   0  +1  +2  +3  +4  +5  +6
%% gf  df  af  ef  bf   f   c   g   d   a   e   b   fs
%%
%% Formula: target_quint = sheet_quint - instrument_quint

\include "../include/transposition.ily"

sheetTonality = d  % Concert key: D major

melody = \relative c' {
  \key d \major
  \time 4/4
  d4 e fs g | a b cs' d' |
  g fs e d | a2 d |
}

chrdMelody = \chordmode {
  d1 | g | a7 | d |
}

%% Score using the transposition macro
\score {
  \header {
    piece = "Melody in D major (concert pitch)"
  }
  <<
    \new ChordNames \chrdMelody
    \new Staff \melody
  >>
}

%% ===================================================================
%% BOOK FILE USAGE
%% ===================================================================
%%
%% In a separate book file for transposing instruments:
%%
%% \include "sheet.ly"
%% transposeFor = bf             % Set instrument pitch
%% \book { ... }
%%
%% The sheet will automatically be transposed to the correct key.

%% ===================================================================
%% INSTRUMENT PITCH VALUES AND TRANSPOSITIONS
%% ===================================================================
%%
%% For concert key D major (quint = 2):
%%
%% Pitch | Quint | Calculation       | Result | Written Key
%% ------|-------|-------------------|--------|-------------
%% bf    | -2    | 2 - (-2) = 4      | e      | E major
%% ef    | -3    | 2 - (-3) = 5      | b      | E major (enharmonic)
%% a     | 3     | 2 - 3 = -1 = f    | f      | F major
%% f     | -1    | 2 - (-1) = 3      | a      | A major
%% c     | 0     | 2 - 0 = 2         | d      | D major (no change)

%% ===================================================================
%% OPTIONAL OCTAVE ADJUSTMENT
%% ===================================================================
%%
%% transposeOctaveBf = ","  % Down one octave
%% transposeOctaveBf = "'"  % Up one octave
%%
%% Note: Use string values for octave adjustment
