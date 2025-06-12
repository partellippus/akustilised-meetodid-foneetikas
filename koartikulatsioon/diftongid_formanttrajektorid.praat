# See skript mõõdab viie diftonginäite F1 ja F2 väärtuseid 20 punktist
# ja kirjutab tulemused tabelisse
# CC-by Pärtel Lippus 8.05.2025

# kirjutab tabeli päise
writeFileLine: "dift_formandid.txt", "dift", tab$, "punkt", tab$, "aeg", tab$, "F1", tab$, "F2"

Read from file: "diftongid.Collection"

selectObject: "Sound ui"
dift$ = "ui"
alg = 0.073
lop = 0.222

@formantVaartused

selectObject: "Sound ui"
plusObject: "TextGrid ui"
Remove

# 2. diftong
selectObject: "Sound õi"
dift$ = "ɤi"
alg = 0.083
lop = 0.211

@formantVaartused

selectObject: "Sound õi"
plusObject: "TextGrid õi"
Remove

# 3. diftong
selectObject: "Sound õe"
alg = 0.118
lop = 0.350
dift$ = "ɤe"

@formantVaartused

selectObject: "Sound õe"
plusObject: "TextGrid õe"
Remove

# 4. diftong

selectObject: "Sound ai"
alg = 0.067
lop = 0.232
dift$ = "ɑi"

@formantVaartused

selectObject: "Sound ai"
plusObject: "TextGrid ai"
Remove


# 5. diftong
selectObject: "Sound ea"
alg = 0.099
lop = 0.309
dift$ = "eɑ"

@formantVaartused

selectObject: "Sound ea"
plusObject: "TextGrid ea"
Remove


procedure formantVaartused
  formant = To Formant (burg): 0, 5, 5500, 0.025, 50

  for i from 5 to 25
    aeg = alg + i/30*(lop-alg)
    #f1 = Get value at time: 1, aeg, "hertz", "linear"
    #f2 = Get value at time: 2, aeg, "hertz", "linear"
    f1 = Get mean: 1, aeg-0.005, aeg+0.005, "hertz"
    f2 = Get mean: 2, aeg-0.005, aeg+0.005, "hertz"
    appendFileLine: "dift_formandid.txt", dift$, tab$, i, tab$, aeg, tab$, f1, tab$, f2
  endfor
  Remove
endproc
