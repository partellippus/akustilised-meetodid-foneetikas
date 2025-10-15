# Joonistab helilaine, selle alla põhitooni, spektrogrammi ja formandid ning lisab TextGridilt häälikupiirid 
# CC by Pärtel Lippus  15.10.2025 

heli = Read from file: "../helifailid/konsonandid.wav"
Select outer viewport: 0, 6, 0, 1.5
Draw: 6.784, 7.188, 0, 0, "no", "curve"
Text left: "yes", "Rõhk"
One mark left: 0, "yes", "yes", "no", ""

# põhitoon, skaala paremal
Select outer viewport: 0, 6, 0.75, 2.25
pitch = To Pitch (filtered autocorrelation): 0, 50, 800, 15, "no", 0.03, 0.09, 0.5, 0.055, 0.35, 0.14
Draw: 6.784, 7.188, 50, 150, "no"
Draw inner box
Marks right every: 1, 25, "yes", "yes", "yes"
Text right: "yes", "Põhitoon (Hz)"

# spektrogramm
Select outer viewport: 0, 6, 1.5, 3.9
selectObject: heli
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: 6.784, 7.188, 0, 0, 100, "yes", 50, 6, 0, "no"
Text left: "yes", "Sagedus (Hz)"
Marks left every: 1, 1000, "yes", "yes", "no"

# formandid
selectObject: heli
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: 6.784, 7.188, 5000, 300, "no"
Black

# häälikupiirid
Select outer viewport: 0, 6, 0, 5.5

tg = Read from file: "../helifailid/konsonandid.TextGrid"
Remove tier: 3
Draw: 6.784, 7.188, "yes", "yes", "no"
Draw inner box
# ajatelg
Text bottom: "yes", "Aeg (ms)"
Axes: 0, 7.188-6.784, 50, 150
Marks bottom every: 0.001, 100, "yes", "yes", "no"
Marks bottom every: 0.001, 25, "no", "yes", "no"


Save as 300-dpi PNG file: "heli-f0-spektrogramm.png"

