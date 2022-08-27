function [y, fsOut] = cicDecimation(x, order, decFac, delayFac, fsIn, debug)
% CICDECIMATION - cic decimation function
%
% INPUTS: x: input signal
%         order: filter order
%         decFac: decimation factor
%         delayFac: delay factor
%         fsIn: original sample rate (*only for debug)
%         debug: prints and plots debug info
%
% OUTPUTS: y: output signal
%          fsOut: sample rate output (*only for debug)
%
% EXAMPLES: cicDecimation(1:10, 4, 64, 1, 3072e6, true)
%
% Created By: George Howell
% Created On: 23-Aug-2022

if nargin<6
    debug = false;
end

% delay buffers
v = zeros(order,1);
w = zeros(order,delayFac);

% shift to column vector
x = x(:);

% cic decimation filter
for n=1:length(x)   

    % integrator stage
    v0 = x(n);
    for orderIdx=1:order
        v(orderIdx) = intWrap(v0 + v(orderIdx), 'int32');
        v0 = v(orderIdx);
    end
    
    % decimation 
    if (mod(n,decFac)==0)
        w0 = v(order);
        for orderIdx=1:order
            y0 = intWrap(w0 - w(orderIdx,delayFac), 'int32')';
            w(orderIdx,1) = w0;
            w0 = y0;
        end

        % shift buffer
        w = circshift(w,1,2);

        % comb filter stage
        y(ceil(n/decFac)) = y0;
    end   
end

% normalise the output signal
y = y/(decFac^order);

if debug
    % sample rate
    fsOut = fsIn/decFac;
    disp(['fs in: ', num2str(fsIn/1e3), ' kHz'])
    disp(['fs out: ', num2str(fsOut/1e3), ' kHz'])
    
    % frequency response
    bCoeffs = zeros(decFac+1,1);
    bCoeffs(1) = 1;
    bCoeffs(decFac+1) = -1;
    
    figure('WindowStyle','docked','NumberTitle','off','Name','Freq')
    freqz(bCoeffs,[1 -1],1028,fsIn)
end

end