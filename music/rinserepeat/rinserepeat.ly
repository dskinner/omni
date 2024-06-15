\include "jungle.ly"
\include "wayspart.ly"

\version "2.24.3"

\header {
  title = "rinserepeatjungle"
  composer = "DS"
}

bdsn_I = \drummode {
  bd4 sn8 bd4 sn8 bd8 sn8
  bd4 sn8 bd4 sn8 sn4
  bd4 sn8 bd4 sn4 sn8
  bd4 sn8 sn8 bd8 sn8 bd8 sn8
}

bdquarters = \drummode {
  bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4
  bd4 bd4 bd4 bd4
}


rhythm = \relative c, {
  c16 cis c
  c8 r16
  c4.
  c8 r16
  c16
}

rhythmEnd = \relative c {
  g8 g16 g8
  f8 f16 f8
  cis8 cis8 c8
}

rhythmLoop = {
  \rhythm
  \rhythm
  \rhythm
  \rhythmEnd
}


melodyTranscribed = \relative c' {
  g c, c
  gis' c, c 
  g' c, c
  
  f c c
  g' c, c
  f c c
  
  e c c
  f c c
  e c c
  f c c
  g' c, c
  f c c
}

melody = \relative c' {
  \tuplet 3/2 { g8\tenuto c, c }
  \tuplet 3/2 { gis' c, c }
  \tuplet 3/2 { g' c, c }
  
  \tuplet 3/2 { f\tenuto c c }
  \tuplet 3/2 { g' c, c }
  \tuplet 3/2 { f c c }
  
  \tuplet 3/2 { e\tenuto c c }
  \tuplet 3/2 { f c c }
  \tuplet 3/2 { e\tenuto c c }
  \tuplet 3/2 { f c c }
  \tuplet 3/2 { g' c, c }
  \tuplet 3/2 { f c c }
}

melodyAlt = \relative c' {
  \tuplet 3/2 { g8 gis c, }
  \tuplet 3/2 { gis' g c, }
  \tuplet 3/2 { g' f c }
  
  \tuplet 3/2 { f g c, }
  \tuplet 3/2 { g' f c }
  \tuplet 3/2 { f e c }
  
  \tuplet 3/2 { e f c }
  \tuplet 3/2 { f e c }
  \tuplet 3/2 { e f c }
  \tuplet 3/2 { f g c, }
  \tuplet 3/2 { g' f c }
  \tuplet 3/2 { f g c, }
}

melodyfourfour = \relative c {
  c8 g' gis
  c, gis' g
  c, g'
  
  c, f g
  c, g' f
  c f
  
  c e f
  c f e
  c e
  
  % NOTE needs ending
}

melodyfourfourEndOne = \relative c {
  c f g
  c, g' f
  c f
}

melodyfourfourEndTwo = \relative c {
  c16 cis c ais c8
  ais16 c8
  ais16 c cis c8 ais
  c1
}

drumbb = {
  \bdsn_I
  \bdsn_I
  \bdsn_I
  r1
  %\tempo 4=100
  \bdquarters
  \bdquarters
  r1
  
  r1 r r r r r r r r r r r r r r r
  \junglebdsn
  \junglebdsn
}


rhythmLine = {
  \clef bass
  \time 4/4
  \tempo 4=81
  \rhythmLoop
  \rhythmLoop
  \rhythmLoop
  
  r1 r r r r r r
  
  r
  \tempo 4=162
  r1 r r r r r r r r r r r r r r r
  \junglerhythm
  \junglerhythmAlt
}

melodyLine = {
  \clef "treble_(8)"
  \time 4/4
  \tempo 4=81
  
  r1 r r r
  \melodyfourfour \melodyfourfourEndOne
  \melodyfourfour \melodyfourfourEndTwo
  
  \tempo 4=100
  \melody
  \melody
  
  % TODO nicer transition
  c2 \tuplet 3/2 {c4 c c }
  
  
  
  \tempo 4=162
  r1 r r r r r r r r r r r r r r r
  \junglemelodyfourfourAlt
  \junglemelodyfourfourAlt
}

wayspartWrapper = {
  \clef bass

  r1 r r r r r r r r r r r r r r r r r r
  

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
  \junglemelodyfourfourAlt
  \junglemelodyfourfourAlt
}

\score {
  <<
    \new Staff = "melody line" \melodyLine
    \new Staff = "rhythm line" \rhythmLine
    \new Staff = "wayspart line" \wayspartWrapper
    
    \new DrumStaff \with { instrumentName = "drums" }
    <<
      \new DrumVoice { \stemDown \drumbb }
    >>
  >>
  \layout { }
  \midi { }
}