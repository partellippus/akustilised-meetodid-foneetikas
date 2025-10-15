# Loeb sisse helifaili, teeb sellest spektrogrammi ja joonistab 
# siis valib heli, teeb formantanalüüsi ja lisab punased täpid 
# CC by Pärtel Lippus  15.10.2025 

heli = Read from file: "../helifailid/konsonandid.wav"
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Paint: 6.784, 7.188, 0, 0, 100, "yes", 50, 6, 0, "yes"
selectObject: heli
formant = To Formant (burg): 0, 5, 5000, 0.025, 50
Red
Speckle: 6.784, 7.188, 5000, 300, "no"
Black
Save as 300-dpi PNG file: "spektrogramm-formandid.png"

