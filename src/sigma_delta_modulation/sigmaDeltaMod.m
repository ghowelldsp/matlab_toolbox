function [y] = sigmaDeltaMod(x)
% SIGMADELTAMOD - basic 1st order sigma-delta modulation
%
% INPUTS: x: input signal
%
% OUTPUTS: y: output signal 
%
% EXAMPLES: sigmaDeltaMod([1:10]);
%
% Created By: George Howell
% Created On: 20-Aug-2022

% general variables
N = length(x);

% create blank signals
v = zeros(N,1);
y = zeros(N,1);

% sigma delta modulation
v(1) = x(1);
if x(1)>0
    y(1) = 1;
else
    y(1) = -1;
end

for n=2:N
    v(n) = x(n) - y(n-1) + v(n-1);
    if v(n)>0
        y(n) = 1;
    else
        y(n) = -1;
    end
end

% convert to binary value
y(y==-1) = 0;

end