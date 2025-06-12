# Joonistab palk palataliseerimata ja palataliseeritud VC
# CC-by Pärtel Lippus 10.04.2025

Erase all
#Read from file: "ka-pa-ta.Collection"

Select outer viewport: 0, 5.25, 0, 4

selectObject: "Sound 0022"
Filter (stop Hann band): 0, 150, 100
spec = To Spectrogram: 0.005, 5500, 0.002, 20, "Gaussian"

alg = 2.264
ots = 2.65
Paint: alg, ots, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound 0022"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: alg, ots, 5000, 300, "no"
Black
Draw inner box
Text left: "yes", "Sagedus (Hz)"
Marks left: 6, "yes", "yes", "no"
Text bottom: "yes", "Aeg (s)"
#Marks bottom: 3, "yes", "yes", "no"

selectObject: "TextGrid 0022"
s1 = Get interval at time: 2, alg
s2 = Get interval at time: 2, ots
for i from s1 to s2
  piir1 = Get start time of interval: 2, i
  piir2 = Get end time of interval: 2, i
  lab$ = Get label of interval: 2, i
  if piir1 > alg
    One mark bottom: piir1, "no", "yes", "yes", fixed$(piir1, 2)
    piir2 = if piir2 > ots then ots else piir2 fi
    One mark top: piir1 + (piir2-piir1)/2, "no", "no", "no", lab$
  endif
endfor

Select outer viewport: 4.75, 10, 0, 4

alg = 3.945
ots = 4.36
selectObject: spec
Paint: alg, ots, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: formant
Red
Speckle: alg, ots, 5000, 300, "no"
Black
Draw inner box
Text left: "yes", "Sagedus (Hz)"
Marks left: 6, "yes", "yes", "no"
Text bottom: "yes", "Aeg (s)"
#Marks bottom: 3, "yes", "yes", "no"

selectObject: "TextGrid 0022"
s1 = Get interval at time: 2, alg
s2 = Get interval at time: 2, ots
for i from s1 to s2
  piir1 = Get start time of interval: 2, i
  piir2 = Get end time of interval: 2, i
  lab$ = Get label of interval: 2, i
  if piir1 > alg
    One mark bottom: piir1, "no", "yes", "yes", fixed$(piir1, 2)
    piir2 = if piir2 > ots then ots else piir2 fi
    One mark top: piir1 + (piir2-piir1)/2, "no", "no", "no", lab$
  endif
endfor


Select outer viewport: 0, 10, 0, 4

Save as 300-dpi PNG file: "palatalisatsioon.png"