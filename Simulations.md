## How to run simulations:

1. `main_hitrate_sim.m` :

  First, run the generation code, `generate_cpnorm_data.m` to generate the datasets in /data.
  NOTE: I have already attached my generated dataset as a sample reference
  Then, run the file. It will generate the graphs in /fig

2. `main_false_detection.m` :

  First, run the generation code, `generate_cpnorm_data.m` to generate the datasets in /data.
  NOTE: I have already attached my generated dataset as a sample reference
  Then, run the file. It will generate the graphs in /fig

## Description of other Files:

1. `generate_ar2_data.m` :
   
   This generates 'n_samples=10000' number of AR(2) time series data of size 'NMax=140' with no changepoint in them.

2. `generate_cpnorm_data.m` :

   This generates 'n_samples=2000' number of normally distributed time series data of size 'NMax=140' with 1 changepoint in them. The changepoint is at indice '30', which corresponds to year 1990.
   Data before 1990 has a mean of '-delta/2', after 1990 it has a mean of 'delta/2'.

3. `generate_lookup_table.m` :

   This generates a lookup table for the critical values of size 'Nmax' using Chen and Guptas closed form approximation

5. `histogram_gen.m` :

   This generates a histogram dataset for computing the False Detection Rates.
   
6. `compute_hitrate_sim.m` :

   This generates the hitrates for each window size from years 1961 to 2100. Window size = 1961-i where 'i' is the year index for which hitrate is being calculated

## Figures:

1. `false_detection_windows.png` :

   This is a graph that shows the number of times a year has been falsely detected as a change point

2. `hitrate_sim_alpha.png` :

   This is a graph that shows the number of times that a hit has been detected at the true changepoint or a neighbourhood of 2 years within it over 2000 samples for a window of size 'i' from 1961-(1961+i)
