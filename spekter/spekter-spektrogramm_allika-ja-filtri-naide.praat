# Skript, mis sünteesib vokaalid /e/ ja /a/ ning joonistab nende spektrid
# CC by, Pärtel Lippus, 25.07.2024


# tekita allika heli f0 = 100 Hz kestus 0.5 sek

dur = 0.5
Create PitchTier: "allikas", 0, 0.5
Add point: 0.0, 100
Add point: 0.5, 100
snd = To Sound (phonation): 44100, 1.0, 0.05, 0.7, 0.03, 3.0, 4.0, "no"
Save as WAV file: "k6rihaale_spekter_synt.wav"

# joonista kõriheli spekter
spec = To Spectrum: "yes"
Erase all
Select outer viewport: 0, 6, 0, 4
Draw: 0, 3000, 0, 90, "no"
Draw inner box
Text left: "yes", "Helirõhu tase (SPL, dB/Hz)"
Text bottom: "yes", "Sagedus (Hz)"
Marks left every: 1, 20, "yes", "yes", "no"
Marks bottom every: 1, 500, "yes", "yes", "no"
# lisa f0 ja 4 osahelile osutavad nooled
Red
for i to 5
  y = Get sound pressure level of nearest maximum: i*100
  Draw arrow: i*100, y+6, i*100, y+1
  Text: i*100, "centre", y+8, "half", "f"+string$(i-1)
endfor
Black
Save as 300-dpi PNG file: "k6rihaale_spekter_synt.png"
selectObject: spec
Remove
Erase all

# lisame spektri Eek & Meister 1998 Q3 vokaalide väärtuste järgi
for vok to 2
  if vok = 1
    # Q3 /a/
    f1 = 670
    f2 = 1070
    f3 = 2460
  else
    f1 = 435
    f2 = 2010
    f3 = 2545
  endif

  fgrid = Create FormantGrid: "filter", 0, 0.5, 10, 550, 1100, 60, 50
  Remove formant points between: 1, 0.0, 0.5
  Remove formant points between: 2, 0.0, 0.5
  Remove formant points between: 3, 0.0, 0.5

  Add formant point: 1, 0.0, f1
  Add formant point: 2, 0.0, f2
  Add formant point: 3, 0.0, f3

  plusObject: snd
  snd_'vok' = Filter
  if vok = 1
    Save as WAV file: "synt_vok_a.wav"
  else
    Save as WAV file: "synt_vok_e.wav"
  endif

  spec_'vok' = To Spectrum: "yes"
  if vok = 1
    Select outer viewport: 0, 4, 0, 4
  elsif vok = 2
    Select outer viewport: 3.5, 7.5, 0, 4
  endif
  Draw: 0, 3000, 0, 90, "no"
  Draw inner box
  Text left: "yes", "Helirõhu tase (SPL, dB/Hz)"
  Text bottom: "yes", "Sagedus (Hz)"
  Marks left every: 1, 20, "yes", "yes", "no"
  Marks bottom every: 1, 500, "yes", "yes", "no"
endfor
  
# salvestame joonise kahe paneeliga
Select outer viewport: 0, 7.5, 0, 4
Save as 300-dpi PNG file: "vokaali_a_ja_e_spekter_synt.png"


# lisame "mähisjoone"

for vok to 2
  # valime uuesti osa joonisest
  if vok = 1
    Select outer viewport: 0, 4, 0, 4
  elsif vok = 2
    Select outer viewport: 3.5, 7.5, 0, 4
  endif

  if vok = 1
    # Q3 /a/
    f1 = 670
    f2 = 1070
    f3 = 2460
  else
    f1 = 435
    f2 = 2010
    f3 = 2545
  endif


  selectObject: spec_'vok'
  Red
  spl1 = Get sound pressure level of nearest maximum: 100
  for i from 2 to 30
    spl2 = Get sound pressure level of nearest maximum: i*100
    Draw line: 100*(i-1), spl1, 100*i, spl2
    spl1 = spl2
  endfor
  y = Get sound pressure level of nearest maximum: round(f1/100)*100
  Draw arrow: f1, y+6, f1, y+1
  Text: f1, "centre", y+8, "half", "F1"
  y = Get sound pressure level of nearest maximum: round(f2/100)*100
  Draw arrow: f2, y+6, f2, y+1
  Text: f2, "centre", y+8, "half", "F2"
  y = Get sound pressure level of nearest maximum: round(f3/100)*100
  Draw arrow: f3, y+6, f3, y+1
  Text: f3, "centre", y+8, "half", "F3"
  Black
  #selectObject: spec_'vok'
  #Remove
endfor

# salvestame joonise kahe paneeliga
Select outer viewport: 0, 7.5, 0, 4
Save as 300-dpi PNG file: "mahisjoon_spekter_synt_a_ja_e.png"
