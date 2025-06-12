clearinfo
appendInfoLine: "aeg", tab$, "f0"
heli = Read from file: "w320.wav"
To Pitch (filtered autocorrelation): 0, 50, 800,
... 15, "no", 0.03, 0.09, 0.5, 0.055, 0.35, 0.14
nframe = Get number of frames
for n to nframe
  aeg = Get time from frame number: n
  f0 = Get value in frame: n, "Hertz"
  appendInfoLine: aeg, tab$, f0
endfor