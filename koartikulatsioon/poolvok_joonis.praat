Erase all
Read from file: "poolvok.Collection"

Font size: 14
Select outer viewport: 0, 4.1, 0, 4

selectObject: "Sound aja"
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: 0, 0, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound aja"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: 0, 0, 5000, 300, "no"
Black
Draw inner box
Text left: "yes", "Sagedus (Hz)"
Marks left: 6, "yes", "yes", "no"
Text bottom: "yes", "Aeg (s)"
# Marks bottom: 3, "yes", "yes", "no"
plusObject: spec
plusObject: "Sound aja"
Remove
selectObject: "TextGrid aja"
runScript: preferencesDirectory$ + "/plugin_Sampa2Praat/sampa2praat.praat", 2, "Sampa to Praat", "Replace_tier"
intd = Get number of intervals: 2
for i to intd
  start = Get start time of interval: 2, i
  stop = Get end time of interval: 2, i
  lab$ = Get label of interval: 2, i
  One mark top: start+(stop-start)/2,"no", "no", "no", lab$
  One mark bottom: stop, "no", "yes", "yes", fixed$(stop, 3)
endfor


Select outer viewport: 2.95, 7.05, 0, 4

selectObject: "Sound aja__2_"
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: 0, 0, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound aja__2_"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: 0, 0, 5000, 300, "no"
Black
Draw inner box
Text bottom: "yes", "Aeg (s)"
# Marks bottom: 3, "yes", "yes", "no"
plusObject: spec
plusObject: "Sound aja__2_"
Remove
selectObject: "TextGrid aja__2_"
runScript: preferencesDirectory$ + "/plugin_Sampa2Praat/sampa2praat.praat", 2, "Sampa to Praat", "Replace_tier"
intd = Get number of intervals: 2
for i to intd
  start = Get start time of interval: 2, i
  stop = Get end time of interval: 2, i
  lab$ = Get label of interval: 2, i
  One mark top: start+(stop-start)/2,"no", "no", "no", lab$
  One mark bottom: stop, "no", "yes", "yes", fixed$(stop, 3)
endfor

Select outer viewport: 5.9, 10, 0, 4

selectObject: "Sound tuua"
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: 0.0, 0.5, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound tuua"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: 0.0, 0.5, 5000, 300, "no"
Black
Draw inner box
Text bottom: "yes", "Aeg (s)"
# Marks bottom: 3, "yes", "yes", "no"
plusObject: spec
plusObject: "Sound tuua"
Remove
selectObject: "TextGrid tuua"
runScript: preferencesDirectory$ + "/plugin_Sampa2Praat/sampa2praat.praat", 2, "Sampa to Praat", "Replace_tier"
intd = Get number of intervals: 2
for i to intd
  start = Get start time of interval: 2, i
  stop = Get end time of interval: 2, i
  lab$ = Get label of interval: 2, i
  One mark top: start+(stop-start)/2,"no", "no", "no", lab$
  One mark bottom: stop, "no", "yes", "yes", fixed$(stop, 3)
endfor


Select outer viewport: 0, 9.5, 0.2, 4

Save as 300-dpi PNG file: "poolvok.png"