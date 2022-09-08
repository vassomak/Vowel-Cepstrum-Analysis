# Vowel-Cepstrum-Analysis
This is an assignment of the course Advanced Signal Processing (AUTh-8th semester-2020)

The purpose of this project is to transfer the recorded vowels from the time to the cepstrum domain, compute the fundamental period, filter them appropriately, extract the impulse response and recreate the sound. For further details, the assignment's instructions can be found [here](https://github.com/vassomak/Vowel-Cepstrum-Analysis/blob/main/PTES_2020_ex4.pdf).

For processing each vowel, 10 files were created, named
'maleXXX.m' and 'femXXX.m', where X is the corresponding vowel, in each of which
vowelProcess.m is called. At the end of each such file, one new audio file is created
with the reconstructed vowel.


## Observations 

* At each vowel the masculine pitch is about 100Hz lower than the female one. The following
table represents the measured fundamental frequencies, in Hz.

gender \ vowel  | 'a'   | 'e' | 'i' | 'o' | 'u'     
-------------   | ----  | ----|---- |---- |----
Female          | 220   | 230 | 249 | 232 | 274
Male            | 127   | 133 | 148 | 125 | 151

* In the Cepstrum sector, more peaks are observed at
female vowels compared to the male ones. This probably happens because the
female voice has a more "breathy" quality, which, in the 
Cepstrum domain, is translated as noise, while the masculine Cepstrum is smoother.
