function [fftMagAve, f] = fftWinAve(sigData, frameLen, frameOverlap, fs, debugInfo)
% FFTWINAVE Computes an windowed fft average by splitting the data into
% frames and applying a window (default = rectangular) before FFT'ing the
% time domain data and averaging over the number of windows.
%
% INPUTS: sigData: signal data in format (samples, signals)
%         frameLen: no. of samples frame length
%         frameOverlap: percentage frame overlap
%         fs: sample rate [Hz]
%         debugInfo: prints debug info to console
%
% OUTPUTS: fftMagAve: full positive and negative frequency average
%          magnitude fft'd data.
%          f: frequency vector
%
% EXAMPLES: fftWinAve(sigData, 10, 50, 10e3, true)
%
% Created By: George Howell
% Created On: 19-Oct-2021

% split data into frames
frameSigData = splitSigToFrames(sigData, frameLen, frameOverlap, debugInfo);
noFrames = size(frameSigData, 3);

% window data
%TODO - create window function first

% fft data and frequecy vector
fftDataMat = fft(frameSigData, [], 1);
f = (0:frameLen-1)*(fs/frameLen);

% sum magnitudes
fftMagAve = sum(abs(fftDataMat),3)/noFrames;

if debugInfo
   figure('WindowStyle', 'docked', 'Name', 'FFT Win Ave')
   plot(f, 2*fftMagAve)
   grid on
   title('FFT Windowed Average')
   xlabel('frequency [Hz]')
   ylabel('magnitude')
   xlim([0 fs/2])
end

end