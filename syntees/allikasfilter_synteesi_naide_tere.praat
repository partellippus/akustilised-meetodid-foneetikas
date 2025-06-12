# tere süntees allikas-filter meetodil
# CC-by Pärtel Lippus, 29.03.2025

# Proovime sünteesida sõna 'tere'. See on esmavälteline sõna, st kõik häälikud on lühikesed, v.a teine vokaal, mis Q1 sõnas on poolteistpikk. 
# Kuna sõna algab klusiiliga, siis väga pikka pausi sõna algusse pole mõtet teha, piisab 20 ms.
# Esimene vokaal võiks olla umbes 60 ms, teise silbi alguskonsonant 60 ms ja teine vokaal 120 ms.

# Kõigepeal genereerime allika e häälekurdudest tuleva signaali. Sõna kestus võiks olla umbes 300 ms e 0.3 sekundit.
Create PitchTier: "allikas", 0, 0.3

# Nüüd tuleks märkida mingid punktid põhitooni kõrgusega. Sõna alguses võiks olla f0 150 Hz, ja esimeses silbis kergelt langeda 140 Hz (sest päris lame põhitoon ei ole väga loomulik), ning siis sõna lõpuks langeda 100 Hz peale. PitchTier'i dünaamilisest menüüst Modifiy leiad käsu >
Add point: 0, 150
Add point: 0.16, 140
Add point: 0.3, 100

# Genereerime põhitooni kõverast objekti, mis matkib kõripulsse.
To PointProcess

# Kõigepealt võtame sõna algusest ja lõpust umbes 20 millisekundit helilisust maha.
Remove points between: 0, 0.02
Remove points between: 0.28, 0.3

# Nüüd selle koha peal, kus võiks umber /r/ olla, genereerime natuke helitu/helilise vaheldumist, kuna teadupärast /r/ hääldamisel keeletipp vibreerib, moodustades väga lühikesi sulge vastu hambasompe.
# Tekitame kolme värinaga /r/, st tekitame kolm 15-millisekundilist sulukest:
Remove points between: 0.08, 0.095
Remove points between: 0.11, 0.125
Remove points between: 0.14, 0.155

# Teeme PointProcess objektist Sound objekti.
To Sound (phonation): 44100, 1.0, 0.05, 0.7, 0.03, 3.0, 4.0

# Nüüd teeme filtri.
# Filter peab siis ka olema 300 ms pikk ja kõigepealt teeme ta vaikimisi väärtustega, st formantväärtused, mis võiksid sobida švaa vokaalile, kui keel on suus jõudeasendis.
Create FormantGrid: "filter", 0, 0.3, 10, 550, 1100, 60, 50

#Kuna sõnas 'tere' labiaalseid häälikuid ei ole, võime piirduda ainult esimese kahe formandi väärtuste muutmisega.
# Kõigepealt eemaldame kogu sõnast F1 ja F2 punktid.
Remove formant points between: 1, 0, 0.3
Remove formant points between: 2, 0, 0.3

# Kuna klusiilide kõige iseloomulikum tunnus on siire vokaalile, siis seame /t/ jaoks siirde alguspuntiks F1 100 Hz ja F2 2000 Hz.
Add formant point: 1, 0.00, 100
Add formant point: 2, 0.00, 2000

# Nüüd seame esimese silbi /e/ väärtused F1 500 Hz ja F2 1900 Hz:
Add formant point: 1, 0.04, 500
Add formant point: 2, 0.04, 1900

# Kuna /r/ puhul keel liigub hambasompude ja jõudeasendi vahel, seame F1 500 Hz ja F2 1500 Hz:
Add formant point: 1, 0.12, 500
Add formant point: 2, 0.12, 1500

# Ja nüüd teise silbi /e/, mis võiks olla madalam, rohkem /ä/ poole:
Add formant point: 1, 0.2, 600
Add formant point: 2, 0.2, 1800

# Ja ongi filter valmis! Nüüd paneme allika ja filtri kokku:
selectObject: "Sound allikas"
plusObject: "FormantGrid filter"
Filter

## Skripti lõpp