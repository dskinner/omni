\version "2.24.3"

\header {
  title = "wip"
  composer = "DS"
}

bdsn_I = \drummode {
  bd4 bd bd bd
  bd bd bd bd
  bd bd bd bd
  bd bd bd bd
}



melodyOne = \relative c' {
  % TODO figure out where whole note c, carries out
  \tuplet 3/2 {
    c8[~c c c c c]
    c~[c c c c c]
    f, c' cis fis cis c
    f, c' cis fis cis c
    fis,~[fis fis fis fis fis]
    ais~[ais ais ais ais ais]
  }
}

melodyTwo = \relative c' {
  \tuplet 3/2 {
    f,~[f f f f f]
    dis~[dis dis dis dis dis]
    fis~[fis fis fis fis fis]
    ais~[ais ais ais ais ais]
  }
}

% five measures, so play four times to even out if 4/4
% TODO this isn't quite right
thrashOne = \relative c' {
  \tuplet 3/2 {
    c8[ cis ais ]
    r4.
    c8[ cis ais ]
    r4.
    c8[ cis ais ]
  }
}

thrashTwo = \relative c' {
  \tuplet 3/2 {
    c8[ cis ais ]
    r4.
    c8[ cis ais ]
    r4.
    r4.
  }
}

thrashOneAlt = \relative c' {
  c16[ cis f, ais ]
  r4
  c16[ cis f, ais ]
  r4
  c16[ cis f, ais ]
}

thrashMix = \relative c' {
  \tuplet 3/2 {
    c8[ cis ais ]
    r4.
    c8[ cis ais ]
    r4.
  }
  c16[ cis f, ais ]
}

thrashNext = \relative c' {
  %\tuplet 3/2 { c8[ cis ais ] }
  c16[ cis f, <f ais> ]
  
  f4\staccato dis\staccato fis\staccato
  
  \tuplet 3/2 {
    c8[ c c ]
  }
}



% everything all 6/4 time followed by chaotic parts and then the
% main melody with all triplets that switches mid part to the 3 3 2 3 3 2 (so 4/4) version
% that transitions to jungle

melodyLine = {
  \clef bass
  \time 4/4
  \tempo 4=162
  \melodyOne
  \melodyOne
  \melodyTwo
  \melodyTwo
  \time 5/4
  \thrashOne
  \thrashOne
  \thrashOne
  \thrashOne
  \thrashNext
  \thrashNext
}

drumbb = {
  \bdsn_I
  \bdsn_I
  \bdsn_I
  \bdsn_I
}

\score {
  <<
    \new Staff = "melody line" \melodyLine
    
    \new DrumStaff \with { instrumentName = "drums" }
    <<
      \new DrumVoice { \stemDown \drumbb }
    >>
  >>
  \layout { }
  \midi { }
}