clear all
capture eststo clear
capture log close
global root_dir `"c:/CSAAW-hackathon/"'
global dta `"c:/CSAAW-hackathon/Code/Site_Specific_data_Truncated_by_ERA"'
cd $root_dir

***********************************4000_1400************************************
global dta `"c:/CSAAW-hackathon/Code/Site_Specific_data_Truncated_by_ERA/4000_1400"'
import delimited using Grace_elements_and_site.csv, delimit(",") clear
keep if era_in_hundreds > -4000 & era_in_hundreds < -1400
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
replace era_in_hundreds = -1250 if ware == "Late Minoan III Fine Ware"
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


***********************************1399_1300************************************
global dta `"c:/CSAAW-hackathon/Code/Site_Specific_data_Truncated_by_ERA/1399_1300"'
import delimited using Grace_elements_and_site.csv, delimit(",") clear
keep if era_in_hundreds > -1399 & era_in_hundreds < -1300
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
replace era_in_hundreds = -1250 if ware == "Late Minoan III Fine Ware"
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

***********************************1299_1200************************************
global dta `"c:/CSAAW-hackathon/Code/Site_Specific_data_Truncated_by_ERA/1299_1200"'
import delimited using Grace_elements_and_site.csv, delimit(",") clear
keep if era_in_hundreds > -1299 & era_in_hundreds < -1200
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
replace era_in_hundreds = -1250 if ware == "Late Minoan III Fine Ware"
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


***********************************1199_1050************************************
global dta `"c:/CSAAW-hackathon/Code/Site_Specific_data_Truncated_by_ERA/1199_1050"'
import delimited using Grace_elements_and_site.csv, delimit(",") clear
keep if era_in_hundreds > -1199 & era_in_hundreds < -1050
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
replace era_in_hundreds = -1250 if ware == "Late Minoan III Fine Ware"
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


***********************************1050_on_ward************************************
global dta `"c:/CSAAW-hackathon/Code/Site_Specific_data_Truncated_by_ERA/1050_on_ward"'
import delimited using Grace_elements_and_site.csv, delimit(",") clear
keep if era_in_hundreds > -1050 
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
replace era_in_hundreds = -1250 if ware == "Late Minoan III Fine Ware"
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
