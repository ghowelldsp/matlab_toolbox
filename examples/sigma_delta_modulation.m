%% SIGMA-DELTA MODULATION
% basic example of a first order sigma-delta modulator

clc; clearvars; close all;

% INPUT SIGNAL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% input signal settings
fs = 3.072e6;
f = 5e3;
amp = 1;
N = 1000;
t(:,1) = (0:N-1)*(1/fs);

% create input signal
x(:,1) = amp*sin(2*pi*f*t);

% SIGMA DELTA MODULATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = sigmaDeltaMod(x);

% PLOTING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('WindowStyle','docked','NumberTitle','off','Name','Input vs PDM Output')

subplot(211)
plot(t,x)
grid on
title('Continuous Input Signal')
xlabel('time [s]')
ylabel('amplitude')

subplot(212)
plot(t,y)
grid on
title('PDM Signal')
xlabel('time [s]')
