clear all
close all
clc

[y,fs] = audioread('maleU.wav');
[x, period] = vowelProcess(y, fs, 0.5, 6, 0.5, 0.73);
audiowrite('maleU_constructed.wav', x, fs);