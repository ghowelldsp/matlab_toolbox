function writeRawFile(filename, fmtType, dataArr)
%WRITERAWFILE Writes raw (binary) data from the input array into the user
%specified file in the user specified format.
%
% INPUTS
%   filename: filename and location
%   fmtType: integer format type
%   dataArr: data array
%
% OUTPUTS
%   raw data file named as filename
%
% EXAMPLE
%   writeRawFile('test', 'int16', [1 2 3])
%
% Created By: G. Howell
% Created On: 20/04/2021

% open file
fid = fopen(filename, 'w'); 
if (fid == -1)
    error('raw output data file failed to open')
end

% write data to file
fwrite(fid, dataArr, ['*',fmtType]);

% close file
fclose(fid);

end