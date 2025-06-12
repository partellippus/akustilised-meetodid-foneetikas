
Create Speaker: "Maret", "female", "2"

Create Artword: "tere", 0.5
#> Edit

#Nüüd avaneb umbes selline aken:
#![ArtwordEditor](Failid/praat_vaated/artwordEditor.jpg){height=506, width=500}
#Aknas vasakul on nimekiri sihtmärkidest, st mis ajahetkel millisele musklile mis pinge on seatud. Aknas paremal on nimekiri musklitest ja kui sealt mõni valida, siis saab anka keskel määrata aja, millal see muskel mingi väärtuse saab. Pingete väärtused muutuvad -1 kuni 1, 0 on jõudeasend.

#Kõigepealt paneme kopsudest õhu liikuma. Seda saab nii, et valid aknas paremalt Lungs ja keskel Time 0, Value 0.2 ja vajutad nuppu Add target. Või Objektiaknas käsuga Set target..., nagu allpool kõik järgnevad käsud:
Set target: 0, 0.2, "Lungs"
Set target: 0.1, 0, "Lungs"

#Paneb häälekurrud võnkuma:
Set target: 0.1, 0.5, "Interarytenoid"
Set target: 0.5, 0.5, "Interarytenoid"

#Levator Palatini sulgeb käigu ninna:
Set target: 0, 1, "LevatorPalatini"
Set target: 0.5, 1, "LevatorPalatini"

#Styloglossus hoiab, et keel kurku/suust välja ei vajuks:
Set target: 0, -0.5, "Styloglossus"
Set target: 0.5, -0.5, "Styloglossus"

#Tekitame sulu (LowerTongue liigutab keeletippu, Masseter lõualuud):
Set target: 0 ,-1, "LowerTongue"
Set target: 0.04, -1, "LowerTongue"
Set target: 0, 0.7, "Masseter"
Set target: 0.1, -0.05, "Masseter"

#Vallandame sulu:
Set target: 0.1, -0.2, "LowerTongue"
Set target: 0.25, -0.2, "LowerTongue"
Set target: 0.5, -0.1, "Masseter"

#Tekitame /r/ jaoks keeletipu vibreerimise:
Set target: 0.26, -1, "LowerTongue"
Set target: 0.28, 0, "LowerTongue"
Set target: 0.3, -1, "LowerTongue"
Set target: 0.32, -0.1, "LowerTongue"

#Nüüd ongi valmis ja tuleb sõna ja kõneleja omavahel kokku viia. Vali objektiaknas Speaker Maret + Artword tere >
selectObject: "Speaker Maret"
plusObject: "Artword tere"
To Sound: 22050, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0



