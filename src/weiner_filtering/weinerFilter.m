function [errSig] = weinerFilter(inputSig, refSig, order)
% WEINERFILTER - basic noise cancellation Weiner filter.
%
% INPUTS: inputSig: input signal
%         refSig: reference signal
%         order: order of the coefficients
%
% OUTPUTS: errSig: error signal
%
% EXAMPLES: weinerFilter([1:10]', [1:10]', 32)
%
% Created By: George Howell
% Created On: 14-May-2022

% reference signal auto-covariance matrix
R_xx = covarMat(refSig, refSig, order);

% input signal, noise cross-covariance matrix and vector
R_xy = covarMat(inputSig, refSig, order);
r_xy(:,1) = R_xy(1,:);

% determine wiener filter coefficients
w = R_xx\r_xy;

% filter the input signal with the wiener filter coefficients
fltSig = filter(w,1,refSig);

% error signal
errSig = inputSig - fltSig;

end