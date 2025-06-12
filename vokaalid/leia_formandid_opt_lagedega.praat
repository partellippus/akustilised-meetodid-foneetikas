# Leiab kahest failist igale vokaalile optimaalse formantlae ja logib tulemused faili
# CC by, Pärtel Lippus, 11.08.2024

tulem$ = "../Failid/vokaalid/formantvaartused_tabel.txt"

writeFile: tulem$, "fail" + tab$ + "vokaal" + tab$ + "lagi" + tab$ + "F1" + tab$ + "F2" + tab$ + "F3"


for sp to 2
  if sp = 1
    fail$ = "isoleeritud_vokaalid"
    keskLagi = 4500
  elsif sp = 2
    fail$ = "0063"
    keskLagi = 5000
  endif

  tg = Read from file: "../Failid/hevifailid/" + fail$ + ".TextGrid"
  intervallid = Get number of intervals: 1
  wav = Read from file: "../Failid/hevifailid/" + fail$ + ".wav"

  formantPaths = To FormantPath (burg): 0.005, 5, keskLagi, 0.025, 50, 0.005, 25

  for i to intervallid
    selectObject: tg
    vok$ = Get label of interval: 1, i
    if vok$ <> ""
      start = Get start time of interval: 1, i
      stop = Get end time of interval: 1, i
      selectObject: formantPaths
      optLagi = Get optimal ceiling: start, stop, { 3, 3, 3 }, 1.25
      appendFile: tulem$, newline$ + fail$ + tab$ + vok$ + tab$ + string$(round(optLagi))

      selectObject: wav
      tmpWav = Extract part: start, stop, "rectangular", 1, "yes"
      tmpForm = To Formant (burg): 0, 5, optLagi, 0.025, 50
      for f to 3
        fx = Get mean: f, start, stop, "hertz"
        appendFile: tulem$, tab$ + string$(round(fx))
      endfor
      plusObject: tmpWav
      Remove
    endif
  endfor

  selectObject: formantPaths
  plusObject: tg
  plusObject: wav
  Remove
endfor