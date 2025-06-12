# Skript, mis joonistab sünteesitud /e/ hääliku spektrogrammi ja spektri
# CC by, Pärtel Lippus, 25.07.2024

Erase all
wav = Read from file: "synt_vok_e.wav"
spektro = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
Select outer viewport: 0, 4, 0, 4
Paint: 0, 0, 0, 5000, 100, "yes", 50, 6, 0, "no"
Draw inner box
Text left: "yes", "Sagedus (Hz)"
Text bottom: "yes", "Aeg (s)"
Marks left every: 1, 1000, "yes", "yes", "no"
Marks bottom every: 1, 0.1, "yes", "yes", "no"
One mark top: 0.25, "yes", "yes", "yes", ""


selectObject: wav
formant = To Formant (burg): 0, 5, 5000, 0.25, 50
f1 = Get mean: 1, 0, 0, "hertz"
f2 = Get mean: 2, 0, 0, "hertz"
f3 = Get mean: 3, 0, 0, "hertz"
f4 = Get mean: 4, 0, 0, "hertz"
Remove

selectObject: spektro
spekter = To Spectrum (slice): 0.25
Select outer viewport: 3.5, 7.5, 0, 4
Draw: 0, 5000, 0, 140, "no"
Draw inner box
Text left: "yes", "Helirõhu tase (SPL, dB/Hz)"
Text bottom: "yes", "Sagedus (Hz)"
Marks left every: 1, 20, "yes", "yes", "no"
Marks bottom every: 1, 1000, "yes", "yes", "no"


for i to 4
  if i = 1
    Red
  elsif i = 2
    Green
  elsif i = 3
    Blue
  else
    Lime
  endif
  y = Get sound pressure level of nearest maximum: f'i'
  Draw arrow: f'i', y+6, f'i', y+1
  Text: f'i', "centre", y+8, "half", "F"+string$(i)
  # nooled spektri ja spektrogrammi vahele
  Paint rounded rectangle: "White", -3710 , -3690, f'i'/5000*140-5, f'i'/5000*140+5, 2
  Text: -3700, "centre", f'i'/5000*140, "half", "F" + string$(i)
  Draw arrow: f'i', y, -3600, f'i'/5000*140
endfor
Black

Select outer viewport: 0, 7.5, 0, 4
Save as 300-dpi PNG file: "spekter-spektrogramm.png"


selectObject: wav
plusObject: spektro
plusObject: spekter
Remove