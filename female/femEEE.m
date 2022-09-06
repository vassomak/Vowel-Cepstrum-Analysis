clear all
close all
clc

[y,fs] = audioread('femE.wav');
[x, period] = vowelProcess(y, fs, 0.2, 3.9, 0.5, 0.68);
audiowrite('femE_constructed.wav', x, fs);