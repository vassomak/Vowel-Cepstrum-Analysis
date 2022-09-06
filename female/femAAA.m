clear all
close all
clc

[y,fs] = audioread('femA.wav');
[x,period] = vowelProcess(y,fs, 0.1, 4, 0.5, 0.83);
audiowrite('femA_constructed.wav', x, fs);