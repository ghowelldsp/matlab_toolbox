%% Test script for excel write (xlwrite in OS X)


 javaaddpath('jxl.jar');
 javaaddpath('MXL.jar');

 import mymxl.*;
 import jxl.*;   

 mat1=randn(20,150,5);
 
% create figure
fig_h = figure('Visible', 'off');
plot(1:10)
grid on
title('Fig 1')
xlabel('x axes')
ylabel('y axes')

% 
% xlwrite('mat1_excel.xls',mat1)
xlwrite('mat1_excel.xls',fig_h)