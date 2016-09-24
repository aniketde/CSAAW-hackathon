clear all
capture eststo clear
capture log close
global root_dir `"c:\CSAAW-hackathon\"'
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

preserve
keep  al ca v dy mn na k sr as u eu ba sm la ti lu nd co sc fe ce yb cs ta sb cr th ni rb tb hf zn bg  id  site
outsheet using Grace_elements_and_site.csv, comma 
restore


*******************************Fix the time-frame*******************************
tab era
/*
1 century BC-1 century AD
11th-10th Century B.C.
2-3 Century AD
2nd Century B.C.
3rd Century B.C.
4th Century B.C.
4th-3rd Century B.C.
5th Century
5th Century B.C.
5th-3rd Century B.C.
6000 B.C.
6th Century B.C.
7th Century B.C.
8th - 7th Century B.C.
8th Century B.C.
8th-7th Century B.C.
Early Helladic
Early Neolithic
LM III B, 1300, 1200
LM III B, 1300-1200
Late Corinthian
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
*/
