function [prMin,prMax] = i2cPullUp(Vcc,Vol,Iol,tr,Cb)
%I2CPULLUP Returns the min and max values for the pull up resistor on an
%I2C bus
%   https://www.youtube.com/watch?v=CEPFWAPDy7o, Got all the details from
%   here.
%   
%   INPUTS
%   Vcc [V] = power source voltage
%   Vol [V] = output low voltage (max value when SDA/SCL is low)
%   Iol [A] = output sink current (current when SDA/SCL is low)
%   tr [s] = rise time of both SDA and SCL signals 
%   Cb [F] = capacitive load for each bus line
%
%   OUTPUTS
%   prMin [Ohms] = min pull up resistor value 
%   prMax [Ohms] = max pull up resistor value 
%
%   Created By: G. Howell
%   Created On: 01/04/2020


% pull up resistor min value
prMin = (Vcc-Vol)/Iol;

% pull up resistor max value
prMax = tr/(0.8473*Cb);

disp(['PR Min: ', num2str(prMin), ' Ohms'])
disp(['PR Max: ', num2str(prMax), ' Ohms'])

end

