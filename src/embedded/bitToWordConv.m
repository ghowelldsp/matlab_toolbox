function [wordVal] = bitToWordConv(x, wordLen)
% BITTOWORDCONV - Bit to word conversion. Converts an array of single bit
% values (i.e. either 0 or 1) to word values by grouping each bit value.
% For example, a bit array of [0,0,0,1,0,0,0,1] would be converted to a
% single value of [17] (or [0x11]) for an 8 bit data type. 
%
% INPUTS: x: array of binary values, i.e. [1,0,1,0,1,0,1,0]
%         wordLen: number of bit in the word
%
% OUTPUTS: wordVal: word values
%
% EXAMPLES: bitToWordConv([1,0,1,0,1,0,1,0], 8)
%
% Created By: George Howell
% Created On: 25-Aug-2022

% convert to binary array
x = x./x;
x(isnan(x)) = 0;

% split input signal to a frame length depending on the number of bits in
% output word
xFrames = splitSigToFrames(x, wordLen, 0, false);

% calculate word values
wordVal = zeros(size(xFrames,2),1);
for wordIdx=1:size(xFrames,2)
    for bitIdx=1:wordLen
        wordVal(wordIdx,1) = wordVal(wordIdx,1) + xFrames(bitIdx,wordIdx)*(2^abs(bitIdx-wordLen));
    end
end

end