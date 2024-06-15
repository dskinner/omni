\version "2.24.3"

\header {
  title = "wayspart"
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

% basically perfect; 5/4 time
elusiveIntro = \relative c' {
  \tuplet 3/2 {
    c8[ cis c\staccato c\staccato] r4
    c8[ cis c\staccato c\staccato] r4
    c8[ cis c]
  }
}

% dabass
emptyTriplets = \relative c, {
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
elusiveTranscribed = \relative c {
  \tuplet 3/2 {
    <f ais,>16 r r r <dis ais>\accent r
    <fis ais,> r r r <dis ais>\accent r
    <c ais> r r
    
    r c8[ c8 c8]
    r16 r c r r r
    
    %<c ais>16 r16
    %<c ais>8
    %<c ais>16~16
    <c ais>8\accent
    %<c ais>16~16\accent
  }
}

elusiveAlt = \relative c {
  \tuplet 3/2 {
    <f ais,>4\staccato <dis ais>8\accent
    <fis ais,>4\staccato <dis ais>8\accent
    <c ais>4
    
    c8[ c8 c8] r8 c8 r8
    
    %<c ais>16 r16
    %<c ais>8
    %<c ais>16~16
    <c ais>8\accent %let ring out while different instrument plays melodyTwo
    %<c ais>16~16\accent
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
  \elusiveIntro
  \elusiveIntro
  \elusiveAlt
  \elusiveAlt
  \time 4/4
  \melodyTwo
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