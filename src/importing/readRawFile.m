function data = readRawFile(filename, dataType)
%READRAWFILE Reads raw (binary) data from a file in the specified format
%and imports into an array.
%
% INPUTS
%   filename: full filename and path to the raw file
%   dataType: raw file data type, i.e. int16, int32, float, etc
%
% OUTPUTS
%   data: raw output data
%
% Created By: G. Howell
% Created On: 10/09/2021

% open file
fid = fopen(filename); 
if (fid == -1)
    error('raw input data file failed to open')
end

% select the no. of bytes per word based on dataType
switch dataType
    case 'int16'
        noBytesWord = 2;
    case {'int32', 'float'}
        noBytesWord = 4;
    case 'double'
        noBytesWord = 8;
    otherwise
        error(['Invalid dataType selection. Valid selctions are: ', getCases()])
end

% get the number of bytes in the file
fileInfo = dir(filename);

% no. of words in files
noWords = fileInfo.bytes/noBytesWord;

% read data
data = fread(fid, noWords, ['*',dataType]);

% close file
fclose(fid);

end