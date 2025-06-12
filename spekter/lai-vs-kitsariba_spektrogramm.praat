# Joonised lai- ja kitsariba spektrogrammist
# CC by, Pärtel Lippus, 6.08.2024


Erase all
wav = Read from file: "../Failid/spekter/synt_vok_e.wav"


for i to 2
  akna_pikkus = if i = 1 then 0.005 else 0.033 fi
  if i = 1
    Select outer viewport: 0, 4, 0, 4
  elsif i = 2
    Select outer viewport: 3.5, 7.5, 0, 4
  endif

  selectObject: wav
  spektro = To Spectrogram: akna_pikkus, 5000, 0.002, 20, "Gaussian"
  Paint: 0, 0, 0, 3000, 100, "yes", 50, 6, 0, "no"
  Draw inner box
  Text left: "yes", "Sagedus (Hz)"
  Text bottom: "yes", "Aeg (s)"
  Marks left every: 1, 1000, "yes", "yes", "no"
  Marks bottom every: 1, 0.1, "yes", "yes", "no"

  Red
  if i = 1
    form# = {435, 2010, 2545}
    for j to 3
      Paint rounded rectangle: "White", 0.035 , 0.065, form# [j], form# [j], 1.75
      Text: 0.05, "centre", form# [j], "half", "F"+string$(j)
    endfor
  else 
    for j to 4
      Text: -0.015, "centre", j*100, "half", "f"+string$(j-1)
      Draw arrow: 0.015, j*100, 0.025, j*100
    endfor
  
  endif
  Black
endfor

Select outer viewport: 0, 7.5, 0, 4
Save as 300-dpi PNG file: "../Failid/spekter/kitsas-vs-lairiba.png"
