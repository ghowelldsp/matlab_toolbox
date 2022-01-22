function createNewClass(className)
%CREATENEWCLASS - Creates a template for a new class with the correct
% formatting applied
%   
% INPUTS: className: name of the new class
%
% OUTPUTS: template of new class in the folder
%
% EXAMPLE: createNewClass('myNewClass')
%
% Created By: G. Howell
% Created On: 02/11/2021

% add .m extension to name
classNameFull = [className, '.m'];

% check if class already exists
if (exist(classNameFull,'file')==2)
    error('ERROR: class already exsits');
end

% open the file
fileID = fopen(classNameFull,'wt');

% class info
fprintf(fileID,['classdef ', className, '\n']);
fprintf(fileID,['    %% ', upper(className),' Summary of class\n']);
fprintf(fileID,'    %%\n');
fprintf(fileID,'    %% Created By: George Howell\n');
fprintf(fileID,['    %% Created On: ',date,'\n']);
fprintf(fileID,'\n');
% imported properties
fprintf(fileID,'    %% imported properties\n');
fprintf(fileID,'    properties\n');
fprintf(fileID,'        property1\n');
fprintf(fileID,'    end\n');
fprintf(fileID,'\n');
% defined properties
fprintf(fileID,'    %% defined properties\n');
fprintf(fileID,'    properties\n');
fprintf(fileID,'    end\n');
fprintf(fileID,'\n');
% private properties
fprintf(fileID,'    %% private properties\n');
fprintf(fileID,'    properties (Access = private)\n');
fprintf(fileID,'    end\n');
fprintf(fileID,'\n');
% public methods
fprintf(fileID,'    %% PUBLIC METHODS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
fprintf(fileID,'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
fprintf(fileID,'%%%%%%%%%%%%%%\n');
fprintf(fileID,'    methods\n');
fprintf(fileID,'        %%------------------------------------------------------------------\n');
fprintf(fileID,['        function obj = ', className, '(opts)\n']);
fprintf(fileID,['            %%', upper(className),' Class constructor\n']);
fprintf(fileID,'        end\n');
fprintf(fileID,'\n');
fprintf(fileID,'        %%------------------------------------------------------------------\n');
fprintf(fileID,'        function fcn(obj)\n');
fprintf(fileID,'            %%FCN\n');
fprintf(fileID,'        end\n');
fprintf(fileID,'    end\n');
fprintf(fileID,'\n');
% private methods
fprintf(fileID,'    %% PRIVATE METHODS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
fprintf(fileID,'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
fprintf(fileID,'%%%%%%%%%%%%\n');
fprintf(fileID,'    methods (Access = private)\n');
fprintf(fileID,'    end\n');
% end class
fprintf(fileID,'end');

% close file
fclose(fileID);

end