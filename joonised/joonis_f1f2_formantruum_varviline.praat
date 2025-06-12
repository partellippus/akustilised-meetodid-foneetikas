# Keerukam F1-F2 formantruumi skript, kus iga vokaal joonistatakse eraldi värviga 
# CC by Pärtel Lippus  10.06.2025 

heli = Read from file: "../helifailid/isoleeritud_vokaalid.wav"
formant = To Formant (burg): 0, 5, 4700, 0.025, 50
tg = Read from file: "../helifailid/isoleeritud_vokaalid.TextGrid"
intervalle = Get number of intervals: 1
for i to intervalle
  selectObject: tg
  vok$ = Get label of interval: 1, i
  if vok$ <> ""
    algus = Get start time of interval: 1, i
    lopp = Get end time of interval: 1, i
    selectObject: formant

    if i/intervalle < 0.3
    r = i/(intervalle*0.3)
    g = 0
    b = 0
    elsif i/intervalle < 0.6
    r = 0
    g = (i-0.3*intervalle)/(intervalle*0.3)
    b = 0
    else
    r = 0
    g = 0
    b = (i-0.6*intervalle)/(intervalle*0.3)
    endif
    garn$ =if vok$ = "a" then "yes" else "no" fi
    if vok$ = "o"
      vok$ = "\o "
    endif
    Colour: {r,g,b}
    Scatter plot: algus, lopp, 2, 2600, 200, 1, 900, 100, 4, garn$, vok$
    Black
  endif
endfor

Save as 300-dpi PNG file: "f1-f2_formantruum_custom.png"

