clear all
close all
clc

[y,fs] = audioread('maleA.wav');
[x,period] = vowelProcess(y, fs, 0.4, 7.4, 0.5, 0.62);
audiowrite('maleA_constructed.wav', x, fs);