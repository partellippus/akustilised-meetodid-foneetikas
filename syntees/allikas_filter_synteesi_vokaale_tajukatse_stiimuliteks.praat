# Skript, mis allikas-filter sünteesi meetodil genereerib vokaalikontiinumi
# Pärtel Lippus, 14.11.2024

# komentaarid leiab õpiku tekstist

Create PitchTier: "allikas", 0, 0.3
Add point: 0, 150 
Add point: 0.16, 140 
Add point: 0.3, 100
To PointProcess
To Sound (phonation): 44100, 1.0, 0.05, 0.7, 0.03, 3.0, 4.0

Create FormantGrid: "filter", 0, 0.3, 10, 550, 1100, 60, 50

for i from 2 to 8
  selectObject: "FormantGrid filter"
  Remove formant points between: 1, 0, 0.3
  Add formant point: 1, 0.15, i*100
  Remove formant points between: 2, 0, 0.3
  Add formant point: 2, 0.15, 2800-i*100

  plusObject: "Sound allikas"
  Filter
  Rename: "vok_" + string$(i*100)
  #Save as WAV file: "../taju/stiimulid/" + "stim_F1_" + string$(i*100) + ".wav"
endfor