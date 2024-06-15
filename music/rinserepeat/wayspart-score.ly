\include "drum.ly"
\include "wayspart.ly"
\version "2.24.3"

\header {
  title = "wayspart"
  composer = "DS"
}

drumbb = \drummode {
  bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4
  
  bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4
  
  bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4
  
  bd4 bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4 bd4
  
  bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4
}

wayspartLine = {
  \clef bass
  \time 4/4
  \tempo 4=162
  \wayspartOne
  \wayspartOne
  \wayspartTwo
  \wayspartTwo
  \time 5/4
  \elusiveIntro
  \elusiveIntro
  \elusiveTranscribed
  \elusiveTranscribed
  \time 4/4
  \wayspartTwo
}

\score {
  <<
    \new Staff = "melody line" \wayspartLine
    
    \new DrumStaff \with { instrumentName = "drums" }
    <<
      \new DrumVoice { \stemDown \drumbb }
    >>
  >>
  \layout { }
  \midi { }
}