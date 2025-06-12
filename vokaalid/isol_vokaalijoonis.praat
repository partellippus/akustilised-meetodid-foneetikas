# Joonistab F1-F2 ploti isoleeritud_vokaalid failist kahe erineva formantlaega
# CC by, Pärtel Lippus, 10.08.2024

Erase all

for n to 2
if n = 1
Select outer viewport: 0, 4.5, 0, 4
max_f = 5000
else
Select outer viewport: 4, 8.5, 0, 4
max_f = 4600

endif

selectObject: "Sound isoleeritud_vokaalid"
formant = To Formant (burg): 0, 5, max_f, 0.025, 50

selectObject: "TextGrid isoleeritud_vokaalid"
intervalle = Get number of intervals: 1
for i to intervalle
  selectObject: "TextGrid isoleeritud_vokaalid"
  vok$ = Get label of interval: 1, i
  if vok$ <> ""
    algus = Get start time of interval: 1, i
    lopp = Get end time of interval: 1, i
    selectObject: "Formant isoleeritud_vokaalid"

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
  selectObject: formant
  Remove
  Text top: "no", "%%Formant ceiling% = " + string$(max_f)
if n =1
  Draw ellipse: 1200, 2800, 300, 440
else
  Draw ellipse: 1500, 400, 150, 250
endif
endfor

Select outer viewport: 0, 8.5, 0, 4
Save as 300-dpi PNG file: "../Failid/vokaalid/formantlaed_5000-4600.png"
