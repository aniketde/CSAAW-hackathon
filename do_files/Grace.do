clear all
capture eststo clear
capture log close
global root_dir `"c:/CSAAW-hackathon/"'
global dta `"c:/CSAAW-hackathon/Code/Site_specific_data"'
cd $root_dir

import excel using LBNL_Greece_v2.xls, first clear case(lower) sheet("Database")
* lbnlid murrid alternateid site latitude longitude context excavator sourceperson affiliation material ware fabric exteriordecoration form specificform piece group era temper notes analyticalnotes powderpresentinarchives datasource run entry al ca v dy mn na k sr as u eu ba sm la ti lu nd co sc fe ce yb cs ta sb cr th ni rb tb hf zn bg
drop if missing(lbnlid)
gen id = _n
* Key variables:
* era: Era
* site: where found, plus lat-lon
*******************************Fix the time-frame*******************************
tab era
gen era_in_hundreds = 0
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
replace era_in_hundreds = -400 if era == "Late Corinthian"
replace era_in_hundreds = -1200 if era == "Late Helladic  III B-C, 1300-1050"
replace era_in_hundreds = -1450 if era == "Late Helladic I and II"
replace era_in_hundreds = -1550 if era == "Late Helladic I, 1580-1500"
replace era_in_hundreds = -1480 if era == "Late Helladic I-II, 1580-1400"
replace era_in_hundreds = -1470 if era == "Late Helladic II, 1500-1400"
replace era_in_hundreds = -1335 if era == "Late Helladic II-IIIA"
replace era_in_hundreds = -1390 if era == "Late Helladic II-IIIA, 1500-1375"
replace era_in_hundreds = -1350 if era == "Late Helladic III A, 1400-1300"
replace era_in_hundreds = -1350 if era == "Late Helladic III A-B"
replace era_in_hundreds = -1351 if era == "Late Helladic III B"
replace era_in_hundreds = -1250 if era == "Late Helladic III B, 1300-1200"
replace era_in_hundreds = -1105 if era == "Late Helladic III B-C, 1300-1050"
replace era_in_hundreds = -1100 if era == "Late Helladic III C, 1300-1050"
replace era_in_hundreds = -1300 if era == "Late Helladic IIIA (ca. 1300 B.C.)"
replace era_in_hundreds = -1300 if era == "Late Helladic IIIA (ca. 1300B.C.)"
replace era_in_hundreds = -1350 if era == "Late Helladic IIIA, 1400-1300"
replace era_in_hundreds = -1365 if era == "Late Helladic IIIA, 1400-1375"
replace era_in_hundreds = -1300 if era == "Late Helladic IIIA-B, 1400-1200"
replace era_in_hundreds = -1350 if era == "Late Helladic IIIA-IIIB, 1375-1200"
replace era_in_hundreds = -1245 if era == "Late Helladic IIIB"
replace era_in_hundreds = -1250 if era == "Late Helladic IIIB, 1300-1200"
replace era_in_hundreds = -1250 if era == "Late Helladic IIIB?, 1300-1200"
replace era_in_hundreds = -1150 if era == "Late Helladic IIIC, 1200-1050"
replace era_in_hundreds = -1150 if era == "Late Helladic IIIC, 1200-1050 B.C."
replace era_in_hundreds = -1300 if era == "Late Minoan III A-B, 1400-1200"
replace era_in_hundreds = -1250 if era == "Late Minoan III B 1300-1200"
replace era_in_hundreds = -1150 if era == "Late Minoan III C 1200-1100"
replace era_in_hundreds = -1150 if era == "Late Minoan LM III C, 1200, 1100"
replace era_in_hundreds = -1350 if era == "Late Mycenaean IIIA"
replace era_in_hundreds = -1349 if era == "Late Mycenaean IIIB"
replace era_in_hundreds = -1348 if era == "Late Mycenaean IIIC"
replace era_in_hundreds = -1800 if era == "Middle Bronze Age"
replace era_in_hundreds = -1091 if era == "Middle Helladic"
replace era_in_hundreds = 2000 if era == "Modern"
replace era_in_hundreds = -10000 if era == "Neolithic"
replace era_in_hundreds = 200 if era == "Roman"
replace era_in_hundreds = 5 if era == "1 century BC-1 century AD"
replace era_in_hundreds = . if era_in_hundreds == 0
replace era_in_hundreds = 0 if era_in_hundreds == 5
count
/* save $dta/1198_era_fixed.dta, replace */
/* outsheet using $dta/1198_era_fixed.csv, comma replace */

* Count for the elements
/* al ca v dy mn na k sr as u eu ba sm la ti lu nd co sc fe ce yb cs ta sb cr th ni rb tb hf zn bg */
preserve
keep  al ca v dy mn na k sr as u eu ba sm la ti lu nd co sc fe ce yb cs ta sb cr th ni rb tb hf zn id  site  era_in_hundreds
drop sb ba as sr v 
/* drop v sr as ba sb al zn tb sm k eu */
foreach element of varlist  al-zn {
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
restore

** Exporting site-specific CSV files
import delimited using Grace_elements_and_site.csv, delimit(",") clear
tab site
preserve
keep if site == "Achaea"
drop site
outsheet using $dta/Achae_era.csv, replace comma nonames
restore
preserve
keep if site == "Chora-Ano Englianos, Messenia"
drop site
outsheet using $dta/Chora_era.csv, replace comma nonames
restore
preserve
keep if site == "Aegina"
drop site
outsheet using $dta/Aegin_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Asine"
drop site
outsheet using $dta/Asine_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Athens"
drop site
outsheet using $dta/Athens_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Berbati"
drop site
outsheet using $dta/Berbati_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Corfu"
drop site
outsheet using $dta/Corfu_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Corinth"
drop site
outsheet using $dta/Corinth_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Eutrey, Boeotia [Eutresis]"
drop site
outsheet using $dta/Eutrey_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Festos [Phaistos]"
drop site
outsheet using $dta/Festos_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Glas (Arne) [Gla]"
drop site
outsheet using $dta/Glas_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Hagios Stephanos [Ayios Stephanos]"
drop site
outsheet using $dta/Hagios_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Kallithea"
drop site
outsheet using $dta/Kallithea_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Kasteli Chania"
drop site
outsheet using $dta/Kasteli_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Kenchreai"
drop site
outsheet using $dta/Kenchreai_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Knossos"
drop site
outsheet using $dta/Knossos_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Korakou"
drop site
outsheet using $dta/Korakou_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Laurion"
drop site
outsheet using $dta/Laurion_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Mycenae"
drop site
outsheet using $dta/Mycenae_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Nichoria"
drop site
outsheet using $dta/Nichoria_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Olympia-Kolosakos, Elis"
drop site
outsheet using $dta/Olympia_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Orchemenos"
drop site
outsheet using $dta/Orchemenos_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Palaiokastro (Arcadia)"
drop site
outsheet using $dta/Palaiokastro_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Perati (Attica)"
drop site
outsheet using $dta/Perati_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Peristeria, Messenia [Peristeria]"
drop site
outsheet using $dta/Peristeria_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Platanos-Renia, Elis"
drop site
outsheet using $dta/Platanos_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Rhodes"
drop site
outsheet using $dta/Rhodes_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Tanagra"
drop site
outsheet using $dta/Tanagra_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Thebes"
drop site
outsheet using $dta/Thebes_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Tiryns"
drop site
outsheet using $dta/Tiryns_era.csv, replace comma nonames
restore
**********
preserve
keep if site == "Zygouries"
drop site
outsheet using $dta/Zygouries_era.csv, replace comma nonames
restore
**********
