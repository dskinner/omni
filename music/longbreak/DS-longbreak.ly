\version "2.24.3"

\header {
  title = "longbreak"
  composer = "DS"
}

bdbd = \drummode {
  bd4 bd4 bd4 bd4
}

drumStaff = {
  \bdbd
  \bdbd
  \bdbd
  \bdbd
}

lead = \relative c' {
  \tempo 4=80
  dis8 \tuplet 3/2 { d16 d d }
  c8 \tuplet 3/2 { d16 d d }
  c8 \tuplet 3/2 { b16 b b }
  \tuplet 3/2 { c8 c f, }
  
  dis'8 \tuplet 3/2 { d16 d d }
  c8 \tuplet 3/2 { d16 d d }
  c8 \tuplet 3/2 { b16 b b }
  \tuplet 3/2 { gis8 gis g }
  
  dis'8 \tuplet 3/2 { d16 d d }
  c8 \tuplet 3/2 { d16 d d }
  c8 \tuplet 3/2 { b16 b b }
  \tuplet 3/2 { c8 c b }
  
  c8 \tuplet 3/2 { c16 c c }
  b8 \tuplet 3/2 { b16 b b }
  gis8 \tuplet 3/2 { gis16 gis gis }
  g8 \tuplet 3/2 { g16 g g }
}

leadStaff = {
  \clef treble
  \lead
}

\score {
  <<
    \new Staff = "lead" \leadStaff
    %\new Staff \with { instrumentName = "brass" } \brassStaff
    
    \new DrumStaff \with { instrumentName = "drums" }
    <<
      \new DrumVoice { \stemDown \drumStaff }
    >>
  >>
  \layout { }
  \midi { }
}