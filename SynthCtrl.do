*Control sintético

clear all
cls
*Directorios
cd "C:\Users\Leobardo\Documents\GitHub\Synthetic_Control"
global root "C:\Users\Leobardo\Documents\GitHub\Synthetic_Control"


use "$root/database.dta"


*ssc install synth, all

gen lag_inf1 = inflation[_n-1]
gen lag_inf2 = inflation[_n-2]
gen lag_inf3 = inflation[_n-3]
gen lag_inf4 = inflation[_n-4]
gen lag_inf5 = inflation[_n-5]


drop if year==1990 | year==1991 | year==1992 | year==1993 | year==1994
drop if id==.

tsset id year

*método de control sintético
*IMF:
*

cap drop pre_rmspe post_rmspe lead effect inflation_synth

cap drop inflation_scaled effect_scaled cigsale_scaled_synth D

gen byte D = (id==6 & year>=2000) | (id==7 & year>=2000) | (id==8 & year>=2000)  | (id==15 & year>=2005) |(id==20 & year>=2000)|(id==23 & year>=2011)  |(id==24 & year>=2002) |(id==30 & year>=2007) 

synth_runner inflation growth lag_inf1 lag_inf2 lag_inf3 lag_inf4 lag_inf5, d(D) trends


effect_graphs

pval_graphs

ereturn list




