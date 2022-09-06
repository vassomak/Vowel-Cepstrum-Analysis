clear all
close all
clc

[y,fs] = audioread('femI.wav');
[x,period] = vowelProcess(y,fs, 0.45, 3.5, 2.5, 0.75);
audiowrite('femI_constructed.wav', x, fs);