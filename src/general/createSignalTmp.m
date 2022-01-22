function [x, t] = createSignalTmp(sigType, sigTimeLen, fs, sigAmp, toneFreq)
% CREATESIGNAL - explanation of function
%
% INPUTS: sigType       = type of signal i.e. 'dirac', etc
%         sigTimeLen    = total time lenght of signal [s]
%         fs            = sample rate [Hz]
%         sigAmp        = signal amplitude
%         toneFreq      = frequency of tone [Hz]
%
% OUTPUTS: x = signal sequence array
%          t = time array [s]
%
% EXAMPLES: createSignal('dirac', 1, 48000, 1)
%
% Created By: George Howell
% Created On: 27-Sep-2020

% determine total number of samples
totSamp = sigTimeLen * fs;

% create time array
t = [0:totSamp-1]'./fs;

% create null signal array
x = zeros(totSamp,1);

switch sigType
    
    case 'dirac'
        x(1) = sigAmp * 1;
        
    case 'tone'
        x = sigAmp * sin(2*pi*toneFreq*t);
        
    otherwise
        error('unknown signal type')
        
end

end