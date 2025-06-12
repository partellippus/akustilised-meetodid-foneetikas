Erase all
Read from file: "diftongid.Collection"

Select outer viewport: 0, 4, 0, 4-0.15

selectObject: "Sound ui"
alg = 0.073
lop = 0.222
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: alg, lop, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound ui"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: alg, lop, 5000, 300, "no"
Black
Draw inner box
Text top: "no", "/ui/"
Text left: "yes", "Sagedus (Hz)"
Marks left: 6, "yes", "yes", "no"
Text bottom: "yes", "Aeg (s)"
Marks bottom: 3, "yes", "yes", "no"
plusObject: spec
plusObject: "Sound ui"
plusObject: "TextGrid ui"
Remove

# 2. paneel
Select outer viewport: 3, 7, 0, 4-0.15

selectObject: "Sound õi"
alg = 0.083
lop = 0.211
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: alg, lop, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound õi"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: alg, lop, 5000, 300, "no"
Black
Draw inner box
Text top: "no", "/ɤi/"
Text bottom: "yes", "Aeg (s)"
Marks bottom: 3, "yes", "yes", "no"
plusObject: spec
plusObject: "Sound õi"
plusObject: "TextGrid õi"
Remove

# 3. paneel

Select outer viewport: 6, 10, 0, 4-0.15

selectObject: "Sound õe"
alg = 0.118
lop = 0.350
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: alg, lop, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound õe"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: alg, lop, 5000, 300, "no"
Black
Draw inner box
Text top: "no", "/ɤe/"
Text bottom: "yes", "Aeg (s)"
Marks bottom: 3, "yes", "yes", "no"
plusObject: spec
plusObject: "Sound õe"
plusObject: "TextGrid õe"
Remove

# 4 paneel

Select outer viewport: 1.5, 5.5, 3.5+0.15, 7.5

selectObject: "Sound ai"
alg = 0.067
lop = 0.232
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: alg, lop, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound ai"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: alg, lop, 5000, 300, "no"
Black
Draw inner box
Text top: "no", "/ɑi/"
Text left: "yes", "Sagedus (Hz)"
Marks left: 6, "yes", "yes", "no"
Text bottom: "yes", "Aeg (s)"
Marks bottom: 3, "yes", "yes", "no"
plusObject: spec
plusObject: "Sound ai"
plusObject: "TextGrid ai"
Remove


Select outer viewport: 4.5, 8.5, 3.5+0.15, 7.5

selectObject: "Sound ea"
alg = 0.099
lop = 0.309
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: alg, lop, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound ea"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: alg, lop, 5000, 300, "no"
Black
Draw inner box
Text top: "no", "/eɑ/"
Text bottom: "yes", "Aeg (s)"
Marks bottom: 3, "yes", "yes", "no"
plusObject: spec
plusObject: "Sound ea"
plusObject: "TextGrid ea"
Remove

Select outer viewport: 0, 10, 0, 7.5

Save as 300-dpi PNG file: "diftongid.png"