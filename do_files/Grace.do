﻿clear all
capture eststo clear
capture log close
global root_dir `"c:/CSAAW-hackathon/"'
global dta `"c:/CSAAW-hackathon/Site_specific_data"'
cd $root_dir

import excel using LBNL_Greece_v2.xls, first clear case(lower) sheet("Database")
* lbnlid murrid alternateid site latitude longitude context excavator sourceperson affiliation material ware fabric exteriordecoration form specificform piece group era temper notes analyticalnotes powderpresentinarchives datasource run entry al ca v dy mn na k sr as u eu ba sm la ti lu nd co sc fe ce yb cs ta sb cr th ni rb tb hf zn bg

drop if missing(lbnlid)
gen id = _n

* Key variables:
* era: Era
* site: where found, plus lat-lon


* Count for the elements
/* al ca v dy mn na k sr as u eu ba sm la ti lu nd co sc fe ce yb cs ta sb cr th ni rb tb hf zn bg */

keep  al ca v dy mn na k sr as u eu ba sm la ti lu nd co sc fe ce yb cs ta sb cr th ni rb tb hf zn id  site
drop sb ba as sr v 
/* drop v sr as ba sb al zn tb sm k eu */
foreach element of varlist  * {
    disp "`element'"
    drop if missing(`element')
}
count
/*
sb ba as sr v 
v sr as ba sb al zn tb sm k eu
742	v
726	sr
719	as
715	ba
714	sb
273	al
264	zn
264	tb
257	sm
253	k
253	eu
253	dy
249	rb
249	ni
249	nd
247	yb
247	ce
239	ca
238	na
238	mn
235	cs
233	ti
232	u
232	th
232	ta
232	sc
232	lu
232	la
232	hf
232	fe
232	cr
232	co
*/
outsheet using Grace_elements_and_site.csv, comma  replace
** Exporting site-specific CSV files
tab site

preserve
keep if site == "Achaea"
save $dta/Achae.dta, replace
restore
preserve
keep if site == "Chora-Ano Englianos, Messenia"
save $dta/Chora.dta, replace
restore
preserve
keep if site == "Aegina"
save $dta/Aegin.dta, replace
restore
**********
preserve
keep if site == "Asine"
save $dta/Asine.dta, replace
restore
**********
preserve
keep if site == "Athens"
save $dta/Athens.dta, replace
restore
**********
preserve
keep if site == "Berbati"
save $dta/Berbati.dta, replace
restore
**********
preserve
keep if site == "Corfu"
save $dta/Corfu.dta, replace
restore
**********
preserve
keep if site == "Corinth"
save $dta/Corinth.dta, replace
restore
**********
preserve
keep if site == "Eutrey, Boeotia [Eutresis]"
save $dta/Eutrey.dta, replace
restore
**********
preserve
keep if site == "Festos [Phaistos]"
save $dta/Festos.dta, replace
restore
**********
preserve
keep if site == "Glas (Arne) [Gla]"
save $dta/Glas.dta, replace
restore
**********
preserve
keep if site == "Hagios Stephanos [Ayios Stephanos]"
save $dta/Hagios.dta, replace
restore
**********
preserve
keep if site == "Kallithea"
save $dta/Kallithea.dta, replace
restore
**********
preserve
keep if site == "Kasteli Chania"
save $dta/Kasteli.dta, replace
restore
**********
preserve
keep if site == "Kenchreai"
save $dta/Kenchreai.dta, replace
restore
**********
preserve
keep if site == "Knossos"
save $dta/Knossos.dta, replace
restore
**********
preserve
keep if site == "Korakou"
save $dta/Korakou.dta, replace
restore
**********
preserve
keep if site == "Laurion"
save $dta/Laurion.dta, replace
restore
**********
preserve
keep if site == "Mycenae"
save $dta/Mycenae.dta, replace
restore
**********
preserve
keep if site == "Nichoria"
save $dta/Nichoria.dta, replace
restore
**********
preserve
keep if site == "Olympia-Kolosakos, Elis"
save $dta/Olympia.dta, replace
restore
**********
preserve
keep if site == "Orchemenos"
save $dta/Orchemenos.dta, replace
restore
**********
preserve
keep if site == "Palaiokastro (Arcadia)"
save $dta/Palaiokastro.dta, replace
restore
**********
preserve
keep if site == "Perati (Attica)"
save $dta/Perati.dta, replace
restore
**********
preserve
keep if site == "Peristeria, Messenia [Peristeria]"
save $dta/Peristeria.dta, replace
restore
**********
preserve
keep if site == "Platanos-Renia, Elis"
save $dta/Platanos.dta, replace
restore
**********
preserve
keep if site == "Rhodes"
save $dta/Rhodes.dta, replace
restore
**********
preserve
keep if site == "Tanagra"
save $dta/Tanagra.dta, replace
restore
**********
preserve
keep if site == "Thebes"
save $dta/Thebes.dta, replace
restore
**********
preserve
keep if site == "Tiryns"
save $dta/Tiryns.dta, replace
restore
**********
preserve
keep if site == "Zygouries"
save $dta/Zygouries.dta, replace
restore
**********



*******************************Fix the time-frame*******************************
tab era
gen era_in_hundreds = 0

replace era_in_hundreds = 5 if era == "1 century BC-1 century AD"
replace era_in_hundreds = -1050 if era == "11th-10th Century B.C."
replace era_in_hundreds = 150 if era == "2-3 Century AD"
replace era_in_hundreds = -200 if era == "2nd Century B.C."
replace era_in_hundreds = -300 if era == "3rd Century B.C."
replace era_in_hundreds = -400 if era == "4th Century B.C."
replace era_in_hundreds = -350 if era == "4th-3rd Century B.C."
replace era_in_hundreds = 400 if era == "5th Century"
replace era_in_hundreds = -500 if era == "5th Century B.C."
replace era_in_hundreds = -400 if era == "5th-3rd Century B.C."
replace era_in_hundreds = -6000 if era == "6000 B.C."
replace era_in_hundreds = -600 if era == "6th Century B.C."
replace era_in_hundreds = -700 if era == "7th Century B.C."
replace era_in_hundreds = -750 if era == "8th - 7th Century B.C."
replace era_in_hundreds = -800 if era == "8th Century B.C."
replace era_in_hundreds = -750 if era == "8th-7th Century B.C."
replace era_in_hundreds = -3200 if era == "Early Helladic"
replace era_in_hundreds = -6500 if era == "Early Neolithic"
replace era_in_hundreds = -1250 if era == "LM III B, 1300, 1200"
replace era_in_hundreds = -1250 if era == "LM III B, 1300-1200"
replace era_in_hundreds =  if era == "Late Corinthian"
Late Helladic  III B-C, 1300-1050
Late Helladic I and II
Late Helladic I, 1580-1500
Late Helladic I-II, 1580-1400
Late Helladic II, 1500-1400
Late Helladic II-IIIA
Late Helladic II-IIIA, 1500-1375
Late Helladic III A, 1400-1300
Late Helladic III A-B
Late Helladic III B
Late Helladic III B, 1300-1200
Late Helladic III B-C, 1300-1050
Late Helladic III C, 1300-1050
Late Helladic IIIA (ca. 1300 B.C.)
Late Helladic IIIA (ca. 1300B.C.)
Late Helladic IIIA, 1400-1300
Late Helladic IIIA, 1400-1375
Late Helladic IIIA-B, 1400-1200
Late Helladic IIIA-IIIB, 1375-1200
Late Helladic IIIB
Late Helladic IIIB, 1300-1200
Late Helladic IIIB?, 1300-1200
Late Helladic IIIC, 1200-1050
Late Helladic IIIC, 1200-1050 B.C.
Late Minoan III A-B, 1400-1200
Late Minoan III B 1300-1200
Late Minoan III C 1200-1100
Late Minoan LM III C, 1200, 1100
Late Mycenaean IIIA
Late Mycenaean IIIB
Late Mycenaean IIIC
Middle Bronze Age
Middle Helladic
Modern
Neolithic
Roman

