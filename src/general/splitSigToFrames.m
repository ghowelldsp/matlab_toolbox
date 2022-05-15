function frameSigData = splitSigToFrames(sigData, frameLen, frameOverlap, debugInfo)
% SPLITSIGTOFRAMES Splits an array of matrix of signals into frames,
% overlapped by a specified percentage amount.
% 
% INPUTS: sigData: signal data in format (samples, signals)
%         frameLen: no. of samples frame length
%         frameOverlap: percentage frame overlap
%         debugInfo: prints debug info to console
%
% OUTPUTS: frameSigData: frame signal data after splitting, returns in the
%                        format of (samples, frames) if single signal, else 
%                        returns in format of (samples, signals, frames)
%
% EXAMPLES: splitSigToFrames(sigData, 1000, 10, true)
%
% Created By: George Howell
% Created On: 19-Oct-2021

% check for debug variable
if nargin<4
   debugInfo = false; 
end

% general variables
sigLen = size(sigData,1);

if frameLen>sigLen
   error('frame length is greater than signal length')
end

if frameOverlap<0 || frameOverlap>99
   error('frame overlap should be between 0% and 99%')
end

% frame index incremental values
frameShift = round((1-frameOverlap/100)*frameLen);

% determines the number of frames (NOTE: ignore last samples that do not
% make up an entire frame)
noFrames = floor((sigLen-(frameLen-frameShift))/frameShift);

% iterate over frames
frameSigData = zeros(frameLen,size(sigData,2),noFrames);
for frameIdx=1:noFrames
    
    % frame start and end index locations
    frameStartIdx = 1 + (frameIdx-1)*frameShift;
    frameEndIdx = frameStartIdx + frameLen - 1;
    
    % split data
    frameSigData(:,:,frameIdx) = sigData(frameStartIdx:frameEndIdx, :);
end

% convert to 2d matrix if one signal
if size(sigData,2)==1
    frameSigData = reshape(frameSigData, frameLen, []);
end

% print info to console
if debugInfo
   disp('SPLIT SIGNALS TO FRAMES INFO')
   disp(['   Frame Len: ', num2str(frameLen), ' samples'])
   disp(['   Frame Overlap: ', num2str(frameOverlap), '%'])
   disp(['   Frame Shift: ', num2str(frameShift), ' samples'])
   disp(['   No. Frames: ', num2str(noFrames)])
end
    
end