clear all
close all
clc

[y,fs] = audioread('maleE.wav');
[x, period] = vowelProcess(y,fs, 0.5, 7, 0.5, 0.66);
audiowrite('maleE_constructed.wav', x, fs);