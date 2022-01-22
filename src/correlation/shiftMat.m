function [X] = shiftMat(x, maxShift)
% SHIFTMAT - Creates a matrix of shifted values of the sequence, zero
% padding the signal at the start and end samples. Returns the matrix in
% the format below, with as many columns as specified by the max shift
% variable.
%
%      |  x(0)  0      0     ...      0    |
%      |  x(1) x(0)    0     ...      0    |
%      |  x(2) x(1)   x(0)   ...      0    |
% X =  |   .    .      .              .    |
%      |  x(N) x(N-1) x(N-2) ...  x(N-p+1) |
%	   |   0   x(N)   x(N-1) ...  x(N-p+2) |
%      |   .    .      .              .    |
%	   |   0    0      0     ...    x(N)   |
%
% INPUTS: x: input sequence
%         maxShift: max order to shift by
%
% OUTPUTS: X: output matrix of shifted values
%
% EXAMPLES: shiftMat(1:10, 4)
%
% Created By: George Howell
% Created On: 01-Nov-2021

% force input sequence to column vector
x = x(:);
N = length(x);

% pad input sequence
xPad = [zeros(maxShift-1,1); x; zeros(maxShift-1,1)];
NPad = length(xPad);

% create matrix
X = zeros(N+maxShift-1, maxShift);
for ordIdx=1:maxShift
    X(:,ordIdx) = xPad(maxShift-ordIdx+1:NPad-ordIdx+1);
end

end