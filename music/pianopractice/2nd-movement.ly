\version "2.24.3"

\header {
  title = "piano practice 2nd movement"
  composer = "DS"
}

lower = \relative c, {
  \clef bass
  \key c \locrian
  \time 5/4
  \tempo 4=42

  <f f'>1~4
  <bes bes'>1~4
  <aes aes'>1~4
  <e e'>1~4
}

upperPtA = {
  <c f>4
  \tuplet 3/2 { f8 ges ees }
  \tuplet 3/2 { f8 ges ees }
  \tuplet 3/2 { ges8 f ees }~4
}

upperPtB = {
  <c f>4
  \tuplet 3/2 { f8 ges ees }
  \tuplet 3/2 { f8 ges ees }
  \tuplet 3/2 { ges8[ f aes }
  bes]~8
}

upper = \relative c'' {
  \clef treble
  \key c \locrian
  \time 5/4
  \upperPtA
  \upperPtA
  \upperPtA
  \upperPtB
  %f16.[ ges ees]
  %f[ ges ees]
  %ges[ f ees]
}

\score {
  %\new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper"  \upper 
    \new Staff = "lower" \lower
  >>
  \layout { }
  \midi {

  }
}