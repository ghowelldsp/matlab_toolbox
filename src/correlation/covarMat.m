function [R] = covarMat(x1, x2, order)
% COVARMAT - Computes the auto-covariance or cross-covariance matrix of
% two sequences.
%
%        |x1(n).x2(n)    x1(n).x2(n-1)    x1(n).x2(n-2)   ... x1(n).x2(n-order+1)
% r(k) = |x1(n-1).x2(n)  x1(n-1).x2(n-1)  x1(n-1).x2(n-2) ...
%        |x1(n-2).x2(n)  x1(n-2).x2(n-1)  x1(n-2).x2(n-2) ...
%         ...            ...              ...
%         x1(n-order+1).x2(n)
%
% INPUTS: x1: sequence 1
%         x2: sequence 2
%         order: order of covariance matrix (i.e. number of lags to
%         evaluate over
%
% OUTPUTS: R: covariance matrix of (order x order)
%
% EXAMPLES: covarMat(1:10, 1:10, 4)
%
% Created By: George Howell
% Created On: 01-Nov-2021

% make both sequences column vectors
x1 = x1(:);
x2 = x2(:);

% subtract the mean from both sequences
x1 = x1 - mean(x1);
x2 = x2 - mean(x2);

% calculate covariance matrix
R = shiftMat(x1, order).' * shiftMat(x2, order);

% normalise covariance matrix (sample variance)
R = R/(length(x1)-1);

end