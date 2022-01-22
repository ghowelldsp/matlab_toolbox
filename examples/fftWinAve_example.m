%% FFT WINDOWED AVERAGE EXAMPLE

clc; clearvars; close all;

% general variables
f1 = 1000;
f2 = 2000;
f3 = 3000;
fs = 10e3;
N = 1000;
t = (0:N-1)*(1/fs);

% create tone signals
toneSig(:,1) = sin(2*pi*f1*t);
toneSig(:,2) = sin(2*pi*f2*t);
toneSig(:,3) = sin(2*pi*f3*t);

% compute an windowed average fft
frameLen = 20;
frameOverlap = 75;
debugInfo = true;
fftData = fftWinAve(toneSig, frameLen, frameOverlap, fs, debugInfo);