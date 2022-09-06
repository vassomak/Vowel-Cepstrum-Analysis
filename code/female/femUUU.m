clear all
close all
clc

[y, fs] = audioread('femU.wav');
[x, period] = vowelProcess(y, fs, 0.2, 3.5, 2.5, 0.75);
audiowrite('femU_constructed.wav', x, fs);