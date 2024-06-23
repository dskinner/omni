\version "2.24.3"

\header {
  title = "fear forgotten"
  composer = "DS"
}

bdbd = \drummode {
  bd4 bd bd bd
  bd4 bd bd bd
}

bdhh_I = \drummode {
  bd4 bd8 hh8 bd8 hh8 bd4
  <bd hh> bd8 hh8 bd8 hh8 bd4
}

bdhh_II = \drummode {
  <bd hh>4 bd8 hh8 bd8 hh8 bd4
  <bd hh> bd8 hh8 bd8 hh8 bd8 hh8
}

drumStaff = {
  \bdbd
  \bdhh_II
  \bdhh_I
}

melody = \relative c, {
  f8[ f c'\tenuto] \parenthesize f,[ f c' f, c']
  fis, fis ais fis fis dis dis c
}

melodyStaff = {
  \clef bass
  \time 4/4
  \tempo 4=75

  \melody
  \melody
  \melody
}

% NOTE highhat lines up with ghost notes when played in sync but in performance this
%      rests two measures before beginning for disonance
color = \relative c' {
  c8[ c c\accent \parenthesize cis cis\accent \parenthesize c c c\accent]
  \parenthesize ais[ ais ais\accent \parenthesize c c\accent \parenthesize ais ais ais]
  
  \parenthesize a8[ a a\accent \parenthesize ais ais \parenthesize a a a\accent]
  \parenthesize ais[ ais ais\accent \parenthesize c c \parenthesize ais ais \parenthesize c]
}

% TODO lamentation 16th triplets probably; c cis

colorStaff = {
  \clef treble
  r1 r \color
}

\score {
  <<
    \new Staff = "color" \colorStaff
    \new Staff = "melody" \melodyStaff
    
    \new DrumStaff \with { instrumentName = "drums" }
    <<
      \new DrumVoice { \stemDown \drumStaff }
    >>
  >>
  \layout { }
  \midi { }
}