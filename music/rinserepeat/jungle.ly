\version "2.24.3"

\header {
  title = "jungle"
  composer = "DS"
}

junglebdsn = \drummode {
  bd4 sn8 bd4 sn8 bd16 sn16 bd8
  bd4 sn8 bd8 sn8 bd8 sn4
  bd4 sn8 bd4 sn8 bd8 hh8
  hh4 hh16 <hh sn> hh4 hh16 <hh sn> hh4
}

jungledrum = {
  %\tempo 4=100
  \junglebdsn
  \junglebdsn
}

junglerhythm = \relative c {
  c8[ c, c]
  c'[ c, c]
  c' c,
  
  ais'[ c, c]
  ais'[ c, c]
  ais' c,
  
  a'[ c, c]
  a'[ c, c]
  a' c,
  
  ais'[ c, c]
  ais'[ c, c]
  ais' c,
}

junglerhythmAlt = \relative c {
  c8[ c, c]
  c'[ c, c]
  c' c,
  
  ais'[ c, c]
  ais'[ c, c]
  ais' c,
  
  a'[ c, c]
  a'[ c, c]
  a'[ c, c]
  ais'[ c, c]
  a' c, ais' c,
}

junglerhythmLine = {
  \clef bass
  \time 4/4
  \tempo 4=162

  %\tempo 4=100
  \junglerhythm
  \junglerhythmAlt
}

% c last
junglemelodyfourfour = \relative c {
  g'8[ gis c,]
  gis'[ g c,]
  g' c, 
  
  f[ g c, ]
  g'[ f c ]
  f c 
  
  e[ f c ]
  f[ e c ]
  e c 
  
  f[ g c, ]
  g'[ f c ]
  f c 
}

junglemelodyfourfourAlt = \relative c' {
  g'8[ gis c,]
  gis'[ g c,]
  g' c, 
  
  f[ g c, ]
  g'[ f c ]
  f c 
  
  e[ f c ]
  f[ e c ]
  e[ f c ]
  
  f
  g c,
  g' f <f c> <g c,> 
  %f[ g c, ]
  %g'[ f c ]
  
}

junglemelodyLine = {
  \time 4/4
  \tempo 4=162
  %\tempo 4=100

  
  \junglemelodyfourfourAlt
  \junglemelodyfourfourAlt
  %\melodyfourfour
}

%\score {
%  <<
%    \new Staff = "junglemelody line" \junglemelodyLine
%    \new Staff = "junglerhythm line" \junglerhythmLine
%    
%    \new DrumStaff \with { instrumentName = "drums" }
%    <<
%      \new DrumVoice { \stemDown \jungledrum }
%    >>
%  >>
%  \layout { }
%  \midi { }
%}