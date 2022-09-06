clear all
close all
clc

[y,fs] = audioread('maleO.wav');
[x,period] = vowelProcess(y, fs, 0.8, 7.5, 0.5, 2/3);
audiowrite('maleO_constructed.wav', x, fs);