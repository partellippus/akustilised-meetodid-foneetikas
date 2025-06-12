# Skript, mis joonistab faili isoleeritud_vokaalid 9 vokaali spektrogrammid 3x3 paneelidena
# CC by, Pärtel Lippus, 10.08.2024

fail$ = "isoleeritud_vokaalid"
#fail$ = "0063"
maxformant = 5000

wav = Read from file: "../Failid/hevifailid/" + fail$ + ".wav"
spec = To Spectrogram: 0.005, 5000, 0.002, 20, "Gaussian"
selectObject: wav
formant = To Formant (burg): 0, 5, maxformant, 0.025, 50

tg = Read from file: "../Failid/hevifailid/" + fail$ + ".TextGrid"

Erase all

intervallid = Get number of intervals: 1

for v to intervallid
  selectObject: tg
  vok$ = Get label of interval: 1, v
  if vok$ <> ""
    start = Get start time of interval: 1, v
    stop = Get end time of interval: 1, v
    if vok$ = "i"
      formandid# = {230, 2197, 3517}
      Select outer viewport: 0, 3, 0, 2.5
      Text top: "no", "kõrge eesvokaal /i/"
      #Marks left every: 1, 1000, "yes", "yes", "no"
    elsif vok$ = "e"
      formandid# = {332, 2172, 3109}
      Select outer viewport: 0, 3, 2, 4.5
      Text top: "no", "keskkõrge eesvokaal /e/"
      #Marks left every: 1, 1000, "yes", "yes", "no"
    elsif vok$ = "ä"
      formandid# = {730, 1642, 2658}
      Select outer viewport: 0, 3, 4, 6.5
      Text top: "no", "madal eesvokaal /ä/"
      #Marks left every: 1, 1000, "yes", "yes", "no"
    elsif vok$ = "ü"
      formandid# = {207, 2147, 2421}
      Select outer viewport: 2.25, 5.25, 0, 2.5
      Text top: "no", "ümardatud kõrge eesvokaal /ü/"
    elsif vok$ = "ö"
      formandid# = {303, 1789, 2308}
      Select outer viewport: 2.25, 5.25, 2, 4.5
      Text top: "no", "ümardatud keskkõrge eesvokaal /ö/"
    elsif vok$ = "õ"
      formandid# = {271, 1077, 2271}
      Select outer viewport: 2.25, 5.25, 4, 6.5
      Text top: "no", "keskkõrge tagavokaal /õ/"
    elsif vok$ = "u"
      formandid# = {264, 472, 2274}
      Select outer viewport: 4.5, 7.5, 0, 2.5
      Text top: "no", "ümardatud kõrge tagavokaal /u/"
    elsif vok$ = "o"
      formandid# = {378, 629, 2311}
      Select outer viewport: 4.5, 7.5, 2, 4.5
      Text top: "no", "ümardatud keskkõrge tagavokaal /o/"
    elsif vok$ = "a"
      formandid# = {567, 857, 2428}
      Select outer viewport: 4.5, 7.5, 4, 6.5
      Text top: "no", "madal tagavokaal /a/"
    endif
    Draw inner box
    selectObject: spec
    Paint: start, stop, 0, 5000, 100, "yes", 50, 6, 0, "no"
    # formandid
    Axes: 0,1,0,5000
    selectObject: formant
    Red
    for f to 3
      if fail$ = "isoleeritud_vokaalid"
        fx = formandid# [f]
      else
        fx = Get mean: f, start, stop, "hertz"
      endif
      Paint rounded rectangle: "White", 0.165, 0.235, fx-70, fx+70, 1.30
      Text: 0.2, "centre", fx, "half", "F" + string$(f)
      One mark left: round(fx), "yes", "yes", "no", ""
    endfor
    Black
  endif
endfor

selectObject: tg
plusObject: wav
plusObject: spec
plusObject: formant
Remove

Select outer viewport: 0, 7, 0, 6.25
Text left: "yes", "Sagedus (Hz)"
Save as 300-dpi PNG file: "../Failid/vokaalid/" + fail$ + "_formandid.png"