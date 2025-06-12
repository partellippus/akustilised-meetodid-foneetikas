### POOLELI ###

# see skript mõõdab EVT4_11001 failist vokaalide kestused, põhitooni ?ja formandid?

wav = Read from file: "Failid/valted/EVT4_11001.wav"
# pitch objektiks kuna on üks kõneleja loetud kõne võrdlemisi monotoonne, siis fo max võiks olla suht madal, üle 220 eriti tõenäoselt siin ei lähe
pitch = To Pitch (filtered autocorrelation): 0, 50, 220, 15, "no", 0.03, 0.09, 0.5, 0.055, 0.35, 0.14

tg = Read from file: "Failid/valted/EVT4_11001.TextGrid"
laused = Get number of intervals: 1

for l to laused
  lause$ = Get label of interval: 1, l
  if left$ (lause$, 1) = "w"
    l_start = Get start time of interval: 1, l
    l_stop = Get end time of interval: 1, l
    s_int_start = Get high interval at time: 3, l_start
    s_int_stop = Get low interval at time: 3, l_stop
    for s from s_int_start to s_int_stop
      s$ = Get label of interval: 3, s
      if s$ <> ""
      s_start = Get start time of interval: 3, s
      s_end = Get end time of interval: 3, s
    endfor
  endif
endfor