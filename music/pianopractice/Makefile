all: 1st-movement.midi 2nd-movement.midi

1st-movement.midi: 1st-movement.ly
	lilypond 1st-movement.ly

2nd-movement.midi: 2nd-movement.ly
	lilypond 2nd-movement.ly

clean:
	rm *.midi
	rm *.pdf
