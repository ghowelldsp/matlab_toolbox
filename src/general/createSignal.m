classdef createSignal < handle
    % CREATESIGNAL Class to create various signal types
    %
    % Created By: George Howell
    % Created On: 02-Nov-2021

    % imported properties
    properties
        N       % number of samples in signal
        fs      % sample rate
    end

    % determined properties
    properties
        x       % signal
        t       % time axes
    end

    % defined properties
    properties
    end

    % private properties
    properties (Access = private)
    end

    % PUBLIC METHODS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    methods
        %------------------------------------------------------------------
        function obj = createSignal(opts)
            %CREATESIGNAL Class constructor

            % import options
            obj.N = opts.N;
            obj.fs = opts.fs;

            % time vector
            obj.timeVector();
        end

        %------------------------------------------------------------------
        function [x, t] = selectSignal(obj, sigType, opts)
            %SELECTSIGNAL Enable selection of one of the signal types

            switch sigType
                case 'tone'
                    f = opts.f;
                    gain = opts.gainTone;
                    phase = opts.phase;
                    [x, t] = obj.tone(f, gain, phase);
                case 'noiseUniform'
                    gain = opts.gainNoiseUni;
                    [x, t] = obj.noiseUniform(gain);
                case 'noiseGaussian'
                    gain = opts.gainNoiseGauss;
                    [x, t] = obj.noiseGaussian(gain);
                case 'unitSample'
                    [x, t] = unitSample();
                case 'previousSignal'
                    x = obj.x;
                    t = obj.t;
                otherwise
                    error('invalid signal type selection')
            end
        end

        %------------------------------------------------------------------
        function [x, t] = unitSample(obj)
            %UNITSAMPLE Create a unit sample signal
            
            % create signal
            x = [1; zeros(obj.N-1,1)];

            % assign to object
            obj.x = x;
            t = obj.t;
        end

        %------------------------------------------------------------------
        function [x, t] = tone(obj, f, gain, phase)
            %TONE Creates a tone signal
            
            % create signal
            x(:,1) = gain * sin(2*pi*f*obj.t + phase);

            % assign to object
            obj.x = x;
            t = obj.t;
        end

        %------------------------------------------------------------------
        function [x, t] = noiseUniform(obj, gain)
            %NOISEUNIFORM Creates a uniformly spread noise signal

            % create signal
            x = gain * (2*rand(obj.N,1)-1);

            % assign to object
            obj.x = x;
            t = obj.t;
        end

        %------------------------------------------------------------------
        function [x, t] = noiseGaussian(obj, gain)
            %NOISEGAUSSIAN Creates a gaussian spread noise signal

            % create signal
            xTmp = randn(obj.N,1);
            x = gain * (xTmp/max(abs(xTmp)));

            % assign to object
            obj.x = x;
            t = obj.t;
        end
    end

    % PRIVATE METHODS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    methods (Access = private)
        %------------------------------------------------------------------
        function timeVector(obj)
            %TIMEVECTOR Creates the time vector

            % time vector
            obj.t(:,1) = (0:obj.N-1)*(1/obj.fs);
        end
    end
end