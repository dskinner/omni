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

bdBaz = \drummode {
  bd4
  r8.. %r8 r16 r32 
  bd4
  r8..
  bd4
  r16
}

thrashBaz = \relative c {
  c16[ cis c c gis]
  r16 r16.
  c16[ cis c c gis]
  r8 r32
  c16[ cis c c c]
}

nextBaz = \relative c' {
  %c16[cis c] r16 r16
  %f,4 dis8. fis4 r4
  % tempo 200?
  
  %c16[ c cis c] r4
  %c8[ c cis c]
  %f,8.\staccato dis\staccato fis\staccato
  
  %
  %c16 r16.. c16 r16.. c16 r16.
  \tuplet 8/1 {
    c2 c c c c c c c
  }
  % maybe put on different staff
  f,16 r8. dis16 r8. fis16
}

nextBazFill = \relative c' {
  r8. c16
}

nextBazEnd = \relative c' {
  r8. c16
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

% basically perfect; 5/4 time
trysomething = \relative c' {
  \tuplet 3/2 {
    c8[ cis c\staccato c\staccato] r4
    c8[ cis c\staccato c\staccato] r4
    c8[ cis c]
  }
}

trysomethingTwo = \relative c {
  \tuplet 3/2 {
    %r8 f8\staccato r dis\staccato r fis\staccato
    %ais8 f'8\staccato ais, dis\staccato ais fis'\staccato
    %r8 <ais f'\staccato> r <ais dis\staccato> r <ais fis'\staccato>
    ais8 <ais f'\staccato> ais <ais dis\staccato> ais <ais fis'>
    r r r
    
    %<ais c>8\staccato c[ cis c] r r
    c8\staccato c[ cis c] r r
  }
}

% TODO closer
trysomethingThree = \relative c {
  \tuplet 3/2 {
    %r8 f8\staccato r dis\staccato r fis\staccato
    %ais8 f'8\staccato ais, dis\staccato ais fis'\staccato
    %r8 <ais f'\staccato> r <ais dis\staccato> r <ais fis'\staccato>
    ais8 <ais f'\staccato> ais <ais dis\staccato> ais <ais fis'>
    r
    r16 c16\staccato % NOTE or just r8
    
    %c16 c16 c8\staccato c[ cis c] r r
    c16[ c16 c16]~16 c8[ cis c] r r
  }
}

% dabass
trysomethingFour = \relative c, {
  \tuplet 3/2 {
    c16 c c c c c
    c c c c c c
    c c c
    
    c16 c c c c c
    c c c c c c
    c c c
  }
}

% the elusive rhythm!
trysomethingFive = \relative c {
  \tuplet 3/2 {
    <f ais,>16 r r r <dis ais> r
    <fis ais,> r r r <dis ais> r
    <c ais> r r
    
    r r r r r r
    r r r r r r
    r r r
  }
}

trysomethingTwoEnd = \relative c' {
   \tuplet 3/2 {
    c8[ cis c r]
  }
}


% everything all 6/4 time followed by chaotic parts and then the
% main melody with all triplets that switches mid part to the 3 3 2 3 3 2 (so 4/4) version
% that transitions to jungle

melodyLine = {
  \clef bass
  \time 4/4
  \tempo 4=162
  %\melodyOne
  %\melodyOne
  %\melodyTwo
  %\melodyTwo
  
  \time 5/4
  %\trysomething
  \trysomethingFive
  \trysomethingFive
  %\trysomethingTwo
  %\trysomethingTwo
  \time 4/4
  \melodyTwo
  
  %\time 5/4
  %\thrashBaz
  %\thrashOne
  
  %\nextBaz
  %\nextBazFill
  %\nextBaz
  %\nextBazFill
  %\nextBaz
  %\nextBazFill
  %\nextBaz
  
  %\melodyOne
  
  %\thrashOne
  %\thrashOne
  %\thrashOne
  %\thrashOne
  %\thrashNext
  %\thrashNext
}

drumbb = {
  %\bdBaz
  %\bdBaz
  %\bdsn_I
  %\bdsn_I
  %\bdsn_I
  %\bdsn_I
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