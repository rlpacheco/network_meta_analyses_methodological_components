clear all
version 18

cd "mydir"

import excel "compiled_files_01_to_07.xlsx", sheet("01")

rename A ref

gen main = "s"
	
duplicates tag ref, gen(dup)

tabulate dup
drop dup

save 01.dta, replace

		
import excel "compiled_files_01_to_07.xlsx", sheet("02") clear
rename A ref
gen intransitivity = "no"
duplicates tag ref, gen(dup)
tabulate dup	
drop dup
	
save 02.dta, replace


import excel "compiled_files_01_to_07.xlsx", sheet("03") clear
rename A ref
gen incoherence = "no"
duplicates tag ref, gen(dup)
tabulate dup	
drop dup

save 03.dta, replace


import excel "compiled_files_01_to_07.xlsx", sheet("04") clear
rename A ref
gen consistency = "no"
duplicates tag ref, gen(dup)
tabulate dup	
drop dup

save 04.dta, replace

import excel "compiled_files_01_to_07.xlsx", sheet("05") clear
rename A ref
gen coe = "no"
duplicates tag ref, gen(dup)
tabulate dup	
drop dup

save 05.dta, replace



import excel "compiled_files_01_to_07.xlsx", sheet("06") clear
rename A ref
gen rank_abstract = "no"
duplicates tag ref, gen(dup)
tabulate dup	
drop dup

save 06.dta, replace

import excel "compiled_files_01_to_07.xlsx", sheet("07") clear

rename A ref
gen rank_all_body = "no"
duplicates tag ref, gen(dup)
tabulate dup	
drop dup

save 07.dta, replace



clear


use 01.dta, clear
merge 1:1 ref using 02
drop _merge
merge 1:1 ref using 03
drop _merge
merge 1:1 ref using 04
drop _merge
merge 1:1 ref using 05
drop _merge
merge 1:1 ref using 06
drop _merge
merge 1:1 ref using 07
drop _merge

replace intransitivity = "yes" if missing(intransitivity)
replace incoherence = "yes" if missing(incoherence)
replace consistency = "yes" if missing(consistency)
replace coe = "yes" if missing(coe)
replace rank_abstract = "yes" if missing(rank_abstract)
replace rank_all_body = "yes" if missing(rank_all_body)

tabulate intransitivity
tabulate incoherence
tabulate consistency
tabulate coe
tabulate rank_abstract
tabulate rank_all_body

save main_raw.dta, replace
