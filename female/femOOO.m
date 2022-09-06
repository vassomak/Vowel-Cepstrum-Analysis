clear all
close all
clc

[y,fs] = audioread('femO.wav');
[x, period] = vowelProcess(y,fs, 0.4, 4.3, 1.5, 0.8);
audiowrite('femO_constructed.wav', x, fs);