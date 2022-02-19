function [winData] = windowData(data, windowType, debug)
% WINDOWDATA - windows the input data
%
% INPUTS: data: input data
%         windowType: window type
%         debug: prints and plots debug info
%
% OUTPUTS: winData: windowed data
%
% EXAMPLES: winData = windowData(1:10, 'hamming', true)
%
% Created By: George Howell
% Created On: 19-Feb-2022

N = length(data);

% window input data
switch windowType
    case 'hamming'
        window = hamming(N);
        winData = data .* window;
    case 'hann'
        window = hann(N);
        winData = data .* window;
    case 'blackman'
        window = blackman(N);
        winData = data .* window;
    otherwise
        % TODO - impliment get cases
end

% plot debug info
if debug
    disp('WINDOW DEBUG INFO');
    disp(['   Window Length: ', num2str(N), ' samples']);

    figure('WindowStyle','docked','NumberTitle','off','Name','Window')

    subplot(211)
    plot(0:N-1, window)
    grid on
    title('Window')
    xlabel('samples')
    ylabel('normalised amplitude')

    subplot(212)
    plot(0:N-1, data, ...
         0:N-1, winData)
    grid on
    title('Windowed Data')
    xlabel('samples')
    ylabel('amplitude')
    legend('input data', 'windowed data')
end

end