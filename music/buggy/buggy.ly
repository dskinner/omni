\version "2.24.3"

\header {
  title = "buggy"
  composer = "DS"
}

bdbd = \drummode {
  bd4 r2 bd4 r2 bd4 r4
}

drumStaff = {
  \bdbd
  \bdbd
  \bdbd
  \bdbd
}

brass_I = \relative c, {
  f8[ c] dis[ c] fis[ c c]
  f[ c] dis[ c c]
  fis[ c c c]
}

brass_II = \relative c, {
  c'8[ c,] ais'[ c,] fis[ c c]
  c'[ c,] ais'[ c, c]
  fis[ c c c]
}

brassStaff = {
  \clef "bass_(8)"
  \time 4/4
  \tempo 4=162

  \brass_II
  \brass_I
  \brass_I
  \brass_I
}

lead = \relative c'' {
  \tuplet 3/2 { g8 gis g gis g gis }
  g1.
  f4 g4
  f1.
  ais,16 c16 cis8 f8 cis8
  c2~1~1~1
}

leadStaff = {
  \clef treble
  \lead
}

\score {
  <<
    \new Staff = "lead" \leadStaff
    \new Staff \with { instrumentName = "brass" } \brassStaff
    
    \new DrumStaff \with { instrumentName = "drums" }
    <<
      \new DrumVoice { \stemDown \drumStaff }
    >>
  >>
  \layout { }
  \midi { }
}