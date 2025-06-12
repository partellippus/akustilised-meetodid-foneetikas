# Leiab frikatiivide spektrimomendid ja kirjutab tabelisse
# CC by, Pärtel Lippus, 14.08. 2024

wav = Read from file: "../Failid/hevifailid/konsonandid.wav"
tg = Read from file: "../Failid/hevifailid/konsonandid.TextGrid"

tulem$ = "../Failid/konsonandid/frikatiivide_spektrimomendid.txt"

writeFileLine: tulem$, "Konsonant", tab$, "Gravitatsioonikese", tab$, "Standardhälve", tab$, "Asümmeetriakordaja", tab$, "Järskuskordaja"

intervallid = Get number of intervals: 2

for i to intervallid
  selectObject: tg
  kons$ = Get label of interval: 2, i
  if kons$ <> "" and index( "s|ʃʃ|ff|h", kons$) > 0
    start = Get start time of interval: 2, i
    stop = Get end time of interval: 2, i
    selectObject: wav
    # mõõdame hääliku keskelt 40 ms aknas
    tmpWav = Extract part: start+((stop-start)/2-0.02), start+((stop-start)/2+0.02), "rectangular", 1, "yes"
    tmpSpec = To Spectrum: "yes"
    cgravity = Get centre of gravity: 1
    sd = Get standard deviation: 1
    skew = Get skewness: 1
    kurt = Get kurtosis: 1
    appendFileLine: tulem$, left$(kons$,1), tab$, cgravity, tab$, sd, tab$, skew, tab$, kurt
    plusObject: tmpWav
    Remove
  endif
endfor
selectObject: wav
plusObject: tg
Remove