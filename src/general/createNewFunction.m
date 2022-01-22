function createNewFunction(funcName)
%CREATENEWFUNCTION - creates a template for a new function with the correct
% formatting applied
%   
% INPUTS: funcName: name of the new function
%
% OUTPUTS: template of new function in the folder
%
% EXAMPLE: createNewFunction('myFunction')
%
% Created By: G. Howell
% Created On: 08/04/2020

% add .m extension to name
funcNameFull = [funcName, '.m'];

% check if file already exists
if (exist(funcNameFull,'file')==2)
    error('ERROR: file already exsits');
end

% open the file
fileID = fopen(funcNameFull,'wt');

% write new function data to file
fprintf(fileID,['function [out1, out2] = ',funcName,'(var1, var2)\n']);
fprintf(fileID,['%% ', upper(funcName),' - explanation of function\n']);
fprintf(fileID,'%%\n');
fprintf(fileID,'%% INPUTS: var1: variable 1 details\n');
fprintf(fileID,'%%         var2: variable 2 details\n');
fprintf(fileID,'%%\n');
fprintf(fileID,'%% OUTPUTS: out1: variable 1 details\n');
fprintf(fileID,'%%          out2: variable 2 details\n');
fprintf(fileID,'%%\n');
fprintf(fileID,'%% EXAMPLES:\n');
fprintf(fileID,'%%\n');
fprintf(fileID,'%% Created By: George Howell\n');
fprintf(fileID,['%% Created On: ',date,'\n']);
fprintf(fileID,'\n');
fprintf(fileID,'end');

% close file
fclose(fileID);

end