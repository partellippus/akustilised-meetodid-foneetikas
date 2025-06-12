# skript genereerib 4 eri sämplimissagedusega faili illustreerimaks nyquisti teoreemi


dir$ = "../Failid/digit_heli/"

samplingrate# = {44100, 10000, 4000, 880}

for i from 1 to size (samplingrate#)

  fname$ = "440Hz_" + string$(samplingrate# [i])
  tmp = Create Sound as tone complex: fname$, 0, 1, samplingrate# [i], "sine", 440, 0, 0, 5
  Save as WAV file: dir$ + fname$ + ".wav"
  Remove
endfor

