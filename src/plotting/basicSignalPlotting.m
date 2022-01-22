function basicSignalPlotting(data,fs,figName,phasePlt)
%SIGNALPLOTTING - plots the signals time and frequency domain responses
%   
%   INPUTS
%   data = time domain signal data
%   fs = sampling frequency [Hz]
%   figName = name of the figure
%   phasePlt = choose to plot phase or not, value should be either true or
%              false
%
%   OUTPUTS
%   plots data to docked figure window
%
%   EXAMPLE
%   basicSignalPlotting(dataArray,48000,'plot 1',true)
%
%   Created By: G. Howell
%   Created On: 01/04/2020

N = length(data);   % total no. of samples
df = fs/N;          % frequency division
T = 1/fs;           % time period
t = [0:(N-1)]*T;    % time array
freqVec = linspace(0,fs-df,N);  % frequency vector
freqVecPos = freqVec(1:floor(N/2)); % positive frequency vector

% fft
dataH = fft(data)/N;

% phase
dataPhase = unwrap(angle(dataH)*180/pi);

% plots phase
if phasePlt
    subPltIdx = 3;
else
    subPltIdx = 2;
end

% creates the figure window
figure('Name',figName,'WindowStyle','docked')

% plots time domain
subplot(subPltIdx,1,1)
plot(t,data)
grid on
title('Time Domain')
xlabel('Time'); ylabel('Magnitude')
xlim([t(1), t(end)])

% plots frequency domain
subplot(subPltIdx,1,2)
semilogx(freqVecPos,db(dataH(1:length(freqVecPos))))
grid on
title('Frequency Domain')
xlabel('Frequency'); ylabel('Magnitude [dB]')
xlim([min(freqVecPos) max(freqVecPos)])

if phasePlt
    subplot(subPltIdx,1,3)
    semilogx(freqVecPos,dataPhase(1:length(freqVecPos)))
    grid on
    title('Frequency Domain - Phase')
    xlabel('Frequency'); ylabel('Phase [deg]') 
    xlim([min(freqVecPos) max(freqVecPos)])
end

end

