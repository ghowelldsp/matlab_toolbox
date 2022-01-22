function [fpValues, quantPcErr, maxMinLimits] = float2fixPoint(fltVals, wordLen, fracLen, sign)
% FLOAT2FIXPOINT - converts floating point values to fixed point, quantises
% and applies saturation if required
%
% INPUTS: fltVals: floating point input array
%         wordLen: fixed point word length
%         fracLen: fixed point fraction length
%         sign: 'true' for signed value, 'false' for unsigned
%
% OUTPUTS: fpValues: fixed point values
%          quantErr: quantisation error
%          minLim: min fixed point limit
%          maxLim: max fixed point limit
%
% EXAMPLES: [fpValues] = float2fixPoint([1.2, 0.6], 4, 2, 'true')
%
% Created By: George Howell
% Created On: 01-Oct-2020

% convert to integer value and quantise
intVal = round(fltVals .* 2^fracLen);

% convert back to fixed point value
fpValues = intVal ./ 2^fracLen;

% create temp word length
wordLenTmp = wordLen;
    
% integer min / max values
if (sign)
    wordLenTmp = wordLenTmp - 1;
end

% integer min and max values
maxMinLimits.intMinVal = -2^wordLenTmp;
maxMinLimits.intMaxVal = 2^wordLenTmp-1;
    
% fixed point min and max values
maxMinLimits.fpMinVal = -2^wordLenTmp / (2^fracLen);
maxMinLimits.fpMaxVal = (2^wordLenTmp-1) / (2^fracLen);

% set min values if unsigned
if (~sign)
    maxMinLimits.intMinVal = 0;
    maxMinLimits.fpMinVal = 0;
end

% check min and max limits, saturate values if nessecary
if any(fpValues < maxMinLimits.fpMinVal)
    fpValues(find(fpValues<maxMinLimits.fpMinVal,1)) = maxMinLimits.fpMinVal;
    warning(['saturation occured, data > ', num2str(maxMinLimits.fpMinVal)])
elseif any(fpValues > maxMinLimits.fpMaxVal)
    fpValues(find(fpValues>maxMinLimits.fpMaxVal,1)) = maxMinLimits.fpMaxVal;
    warning(['saturation occured, data > ', num2str(maxMinLimits.fpMaxVal)])
end

% quantisation error
quantErr = fpValues - fltVals;
quantPcErr = abs(quantErr ./ fpValues) * 100;

end