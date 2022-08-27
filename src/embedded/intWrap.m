function [y] = intWrap(x, intType)
% INTWRAP - checks if the value of x has overflown the data type limits and
% wraps the integer data is so.
%
% INPUTS: x: input value
%         intType: integer type (int8, uint32, etc)
%
% OUTPUTS: y: wrapped value
%
% EXAMPLES: intWrap(180, 'int8')
%
% Created By: George Howell
% Created On: 26-Aug-2022

intMaxVal = double(intmax(intType));
intMinVal = double(intmin(intType));

while (x>intMaxVal || x<intMinVal)
    if (x>intMaxVal)
        x = intMinVal + (x - intMaxVal - 1);
    elseif (x<double(intmin(intType)))
        x = intMaxVal + (x - intMinVal + 1);
    end
end

y = x;

end