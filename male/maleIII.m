clear all
close all
clc

[y,fs] = audioread('maleI.wav');
[x, period] = vowelProcess(y, fs, 0.5, 6.5, 0.5, 0.76);
audiowrite('maleI_constructed.wav', x, fs);