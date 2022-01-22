function [r] = backXcorr(x, y, debugInfo)
% BACKXCORR - Performs correlation backwards in time between two vectors
% of the same length. The shifted signal is the moved backwards in time
% againest the reference signal, zero padding the offset samples.
%
% r = x(n)y(n-k)
%
% INPUTS: refSig: reference signal (samples, 1)
%         shiftedSig: shifted signal (samples, 1)
%
% OUTPUTS: r: autocorrelation sequence (samples, 1)
%
% EXAMPLES: backXcorr(1:10', 1:10', true)
%
% Created By: George Howell
% Created On: 25-Oct-2021

if length(x)~=length(y)
    error('length of ref signal and shifted signal not equal')
end

% general variables
N = length(x);

% correlate signals
r = zeros(N,1);
for sampIdx=1:N
    r(sampIdx,1) = x.' * [zeros(sampIdx-1,1); y(1:(N-(sampIdx-1)))];
end

% display debug info
if debugInfo
    % plot correlation
    figure('WindowStyle', 'docked', 'NumberTitle', 'off', 'Name', 'Back X-Corr')
    plot(r)
    grid on
    title('Back X-Corr')
    xlabel('samples')
end

end