\version "2.24.3"

\header {
  title = "summer24"
  composer = "DS"
}

% NOTE consider shifting everything besides drums up if playing all through single instrument

bdsn_I = \drummode {
  bd4 bd bd bd
  bd  bd bd bd
  bd4 bd bd bd
  bd  bd bd bd
}

drumbb = {
  \bdsn_I
  \bdsn_I
  \bdsn_I
  \bdsn_I
  \bdsn_I
  \bdsn_I
}

phraseTwo = \relative c''' {
  \tuplet 3/2 { <c f>4 <c fis> <c f> } <c dis>2
  \tuplet 3/2 { <c f>4 <c dis> <c f> } <c dis>2
  \tuplet 3/2 { <c f>4 <c dis> <c ais> } <c ais>2
  \tuplet 3/2 { <c f>4 <c dis> <c ais> } <c ais>2
}

highLine = {
  \clef treble
  
  r1 r r r
  r1 r r r
  r1 r r r
  r1 r r r
  \phraseTwo
  \phraseTwo
}

% TODO treble ... bass ... which is it

phraseOneTreble = \relative c, {
  fis4 fis8 fis4 fis8 fis8 ais4 ais8 ais4 ais4 ais4
    c4   c8   c4   c8   c8   c4   c8   c4   c4   c4
}

phraseOneBass = \relative c, {
  %6  8  10    8
  c4. c2 c2 r8 c2
  c2. c8 c2 r8 c2
}

phraseIntroTreble = \relative c {
  ais4 c8 ais cis   c ais4~1
  ais4 c8 ais   c ais   c4~1
  ais4 c8 ais cis   c ais4~1
  ais4 c8 ais ais fis fis4~1
}

phraseIntroBass = \relative c, {
  c4 c8 c c c c4~1
  c4 c8 c c c c4~1
  c4 c8 c c c c4~1
  c4 c8 c c c c4~1
}

trebleLine = {
  \clef bass
  \time 4/4
  \tempo 4=110
  
  \phraseIntroTreble
  
  \phraseOneTreble
  \phraseOneTreble
  \phraseOneTreble
  \phraseOneTreble
}

bassLine = {
  \clef bass
  \time 4/4
  \tempo 4=110
  
  r1 r r r
  r1 r r r
  %\phraseIntroBass
  
  \phraseOneBass
  \phraseOneBass
  \phraseOneBass
  \phraseOneBass
}

\score {
  <<
    \new Staff = "treble line" \trebleLine
    \new Staff = "bass line"  \bassLine 
    \new Staff = "high line" \highLine
    
    \new DrumStaff \with { instrumentName = "drums" }
    <<
      \new DrumVoice { \stemDown \drumbb }
    >>
  >>
  \layout { }
  \midi { }
}