
clear all
capture eststo clear
capture log close
global root_dir `"c:/CSAAW-hackathon/"'
cd $root_dir

***********************************4000_1400************************************
import delimited using Grace_elements_and_site.csv, delimit(",") clear

