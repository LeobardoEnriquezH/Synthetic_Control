*Control sintético

clear all
cls
*Directorios
cd "C:\Users\Leobardo\Documents\GitHub\Synthetic_Control"
global root "C:\Users\Leobardo\Documents\GitHub\Synthetic_Control"


use "$root/ITcountries.dta"

****Install packages****
*ssc install synth, all
*cap ado uninstall synth_runner //in-case already installed
*net install synth_runner, from(https://raw.github.com/bquistorff/synth_runner/master/) replace

tsset id2 year

*vision general
*synth inflation growth  inflation(1998) inflation(1997) inflation(1996), trunit(16) figure trperiod(1999) 

*segundo método
synth_runner inflation growth inflation(1998) inflation(1997) inflation(1996), trunit(16) trperiod(1999) gen_vars 


single_treatment_graphs, trlinediff(0) effects_ylabels(-10(0)20) effects_ymax(20) effects_ymin(-10)

effect_graphs , trlinediff(0)

pval_graphs

