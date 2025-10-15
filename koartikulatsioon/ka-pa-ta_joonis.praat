# Joonistab kolm paneeli CV siirdest
# CC-by Pärtel Lippus 10.04.2025

Erase all
Read from file: "ka-pa-ta.Collection"

Font size: 14

Select outer viewport: 0, 4, 0, 4

selectObject: "Sound ka"
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: 0, 0.15, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound ka"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: 0, 0.15, 5000, 300, "no"
Black
Draw inner box
Text top: "no", "/kɑ/"
Text left: "yes", "Sagedus (Hz)"
Marks left: 6, "yes", "yes", "no"
Text bottom: "yes", "Aeg (s)"
Marks bottom: 3, "yes", "yes", "no"
plusObject: spec
plusObject: "Sound ka"
plusObject: "TextGrid ka"
Remove

Select outer viewport: 3-0.2, 7-0.2, 0, 4

selectObject: "Sound pa"
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: 0.07, 0.2, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound pa"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: 0.07, 0.2, 5000, 300, "no"
Black
Draw inner box
Text top: "no", "/pɑ/"
Text bottom: "yes", "Aeg (s)"
Marks bottom: 3, "yes", "yes", "no"
plusObject: spec
plusObject: "Sound pa"
plusObject: "TextGrid pa"
Remove

Select outer viewport: 6-0.4, 10-0.4, 0, 4

selectObject: "Sound ta"
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: 0.0, 0.15, 0, 0, 100, "yes", 50, 6, 0, "no"
selectObject: "Sound ta"
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: 0.0, 0.15, 5000, 300, "no"
Black
Draw inner box
Text top: "no", "/tɑ/"
Text bottom: "yes", "Aeg (s)"
Marks bottom: 3, "yes", "yes", "no"
plusObject: spec
plusObject: "Sound ta"
plusObject: "TextGrid ta"
Remove

Select outer viewport: 0, 9, 0.2, 4

Save as 300-dpi PNG file: "ka-pa-ta.png"