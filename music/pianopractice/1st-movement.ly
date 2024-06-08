\version "2.24.3"

\header {
  composer = "DS"
}

brassLower_I = {
  <f f,>2 r4 <bes bes,>4
  <aes aes,>2 r4 <e e,>4
  <f f,>2 r4 <bes bes,>4
  <aes aes,>2 r2
}

brassLower = \relative c {
  \clef bass
  \key c \locrian
  \time 4/4
  \tempo 4=60
  
  \brassLower_I
  \brassLower_I
  \brassLower_I
}

brassUpper = \relative c' {
  \clef treble
  \key c \locrian
  \time 4/4
  \tempo 4=60

  %%        TODO brass splits last into 3rds which sounds great; do here
  <c f>2 r4 <c ges'>4
  <c ees>2 r4 <c des>4
  <c f>2 r4 <c ges'>4
  <c ees>2 r8 <c des>8 <c f> <c bes'>
}

stringsSpiccato = \relative c {
  \clef bass
  \key c \locrian
  \time 4/4

  c8 ees f4 r4 ees4
  bes8 des ees4 r4 des4
  c8 ees f4 r4 ees4
  bes8 des ees4 r4 des4
}

bdsn_I = \drummode {
  bd4 sn8. bd8. bd8 sn4
  bd4 sn8. bd8. bd8 sn4
  bd4 sn8. bd8. bd8 sn4
  bd4 sn8. bd8. bd8 sn4
}

drumbb = {
  %%       3/16
  \bdsn_I
  \bdsn_I
}

hh_I = \drummode {
  hh8 hh hh hh r r hh r
  hh8 hh hh hh r r hh hh
  hh8 hh hh hh r hh r hh
  hh8 hh hh hh r r hh r
}

drumhh = \drummode {
  \hh_I
  \hh_I
}

piano = \relative c' {
  \clef treble
  \key c \locrian
  r1 r1 r1 r1
  %% TODO maybe loop above with strings and brass and then drop beat and play fast piano below
  \time 3/4
  \tempo 4=72

  <c f>8 <c f> <c f>2
  <c ges'>8 <c ges'> <c ges'>2
  <c ees>8 <c ees> <c ees>2
  <c des>8 <c f> <c bes'>2
  e16. dis cis ais <c f>4.~ 4.

  %% TODO mapped out in 4/4 before using 16th dotted notes
  e16. dis cis ais
  \time 4/4
  <c f>8 <c ges'>8 <c ees>4
  <c des>8 <c f>8 <c bes'>4
  e16. dis cis ais <c f>2
  <c ges'>8 <c ees>4
  <c des>8 <c f>8 <c bes'>4.
  e16. dis cis ais <c f>2.
}

pianoD = \relative c'' {
  \clef treble
  \key c \locrian
  
  r1 r r r
  
  %c32 ees f c ges' f ees~8.
  %c32 ees f c ges' f ees r
  %e16 dis32 cis ais
  c32 ees f c ges' f ees16
  r2
  <f ees>16 <ges ees> <f ees>8
  
  ges32 f r ges f r ges f16 % tension
  r16
  %%                rest 9/32
  e32 dis32 cis ais r r4
  c32 ees f c ges' f ees16
  %<c f>4 ges' f <c f>16 <c ges'> <c f>4.
  <c f>4. ges'32 f4 r16.
  <c f>16 <c ges'> <c f>8 % plays last quarter
  
  % triple threat
  %<c f>4
  %f32[ ges ees] f[ ges ees] f[ ges ees]
  %ges[ f ees] ges[ f ees] ges[ f ees]~ 8.
  
  %%
  %ges'32 f r ges f r ges f16 % tension
  <c f>4. ges'32 f r8.
  % triplet outro
  e64[ dis cis ais]
  e'[ dis cis ais]
  e'[ dis cis ais]~ 8.
  
  %e'[ dis cis ais8.] r64
  
  <c f>4. ges'32 f4 r16.
  <c f>16 <c ges'> <c f>8
  <c f>4
  f32[ ges ees] f[ ges ees] f[ ges ees]
  ges[ f ees] ges[ f ees] ges[ f ees]~ 8.
  <c f>4
  f32[ ges ees] f[ ges ees]
  ges[ f ees] ges[ f ees] ges[ f ees]~ 4 r32
  <c f>4
  f32[ ges ees] f[ ges ees] f[ ges ees]
  ges[ f ees] ges[ f ees] ges[ f ees]~ 8.
}

\score {
  %\new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "brass upper"  \brassUpper 
    
    \new Staff = "brass lower" \brassLower
    
    \new Staff = "strings spiccato" \stringsSpiccato
        
    \new Staff = "piano play" \pianoD
    
    %\new DrumStaff = "drumhh" \drumhh
    %\new DrumStaff = "drumbb" \drumbb
    
    \new DrumStaff \with { instrumentName = "drums" }
    <<
      \new DrumVoice { \stemUp \drumhh }
      \new DrumVoice { \stemDown \drumbb }
    >>

  >>
  \layout { }
  \midi {

  }
}